package com.knc.ntcs.web.custmgmt.doamin;


import com.knc.ntcs.core.common.dto.ComInfoDTO;
import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.config.modelmapper.CommonBean;
import com.knc.ntcs.web.custmgmt.entity.TbUserMEntity;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import lombok.extern.slf4j.Slf4j;
import org.apache.ibatis.type.Alias;
import org.springframework.util.StringUtils;

import java.util.Date;

@Setter
@Getter
@Slf4j
@ToString
@Alias("DkUserMDTO")
public class UserMDTO extends ControllFieldDTO {
  private long usrSeq;

  private long custSeq;
  private long orgSeq;
  private String usrLoginId;
  private String usrPwd;
  private String usrNm;
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

  public UserMDTO() {};

  @Builder
  public UserMDTO(long tagSeq,
                  long custSeq,
                  long orgSeq,
                  String usrLoginId,
                  String usrPwd,
                  String usrNm) {

    this.usrSeq       = usrSeq;
    if (StringUtils.isEmpty(usrSeq))  this.usrSeq = 0;
    this.custSeq      = custSeq;
    if (StringUtils.isEmpty(custSeq))  this.custSeq = 0;
    this.orgSeq        = orgSeq;
    if (StringUtils.isEmpty(orgSeq))  this.orgSeq = 0;
    this.usrLoginId        = usrLoginId;
    if (StringUtils.isEmpty(usrLoginId))  this.usrLoginId = "";
    this.usrPwd        = usrPwd;
    if (StringUtils.isEmpty(usrPwd))  this.usrPwd = "";

    this.usrNm        = usrNm;
    if (StringUtils.isEmpty(usrNm))  this.usrNm = "";
  }


  public TbUserMEntity dtoToEntity(UserMDTO userMDTO, ComInfoDTO comInfoDTO, CommonBean ommonBean) {

    TbUserMEntity tbUserMEntity = ommonBean.modelMapper().map(userMDTO, TbUserMEntity.class);
    tbUserMEntity.setControllField(comInfoDTO.getControllFieldDTO());

    log.debug("==== TbUserMEntity :: " + tbUserMEntity.toString());
    return   tbUserMEntity;
  }

  public UserMDTO entityToDto(TbUserMEntity tbUserMEntity, CommonBean ommonBean) {
    UserMDTO userMDTO = ommonBean.modelMapper().map(tbUserMEntity, UserMDTO.class);
    return userMDTO;
  }
}
