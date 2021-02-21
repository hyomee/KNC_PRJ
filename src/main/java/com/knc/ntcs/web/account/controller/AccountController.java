package com.knc.ntcs.web.account.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/account")
public class AccountController {

	/**
	 * 회원관리 조회
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("account/account");
		return mav;
	}
}
