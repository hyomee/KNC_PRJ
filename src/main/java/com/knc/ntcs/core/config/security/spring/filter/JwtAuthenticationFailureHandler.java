package ntcs.core.config.security.spring.filter;


import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.dto.CustomMessageDTO;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.error.BizExceptionUtils;
import com.knc.ntcs.core.common.utils.JsonUtils;
import com.knc.ntcs.core.common.utils.RequestUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.InsufficientAuthenticationException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Slf4j
public class JwtAuthenticationFailureHandler implements AuthenticationFailureHandler {

  private  MessageSource messageSource;
  public JwtAuthenticationFailureHandler(MessageSource messageSource) {
    this.messageSource = messageSource;;
  }

  @Override
  public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
                                      AuthenticationException exception) throws IOException {
    log.debug("==== JwtAuthenticationFailureHandler :: onAuthenticationFailure");
    response.setStatus(HttpStatus.BAD_REQUEST.value());
    response.setContentType(MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");

    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

    CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();

    if (exception instanceof BadCredentialsException) {
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, "SECURITY.InvalidCredentials");
    } else if (exception instanceof InsufficientAuthenticationException) {
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, "SECURITY.InvalidAuthenticationRequest");
    } else {
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, "SECURITY.Authentication");
    }

    ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
            .message(customMessageDTO.getMessage())
            .build();

    error.add(errorMsgDTO);

    ResultDTO resultDTO = ResultDTO.builder()
            .code(customMessageDTO.getCode())
            .error(error)
            .status(String.valueOf(DkHttpStatus.BAD_REQUEST.value()))
            .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
            .build();


    ResponseDTO responseDTO = ResponseDTO.builder()
            .result(resultDTO)
            .build();

    JsonUtils.write(response.getWriter(), responseDTO);
  }
}
