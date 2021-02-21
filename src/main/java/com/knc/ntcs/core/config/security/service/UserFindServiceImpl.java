package com.knc.ntcs.core.config.security.service;

import com.knc.ntcs.core.config.security.spring.dto.JwtUserVO;
import com.knc.ntcs.web.custmgmt.entity.TbUserMEntity;
import com.knc.ntcs.web.custmgmt.repository.TbUserMRepository;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service
@Slf4j
public class UserFindServiceImpl implements UserFindService{

  @Autowired
  private TbUserMRepository tbUserMRespository;


  @Override
  public JwtUserVO findByUsrLoginId(String userLoginId) {

    log.debug("===== 1. UserFindServiceImpl 진입 =====");
    TbUserMEntity tbUserMEntity = tbUserMRespository.findByUsrLoginId(userLoginId);

    JwtUserVO jwtUser = JwtUserVO.builder()
            .userSeq(tbUserMEntity.getUsrSeq())
            .username(tbUserMEntity.getUsrLoginId())
            .password(tbUserMEntity.getUsrPwd())
            .roles(tbUserMEntity.getRoles())
            .build();

    return jwtUser;
  }
}
