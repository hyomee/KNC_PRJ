package com.knc.ntcs.web.custmgmt.doamin;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.config.modelmapper.CommonBean;
import com.knc.ntcs.web.custmgmt.entity.TbCustMEntity;
import lombok.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.NotNull;


@Getter
@Setter
@NoArgsConstructor
@EqualsAndHashCode
@ToString
@Slf4j
@Alias("TbCustMDTO")
public class CustMDTO extends ControllFieldDTO {


  private long custSeq;

  @NotNull
  private String custLoginId;

  @NotNull
  private String custNm;
  private String custTypeCdId;
  private String custTelNo;
  private String custPers;
  private String custPost;
  private String custAddr;
  private int chargeSmsLimitCnt;
  private int loginStepCnt;
  private String custWlogoFile;
  private String custMlogoFile;
  private String custRegNo;
  private String useYn;
  private String delYn;

  public TbCustMEntity dtoToEntity(CustMDTO custMDTO, ComInfoDTO comInfoDTO, CommonBean ommonBean) {

    TbCustMEntity tbCustMEntity = ommonBean.modelMapper().map(custMDTO, TbCustMEntity.class);
    tbCustMEntity.setControllField(comInfoDTO.getControllFieldDTO());

    log.debug("==== tbCustMEntity :: " + tbCustMEntity.toString());
    return   tbCustMEntity;
  }

  public CustMDTO entityToDto(TbCustMEntity tbIotDevMEntity, CommonBean ommonBean) {
    CustMDTO custMDTO = ommonBean.modelMapper().map(tbIotDevMEntity, CustMDTO.class);
    return custMDTO;
  }
}
