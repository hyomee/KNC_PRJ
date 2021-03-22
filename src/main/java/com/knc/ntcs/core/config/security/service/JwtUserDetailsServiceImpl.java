package com.knc.ntcs.core.config.security.service;

import com.knc.ntcs.core.config.security.spring.dto.JwtUserDetailsVO;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;
import com.knc.ntcs.web.management.user.entity.TsyUserEntity;
import com.knc.ntcs.web.management.user.respository.TsyUserRepository;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

// 로그인 요청 이어면 /login

@Service
@Slf4j
public class JwtUserDetailsServiceImpl implements UserDetailsService {

  @Autowired
  private TsyUserRepository tsyUserRepository;

  @Override
  public UserDetails loadUserByUsername(String userId) throws UsernameNotFoundException {
    log.debug("===== 1. JwtUserDetailsService 진입 =====");
    TsyUserEntity tsyUserEntity = tsyUserRepository.findByUserId(userId);
    JwtUserVO jwtUser ;

    if (tsyUserEntity == null) {
      jwtUser = JwtUserVO.builder().build();
    } else {
      jwtUser = JwtUserVO.builder()
              .userId(tsyUserEntity.getUserId())
              .userName(tsyUserEntity.getUserName())
              .password(tsyUserEntity.getPassword())
              .roles(tsyUserEntity.getRoles())
              .build();
    }

    log.debug("===== 1. JwtUserDetailsService 종료 : jwtUser = \n" + jwtUser.toString());


    return new JwtUserDetailsVO(jwtUser);
  }
}
