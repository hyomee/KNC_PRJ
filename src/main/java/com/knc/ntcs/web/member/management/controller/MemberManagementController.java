package ntcs.web.member.management.controller;

import com.knc.ntcs.core.config.restTemplate.KncRestTemplate;
import com.knc.ntcs.web.member.management.dto.TcmMemberRequestDTO;
import com.knc.ntcs.web.member.management.dto.TcmMemberResponseDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@Slf4j
@Controller
@RequiredArgsConstructor
@RequestMapping(value = "Member/Management")
public class MemberManagementController {

	private final KncRestTemplate kncRestTemplate;

	/**
	 * 회원관리
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "")
	public ModelAndView callMainView() throws Exception {
		log.debug("회원관리");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/management/memberManagement");
		return mav;
	}

	/**
	 * 회원관리
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/Datatable")
	public ModelAndView callMainViewd() throws Exception {
		log.debug("회원관리");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/management/memberManagementd");
		return mav;
	}
	
	/**
	 * 회원관리
	 * @return
	 * @throws Exception
	 */
	@GetMapping(value = "/Jqgrid")
	public ModelAndView callMainViewj() throws Exception {
		log.debug("회원관리"); 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("member/management/memberManagementj");
		return mav;
	}	
	
	/**
	 * 회원관리 목록조회 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping(path = "/Datatable/List")
	public String getMemberManagementListD(ModelMap model, TcmMemberRequestDTO dto) throws Exception
	{
		
		log.debug("회원유형 "+dto.getUsrType());


		String tcmMemebrRequest = "usrType=" + dto.getUsrType() + "&nextPage="+ dto.getNextPage() + "&prevPage=" +dto.getPrevPage();
		HashMap hp = kncRestTemplate.getForHashmap("/Datatable/List", tcmMemebrRequest);

		List<TcmMemberResponseDTO> result = new ArrayList<TcmMemberResponseDTO>();
				
		TcmMemberResponseDTO dto1 = new TcmMemberResponseDTO();
		dto1.setUsrId("bugking70");
		dto1.setUsrEmail("bugking70.gmail.com");
		dto1.setUsrPassword("1");
		dto1.setUsrType("정회원");
		dto1.setUsrStat("활성");
		dto1.setCustId("C20000200");
		dto1.setScrbDttm("2020-01-01");
		dto1.setTmntDttm("9999-12-31");
		dto1.setTmntResn("");
		dto1.setJoinId("1");
		dto1.setSwitchFlag("예");
		dto1.setCreationDate("2020-01-05");
		dto1.setSwitchManager("홍길동");
		result.add(dto1);
		
		TcmMemberResponseDTO dto2 = new TcmMemberResponseDTO();
		dto2.setUsrId("akstp");
		dto2.setUsrEmail("akstp.gmail.com");
		dto2.setUsrPassword("1");
		dto2.setUsrType("준회원");
		dto2.setUsrStat("비활성");
		dto2.setCustId("C10000200");
		dto2.setScrbDttm("2020-01-01");
		dto2.setTmntDttm("9999-12-31");
		dto2.setTmntResn("");
		dto2.setJoinId("1");
		dto2.setSwitchFlag("예");
		dto2.setCreationDate("2020-01-06");
		dto2.setSwitchManager("홍길동");
		result.add(dto2);		
		
		model.put("data",result);
		return "jsonView";
	}			
	
	
	/**
	 * 회원관리 목록조회 
	 * 
	 * @param model
	 * @return
	 */
	@GetMapping(path = "/Jqgrid/List")
	public String getMemberManagementListJ(ModelMap model, TcmMemberRequestDTO dto) throws Exception
	{
		
		log.debug("회원유형 "+dto.getUsrType());
		List<TcmMemberResponseDTO> result = new ArrayList<TcmMemberResponseDTO>();
				
		TcmMemberResponseDTO dto1 = new TcmMemberResponseDTO();
		dto1.setUsrId("bugking70");
		dto1.setUsrEmail("bugking70.gmail.com");
		dto1.setUsrPassword("1");
		dto1.setUsrType("정회원");
		dto1.setUsrStat("활성");
		dto1.setCustId("C20000200");
		dto1.setScrbDttm("2020-01-01");
		dto1.setTmntDttm("9999-12-31");
		dto1.setTmntResn("");
		dto1.setJoinId("1");
		dto1.setSwitchFlag("예");
		dto1.setCreationDate("2020-01-05");
		dto1.setSwitchManager("홍길동");
		result.add(dto1);
		
		TcmMemberResponseDTO dto2 = new TcmMemberResponseDTO();
		dto2.setUsrId("akstp");
		dto2.setUsrEmail("akstp.gmail.com");
		dto2.setUsrPassword("1");
		dto2.setUsrType("준회원");
		dto2.setUsrStat("비활성");
		dto2.setCustId("C10000200");
		dto2.setScrbDttm("2020-01-01");
		dto2.setTmntDttm("9999-12-31");
		dto2.setTmntResn("");
		dto2.setJoinId("1");
		dto2.setSwitchFlag("예");
		dto2.setCreationDate("2020-01-06");
		dto2.setSwitchManager("홍길동");
		result.add(dto2);		
		
		model.put("list",result);


		return "jsonView";
	}				
	
	
}

