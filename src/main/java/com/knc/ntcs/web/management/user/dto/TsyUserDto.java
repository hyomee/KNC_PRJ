package com.knc.ntcs.web.management.user.dto;


import lombok.*;

@Setter
@Getter
@NoArgsConstructor(access = AccessLevel.PUBLIC)
// @EqualsAndHashCode(callSuper = true)
@ToString
public class TsyUserDto {

  private String userId;
  private String password;
  private String userName;
  private String userGroupId;
  private String orgId;
  private String crrTp;
  private String empNo;
  private String telNo;
  private String mtelNo;
  private String eMail;
  private String ipBandwidth;
  private int loginFailCount;
  private String passwordDueDate;
  private int passwordChangePeriod;
  private String lastLoginDate;
  private String lastLoginTime;
  private String accountLock;
  private String password1;
  private String password2;
  private String useYn;
  private String roles;

}
