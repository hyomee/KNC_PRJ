package com.knc.ntcs.core.config.test;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Base64;

public class kncdbconnection {



  public static void main(String[] arg) throws Exception {

    String url = "jdbc:mariadb://ctdev.cnntech.net:53306/ntcs";
    String encurl = encAES1(url);
    String id = "ntcs";
    String encid = encAES1(id);
    String pwd = "ntcs2021";
    String encpwd= encAES1(pwd);

    System.out.println(encurl);
    System.out.println(decAES1(encurl));

    System.out.println(encid);
    System.out.println(decAES1(encid));

    System.out.println(encpwd);
    System.out.println(decAES1(encpwd));

    url = "jdbc:mariadb://iabacusxxxxxxx";
    encurl = encAES1(url);
    id = "xxxxx";
    encid = encAES1(id);
    pwd = "xxxxxx";
    encpwd= encAES1(pwd);

    System.out.println(encurl);
    System.out.println(decAES1(encurl));

    System.out.println(encid);
    System.out.println(decAES1(encid));

    System.out.println(encpwd);
    System.out.println(decAES1(encpwd));

  }


  public static Key getAESKey1() throws Exception {
    String iv;
    Key keySpec;

    String key = "encryption!@dkecofarm";
    iv = key.substring(0, 16);
    byte[] keyBytes = new byte[16];
    byte[] b = key.getBytes("UTF-8");

    int len = b.length;
    if (len > keyBytes.length) {
      len = keyBytes.length;
    }

    System.arraycopy(b, 0, keyBytes, 0, len);
    keySpec = new SecretKeySpec(keyBytes, "AES");

    return keySpec;
  }

  // 암호화
  public static String encAES1(String str) throws Exception {
    Key keySpec = getAESKey1();
    String iv = "0987654321654321";
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
    byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
    String enStr = new String(Base64.getEncoder().encode(encrypted));

    return enStr;
  }

  // 복호화
  public static String decAES1(String enStr) throws Exception {
    Key keySpec = getAESKey1();
    String iv = "0987654321654321";
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
    byte[] byteStr = Base64.getDecoder().decode(enStr.getBytes("UTF-8"));
    String decStr = new String(c.doFinal(byteStr), "UTF-8");

    return decStr;
  }






}
