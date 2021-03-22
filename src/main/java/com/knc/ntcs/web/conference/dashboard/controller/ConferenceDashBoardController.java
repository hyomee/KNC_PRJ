package com.knc.ntcs.web.conference.dashboard.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Conference/Dashboard")
public class ConferenceDashBoardController {

	/**
	 * 회의현황 MAIN화면	
	 * @return
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() {
		
		log.debug("회의현황");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("conference/dashboard/conferenceDashboard");
		return mav;
	}	
	
}
