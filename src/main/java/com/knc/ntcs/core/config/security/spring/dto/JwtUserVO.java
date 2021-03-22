package com.knc.ntcs.core.config.security.spring.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Data
@ToString
public class JwtUserVO {
  private String userId;
  private String userName;
  private String password;
  private String roles;

  @Builder
  public JwtUserVO(String userId, String userName, String password, String roles) {
    this.userId = userId;
    this.userName = userName;
    this.password = password;
    this.roles = roles;
  }

  // ENUM으로 안하고 ,로 해서 구분해서 ROLE을 입력 -> 그걸 파싱!!
  public List<String> getRoleList(){
    if(this.roles.length() > 0){
      return Arrays.asList(this.roles.split(","));
    }
    return new ArrayList<>();
  }

}
