package co.kr.knc.core.common.dto;

import lombok.Data;

@Data
public class PageingDTO {
  int page;
  int size;
  String name;
}
