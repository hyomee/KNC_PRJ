package com.knc.ntcs.web.custmgmt.entity;


import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.common.entity.ControllField;
import lombok.*;

import javax.persistence.*;
import java.io.Serializable;

@Entity
@Table(name="TB_CUST_M")
@Getter
@NoArgsConstructor
@AllArgsConstructor
@EqualsAndHashCode
@ToString
public class TbCustMEntity extends ControllField implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long custSeq;
  private String custLoginId;
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

  @Builder
  public TbCustMEntity( long custSeq,
                        String custLoginId,
                        String custNm,
                        String custTypeCdId,
                        String custTelNo,
                        String custPers,
                        String custPost,
                        String custAddr,
                        int chargeSmsLimitCnt,
                        int loginStepCnt,
                        String custWlogoFile,
                        String custMlogoFile,
                        String custRegNo,
                        String useYn,
                        String delYn,
                        ControllFieldDTO controllFieldDO) {

    this.custSeq = custSeq;

    this.custLoginId = custLoginId;
    this.custNm = custNm;
    this.custTypeCdId = custTypeCdId;
    this.custTelNo = custTelNo;
    this.custPers = custPers;
    this.custPost = custPost;
    this.custAddr = custAddr;
    this.chargeSmsLimitCnt = chargeSmsLimitCnt;
    this.loginStepCnt = loginStepCnt;
    this.custWlogoFile = custWlogoFile;
    this.custMlogoFile = custMlogoFile;
    this.custRegNo = custRegNo;
    this.useYn = useYn;
    this.delYn = delYn;

    // 제어핑드 설정
    super.setControllField(controllFieldDO);

  }


  public void setControllField(ControllFieldDTO controllFieldDO) {
    super.setControllField(controllFieldDO);
  }
}
