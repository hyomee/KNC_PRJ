package com.knc.ntcs.core.config.security.service;

import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import com.knc.ntcs.web.management.user.respository.TsyUserRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Slf4j
public class UserFindServiceImpl implements UserFindService{

  @Autowired
  private TsyUserRepository tsyUserRepository;


  @Override
  public JwtUserVO findByUsrLoginId(String userId) {

    log.debug("===== 1. UserFindServiceImpl 진입 =====");
    TsyUserEntity tsyUserEntity = tsyUserRepository.findByUserId(userId);

    JwtUserVO jwtUser = JwtUserVO.builder()
            .userId(tsyUserEntity.getUserId())
            .userName(tsyUserEntity.getUserName())
            .password(tsyUserEntity.getPassword())
            .roles(tsyUserEntity.getRoles())
            .build();


    return jwtUser;
  }
}
