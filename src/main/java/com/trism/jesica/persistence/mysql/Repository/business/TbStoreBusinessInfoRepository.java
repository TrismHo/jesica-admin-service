package com.trism.jesica.persistence.mysql.Repository.business;

import com.trism.jesica.persistence.mysql.Entitiy.business.TbStoreBusinessInfo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbStoreBusinessInfoRepository extends JpaRepository<TbStoreBusinessInfo, Long> {

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_business_info " +
            "( group_no," +
            "insert_user_id," +
            "group_type, "+
            "corp_type, "+
            "auth_status, "+
            "auth_date, "+
            "biz_num, "+
            "biz_name, "+
            "biz_owner, "+
            "biz_type, "+
            "biz_item, "+
            "biz_addr, "+
            "biz_tel, "+
            "biz_email) "+
            "values " +
            "(:groupNo," +
            ":insertUserId, " +
            ":groupType, "+
            ":corpType, "+
            ":authStatus, "+
            ":authDate, "+
            ":bizNum, "+
            ":bizName, "+
            ":bizOwner, "+
            ":bizType, "+
            ":bizItem, "+
            ":bizAddr, "+
            ":bizTel, "+
            ":bizEmail "+
            ") " +
            "", nativeQuery = true)
    int insertTbBusiness(
            @Param("groupNo") Integer groupNo,
            @Param("insertUserId") String insertUserId,
            @Param("groupType") Integer groupType,
            @Param("corpType") Integer corpType,
            @Param("authStatus") Integer authStatus,
            @Param("authDate") String authDate,
            @Param("bizNum") String bizNum,
            @Param("bizName") String bizName,
            @Param("bizOwner") String bizOwner,
            @Param("bizType") String bizType,
            @Param("bizItem") String bizItem,
            @Param("bizAddr") String bizAddr,
            @Param("bizTel") String bizTel,
            @Param("bizEmail") String bizEmail
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_business_info set " +
            "update_user_id = :updateUserId, " +
            "update_date = now(), " +
            "group_type = :groupType, " +
            "corp_type = :corpType, " +
            "auth_status = :authStatus, " +
            "auth_date = :authDate, " +
            "biz_num = :bizNum, " +
            "biz_name = :bizName, " +
            "biz_owner = :bizOwner, " +
            "biz_type = :bizType, " +
            "biz_item = :bizItem, " +
            "biz_addr = :bizAddr, " +
            "biz_tel = :bizTel, " +
            "biz_email = :bizEmail " +
            "where group_no = :groupNo", nativeQuery = true)
    int updateTbBusiness(
            @Param("groupNo") Integer groupNo,
            @Param("updateUserId") String updateUserId,
            @Param("groupType") Integer groupType,
            @Param("corpType") Integer corpType,
            @Param("authStatus") Integer authStatus,
            @Param("authDate") String authDate,
            @Param("bizNum") String bizNum,
            @Param("bizName") String bizName,
            @Param("bizOwner") String bizOwner,
            @Param("bizType") String bizType,
            @Param("bizItem") String bizItem,
            @Param("bizAddr") String bizAddr,
            @Param("bizTel") String bizTel,
            @Param("bizEmail") String bizEmail
    );
}
