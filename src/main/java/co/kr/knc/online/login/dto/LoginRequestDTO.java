package co.kr.knc.online.login.dto;


import co.kr.knc.core.common.dto.ControllFieldDTO;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@Setter
@Getter
@ToString
@Alias("LoginRequestDTO")
public class LoginRequestDTO extends ControllFieldDTO {
  @NotEmpty @Size(message = "V0001", min=4, max=12)
  private String id;

  @NotNull
  private String pwd;

  @Email
  private String email;

}
