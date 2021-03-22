package co.kr.knc.core.config.security.spring.filter;


import co.kr.knc.core.common.dto.CustomMessageDTO;
import co.kr.knc.core.common.utils.JsonUtils;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.logout.LogoutSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class JwtLogoutSuccessHandler implements LogoutSuccessHandler {

  private MessageSource messageSource;
  public JwtLogoutSuccessHandler(MessageSource messageSource) {
    this.messageSource = messageSource;;
  }

  @Override
  public void onLogoutSuccess(HttpServletRequest request, HttpServletResponse response, Authentication authentication)
    throws IOException {

    response.setStatus(HttpStatus.OK.value());
    CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().code("OK").build();
    JsonUtils.write(response.getWriter(), customMessageDTO);
  }
}
