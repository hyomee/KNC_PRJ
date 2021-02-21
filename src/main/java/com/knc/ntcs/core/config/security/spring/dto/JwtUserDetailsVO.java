package com.knc.ntcs.core.config.security.spring.dto;

import lombok.extern.slf4j.Slf4j;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;

import java.util.ArrayList;
import java.util.Collection;

@Slf4j
public class JwtUserDetailsVO implements UserDetails {

  private JwtUserVO jwtUserVO;

  public JwtUserDetailsVO(JwtUserVO jwtUserVO) {
    this.jwtUserVO = jwtUserVO;
  }

  public JwtUserVO getJwtUserVO() {
    return jwtUserVO;
  }


  @Override
  public String getPassword() {
    return jwtUserVO.getPassword();
  }

  @Override
  public String getUsername() {
    return jwtUserVO.getUsername();
  }

  @Override
  public boolean isAccountNonExpired() {
    return true;
  }

  @Override
  public boolean isAccountNonLocked() {
    return true;
  }

  @Override
  public boolean isCredentialsNonExpired() {
    return true;
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  @Override
  public Collection<? extends GrantedAuthority> getAuthorities() {
    log.debug("=== GrantedAuthority :: jwtUserVO :: " + jwtUserVO.getRoles());
    Collection<GrantedAuthority> authorities =  new ArrayList<>();
//    List jwtUserVOs = jwtUserVO.getRoleList();
//    jwtUserVOs.forEach(r->{
//      log.debug("=== GrantedAuthority :: " + r.toString());
//      authorities.add(return r);
//    }) ;
//
    jwtUserVO.getRoleList().forEach(r->{
      authorities.add(()->{
        return r;
      });
    });
    return authorities;
  }

}
