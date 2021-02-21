package com.knc.ntcs.core.config.security.spring.dto;

import io.micrometer.core.instrument.util.StringUtils;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JwtRequestDTO {
  private String usrLoginId;
  private String usrPwd;

  public boolean isInvalid() {
    return StringUtils.isBlank(usrLoginId) || StringUtils.isBlank(usrPwd);
  }
}
