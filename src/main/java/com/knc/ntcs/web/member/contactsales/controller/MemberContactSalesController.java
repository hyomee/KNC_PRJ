package ntcs.web.member.contactsales.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.knc.ntcs.web.member.contactsales.service.MemberContactSalesService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Member/ContactSales")
public class MemberContactSalesController {

	
	private MemberContactSalesService memberContactSalesService;
	
	/**
	 * 영업문의 조회 (UI)
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		log.debug("영업문의");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/contactsales/memberContactSales");
		return mav;
	}
	
	/**
	 * 영업문의 조회
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(path = "/List")
	public String getContactSalesList(ModelMap model) throws Exception
	{
		model.put("list", memberContactSalesService.selectCombo());
		return "jsonView";
	}	
	
	/**
	 * 영업문의 등록
	 * @param model
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	@PostMapping(path = "")
	public String addContactSales(ModelMap model) throws Exception
	{
		// 등록화면 service 구현 추가필요함
		return "jsonView";
	}	
	
	/**
	 * 영업문의 처리결과 등록
	 * @param model
	 * @param dto
	 * @return
	 * @throws Exception
	 */
	@PostMapping(path = "Result")
	public String addContactSalesResult(ModelMap model) throws Exception
	{
		//  service 구현 추가필요함
		return "jsonView";
	}		
}
