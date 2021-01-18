package co.kr.knc.core.common.error.advice;

import co.kr.knc.core.common.constant.DkHttpStatus;
import co.kr.knc.core.common.constant.ErrorConstant;
import co.kr.knc.core.common.dto.CustomMessageDTO;
import co.kr.knc.core.common.dto.ErrorMsgDTO;
import co.kr.knc.core.common.dto.ResponseDTO;
import co.kr.knc.core.common.dto.ResultDTO;
import co.kr.knc.core.common.error.BizExceptionUtils;
import co.kr.knc.core.common.error.advice.exception.SetException;
import co.kr.knc.core.common.utils.RequestUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
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
@Order(Ordered.LOWEST_PRECEDENCE)
public class ExceptionAdvice {

  @Value("${log.error.fillInStackTrace:false}")
  private boolean fillInStackTrace;

  @Value("${log.error.printStackTrace:false}")
  private boolean printStackTrace;

  private final SetException setException;

  private final MessageSource messageSource;

  // 생성자는 @RequiredArgsConstructor 선언 으로 자동 생성


  @ExceptionHandler(Exception.class)
  public ResponseEntity<ResponseDTO> exception(Exception ex,
                                              WebRequest request) {

    log.debug("==== fillInStackTrace :: " + fillInStackTrace);
    if (printStackTrace) {
      ex.printStackTrace();
    }

    BizExceptionUtils.fillInStackTrace(fillInStackTrace,"Exception", ex.fillInStackTrace().toString());

    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();
    CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();
    BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, ErrorConstant.ERROR_Exception);


    ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
            .message(customMessageDTO.getMessage())
            .build();

    error.add(errorMsgDTO);

    ResultDTO resultDTO = ResultDTO.builder()
            .code(customMessageDTO.getCode())
            .error(error)
            .status(String.valueOf(DkHttpStatus.INTERNAL_SERVER_ERROR.value()))
            .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
            .build();


    ResponseDTO responseDTO = ResponseDTO.builder()
            .result(resultDTO)
            .build();

    return ResponseEntity.status(Integer.parseInt(resultDTO.getStatus())).body(responseDTO) ;
            // new ResponseEntity<>(responseDTO, httpStatus);
  }





}
