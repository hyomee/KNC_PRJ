package co.kr.knc.online.login.service.impl;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.common.error.exception.BizException;
import co.kr.knc.core.common.utils.RequestUtils;
import co.kr.knc.online.custmgmt.entity.TbUserMEntity;
import co.kr.knc.online.custmgmt.repository.TbUserMRepository;
import co.kr.knc.online.login.dto.LoginRequestDTO;
import co.kr.knc.online.login.dto.LoginResponseDTO;
import co.kr.knc.online.login.service.LoginProcessService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

@Slf4j
@RequiredArgsConstructor
@Service
public class LoginProcessServiceImpl implements LoginProcessService {


  private final TbUserMRepository tbUserMRespository;


  /**
   * 로그인 처리
   * @param loginRequestDTO
   * @param comInfoDTO
   * @return
   */
  @Override
  public LoginResponseDTO loginProcess(LoginRequestDTO loginRequestDTO, ComInfoDTO comInfoDTO)  {

    RequestUtils.printRchRequestHeader();
    LoginResponseDTO loginResponseDTO = null;
    // id, pwd로 비밀번호 조회
    TbUserMEntity tbUserMEntity = tbUserMRespository.findByUsrLoginIdAndUsrPwd(loginRequestDTO.getId(), loginRequestDTO.getPwd());
    if (tbUserMEntity != null ) {
      log.debug("===== ukUserMEntity is null");
      //TODO 존재 하면  토큰 셍성은 정상 로그인 후 등록 함
//      loginResponseDTO = LoginResponseDTO.builder()
//              .authToken(jwtTokenProvider.createToken("tokenSamle"))
//              .build();
    } else {
      throw new BizException("VALID.V0001", loginRequestDTO.getId() );
    }
    return loginResponseDTO;
  }
}
