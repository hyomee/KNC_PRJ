package co.kr.knc.online.custmgmt.service;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.online.custmgmt.doamin.CustMDTO;
import co.kr.knc.online.custmgmt.doamin.UserMDTO;

public interface CustMgmtService {

  // 고객 관리
  CustMDTO saveCustM(CustMDTO CustMDTO, ComInfoDTO comInfoDTO) throws Exception ;
  CustMDTO findByCustNm(CustMDTO CustMDTO, ComInfoDTO comInfoDTO) throws Exception ;;
  CustMDTO findByCustLoginId(CustMDTO CustMDTO, ComInfoDTO comInfoDTO) throws Exception ;;


  // 사용자 관리
  UserMDTO saveUserM(UserMDTO userMDTO, ComInfoDTO comInfoDTO) throws Exception;


  // 조직 관리

}
