package ntcs.core.common.utils;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class DateCalendarUtils {

  /**
   * 현재 날짜 구하기 ( Date 객체 )
   * @param formatString
   *        - yyyyMMddHHmmss, yyyy-MM-dd HH:mm:ss, yyyy년 MM월dd일 HH시mm분ss초
   * @return
   */
  public static String currentDate(String formatString) {
    SimpleDateFormat format = new SimpleDateFormat( formatString );
    Date time = new Date();
    return format.format(time);
  }

  /**
   * 현재 날짜 구하기 ( Calendar 객체 )
   * @param formatString
   *        - yyyyMMddHHmmss, yyyy-MM-dd HH:mm:ss, yyyy년 MM월dd일 HH시mm분ss초
   * @return
   */
  public static String currentCalendar(String formatString) {
    SimpleDateFormat format = new SimpleDateFormat( formatString );
    Calendar time = Calendar.getInstance();
    return format.format(time.getTime());
  }

  /**
   * 현재 날짜 구하기 ( System 객체 )
   * @param formatString
   *        - yyyyMMddHHmmss, yyyy-MM-dd HH:mm:ss, yyyy년 MM월dd일 HH시mm분ss초
   * @return
   */
  public static String currentSystem(String formatString) {
    SimpleDateFormat format = new SimpleDateFormat( formatString );
    return format.format (System.currentTimeMillis());
  }

}
