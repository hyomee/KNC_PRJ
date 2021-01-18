package co.kr.knc.core.common.utils;

public class DataUtils {

  public static <T> boolean IsNull(T value) {
    if (value == null && value.toString().length() == 0 ) return false;
    return true;
  }
}
