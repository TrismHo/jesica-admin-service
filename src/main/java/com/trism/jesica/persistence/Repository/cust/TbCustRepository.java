package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCust;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCustRepository extends JpaRepository<TbCust, Long>, JpaSpecificationExecutor<TbCust> {

    @Modifying
    @Query(value = "update tb_cust set " +
            "login_pwd = :loginPwd " +
            "where cust_no = :custNo", nativeQuery = true)
    int updateCustPassword(@Param("custNo") Long custNo, @Param("loginPwd") String loginPwd);

    @Modifying
    @Query(value = "update tb_cust set " +
            "cust_name = :custName, " +
            "cust_tel = :custTel, " +
            "data_status = :dataStatus, " +
            "gender = :gender, " +
            "sms_yn = :smsYn, " +
            "push_order_yn = :pushOrderYn, " +
            "push_notice_yn = :pushNoticeYn, " +
            "push_marketing_yn = :pushMarketingYn " +
            "where cust_no = :custNo", nativeQuery = true)
    int updateCust(@Param("custNo") Long custNo,
                   @Param("custName") String custName,
                   @Param("custTel") String custTel,
                   @Param("dataStatus") Integer dataStatus,
                   @Param("gender") String gender,
                   @Param("smsYn") Integer smsYn,
                   @Param("pushOrderYn") Integer pushOrderYn,
                   @Param("pushNoticeYn") Integer pushNoticeYn,
                   @Param("pushMarketingYn") Integer pushMarketingYn
    );

    @Query(value = "select count(cust_no) as cnt " +
            "from tb_cust " +
            "where data_status = 1 " +
            "", nativeQuery = true)
    List<Map<String,Object>> getCustChart();
}
