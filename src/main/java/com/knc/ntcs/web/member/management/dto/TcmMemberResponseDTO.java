package com.knc.ntcs.web.member.management.dto;

import org.apache.ibatis.type.Alias;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@ToString
@Alias("TcmMemberResponseDTO")
public class TcmMemberResponseDTO {

	private String usrId;
	private String usrEmail;
	private String usrPassword;
	private String usrType;
	private String usrStat;
	private String custId;
	private String scrbDttm;
	private String tmntDttm;
	private String tmntResn;
	private String joinId;
	private String switchFlag;
	private String switchManager;
	private String operatorId;
	private String creationDate;
	private String updateDate;
}
