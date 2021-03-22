package com.knc.ntcs.web.login.dto;

import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import lombok.*;
import org.apache.ibatis.type.Alias;

@Setter
@Getter
@ToString
@NoArgsConstructor
@Alias("LoginResponseDTO")
public class LoginResponseDTO extends ControllFieldDTO {

  private String authToken;

  @Builder
  public LoginResponseDTO( String authToken ) {
    this.authToken = authToken;
  }
}
