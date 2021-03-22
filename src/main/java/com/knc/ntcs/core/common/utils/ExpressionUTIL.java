package ntcs.core.common.utils;

import java.util.Arrays;
import java.util.List;

public class ExpressionUTIL {

  public static Boolean containsListAndList(String compA, String compB) {

    boolean bl = false;

    List ca = Arrays.asList(compA.split("#"));
    List cb = Arrays.asList(compB.split("#"));

    for ( int i = 0; i < ca.size() ; i++) {
      for ( int j = 0; j < cb.size() ; j++) {
        if (ca.get(i).equals(cb.get(j))) {
          bl = true;
        }
      }
    }
    return bl;
  }


  public static Boolean containsStringAndList(String compA, String compB) {
    boolean bl = false;
    List cb = Arrays.asList(compB.split("#"));
    for ( int j = 0; j < cb.size() ; j++) {
      if (compA.equals(cb.get(j))) {
        bl = true;
      }
    }
    return bl;
  }
}
