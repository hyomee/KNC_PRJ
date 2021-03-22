package com.knc.ntcs.core.config.restTemplate;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Component
public class KncRestTemplate {

  String url = "http://192.168.35.153:18081/ntcs/admin/v1";

  private final RestTemplate restTemplate;

  public <T> T post(String uri, T data) {
    MultiValueMap parameters = (MultiValueMap) data;
    ResponseEntity<HashMap> res = new RestTemplate().postForEntity(url, parameters, HashMap.class);
    return (T) res;
  }

  public <T> T get(String uri, String pathVariable) {
    ResponseEntity<HashMap> res = new RestTemplate().getForEntity(url + "?" + pathVariable,  HashMap.class);
    return (T) res;
  }


  public <T> HashMap postForHashmap(String uri, T data) {
    MultiValueMap parameters = (MultiValueMap) data;
    ResponseEntity<HashMap> res = new RestTemplate().postForEntity(url, parameters, HashMap.class);
    HashMap hpRn = new HashMap();
    hpRn.put("header", res.getHeaders());
    hpRn.put("body", res.getBody());

    return hpRn;
  }

  public <T> HashMap getForHashmap(String uri , String pathVariable) {
    ResponseEntity<HashMap> res = new RestTemplate().getForEntity(url + "?" + pathVariable,  HashMap.class);
    HashMap hpRn = new HashMap();
    hpRn.put("header", res.getHeaders());
    hpRn.put("body", res.getBody());

    return hpRn;
  }
}
