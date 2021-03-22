package com.knc.ntcs.core.common.dto;

import lombok.Setter;
import org.springframework.util.StringUtils;

import com.knc.ntcs.core.common.utils.DateCalendarUtils;

import lombok.Getter;
import lombok.ToString;

import javax.persistence.Column;
@Setter
@Getter
@ToString
public class ControllFieldDTO {

  private String operatorId;
  private String createDate;
  private String updateDate;



}
