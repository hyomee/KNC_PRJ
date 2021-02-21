package com.knc.ntcs.core.config.security.spring.dto;

import java.io.Serializable;

public class JwtResponseDTO implements Serializable {

  private final String jwt;

  public JwtResponseDTO(String jwt) {
    this.jwt = jwt;
  }

  public String getJwt() {
    return jwt;
  }
}
