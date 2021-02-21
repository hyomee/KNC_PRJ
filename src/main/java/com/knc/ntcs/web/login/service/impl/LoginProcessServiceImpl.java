package com.knc.ntcs.web.login.service.impl;


import org.springframework.stereotype.Service;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.utils.RequestUtils;
import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.login.dto.LoginResponseDTO;
import com.knc.ntcs.web.login.service.LoginProcessService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class LoginProcessServiceImpl implements LoginProcessService {

  /**
   * 로그인 처리
   * @param loginRequestDTO
   * @param comInfoDTO
   * @return
   */
  @Override
  public LoginResponseDTO loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO)  {

    RequestUtils.printRchRequestHeader();
    LoginResponseDTO loginResponseDTO = null;
    
    return loginResponseDTO;
  }
}
