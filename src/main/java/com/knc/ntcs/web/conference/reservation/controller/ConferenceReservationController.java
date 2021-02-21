package com.knc.ntcs.web.conference.reservation.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Conference/Reservation")
public class ConferenceReservationController {

	/**
	 * 회의현황 MAIN화면	
	 * @return
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() {
		
		log.debug("회의예약");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/conference/reservation/conferenceReservation");
		return mav;
	}	
}
