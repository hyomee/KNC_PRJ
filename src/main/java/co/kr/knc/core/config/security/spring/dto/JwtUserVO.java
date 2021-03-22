package co.kr.knc.core.config.security.spring.dto;

import lombok.Builder;
import lombok.Data;
import lombok.ToString;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@Data
@ToString
public class JwtUserVO {
  private long userSeq;
  private String username;
  private String password;
  private String roles;

  @Builder
  public JwtUserVO(long userSeq, String username, String password, String roles) {
    this.userSeq = userSeq;
    this.username = username;
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
