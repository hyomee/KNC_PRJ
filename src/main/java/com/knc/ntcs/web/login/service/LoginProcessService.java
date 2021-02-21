package com.knc.ntcs.web.login.service;


import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.login.dto.LoginResponseDTO;

public interface LoginProcessService {
  LoginResponseDTO loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO) ;

}
