package ntcs.core.config.security.spring.dto;

import io.micrometer.core.instrument.util.StringUtils;
import lombok.*;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class JwtRequestDTO {
  private String userId;
  private String password;

  public boolean isInvalid() {
    return StringUtils.isBlank(userId) || StringUtils.isBlank(password);
  }
}
