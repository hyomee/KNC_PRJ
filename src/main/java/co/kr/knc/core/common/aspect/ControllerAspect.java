package co.kr.knc.core.common.aspect;



import co.kr.knc.core.common.constant.ComConstant;
import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.common.dto.ControllFieldDTO;
import co.kr.knc.core.common.dto.HeaderDTO;
import co.kr.knc.core.common.dto.ResponseDTO;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import javax.annotation.PostConstruct;
import javax.servlet.http.HttpServletRequest;
import java.util.Enumeration;
import java.util.LinkedHashMap;


@Slf4j
@Aspect
@Component
/**
 * Controller에 header 정보 삽입
 */
public class ControllerAspect {

    @PostConstruct
    private void init() {
        // Class 생성 시점에 해야 할 일이 있으면 추가 함
    }

    /**
     * pointcut 선언
     */
    @Pointcut("within(@org.springframework.web.bind.annotation.RestController *)")
    void CtrlPointCut() {
        log.debug(String.format("Controller Aspect 진입"));
    }

    @Around("CtrlPointCut()")
    /**
     * 실제 작업 처리 부분
     */
    public Object Before(ProceedingJoinPoint joinPoint) throws Throwable {
        log.debug("Controller :: Start");
        Object rnObj = new Object();
        Object[] args1 = setParameter(joinPoint);
        try {
            if (args1.length == 0 ) {
                rnObj = joinPoint.proceed();
            } else {
                log.debug("=== " + args1.toString());
                rnObj = joinPoint.proceed(args1);
            }

            if (rnObj instanceof ResponseDTO) {
                //ResponseDTO responseDTO = (ResponseDTO) rnObj;
                //responseDTO.getResult().setPath("");
            }

        } catch (Throwable e) {
//            e.fillInStackTrace();
            throw e;
        }

        return rnObj;
    }

    private Object[] setParameter(ProceedingJoinPoint joinPoint) {
        Object[] inParamObjs = joinPoint.getArgs();

        int argsLength = inParamObjs.length;
        if ( argsLength == 0 ) return inParamObjs;
        // HttpServletRequest를 찾는다.
        HttpServletRequest request = getHttpServletRequest( inParamObjs, argsLength);

        HeaderDTO headerDto = setHeader(request);

        // 제어 필드 설정
        ControllFieldDTO controllFieldDTO = setControllFieldDTO(headerDto);

        ComInfoDTO comInfoDTO = ComInfoDTO.builder()
                .headerDTO(headerDto)
                .controllFieldDTO(controllFieldDTO)
                .build();

        Object[] outPparamObj = new Object[argsLength];

        for (int i = 0; i < argsLength; i++) {
            if (inParamObjs[i] instanceof HttpServletRequest) {
                outPparamObj[i] = inParamObjs[i];
            } else if (inParamObjs[i] instanceof ComInfoDTO) {
                outPparamObj[i] = comInfoDTO;
            } else {
                //TODO 상위에 있는 객체에 자동 바인딩 로직 구현 필요
                log.debug("=== :: outPparamObj :: " + inParamObjs.getClass());
                outPparamObj[i] = inParamObjs[i];
            }
        }

        return outPparamObj;

    }

    private HttpServletRequest getHttpServletRequest( Object[] args, int argsLength) {
        HttpServletRequest request = null;
        for (int i = 0; i < argsLength; i++) {
            Object obj = args[i];
//            if (args[i] instanceof List) {
//                listYn = true;
//            }
            if (obj instanceof HttpServletRequest) {
                request = (HttpServletRequest) obj;
                break;
            }
        }
        return request;
    }

    private HeaderDTO setHeader(HttpServletRequest request) {

        String xApplication = "";
        String xAuthToken = "";
        String xChannel = "";
        String xLangSet = "";
        String xLogKey = "";
        String xMid = "";
        LinkedHashMap<String, String> headerMap = new LinkedHashMap<String, String>();

        Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            String key = headerNames.nextElement();
            String value = request.getHeader(key);
            headerMap.put(key, value);
            if (ComConstant.X_APPLICATION.equals(key.toUpperCase())) {
                xApplication = value;
            } else if (ComConstant.X_AUTH_TOKEN.equals(key.toUpperCase())) {
                xAuthToken = value;
            } else if (ComConstant.X_CHANNEL.equals(key.toUpperCase())) {
                xChannel = value;
            } else if (ComConstant.X_LANG_SET.equals(key.toUpperCase())) {
                if (org.springframework.util.StringUtils.isEmpty(value)) {
                    value = "kr";
                }
                xLangSet = value;
            } else if (ComConstant.X_LOG_KEY.equals(key.toUpperCase())) {
                xLogKey = value;
            } else if (ComConstant.X_MID.equals(key.toUpperCase())) {
                xMid = value;
            }
        }

        String remoteAddr = StringUtils.defaultString(request.getRemoteAddr(), "-");
        String url = (request.getRequestURL() == null) ? "" : request.getRequestURL().toString();
        String queryString = StringUtils.defaultIfEmpty(request.getQueryString(), "");
//        String refer = StringUtils.defaultString(request.getHeader("Refer"), "-");
//        String agent = StringUtils.defaultString(request.getHeader("User-Agent"), "-");


        HeaderDTO headerDTO = HeaderDTO.builder()
                .xAuthToken(xAuthToken)
                .xChannel(xChannel)
                .xLangSet(xLangSet)
                .xLogKey(xLogKey)
                .xMid(xMid)
                .path(url)
                .remoteAddr(remoteAddr)
                .queryString(queryString)
                .headerMap(headerMap)
                .build();

        return headerDTO;
    }

    private ControllFieldDTO setControllFieldDTO(HeaderDTO headerDTO) {
        ControllFieldDTO controllFieldDTO = new ControllFieldDTO();
        //TODO 인증 토근에서 가지고와야 함
        String userId = "1234";
        controllFieldDTO.setCreateId(userId, "");
        return controllFieldDTO;
    }

}
