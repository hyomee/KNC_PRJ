package com.knc.ntcs.core.common.error;

import com.knc.ntcs.core.common.constant.ErrorConstant;
import com.knc.ntcs.core.common.dto.CustomMessageDTO;
import lombok.extern.slf4j.Slf4j;
import org.springframework.context.MessageSource;
import org.springframework.context.i18n.LocaleContextHolder;

@Slf4j
public class BizExceptionUtils {

  public static void fillInStackTrace(boolean fillInStackTrace, String exception, String errorStr) {
    log.debug("==== fillInStackTrace :: " + fillInStackTrace);
    if (fillInStackTrace) {
      log.error("###### User Error Start #######" );
      log.error(String.format("==== Exception :: %s , ErrorMag :: %s", exception, errorStr));
      log.error("###### User Error End #######");
    }
  }

  // code정보에 해당하는 메시지를 조회합니다.
  public static String getMessage(MessageSource messageSource, String code) {
    return getMessage(messageSource, code, null);
  }
  // code정보, 추가 argument로 현재 locale에 맞는 메시지를 조회합니다.
  public static String getMessage(MessageSource messageSource, String code, Object[] args) {
    return messageSource.getMessage(code, args, LocaleContextHolder.getLocale());
  }


  public static void getCustomMessage(CustomMessageDTO customMessageDTO, MessageSource messageSource, String ymlKey) {

    customMessageDTO.setCode(BizExceptionUtils.getMessage(messageSource, ymlKey + ErrorConstant.ERROR_CODE));
    customMessageDTO.setMessage(BizExceptionUtils.getMessage(messageSource, ymlKey + ErrorConstant.ERROR_MSG));


  }
}
