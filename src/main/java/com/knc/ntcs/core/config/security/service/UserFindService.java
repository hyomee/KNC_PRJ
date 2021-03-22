package com.knc.ntcs.core.config.security.service;

import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;

public interface UserFindService {
  JwtUserVO  findByUsrLoginId(String UserLoginId);
}
