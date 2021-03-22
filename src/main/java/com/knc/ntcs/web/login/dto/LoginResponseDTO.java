package ntcs.web.login.dto;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;
import org.apache.ibatis.type.Alias;

@Setter
@Getter
@ToString
@Alias("LoginResponseDTO")
public class LoginResponseDTO {

  private String authToken;

  @Builder
  public LoginResponseDTO( String authToken ) {
    this.authToken = authToken;
  }
}
