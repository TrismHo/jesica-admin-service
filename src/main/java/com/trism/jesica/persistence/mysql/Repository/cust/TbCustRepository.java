package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCust;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbCustRepository extends JpaRepository<TbCust, Long>, JpaSpecificationExecutor<TbCust> {

    String query =  "and cust.data_status =:dataStatus ";
    String query2 =  "and cust.is_member =:isMember ";
    String selectQuery  = "        cust.cust_no as custNo, " +
            "           cust.insert_date as insertDate, " +
            "           cust.update_date as updateDate, " +
            "           cust.acc_point as accPoint, " +
            "           cust.cash as cash, " +
            "           cust.cust_addr_no as custAddrNo, " +
            "           cust.cust_name as custName, " +
            "           cust.cust_tel as custTel, " +
            "           cust.data_status as dataStatus, " +
            "           cust.ext_cust_no as extCustNo, " +
            "           cust.ext_recomm_st_code as extRecommStCode, " +
            "           cust.ext_recomm_st_name as extRecommStName, " +
            "           cust.ext_recomm_wk_code as extRecommWkCode, " +
            "           cust.gender as gender, " +
            "           cust.is_member as isMember, " +
            "           cust.login_id as loginId, " +
            "           cust.login_pwd as loginPwd, " +
            "           cust.mileage as mileage, " +
            "           cust.platform_type as platformType, " +
            "           cust.point, " +
            "           cust.push_marketing_yn as pushMarketingYn , " +
            "           cust.push_notice_yn as pushNoticeYn, " +
            "           cust.push_order_yn as pushOrderYn, " +
            "           cust.sms_yn as smsYn,  " +
            "           cust.sns_token_1 as snsToken1, " +
            "           cust.sns_token_2 as snsToken2, " +
            "           cust.use_count as useCount, " +
            "           cust.ext_br_code as extBrCode, " +
            "           cust.ext_master_st_code as extMasterStCode, " +
            "           (select code_name from  tb_system_code where sys_type = 'A1' and sys_code = custLoc.addr_1 ) as addr1, " +
            "           (select code_name from  tb_system_code where sys_type = 'A2' and sys_code = custLoc.addr_2 ) as addr2, " +
            "           (select cust_name from tb_cust where cust_no = cust.recomm_cust_no) as recommCustName, " +
            "           cust.recomm_code as recommCode, " +
            "           cust.recomm_count as recommCount, " +
            "           cust.recomm_count as recommCustNo, " +
            "           cust.recomm_cust_tel as recommCustTel"
            ;

    /*@Query(value = "select " +
            selectQuery +
            "       from tb_cust as cust " +
            "        left join tb_cust_location as custLoc  "+
            "        on cust.cust_no  = custLoc.cust_no  " +
            "        where cust.platform_type = :platformType " +
             query +
             query2 +
            "         and cust.insert_date BETWEEN :startDate and :endDate" +
            "         order by cust.insert_date desc "+
            "", countQuery = "select count(*) from where 1=1 "+query+query2 ,nativeQuery = true)

    Page<TbCustDTO> getCustList(@Param("isMember") String isMember,
                                        @Param("platformType") String platformType,
                                        @Param("dataStatus") String dataStatus,
                                        @Param("startDate") String startDate,
                                        @Param("endDate") String endDate,
                                        Pageable pageable
    ) ;

    @Query(value = "select " +
            selectQuery +
            "       from tb_cust as cust " +
            "        left join tb_cust_location as custLoc  " +
            "        on cust.cust_no  = custLoc.cust_no  " +
            "        where cust.platform_type = :platformType " +
            query +
            query2 +
            " and cust.cust_tel like :custTel "+
            "         and cust.insert_date BETWEEN :startDate and :endDate" +
            "         order by cust.insert_date desc "+
            "",  countQuery = "select count(*) from where 1=1 "+query+query2+" and cust.cust_tel like :custTel", nativeQuery = true)
    Page<TbCustDTO> getCustTelList(@Param("isMember") String isMember,
                                @Param("platformType") String platformType,
                                @Param("dataStatus") String dataStatus,
                                @Param("startDate") String startDate,
                                @Param("endDate") String endDate,
                                @Param("custTel") String custTel,
                                   Pageable pageable
    ) ;

    @Query(value = "select " +
            selectQuery +
            "       from tb_cust as cust " +
            "        left join tb_cust_location as custLoc  " +
            "        on cust.cust_no  = custLoc.cust_no  " +
            "        where cust.platform_type = :platformType " +
            query +
            query2 +
            " and cust.cust_name like :custName "+
            "         and cust.insert_date BETWEEN :startDate and :endDate" +
            "         order by cust.insert_date desc "+
            "", countQuery = "select count(*) from where 1=1 "+query+query2+" and cust.cust_name like :custName" ,nativeQuery = true)
    Page<TbCustDTO> getCustNameList(@Param("isMember") String isMember,
                                    @Param("platformType") String platformType,
                                    @Param("dataStatus") String dataStatus,
                                    @Param("startDate") String startDate,
                                    @Param("endDate") String endDate,
                                    @Param("custName") String custName,
                                    Pageable pageable
    ) ;*/


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
            /*"sms_yn = :smsYn, " +*/
            "push_order_yn = :pushOrderYn, " +
            /*"push_notice_yn = :pushNoticeYn, " +*/
            "push_marketing_yn = :pushMarketingYn, " +
            "platform_type = :platformType " +
            "where cust_no = :custNo", nativeQuery = true)
    int updateCust(@Param("custNo") Long custNo,
                   @Param("custName") String custName,
                   @Param("custTel") String custTel,
                   @Param("dataStatus") Integer dataStatus,
                   @Param("gender") String gender,
                  /* @Param("smsYn") Integer smsYn,*/
                   @Param("pushOrderYn") Integer pushOrderYn,
                  /* @Param("pushNoticeYn") Integer pushNoticeYn,*/
                   @Param("pushMarketingYn") Integer pushMarketingYn,
                   @Param("platformType") Integer platformType
    );

    @Query(value = "select count(cust_no) as cnt " +
            "from tb_cust " +
            "where data_status = 1 " +
            "and platform_type = :platformType"+
            "", nativeQuery = true)
    List<Map<String,Object>> getCustChart(@Param("platformType") Integer platformType);

    @Query(value = "select " +
            " cust_name as custName, " +
            " cust_tel as custTel, " +
            " use_count as useCount, " +
            " insert_date as insertDate " +
            "       from tb_cust as cust " +
            "         where data_status = 1 " +
            "           and platform_type = 2 " +
            "           and recomm_cust_no = :custNo " +
            "         order by insert_date desc "+
            "", nativeQuery = true)
    List<Map<String,Object>> getFriends(@Param("custNo") Long custNo);


    @Query(value = "select " +
            selectQuery +
            "       from tb_cust as cust " +
            "        left join tb_cust_location as custLoc  " +
            "        on cust.cust_no  = custLoc.cust_no  " +
            "         where cust.cust_no = :custNo " +
            "         order by cust.insert_date desc "+
            "", nativeQuery = true)
    Map<String,Object> getCustDetail(@Param("custNo") Long custNo);

    Page<TbCust> findAll(Specification<TbCust> specification, Pageable pageable);

    @Query(value = "select " +
            selectQuery +
            "       from tb_cust as cust " +
            "        left join tb_cust_location as custLoc  "+
            "        on cust.cust_no  = custLoc.cust_no  " +
            ":specification "+
            /*"        where cust.platform_type = :platformType " +
            query +
            query2 +
            "         and cust.insert_date BETWEEN :startDate and :endDate" +
            "         order by cust.insert_date desc "+*/
            "", countQuery = "select count(*) from where 1=1 "+query+query2 ,nativeQuery = true)

    Page<TbCust> getCustListPop(Specification<TbCust> specification, Pageable pageable);

    @Query(value = "select " +
            "        cust_no as custNo, " +
            "           insert_date as insertDate, " +
            "           update_date as updateDate, " +
            "           acc_point as accPoint, " +
            "           cash as cash, " +
            "           cust_addr_no as custAddrNo, " +
            "           cust_name as custName, " +
            "           cust_tel as custTel, " +
            "           data_status as dataStatus, " +
            "           ext_cust_no as extCustNo, " +
            "           ext_recomm_st_code as extRecommStCode, " +
            "           ext_recomm_st_name as extRecommStName, " +
            "           gender as gender, " +
            "           is_member as isMember, " +
            "           login_id as loginId, " +
            "           login_pwd as loginPwd, " +
            "           mileage as mileage, " +
            "           platform_type as platformType, " +
            "           point, " +
            "           push_marketing_yn as pushMarketingYn , " +
            "           push_notice_yn as pushNoticeYn, " +
            "           push_order_yn as pushOrderYn, " +
            "           sms_yn as smsYn,  " +
            "           sns_token_1 as snsToken1, " +
            "           sns_token_2 as snsToken2, " +
            "           use_count as useCount, " +
            "           ext_br_code as extBrCode, " +
            "           ext_master_st_code as extMasterStCode, " +
            "           recomm_code as recommCode, " +
            "           recomm_count as recommCount, " +
            "           recomm_count as recommCustNo, " +
            "           recomm_cust_tel as recommCustTel"+
            "       from tb_cust as cust " +
            "       where ext_cust_no in (:custList) "+
            "",nativeQuery = true)
    List<Map<String,Object>> getCustList(@Param("custList") String[] custList);
    @Query(value = "select " +
            "        cust_no as custNo " +
            "       from tb_cust as cust " +
            "       where data_status = 1 " +
            "       and (:appCode is null and 1 = 1 ) or ( :appCode is not null and app_code = ':appCode' )"+
            "       and platform_type = 2 "+
            "",nativeQuery = true)
    List<Map<String,Object>> getAppCodeCustList(@Param("appCode") String appCode);


    @Modifying
    @Query(value =
            "update tb_cust set " +
                    "ext_recomm_st_code = :stCode, " +
                    "ext_recomm_st_name = :recommStName, " +
                    "ext_br_code = :brCode, " +
                    "ext_master_st_code = :masterStCode, " +
                    "service_no = :serviceNo, " +
                    "ext_recomm_st_type = :stAppUseType, " +
                    "update_date = now() " +
                    "where cust_no = :custNo",
            nativeQuery = true
    )
    int updateCustRecommSt(
            @Param("custNo") Integer custNo,
            @Param("stCode") String stCode,
            @Param("recommStName") String recommStName,
            @Param("brCode") String brCode,
            @Param("masterStCode") String masterStCode,
            @Param("serviceNo") Integer serviceNo,
            @Param("stAppUseType") String stAppUseType
    );
}
