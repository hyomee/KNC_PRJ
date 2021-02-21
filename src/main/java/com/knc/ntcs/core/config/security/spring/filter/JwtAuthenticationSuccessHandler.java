package com.knc.ntcs.core.config.security.spring.filter;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.dto.CustomMessageDTO;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.utils.JsonUtils;
import com.knc.ntcs.core.common.utils.RequestUtils;
import com.knc.ntcs.core.config.security.contant.JwtPropContant;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserDetailsVO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Slf4j
public class JwtAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

  private MessageSource messageSource;
  public JwtAuthenticationSuccessHandler(MessageSource messageSource) {
    this.messageSource = messageSource;;
  }

  @Override
  public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
                                      Authentication authentication) throws IOException {
    response.setStatus(HttpStatus.OK.value());
    response.setContentType(MediaType.APPLICATION_JSON_VALUE + ";charset=UTF-8");

    JwtUserDetailsVO ywtUserDetailsVO = (JwtUserDetailsVO) authentication.getPrincipal();

    log.debug("==== getUserSeq :: " + ywtUserDetailsVO.getJwtUserVO().getUserSeq());
    log.debug("==== getUsername :: " + ywtUserDetailsVO.getJwtUserVO().getUsername());

    log.debug("==== ywtUserDetailsVO.getUsername() :: " + ywtUserDetailsVO.getUsername());


    String jwtToken = JWT.create()
            .withSubject(ywtUserDetailsVO.getUsername())
            .withExpiresAt(new Date(System.currentTimeMillis()+ JwtPropContant.EXPIRATION_TIME))
            .withClaim("userSeq", ywtUserDetailsVO.getJwtUserVO().getUserSeq())  // 동일한 key 생성 방지
            .withClaim("username", ywtUserDetailsVO.getJwtUserVO().getUsername())
            .sign(Algorithm.HMAC512(JwtPropContant.SECRET));


    log.debug("===== 6. successfulAuthentication token :: " + JwtPropContant.TOKEN_PREFIX+jwtToken);
    HashMap rsn = new HashMap();
    rsn.put("token", JwtPropContant.TOKEN_PREFIX+jwtToken);
    response.setHeader(JwtPropContant.HEADER_STRING.toString(), JwtPropContant.TOKEN_PREFIX+jwtToken );
    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

    CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().code("OK").build();



    ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
            .build();

    error.add(errorMsgDTO);

    ResultDTO resultDTO = ResultDTO.builder()
            .code(customMessageDTO.getCode())
            .error(error)
            .status(String.valueOf(DkHttpStatus.OK.value()))
            .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
            .build();


    ResponseDTO responseDTO = ResponseDTO.builder()
            .result(resultDTO)
            .data(rsn)
            .build();

    log.debug("===== successfulAuthentication " + responseDTO.toString());
    JsonUtils.write(response.getWriter(), responseDTO);

  }
}
