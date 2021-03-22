package ntcs.core.common.error.advice.vo;

import com.knc.ntcs.core.common.constant.DkHttpStatus;
import lombok.Builder;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
public class ErrorResponseVO {

  private String errorCode;
  private String errorMsg;
  private String error;
  private String path;
  DkHttpStatus dkHttpStatus;

  @Builder
  public ErrorResponseVO( String errorCode,
           String errorMsg,
           String error,
           String path,
           DkHttpStatus dkHttpStatus) {

    this.errorCode = errorCode;
    this.errorMsg = errorMsg;
    this.error =  error;
    this.path =  path;
    this.dkHttpStatus =  dkHttpStatus;

  }


}
