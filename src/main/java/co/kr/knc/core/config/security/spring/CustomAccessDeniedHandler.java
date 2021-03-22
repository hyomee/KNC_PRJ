package co.kr.knc.core.config.security.spring;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import co.kr.knc.core.common.constant.ComConstant;
import co.kr.knc.core.common.constant.DkHttpStatus;
import co.kr.knc.core.common.constant.ErrorConstant;
import co.kr.knc.core.common.dto.CustomMessageDTO;
import co.kr.knc.core.common.dto.ErrorMsgDTO;
import co.kr.knc.core.common.dto.ResponseDTO;
import co.kr.knc.core.common.dto.ResultDTO;
import co.kr.knc.core.common.error.BizExceptionUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler {

  private MessageSource messageSource;

  public CustomAccessDeniedHandler(MessageSource messageSource) {
    this.messageSource = messageSource;
  }
  @Override
  public void handle(HttpServletRequest request, HttpServletResponse response, AccessDeniedException accessDeniedException)
          throws IOException, ServletException {

    ObjectMapper objectMapper = new ObjectMapper();

    log.debug("===== CustomAuthenticationEntryPoint :: commence :: " + accessDeniedException.fillInStackTrace().toString());
    try {

      List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

      CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, ErrorConstant.SECURITY_AccessDenie);


      ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
              .message(customMessageDTO.getMessage())
              .build();

      error.add(errorMsgDTO);

      ResultDTO resultDTO = ResultDTO.builder()
              .code(customMessageDTO.getCode())
              .error(error)
              .status(String.valueOf(DkHttpStatus.UNAUTHORIZED.value()))
              .path(request.getRequestURL().toString())
              .build();


      ResponseDTO responseDTO = ResponseDTO.builder()
              .result(resultDTO)
              .build();


      JsonNode jsonNode  = objectMapper.convertValue( responseDTO, JsonNode.class);

      log.debug("======================= :: " + jsonNode);


      response.setContentType(ComConstant.CONTENT_TYPE);
      response.setStatus(HttpServletResponse.SC_UNAUTHORIZED);
      response.getWriter().write(String.valueOf(jsonNode));
    } catch (RuntimeException e) {
      e.printStackTrace();
    }
  }

}