package com.knc.ntcs.web.login.controller;


import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import com.knc.ntcs.core.config.restTemplate.KncRestTemplate;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.utils.ResponseUtils;
import com.knc.ntcs.web.login.dto.LoginRequestDTO;
import com.knc.ntcs.web.login.dto.LoginResponseDTO;
import com.knc.ntcs.web.login.service.LoginProcessService;

import lombok.extern.slf4j.Slf4j;

import java.util.HashMap;


@Slf4j
@RestController
@RequiredArgsConstructor
@RequestMapping(value="/login")
public class LoginController {


  private final LoginProcessService loginProcessService;
  private final KncRestTemplate kncRestTemplate;
	 
	@GetMapping(value = "")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("login");
		return mav;
	}
  
  /**
   * 로그인 처리
   * @param request
   * @param loginRequestDTO
   * @param comInfoDTO
   * @return
   */
  @PostMapping(value = "/loginProcess", headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> loginProcess(HttpServletRequest request,
                                               @Valid @RequestBody LoginRequestDTO loginRequestDTO,
                                               ComInfoDTO comInfoDTO)  {
	  
    LoginResponseDTO loginResponseDTO = loginProcessService.loginProcess(loginRequestDTO, comInfoDTO);


    return ResponseUtils.completed( loginResponseDTO, comInfoDTO);
  }

  @PostMapping(value = "/restTest", headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> restTest(HttpServletRequest request,
                                             @Valid @RequestBody LoginResponseDTO loginResponseDTO,
                                             ComInfoDTO comInfoDTO)  {

    log.debug("restTest :: " + loginResponseDTO.toString()) ;


    return ResponseUtils.completed( loginResponseDTO, comInfoDTO);
  }

}
