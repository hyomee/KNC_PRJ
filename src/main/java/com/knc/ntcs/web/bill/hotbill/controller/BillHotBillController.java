package ntcs.web.bill.hotbill.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Bill/HotBill")
public class BillHotBillController {

	/**
	 * 실시간요요금정보	
	 * @return
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() {
		log.debug("== 실시간요금정보");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("bill/hotbill/billHotBill");
		return mav;
	}		
	
}
