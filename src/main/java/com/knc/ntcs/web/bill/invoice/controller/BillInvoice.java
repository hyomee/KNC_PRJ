package ntcs.web.bill.invoice.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Bill/Invoice")
public class BillInvoice {

	/**
	 * 청수납관리 메인화면
	 * @return
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() {
		
		log.debug("청수납관리 메인");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bill/invoice/billInvoice");
		return mav;
	}		
	
}
