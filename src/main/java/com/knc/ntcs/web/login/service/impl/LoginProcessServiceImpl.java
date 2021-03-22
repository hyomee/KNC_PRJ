package ntcs.web.login.service.impl;


import com.auth0.jwt.JWT;
import com.auth0.jwt.algorithms.Algorithm;
import com.knc.ntcs.core.config.security.contant.JwtPropContant;
import com.knc.ntcs.web.management.user.dto.TsyUserDto;
import com.knc.ntcs.web.management.user.service.TsyUserService;
import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.utils.RequestUtils;
import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.login.dto.LoginResponseDTO;
import com.knc.ntcs.web.login.service.LoginProcessService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

import java.util.Date;
import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Service
public class LoginProcessServiceImpl implements LoginProcessService {

  private TsyUserService tsyUserService;
  /**
   * 로그인 처리
   * @param loginRequestDTO
   * @param comInfoDTO
   * @return
   */
  @Override
  public LoginResponseDTO loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO)  {

    RequestUtils.printRchRequestHeader();
    TsyUserDto tsyUserDto = tsyUserService.loginProcess(loginRequestDTO, comInfoDTO);
    LoginResponseDTO loginResponseDTO = null;
    if (StringUtils.isEmpty(tsyUserDto.getUserId())) {
      String jwtToken = JWT.create()
              .withSubject(tsyUserDto.getUserName())
              .withExpiresAt(new Date(System.currentTimeMillis()+ JwtPropContant.EXPIRATION_TIME))
              .withClaim("userId", tsyUserDto.getUserId())  // 동일한 key 생성 방지
              .withClaim("userName", tsyUserDto.getUserName())
              .sign(Algorithm.HMAC512(JwtPropContant.SECRET));


      log.debug("===== 6. successfulAuthentication token :: " + JwtPropContant.TOKEN_PREFIX+jwtToken);
      HashMap rsn = new HashMap();
      rsn.put("token", JwtPropContant.TOKEN_PREFIX+jwtToken);
    }

    
    return loginResponseDTO;
  }
}
