package com.knc.ntcs.web.management.user.entity;

import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.common.entity.ControllField;
import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name="TSY_USER")
@Getter
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@EqualsAndHashCode(callSuper = true)
@ToString
public class TsyUserEntity extends ControllField implements Serializable {

  @Id
  @Column(name = "USER_ID")
  private String userId;

  @Column(name = "PASSWORD")
  private String password;

  @Column(name = "USER_NAME")
  private String userName;

  @Column(name = "USER_GROUP_ID")
  private String userGroupId;

  @Column(name = "ORG_ID")
  private String orgId;

  @Column(name = "CRR_TP")
  private String crrTp;

  @Column(name = "EMP_NO")
  private String empNo;

  @Column(name = "TEL_NO")
  private String telNo;

  @Column(name = "MTEL_NO")
  private String mtelNo;

  @Column(name = "E_MAIL")
  private String eMail;

  @Column(name = "IP_BANDWIDTH")
  private String ipBandwidth;

  @Column(name = "LOGIN_FAIL_COUNT")
  private int loginFailCount;

  @Column(name = "PASSWORD_DUE_DATE")
  private String passwordDueDate;

  @Column(name = "PASSWORD_CHANGE_PERIOD")
  private int passwordChangePeriod;

  @Column(name = "LAST_LOGIN_DATE")
  private String lastLoginDate;

  @Column(name = "LAST_LOGIN_TIME")
  private String lastLoginTime;

  @Column(name = "ACCOUNT_LOCK")
  private String accountLock;

  @Column(name = "PASSWORD1")
  private String password1;

  @Column(name = "PASSWORD2")
  private String password2;

  @Column(name = "USE_YN")
  private String useYn;

  @Column(name = "ROLES")
  private String roles;

  @Builder
  public TsyUserEntity(String userId,
                       String password,
                       String userName,
                       String userGroupId,
                       String orgId,
                       String crrTp,
                       String empNo,
                       String telNo,
                       String mtelNo,
                       String eMail,
                       String ipBandwidth,
                       int loginFailCount,
                       String passwordDueDate,
                       int passwordChangePeriod,
                       String lastLoginDate,
                       String lastLoginTime,
                       String accountLock,
                       String password1,
                       String password2,
                       String useYn,
                       String roles,
                       ControllFieldDTO controllFieldDO ) {
    this.userId = userId;
    this.password = password;
    this.userName = userName;
    this.userGroupId = userGroupId;
    this.orgId = orgId;
    this.crrTp = crrTp;
    this.empNo = empNo;
    this.telNo = telNo;
    this.mtelNo = mtelNo;
    this.eMail = eMail;
    this.ipBandwidth = ipBandwidth;
    this.loginFailCount = loginFailCount;
    this.passwordDueDate = passwordDueDate;
    this.passwordChangePeriod = passwordChangePeriod;
    this.lastLoginDate = lastLoginDate;
    this.lastLoginTime = lastLoginTime;
    this.accountLock = accountLock;
    this.password1 = password1;
    this.password2 = password2;
    this.useYn = useYn;
    this.roles = roles;

    //제어 필드 설정
    super.setControllField(controllFieldDO);
  }

  public void setControllField(ControllFieldDTO controllFieldDO) {
    super.setControllField(controllFieldDO);
  }
}
