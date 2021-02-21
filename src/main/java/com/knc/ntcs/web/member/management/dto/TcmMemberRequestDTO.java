package com.knc.ntcs.web.member.management.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Alias("TcmMemberRequestDTO")
public class TcmMemberRequestDTO {

	private String usrType;	
	private String nextPage;	
	private String prevPage;	
}
