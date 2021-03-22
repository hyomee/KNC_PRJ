package com.knc.ntcs.web.customer.contract.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.knc.ntcs.web.conference.history.controller.ConferenceHistoryController;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/Customer/Contract")
public class CustomerContractController {

	/**
	 * 계약관리 UI
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		log.debug("계약관리 UI");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/contract/customerContract");
		return mav;
	}
}
