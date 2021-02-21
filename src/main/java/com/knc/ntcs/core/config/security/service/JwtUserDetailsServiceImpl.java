package com.knc.ntcs.core.config.security.service;

import com.knc.ntcs.core.config.security.spring.dto.JwtUserDetailsVO;
import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;
import com.knc.ntcs.web.custmgmt.entity.TbUserMEntity;
import com.knc.ntcs.web.custmgmt.repository.TbUserMRepository;
import lombok.extern.slf4j.Slf4j;
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
  private TbUserMRepository tbUserMRespository;

  @Override
  public UserDetails loadUserByUsername(String userLoginId) throws UsernameNotFoundException {
    log.debug("===== 1. JwtUserDetailsService 진입 =====");
    TbUserMEntity tbUserMEntity = tbUserMRespository.findByUsrLoginId(userLoginId);

    JwtUserVO jwtUser = JwtUserVO.builder()
            .userSeq(tbUserMEntity.getUsrSeq())
            .username(tbUserMEntity.getUsrLoginId())
            .password(tbUserMEntity.getUsrPwd())
            .roles(tbUserMEntity.getRoles())
            .build();
    log.debug("===== 1. JwtUserDetailsService 종료 : jwtUser = \n" + jwtUser.toString());


    return new JwtUserDetailsVO(jwtUser);
  }
}
