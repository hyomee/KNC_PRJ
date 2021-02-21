package com.knc.ntcs.web.login.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotEmpty;
import javax.validation.constraints.Size;

import org.apache.ibatis.type.Alias;

import com.knc.ntcs.core.common.dto.ControllFieldDTO;
import com.sun.istack.NotNull;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

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
