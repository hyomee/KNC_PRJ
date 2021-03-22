package ntcs.web.customer.management.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/Customer/Management")
public class CustmerManagementController {
	
	/**
	 * 고객관리로 UI
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		log.debug("고객관리");
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/management/customerManagement");
		return mav;
	}
	
	
		
	/**
	 * 고객 기본정보 목록조회
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping(path = "/List")
	public String getCustmerManagementList(ModelMap model)
	{
		System.out.println("조회");
		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("custId","1");
		map.put("usrId","calltogegher");
		map.put("custName","콜투게더1");
		map.put("custType","1");
		map.put("custClass","1");
		map.put("corpRegNo","12345-12345");
		map.put("bizRegNo","123456-1234568");
		map.put("telNo","02-2068-1234");
		map.put("faxNo","02-2068-1235");
		map.put("mtelNno","02-2068-1234");
		map.put("vald_strt_dttm","2020.01.25");

		result.add(map);

		Map<String,Object> map2 = new HashMap<String,Object>();
		map2.put("custId","2");
		map2.put("usrId","calltogegher");
		map2.put("custName","콜투게더2");
		map2.put("custType","1");
		map2.put("custClass","1");
		map2.put("corpRegNo","12345-12342");
		map2.put("bizRegNo","123456-1234562");
		map2.put("telNo","02-2068-1232");
		map2.put("faxNo","02-2068-1232");
		map2.put("mtelNno","02-2068-1232");
		map2.put("vald_strt_dttm","2020.01.27");		
		
		result.add(map2);
		
		Map<String,Object> map3 = new HashMap<String,Object>();
		map3.put("custId","3");
		map3.put("usrId","calltogegher");
		map3.put("custName","콜투게더3");
		map3.put("custType","1");
		map3.put("custClass","1");
		map3.put("corpRegNo","12345-12342");
		map3.put("bizRegNo","123456-1234562");
		map3.put("telNo","02-2068-1232");
		map3.put("faxNo","02-2068-1232");
		map3.put("mtelNno","02-2068-1232");
		map3.put("vald_strt_dttm","2020.01.27");		
		
		result.add(map3);	 	
		
		model.put("list",result);
		
		return "jsonView";
	}			

	
	/**
	 * 고객 상세정보 - 상세기본정보 수정
	 * 
	 * @param model
	 * @return
	 */
	@PutMapping(path = "/Detail")
	public String modifyCustmerManagementDetail(ModelMap model)
	{
		log.debug("고객 상세정보 - 상세기본정보 수정");
		return "jsonView";
	}
	
	/**
	 * 고객 상세정보 - 청수납정보 수정 저장
	 * 
	 * @param model
	 * @return
	 */
	@PutMapping(path = "/BillAccount")
	public String modifyCustmerManagementBillAccount(ModelMap model)
	{
		log.debug("청수납정보 수정 ");
		return "jsonView";
	}	
}
