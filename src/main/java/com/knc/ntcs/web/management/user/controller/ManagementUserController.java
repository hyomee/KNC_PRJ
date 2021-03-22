package com.knc.ntcs.web.management.user.controller;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.utils.ResponseUtils;
import com.knc.ntcs.web.management.user.dto.TsyUserDto;
import com.knc.ntcs.web.management.user.service.TsyUserService;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

import javax.servlet.http.HttpServletRequest;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/management/user")
public class ManagementUserController {

	// 서비스 주입
	private final TsyUserService tsyUserService;


	/**
	 * 시용자정보 조회 UI
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("management/user/managementUser");
		return mav;
	}



	@PostMapping(value = "/saveTsyUser", headers = "X_APPLICATION=v1")
	public ResponseEntity<Object> saveTsyUser(HttpServletRequest request,
																					@RequestBody TsyUserDto tsyUserDTO,
																					ComInfoDTO comInfoDTO) throws Exception {
		log.debug("=== ctl :: saveCustM : " + tsyUserDTO.toString());
		TsyUserDto tsyUserResDTO = tsyUserService.saveTsyUser(tsyUserDTO, comInfoDTO);
		return ResponseUtils.completed( tsyUserResDTO, comInfoDTO );
	}

}
