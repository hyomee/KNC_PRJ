package com.knc.ntcs.web.custmgmt.repository;


import com.knc.ntcs.web.custmgmt.entity.TbUserMEntity;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

public interface TbUserMRepository extends JpaRepository<TbUserMEntity, Long>, QuerydslPredicateExecutor<TbUserMEntity> {
  TbUserMEntity findByCustSeqAndUsrLoginIdAndUsrPwd(String custSeq, String UserLoginId, String usrPwd);
  TbUserMEntity findByCustSeqAndUsrLoginId(String custSeq, String UserLoginId);
  TbUserMEntity findByUsrLoginIdAndUsrPwd(String UserLoginId, String usrPwd);
  TbUserMEntity findByUsrLoginId(String UserLoginId);
}
