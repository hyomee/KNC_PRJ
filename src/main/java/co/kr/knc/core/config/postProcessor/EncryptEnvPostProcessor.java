package co.kr.knc.core.config.postProcessor;

import lombok.extern.slf4j.Slf4j;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.env.EnvironmentPostProcessor;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.PropertiesPropertySource;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;
import java.security.Key;
import java.util.Base64;
import java.util.Properties;

@Slf4j
public class EncryptEnvPostProcessor implements EnvironmentPostProcessor {


  private String key = "encryption!@dkecofarm";

  @Override
  public void postProcessEnvironment(ConfigurableEnvironment environment, SpringApplication application) {

    Properties props = new Properties();
    try {

      String url = decAES(environment.getProperty("spring.datasource.url"));
      String id =  decAES(environment.getProperty("spring.datasource.username"));
      String pwd = decAES(environment.getProperty("spring.datasource.password"));

      log.debug("==== URL ::" + url);
      log.debug("==== URL ::" + id);
      log.debug("==== URL ::" + pwd);

      props.put("spring.datasource.url", url);
      props.put("spring.datasource.password", pwd);
      props.put("spring.datasource.username", id);
    } catch (Exception e) {
      System.out.println("DB id/password decrypt fail !");
    }

    environment.getPropertySources().addFirst(new PropertiesPropertySource("myProps", props));

  }


  private Key  getAESKey() throws Exception {
    String iv;
    Key keySpec;

    iv = key.substring(0, 16);
    byte[] keyBytes = new byte[16];
    byte[] b = key.getBytes("UTF-8");

    int len = b.length;
    if (len > keyBytes.length) {
      len = keyBytes.length;
    }

    System.arraycopy(b, 0, keyBytes, 0, len);
    SecretKeySpec secretKeySpec = new SecretKeySpec(keyBytes, "AES");

    return secretKeySpec;
  }

  // 암호화
  private String encAES(String str) throws Exception {
    Key keySpec = getAESKey();
    String iv = "0987654321654321";
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.ENCRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
    byte[] encrypted = c.doFinal(str.getBytes("UTF-8"));
    String enStr = new String(Base64.getEncoder().encode(encrypted));

    return enStr;
  }

  // 복호화
  private String decAES(String enStr) throws Exception {
    Key keySpec = getAESKey();
    String iv = "0987654321654321";
    Cipher c = Cipher.getInstance("AES/CBC/PKCS5Padding");
    c.init(Cipher.DECRYPT_MODE, keySpec, new IvParameterSpec(iv.getBytes("UTF-8")));
    byte[] byteStr = Base64.getDecoder().decode(enStr.getBytes("UTF-8"));
    String decStr = new String(c.doFinal(byteStr), "UTF-8");

    return decStr;
  }

}
