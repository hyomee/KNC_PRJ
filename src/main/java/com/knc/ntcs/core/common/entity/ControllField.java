package com.knc.ntcs.core.common.entity;


import javax.persistence.Column;
import javax.persistence.MappedSuperclass;

import org.springframework.util.StringUtils;

import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.knc.ntcs.core.common.utils.DateCalendarUtils;

import lombok.Getter;

@Getter
@MappedSuperclass
public class ControllField {

  @Column(name="REG_USR_ID", nullable = false)
  private String regUsrId;

  @Column(name="REG_DTTM", nullable = false)
  private String regDttm;

  @Column(name="MOD_USR_ID")
  private String modUsrId;

  @Column(name="MOD_DTTM")
  private String modDttm;


  protected void setControllField(ControllFieldDTO controllFieldDO) {
    this.regUsrId = controllFieldDO.getRegUsrId();
    setDefautReqDrrm(controllFieldDO.getRegDttm());
    this.modUsrId = controllFieldDO.getModUsrId();
    this.modDttm  = controllFieldDO.getModDttm();
  }

  private void setDefaultRegId(String regUsrId) {
    this.regUsrId = regUsrId;
    if (StringUtils.isEmpty(regUsrId)) {
      this.regUsrId = "SYSTEM";
    }
  }
  /**
   * 생성일자가 없는 경우 현재 일자를 자동으로 넣어 준다.
   * @param regDttm
   */
  private void setDefautReqDrrm(String regDttm) {
    this.regDttm = regDttm;
    if (StringUtils.isEmpty(regDttm)) {
      this.regDttm = DateCalendarUtils.currentDate("yyyyMMddHHmmss");
    }
  }



}
