package co.kr.knc.online.login.controller;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.common.utils.ResponseUtils;
import co.kr.knc.online.login.dto.LoginRequestDTO;
import co.kr.knc.online.login.dto.LoginResponseDTO;
import co.kr.knc.online.login.service.LoginProcessService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;


@Slf4j
@RestController
@RequestMapping(value="/login")
public class LoginController {

  private final LoginProcessService loginProcessService;

  public LoginController(LoginProcessService loginProcessService) {
    this.loginProcessService = loginProcessService;
  }

  /**
   * 로그인 처리
   * @param request
   * @param loginRequestDTO
   * @param comInfoDTO
   * @return
   */
  @PostMapping(value = "/loginProcess", headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> insertDkTagSet(HttpServletRequest request,
                                               @Valid @RequestBody LoginRequestDTO loginRequestDTO,
                                               ComInfoDTO comInfoDTO)  {

    LoginResponseDTO loginResponseDTO = loginProcessService.loginProcess(loginRequestDTO, comInfoDTO);
    return ResponseUtils.completed( loginResponseDTO, comInfoDTO);
  }

}
