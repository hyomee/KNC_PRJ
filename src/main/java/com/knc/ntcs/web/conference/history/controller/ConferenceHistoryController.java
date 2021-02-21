package com.knc.ntcs.web.conference.history.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping(value="/Conference/History")
public class ConferenceHistoryController {
	
	/**
	 * 회의이력 ui
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		log.debug("회의이력");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("conference/history/conferenceHistory");
		mav.addObject("KNC","KOBE BYRANT");
		return mav;
	}
}
