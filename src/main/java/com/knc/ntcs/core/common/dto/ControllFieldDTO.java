package com.knc.ntcs.core.common.dto;

import org.springframework.util.StringUtils;

import com.knc.ntcs.core.common.utils.DateCalendarUtils;

import lombok.Getter;
import lombok.ToString;

@Getter
@ToString
public class ControllFieldDTO {

  private String regUsrId = "";
  private String regDttm = "";
  private String modUsrId = "";
  private String modDttm = "";

  public void setCreateId(String regUsrId, String regDttm) {

    this.regUsrId = regUsrId;
    this.regDttm = regDttm;
    if (StringUtils.isEmpty(regDttm)) {
      this.regDttm = DateCalendarUtils.currentDate("yyyyMMddHHmmss");
    }

  }

  public void setUpdate(String modUsrId, String regDttm) {
    this.regUsrId = modUsrId;
    this.modDttm = modDttm;
    if (StringUtils.isEmpty(modDttm)) {
      this.modDttm = DateCalendarUtils.currentDate("yyyyMMddHHmmss");
    }
  }

}
