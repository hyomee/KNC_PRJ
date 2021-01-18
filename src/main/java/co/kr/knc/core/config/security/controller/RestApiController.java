package co.kr.knc.core.config.security.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class RestApiController {

  // 모든 사람이 접근 가능
  @GetMapping("home")
  public String home() {
    return "<h1>home</h1>";
  }

  // 모든 사람이 접근 가능
  @GetMapping("index")
  public String index() {
    return "forword:/index.html";
  }



}
