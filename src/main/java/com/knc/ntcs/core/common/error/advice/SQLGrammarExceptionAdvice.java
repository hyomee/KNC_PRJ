package com.knc.ntcs.core.common.error.advice;

import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.constant.ErrorConstant;
import com.knc.ntcs.core.common.dto.CustomMessageDTO;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.error.BizExceptionUtils;
import com.knc.ntcs.core.common.utils.RequestUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.hibernate.exception.SQLGrammarException;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class SQLGrammarExceptionAdvice {

  @Value("${log.error.fillInStackTrace:false}")
  private boolean fillInStackTrace;

  @Value("${log.error.printStackTrace:false}")
  private boolean printStackTrace;

  private final MessageSource messageSource;

  @ExceptionHandler(SQLGrammarException.class)
  public ResponseEntity<ResponseDTO> SQLExceptionException(SQLGrammarException ex, WebRequest request) {

    if (printStackTrace) {
      ex.printStackTrace();
    }

    BizExceptionUtils.fillInStackTrace(fillInStackTrace, "SQLGrammarExceptionAdvice :: ", ex.fillInStackTrace().toString());

    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();
    CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();
    BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, ErrorConstant.ERROR_SQLGrammarExceptionAdvice);


    ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
            .message(customMessageDTO.getMessage()  + "[" + ex.getSQLException().getMessage() + "]")
            .objId(ex.getErrorCode()+"")
            .objValue(ex.getSQLState())
            .build();

    error.add(errorMsgDTO);

    ResultDTO resultDTO = ResultDTO.builder()
            .code(customMessageDTO.getCode())
            .error(error)
            .status(String.valueOf(DkHttpStatus.METHOD_NOT_ALLOWED.value()))
            .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
            .build();


    ResponseDTO responseDTO = ResponseDTO.builder()
            .result(resultDTO)
            .build();



    return ResponseEntity.status(DkHttpStatus.METHOD_NOT_ALLOWED.value()).body(responseDTO);
    // new ResponseEntity<>(responseDTO, HttpStatus.INTERNAL_SERVER_ERROR);
  }
}
