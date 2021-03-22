package com.knc.ntcs.web.member.contactsales.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Service;

import com.knc.ntcs.web.member.contactsales.mapper.MemberContactSalesMapper;
import com.knc.ntcs.web.member.contactsales.service.MemberContactSalesService;

import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequiredArgsConstructor
@Service
public class MemberContactSalesServiceImpl implements MemberContactSalesService {

	private MemberContactSalesMapper mapper;
	
    public List<Map<String, Object>> selectCombo() throws Exception {
        
    	return mapper.selectTableList();
    }	
	
}
