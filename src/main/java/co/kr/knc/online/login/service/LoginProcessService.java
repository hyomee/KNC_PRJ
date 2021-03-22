package co.kr.knc.online.login.service;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.online.login.dto.LoginRequestDTO;
import co.kr.knc.online.login.dto.LoginResponseDTO;

public interface LoginProcessService {
  LoginResponseDTO loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO) ;

}
