package co.kr.knc.test;

import java.util.HashMap;

public class TestCaseMain {

  public static void main(String[] args) {
    HashMap hashMap = new HashMap();
    HashMap hashMap1 = new HashMap();

    hashMap1.put("ZZ", "1" );
    hashMap1.put("YY", "2" );

    hashMap.put("AA", hashMap1 );
    hashMap.put("BB", "홍길도" );


    System.out.println(( (HashMap) hashMap.get("AA")).get("ZZ"));

    Object obj = getObj(hashMap, "AA");
    Object obj1 = getObj((HashMap)obj, "ZZ");





  }

  private static Object getObj(HashMap hp, String key) {
    return hp.get(key);
  }

  private static Object getXXXX (Object pObj, String key) {
    Object rnObejct = new  Object();
    if ( pObj instanceof String ) {
      rnObejct = pObj ;
    } else if ( pObj instanceof Object ) {
      rnObejct =  getObj((HashMap)pObj, "ZZ");
    }
    return rnObejct;
  }
}