package ntcs.core.common.utils;

import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class LogUtils {

  @Value("${log.ruledebug:Y}")
  private  String logRulelog;

  public  void logPrint(Class cls, String msg) {
    if (logRulelog.equals("Y")) {
      log.debug(cls + "::" + msg);
    }
  }

}
