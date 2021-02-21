package com.knc.ntcs.web.custmgmt.repository;


import com.knc.ntcs.web.custmgmt.entity.TbCustMEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;


public interface TbCustMRepository extends JpaRepository<TbCustMEntity, Long>, QuerydslPredicateExecutor<TbCustMEntity> {
  TbCustMEntity findByCustNm(String custNm);
  TbCustMEntity findByCustLoginId(String findByCustLoginId);
}
