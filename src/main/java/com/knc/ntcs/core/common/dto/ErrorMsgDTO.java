package com.knc.ntcs.core.common.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
public class ErrorMsgDTO {
  private String message = "";
  private String objId = "";
  private String objValue = "";

  @Builder
  public ErrorMsgDTO(String message, String objId, String objValue) {
    this.message = message;

    if (objId == null) objId = "";
    this.objId = objId;

    if (objValue == null) objValue = "";
    this.objValue = objValue;
  }


}
