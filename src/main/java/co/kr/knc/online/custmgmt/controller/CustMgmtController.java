package co.kr.knc.online.custmgmt.controller;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.common.utils.ResponseUtils;
import co.kr.knc.online.custmgmt.doamin.CustMDTO;
import co.kr.knc.online.custmgmt.doamin.UserMDTO;
import co.kr.knc.online.custmgmt.service.CustMgmtService;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;

/**
 * 고객(농장) 관리
 * 고객(농장) 사용자 관리
 * 고객(조직) 관리
 */
@Slf4j
@RestController
@RequestMapping(value="/service/custmgmt")
public class CustMgmtController {

  private CustMgmtService custMgmtService;

  public CustMgmtController(CustMgmtService custMgmtService) {
    this.custMgmtService = custMgmtService;
  }

  /**
   * 고객  등록 및 수정
   * - 등록 : 고객 순번이 0 또는 null
   * @param request
   * @param custMDTO
   * @param comInfoDTO
   * @return
   * @throws Exception
   */
  @PostMapping(value = "/saveCustM", headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> saveCustM(HttpServletRequest request,
                                               @RequestBody CustMDTO custMDTO,
                                               ComInfoDTO comInfoDTO) throws Exception {
    log.debug("=== ctl :: saveCustM : " + custMDTO.toString());
    CustMDTO rnCustMDTO = custMgmtService.saveCustM(custMDTO, comInfoDTO);
    return ResponseUtils.completed( rnCustMDTO, comInfoDTO );
  }

  /**
   * 고객명으로 조회
   * @param request
   * @param custMDTO
   * @param comInfoDTO
   * @return
   * @throws Exception
   */
  @GetMapping(value = "/findByCustNm" , headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> findByCustNm(HttpServletRequest request,
                                             @RequestBody CustMDTO custMDTO,
                                             ComInfoDTO comInfoDTO) throws Exception {
    CustMDTO rnCustMDTO = custMgmtService.findByCustNm(custMDTO, comInfoDTO);
    return ResponseUtils.completed( rnCustMDTO, comInfoDTO );
  }

  /**
   * 고객아이디로 조회
   * @param request
   * @param custMDTO
   * @param comInfoDTO
   * @return
   * @throws Exception
   */
  @GetMapping(value = "/findByCustLoginId" , headers = "X_APPLICATION=v1")
  public ResponseEntity<Object> findByCustLoginId(HttpServletRequest request,
                                                  @RequestBody CustMDTO custMDTO,
                                                  ComInfoDTO comInfoDTO) throws Exception {
    CustMDTO rnCustMDTO = custMgmtService.findByCustLoginId(custMDTO, comInfoDTO);
    return ResponseUtils.completed( rnCustMDTO, comInfoDTO );
  }

  /**
   *
   * @param request
   * @param userMDTO
   * @param comInfoDTO
   * @return
   * @throws Exception
   */
  @PostMapping(value = "saveUserM", headers = "X_APPLICATION = v1")
  public ResponseEntity<Object> saveUserM(HttpServletRequest request,
                                          @RequestBody UserMDTO userMDTO,
                                          ComInfoDTO comInfoDTO) throws Exception{
    UserMDTO rnUserDTO = custMgmtService.saveUserM(userMDTO, comInfoDTO);
    return ResponseUtils.completed(rnUserDTO, comInfoDTO);

  }
}
