package ntcs.core.common.error.advice;

import com.knc.ntcs.core.common.constant.ComConstant;
import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.error.BizExceptionUtils;
import com.knc.ntcs.core.common.error.exception.BizException;
import com.knc.ntcs.core.common.utils.RequestUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestControllerAdvice
@Order(Ordered.LOWEST_PRECEDENCE)
public class BizExceptionAdvice {
  @Value("${log.error.fillInStackTrace:false}")
  private boolean fillInStackTrace;

  @Value("${log.error.printStackTrace:false}")
  private boolean printStackTrace;

  private final MessageSource messageSource;


  @ExceptionHandler(BizException.class)
  public ResponseEntity<ResponseDTO> bizException(BizException ex,
                                               WebRequest request) {

    log.debug("==== fillInStackTrace :: " + fillInStackTrace);
    if (printStackTrace) {
      //ex.printStackTrace();
    }

    BizExceptionUtils.fillInStackTrace(fillInStackTrace, "BizException", ex.fillInStackTrace().toString());
    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

    ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
            .build();

    ResultDTO resultDTO = ResultDTO.builder()
            .code(ex.getCode())
            .status(String.valueOf(DkHttpStatus.INTERNAL_SERVER_ERROR.value()))
            .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
            .build();


    try {
      if (resultDTO.getCode().equals(ComConstant.NO_CODE)) {
        resultDTO.setCode(ComConstant.NO_CODE);
      } else {

        errorMsgDTO.setMessage(BizExceptionUtils.getMessage(messageSource, resultDTO.getCode()));

        if (StringUtils.isEmpty(errorMsgDTO.getMessage()) || resultDTO.getCode().equals(errorMsgDTO.getMessage())) {
          errorMsgDTO.setMessage(BizExceptionUtils.getMessage(messageSource, "NOMSG"));
        } else {
          if (ex.getArgs().length > 0) {// 값이 존재 한다면
            BizExceptionUtils.getMessage(messageSource, ex.getCode(),ex.getArgs());

//            String[] bizStr = ex.getArgs();
//            String[] msgs = errorMsgDTO.getMessage().split("@");
//            // log.debug(("==== msgs.length :: " + msgs.length + " ex.getArgs().length :: " + ex.getArgs().length));
//            if ( (msgs.length -1)  == ex.getArgs().length) {
//              String newMsg = "";
//              for (int i = 0; i < msgs.length; i++) {
//                newMsg = newMsg + msgs[i];
//                if (i < bizStr.length) {
//                  newMsg = newMsg + bizStr[i];
//                }
//              }
//              errorMsgDTO.setMessage(newMsg);
//            } else {
//              errorMsgDTO.setMessage(BizExceptionUtils.getMessage(messageSource, "NOPAR"));
//            }


            if (resultDTO.getCode().substring(0, 5).equals("VALID")) {
              resultDTO.setStatus(String.valueOf(DkHttpStatus.NOT_VALID.value()));
            }
          }
        }
      }
    } catch (Exception exx) {
      if (printStackTrace) {
        exx.printStackTrace();
      }
      errorMsgDTO.setMessage(BizExceptionUtils.getMessage(messageSource, "NOMSG"));
    }

    error.add(errorMsgDTO);
    resultDTO.setError(error);

    ResponseDTO responseDTO = ResponseDTO.builder()
            .result(resultDTO)
            .build();

    return ResponseEntity.status(Integer.parseInt(resultDTO.getStatus())).body(responseDTO);
  }
}
