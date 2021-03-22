package com.knc.ntcs.core.config.restTemplate;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import java.util.HashMap;

@Slf4j
@RequiredArgsConstructor
@Component
public class KncRestTemplate {

  private final ObjectMapper objectMapper;

  String baseUrl = "http://localhost:8081/";
  private Object Map;


  public <T> T post(String uri, T data) {
    HashMap parameters = objectMapper.convertValue(data, HashMap.class);
    // MultiValueMap parameters = objectMapper.convertValue(data, HashMap.class);
    ResponseEntity<HashMap> res = new RestTemplate().postForEntity(baseUrl + uri, parameters, HashMap.class);
    return (T) res;
  }

  public <T> T get(String uri, String pathVariable) {
    ResponseEntity<HashMap> res = new RestTemplate().getForEntity(baseUrl + uri + "?" + pathVariable,  HashMap.class);
    return (T) res;
  }


  public <T> HashMap postForHashmap(String uri, T data) {

    HashMap parameters = objectMapper.convertValue(data, HashMap.class);
    ResponseEntity<HashMap> res = new RestTemplate().postForEntity(baseUrl + uri, parameters, HashMap.class);
    HashMap hpRn = new HashMap();
    hpRn.put("header", res.getHeaders());
    hpRn.put("body", res.getBody());

    return hpRn;
  }

  public <T> HashMap getForHashmap(String uri , String pathVariable) {
    ResponseEntity<HashMap> res = new RestTemplate().getForEntity(baseUrl + uri + "?" + pathVariable,  HashMap.class);
    HashMap hpRn = new HashMap();
    hpRn.put("header", res.getHeaders());
    hpRn.put("body", res.getBody());

    return hpRn;
  }
}
