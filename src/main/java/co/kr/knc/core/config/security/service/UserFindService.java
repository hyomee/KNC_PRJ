package co.kr.knc.core.config.security.service;

import co.kr.knc.core.config.security.spring.dto.JwtUserVO;

public interface UserFindService {
  JwtUserVO  findByUsrLoginId(String UserLoginId);
}
