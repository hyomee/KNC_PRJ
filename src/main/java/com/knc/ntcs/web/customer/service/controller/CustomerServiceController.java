package com.knc.ntcs.web.customer.service.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/Customer/Service")
public class CustomerServiceController {

	/**
	 * 서비스관리
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/service/customerService");
		return mav;
	}
}
