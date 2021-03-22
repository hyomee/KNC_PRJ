package ntcs.core.common.dto;

import com.fasterxml.jackson.annotation.JsonInclude;

import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@JsonInclude(JsonInclude.Include.NON_NULL)
@ToString
public class CustomMessageDTO {
  private String code = "";
  private String message = "";

  @Builder
  public CustomMessageDTO(String code, String message) {

    this.code = code;
    this.message = message;

  }
}
