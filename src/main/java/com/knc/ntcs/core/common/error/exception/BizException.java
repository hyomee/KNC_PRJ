package com.knc.ntcs.core.common.error.exception;

import com.knc.ntcs.core.common.constant.ComConstant;
import lombok.Getter;

@Getter
public class BizException extends RuntimeException {

  private String code;
  private String[] args;
  private Throwable throwable = null;



  public BizException() {
    super();
  }

  /**
   * 사용자 메세지를 화면으로 바로 노출
   * @param message
   */
  public BizException(String message) {
    super(message);
    this.code = ComConstant.NO_CODE;
  }

  public BizException(String code, String... args) {
    this.code = code;
    this.args = args;

  }
}

