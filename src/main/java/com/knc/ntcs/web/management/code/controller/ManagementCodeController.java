package com.knc.ntcs.web.management.code.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping(value = "/management/code")
public class ManagementCodeController {

	/**
	 * 공통코드 조회
	 * 
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {

		ModelAndView mav = new ModelAndView();
		mav.setViewName("management/code/managementCode");
		return mav;
	}

	/**
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/list")
	public String getManagementCodeList(ModelMap model) throws Exception {

		ModelMap messageBodyMap = new ModelMap();

		List<Map<String, Object>> result = new ArrayList<Map<String, Object>>();

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("langType", "KOR");
		map.put("commonGroupCd", "서비스요금항목");
		map.put("commonCd", "201");
		map.put("commonCdNm", "웹캐스팅1");
		map.put("codeDesc1", "");

		result.add(map);

		Map<String, Object> map2 = new HashMap<String, Object>();
		map2.put("langType", "KOR");
		map2.put("commonGroupCd", "서비스요금항목");
		map2.put("commonCd", "202");
		map2.put("commonCdNm", "웹캐스팅2");
		map2.put("codeDesc1", "");

		result.add(map2);

		Map<String, Object> map3 = new HashMap<String, Object>();
		map3.put("langType", "KOR");
		map3.put("commonGroupCd", "서비스요금항목");
		map3.put("commonCd", "202");
		map3.put("commonCdNm", "웹캐스팅3");
		map3.put("codeDesc1", "웹캐스팅3");

		result.add(map3);

		messageBodyMap.put("data", result);
		messageBodyMap.put("recordsTotal", 3);
		messageBodyMap.put("recordsFiltered", 3);

		model.put("messageBody", messageBodyMap);

		return "jsonView";
	}

	/**
	 * 공통코드 상세
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/detail")
	public String getManagementCodeDetail(ModelMap model) throws Exception {

		ModelMap messageBodyMap = new ModelMap();

		model.put("messageBody", messageBodyMap);

		return "jsonView";
	}

	/**
	 * 공통코드 수정
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@PutMapping(value = "")
	public String ModifyManagementCode(ModelMap model) throws Exception {

		return "jsonView";
	}

	/**
	 * 공통코드 등록
	 * 
	 * @param model
	 * @return
	 * @throws Exception
	 */
	@PostMapping(value = "", headers = "X_APPLICATION=v1")
	public String addManagementCode(ModelMap model) throws Exception {

		return "jsonView";
	}
}
