package com.knc.ntcs.web.main.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
public class MainController {

	@GetMapping(value = "/")
	public ModelAndView index() throws Exception {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("index");
		return mav;	
	}
	
	@GetMapping(value = "/main")
	public ModelAndView main() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("main");
		return mav;	
	}	
	
	@GetMapping(value = "/dashboard")
	public ModelAndView dashboard() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("dashboard");
		return mav;	
	}	
	

}
