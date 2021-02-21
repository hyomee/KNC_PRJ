package com.knc.ntcs.web.custmgmt.entity;


import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.common.entity.ControllField;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

import javax.persistence.*;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

@Entity
@Table(name="TB_USER_M")
@Getter
@NoArgsConstructor
@ToString
public class TbUserMEntity extends ControllField implements Serializable {

  @Id
  @GeneratedValue(strategy = GenerationType.IDENTITY)
  private long usrSeq;

  private long custSeq;
  private long orgSeq;
  private String usrLoginId;
  private String usrPwd;
  private String usrNm;
  private String roles;
  private String roleCdId;
  private String smsRcvNo;
  private String useYn;
  private String firstLoginYn;
  private String usrSlpYn;
  private String usrLckYn;
  private String smsUseYn;
  private String pushUseYn;
  private String orgSetYn;
  private long loginFailCnt;
  private long smsAuthFailCnt;
  private String usrPhoneNo;
  private String usrEmail;
  private Date lastLoginDttm;
  private Date pwdModDttm;
  private Date pwdNxtDttm;
  private Date usrSttsModDttm;
  private Date usrSlpModDttm;
  private Date usrLckModDttm;
  private String authCdId;
  private String authNo;
  private Date authSmsSndDttm;
  private Date authNoExpireDttm;
  private Date authSuccDttm;

  // 고객 조회

  @Builder
  public TbUserMEntity(long usrSeq,
                       long custSeq,
                       long orgSeq,
                       String usrLoginId,
                       String usrPwd,
                       String usrNm,
                       String roles,
                       String roleCdId,
                       String smsRcvNo,
                       String useYn,
                       String firstLoginYn,
                       String usrSlpYn,
                       String usrLckYn,
                       String smsUseYn,
                       String pushUseYn,
                       String orgSetYn,
                       long loginFailCnt,
                       long smsAuthFailCnt,
                       String usrPhoneNo,
                       String usrEmail,
                       Date lastLoginDttm,
                       Date pwdModDttm,
                       Date pwdNxtDttm,
                       Date usrSttsModDttm,
                       Date usrSlpModDttm,
                       Date usrLckModDttm,
                       String authCdId,
                       String authNo,
                       Date authSmsSndDttm,
                       Date authNoExpireDttm,
                       Date authSuccDttm,
                       ControllFieldDTO controllFieldDO) {
    this.usrSeq = usrSeq;
    this.custSeq = custSeq;
    this.orgSeq = orgSeq;
    this.usrLoginId = usrLoginId;
    this.usrPwd = usrPwd;
    this.usrNm = usrNm;
    this.roles = roles;
    this.roleCdId = roleCdId;
    this.smsRcvNo = smsRcvNo;
    this.useYn = useYn;
    this.firstLoginYn = firstLoginYn;
    this.usrSlpYn = usrSlpYn;
    this.usrLckYn = usrLckYn;
    this.smsUseYn = smsUseYn;
    this.pushUseYn = pushUseYn;
    this.orgSetYn = orgSetYn;
    this.loginFailCnt = loginFailCnt;
    this.smsAuthFailCnt = smsAuthFailCnt;
    this.usrPhoneNo = usrPhoneNo;
    this.usrEmail = usrEmail;
    this.lastLoginDttm = lastLoginDttm;
    this.pwdModDttm = pwdModDttm;
    this.pwdNxtDttm = pwdNxtDttm;
    this.usrSttsModDttm = usrSttsModDttm;
    this.usrSlpModDttm = usrSlpModDttm;
    this.usrLckModDttm = usrLckModDttm;
    this.authCdId = authCdId;
    this.authNo = authNo;
    this.authSmsSndDttm = authSmsSndDttm;
    this.authNoExpireDttm = authNoExpireDttm;
    this.authSuccDttm = authSuccDttm;

    // 제어핑드 설정
    super.setControllField(controllFieldDO);
  }

  // roles에 이있는 권한 USER, ADMIN ..
  public List<String> getRoleList(){
    if(this.roles.length() > 0){
      return Arrays.asList(this.roles.split(","));
    }
    return new ArrayList<>();
  }

  public void setControllField(ControllFieldDTO controllFieldDO) {
    super.setControllField(controllFieldDO);
  }
}
