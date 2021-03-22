package co.kr.knc.online.custmgmt.doamin;

import co.kr.knc.core.common.dto.ComInfoDTO;
import co.kr.knc.core.common.dto.ControllFieldDTO;
import co.kr.knc.core.config.modelmapper.CommonBean;
import co.kr.knc.online.custmgmt.entity.TbCustMEntity;
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
