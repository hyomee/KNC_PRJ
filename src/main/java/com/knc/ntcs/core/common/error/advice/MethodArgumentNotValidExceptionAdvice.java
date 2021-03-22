package ntcs.core.common.error.advice;

import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.error.BizExceptionUtils;
import com.knc.ntcs.core.common.error.advice.exception.SetException;
import com.knc.ntcs.core.common.utils.RequestUtils;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.MessageSource;
import org.springframework.context.support.MessageSourceAccessor;
import org.springframework.core.Ordered;
import org.springframework.core.annotation.Order;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.MethodArgumentNotValidException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.context.request.WebRequest;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;

@Slf4j
@RequiredArgsConstructor
@RestControllerAdvice
@Order(Ordered.HIGHEST_PRECEDENCE)
public class MethodArgumentNotValidExceptionAdvice {


  @Value("${log.error.fillInStackTrace:false}")
  private boolean fillInStackTrace;

  @Value("${log.error.printStackTrace:false}")
  private boolean printStackTrace;

  private final SetException setException;

  private final MessageSource messageSource;

  // 생성자는 @RequiredArgsConstructor 선언 으로 자동 생성


  @ExceptionHandler(MethodArgumentNotValidException.class)
  public ResponseEntity<ResponseDTO> methodArgumentNotValidException(MethodArgumentNotValidException ex,
                                               WebRequest request) {

    log.debug("==== MethodArgumentNotValidException :: fillInStackTrace :: " + fillInStackTrace);
    if (printStackTrace) {
     //.printStackTrace();
    }

    List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();
    try {
      BindingResult bindingResult = ex.getBindingResult();

      StringBuilder builder = new StringBuilder();
      for (FieldError fieldError : bindingResult.getFieldErrors()) {

        ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
                .message(BizExceptionUtils.getMessage(messageSource, fieldError.getDefaultMessage(),fieldError.getArguments()))
                .objId(fieldError.getField())
                .objValue(fieldError.getRejectedValue() + "")
                .build();
        error.add(errorMsgDTO);


        log.debug("StringBuilder builder :: " + fieldError.getCode() + "." + fieldError.getObjectName());
      }

    } catch (Exception xx) {
      xx.printStackTrace();
    }



    //final ErrorResponse response = ErrorResponse.of(ErrorCode.INVALID_INPUT_VALUE, e.getBindingResult());
    BizExceptionUtils.fillInStackTrace(fillInStackTrace,"Exception", ex.fillInStackTrace().toString());



    ResultDTO resultDTO =  ResultDTO.builder()
            .code(String.valueOf(DkHttpStatus.INTERNAL_SERVER_ERROR.value()))
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


  @Resource(name = "messageSourceAccessor")
  private MessageSourceAccessor msa;

  private String getErrorMessage(String code, FieldError fieldError) {
    //log.debug("MessageSourceAccessor :: Code :: " + code);

    log.info("code.get() : {}", code);
    String errorMessage = msa.getMessage(code, fieldError.getArguments());
    log.info("error message: {}", errorMessage);
    return errorMessage;


  }

}
