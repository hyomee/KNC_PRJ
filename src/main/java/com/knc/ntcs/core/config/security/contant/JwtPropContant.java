package com.knc.ntcs.core.config.security.contant;

public class JwtPropContant {
  public final static String SECRET = "디케이팜"; // 우리 서버만 알고 있는 비밀값
  public final static int EXPIRATION_TIME = 864000000; // 10일 (1/1000초)
  public final static String TOKEN_PREFIX = "dkfarm "; // "Bearer "
  public final static String HEADER_STRING = "x_auth_token";    // "Authorization";


}
