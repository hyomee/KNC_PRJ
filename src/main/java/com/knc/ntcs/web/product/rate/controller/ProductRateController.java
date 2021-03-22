package ntcs.web.product.rate.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Product/Rate")
public class ProductRateController {
	
	/**
	 * 요금관리 UI
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("product/rate/productRate");
		return mav;
	}
	
}
