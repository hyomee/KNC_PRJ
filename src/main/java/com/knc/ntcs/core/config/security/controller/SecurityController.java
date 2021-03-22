package ntcs.core.config.security.controller;

import com.knc.ntcs.core.common.dto.ComInfoDTO;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping(value = "/security")
public class SecurityController {

  @GetMapping(value = "/passwordencode", headers = "X_APPLICATION=v1")
  public String passwordEncode(HttpServletRequest request,
                                               @RequestParam("password") String password,
                                               ComInfoDTO comInfoDTO) throws Exception {
    BCryptPasswordEncoder bCryptPasswordEncoder= new BCryptPasswordEncoder();
    String passwordencode = bCryptPasswordEncoder.encode(password);
    return passwordencode;
  }

}
