package ntcs.core.common.error;

import com.knc.ntcs.core.common.constant.DkHttpStatus;
import com.knc.ntcs.core.common.constant.ErrorConstant;
import com.knc.ntcs.core.common.dto.CustomMessageDTO;
import com.knc.ntcs.core.common.dto.ErrorMsgDTO;
import com.knc.ntcs.core.common.dto.ResponseDTO;
import com.knc.ntcs.core.common.dto.ResultDTO;
import com.knc.ntcs.core.common.utils.RequestUtils;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.autoconfigure.web.ServerProperties;
import org.springframework.boot.autoconfigure.web.servlet.error.BasicErrorController;
import org.springframework.boot.autoconfigure.web.servlet.error.ErrorViewResolver;
import org.springframework.boot.web.servlet.error.ErrorAttributes;
import org.springframework.context.MessageSource;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

@Slf4j
@Controller
@RequestMapping("${server.error.path:${error.path:/error}}")
public class ErrorController extends BasicErrorController {

  @Value("${log.error.fillInStackTrace:false}")
  private boolean fillInStackTrace;

  @Value("${log.error.printStackTrace:false}")
  private boolean printStackTrace;

  @Autowired
  private  MessageSource messageSource;

  public ErrorController(ErrorAttributes errorAttributes,
                               ServerProperties serverProperties,
                               List<ErrorViewResolver> errorViewResolvers) {

    super(errorAttributes, serverProperties.getError(), errorViewResolvers);
    log.debug("=== " + errorAttributes.toString());

    log.debug("error :: ResponseEntity " + serverProperties.getError());
    log.debug("error :: errorAttributes " + errorAttributes.toString());
  }

  @RequestMapping(produces = MediaType.TEXT_HTML_VALUE)
  public ModelAndView errorHtml(HttpServletRequest request,
                                HttpServletResponse response) {
    log(request); // 로그 추가
    log.error("error :: errorHtml ");
    return super.errorHtml(request, response);
  }

  @Override
  public ResponseEntity<Map<String, Object>> error(HttpServletRequest request) {
    log(request);
    log.error("error :: ResponseEntity ");
    HttpStatus status = super.getStatus(request);
    if (status == HttpStatus.NO_CONTENT) {
      return new ResponseEntity(status);
    } else if (status == HttpStatus.NOT_FOUND) {

      Map<String, Object> body = super.getErrorAttributes(request, this.getErrorAttributeOptions(request, MediaType.ALL));
      List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

      CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, ErrorConstant.ERROR_InternalServerError);


      ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
              .message(customMessageDTO.getMessage())
              .objValue(body.get("message").toString())
              .build();

      error.add(errorMsgDTO);

      ResultDTO resultDTO = ResultDTO.builder()
              .code(customMessageDTO.getCode())
              .error(error)
              .status(String.valueOf(DkHttpStatus.NOT_FOUND.value()))
              .path(RequestUtils.getHttpServletRequest().getRequestURL().toString())
              .build();


      ResponseDTO responseDTO = ResponseDTO.builder()
              .result(resultDTO)
              .build();

      return new ResponseEntity(responseDTO, status);
    } else {
      Map<String, Object> body = super.getErrorAttributes(request, this.getErrorAttributeOptions(request, MediaType.ALL));
      log.error("error :: Map<String, Object> body  ::  " + body.toString());

      List<ErrorMsgDTO> error = new ArrayList<ErrorMsgDTO>();

      CustomMessageDTO customMessageDTO = CustomMessageDTO.builder().build();
      BizExceptionUtils.getCustomMessage(customMessageDTO, messageSource, ErrorConstant.ERROR_NoHandlerFoundException);


      ErrorMsgDTO errorMsgDTO = ErrorMsgDTO.builder()
              .message(customMessageDTO.getMessage())
              .objValue(body.get("message").toString())
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

      return new ResponseEntity(responseDTO, status);
    }
    //return super.error(request);
  }

  private void log(HttpServletRequest request) {
    //request.get
    log.error("error");
  }
}
