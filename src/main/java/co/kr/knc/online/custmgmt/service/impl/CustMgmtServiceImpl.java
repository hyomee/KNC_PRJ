package co.kr.knc.online.custmgmt.service.impl;


import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.config.modelmapper.CommonBean;
import co.kr.knc.online.custmgmt.doamin.CustMDTO;
import co.kr.knc.online.custmgmt.doamin.UserMDTO;
import co.kr.knc.online.custmgmt.entity.TbCustMEntity;
import co.kr.knc.online.custmgmt.entity.TbUserMEntity;
import co.kr.knc.online.custmgmt.repository.TbCustMRepository;
import co.kr.knc.online.custmgmt.repository.TbUserMRepository;
import co.kr.knc.online.custmgmt.service.CustMgmtService;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

@Slf4j
@RequiredArgsConstructor
@Service
public class CustMgmtServiceImpl implements CustMgmtService {

  private  final TbCustMRepository tbCustMRespository;
  private  final TbUserMRepository tbUserMRespository;
  private  final PasswordEncoder bcryptEncoder;
  private  final CommonBean commonBean;


  @Override
  @Transactional
  public CustMDTO saveCustM(CustMDTO custMDTO, ComInfoDTO comInfoDTO) throws Exception {

    TbCustMEntity tbCustMEntity = custMDTO.dtoToEntity(custMDTO, comInfoDTO, commonBean );

    tbCustMRespository.save(tbCustMEntity);
    log.debug(String.format("saveCustM :: tbCustMEntity.getCustSeq() = %s", tbCustMEntity.getCustSeq()));


    // 사용자 등록
    UserMDTO userMDTO = UserMDTO.builder()
            .custSeq(tbCustMEntity.getCustSeq())
            .usrLoginId(tbCustMEntity.getCustLoginId())
            .usrPwd("P@"+tbCustMEntity.getCustLoginId()+"dk!")
            .usrNm(tbCustMEntity.getCustPers())
            .build();

    userMDTO =  firstSaveUserM( userMDTO,  comInfoDTO);
    log.debug(String.format("saveCustM :: userMDTO = %s", userMDTO.toString()));

    CustMDTO custMDTORn = custMDTO.entityToDto(tbCustMEntity, commonBean);



     return custMDTORn;
  }

  @Override
  public CustMDTO findByCustNm(CustMDTO CustMDTO, ComInfoDTO comInfoDTO) throws Exception {
    return null;
  }

  @Override
  public CustMDTO findByCustLoginId(CustMDTO CustMDTO, ComInfoDTO comInfoDTO) throws Exception {
    return null;
  }


  private UserMDTO firstSaveUserM(UserMDTO userMDTO, ComInfoDTO comInfoDTO) throws Exception {

    TbUserMEntity tbUserMEntity = TbUserMEntity.builder()
            .custSeq(userMDTO.getCustSeq())
            .usrLoginId(userMDTO.getUsrLoginId())
            .usrNm(userMDTO.getUsrNm())
            .usrPwd(bcryptEncoder.encode(userMDTO.getUsrPwd()))
            .roles("ROLE_ADMIN,ROLE_MANAGER")
            .controllFieldDO(comInfoDTO.getControllFieldDTO())
            .build();

    log.debug("=== saveUserM :: " + tbUserMEntity.toString());
    tbUserMRespository.save(tbUserMEntity);

    return  userMDTO.entityToDto(tbUserMEntity, commonBean);
  }

  @Override
  public UserMDTO saveUserM(UserMDTO userMDTO, ComInfoDTO comInfoDTO) throws Exception {

    TbUserMEntity tbUserMEntity = userMDTO.dtoToEntity(userMDTO, comInfoDTO, commonBean );

    log.debug("=== saveUserM :: " + tbUserMEntity.toString());
    tbUserMRespository.save(tbUserMEntity);

    return  userMDTO.entityToDto(tbUserMEntity, commonBean);
  }
}
