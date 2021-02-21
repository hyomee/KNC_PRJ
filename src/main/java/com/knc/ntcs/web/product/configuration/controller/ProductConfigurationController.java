package com.knc.ntcs.web.product.configuration.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Product/Configuration")
public class ProductConfigurationController {
	
	/**
	 * 상품구성관리 UI
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/configuration/productConfiguration");
		return mav;
	}
	
}
