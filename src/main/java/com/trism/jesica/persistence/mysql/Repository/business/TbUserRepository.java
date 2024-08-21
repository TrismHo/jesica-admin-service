package com.trism.jesica.persistence.mysql.Repository.business;

import com.trism.jesica.persistence.mysql.Entitiy.business.TbUser;
import com.trism.jesica.persistence.mysql.Repository.querydsl.business.TbUserRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbUserRepository extends JpaRepository<TbUser, Long>, JpaSpecificationExecutor<TbUser>, TbUserRepositorySupport {


    @Modifying
    @Query(value = "update tb_user set " +
            "user_pwd = :userPwd " +
            ",pwd_update_dtm = now()" +
            "where user_no = :userNo", nativeQuery = true)
    int updateUser(@Param("userNo") Long userNo, @Param("userPwd") String userPwd );

    @Modifying
    @Query(value = "update tb_user set " +
            "pwd_fail_count = :pwdFailCount " +
            "where user_no = :userNo", nativeQuery = true)
    int insertFailCnt(@Param("userNo") Long userNo, @Param("pwdFailCount") Integer pwdFailCount);

    @Modifying
    @Query(value = "update tb_user set " +
            "pwd_fail_count = 0 ," +
            "last_login_dtm = now() " +
            "where user_no = :userNo", nativeQuery = true)
    int setSuccessLoginSet(@Param("userNo") Long userNo);


    TbUser findByUserId(@Param("userId") String userId);


    @Query(value = "select count(user_no) as cnt " +
            "from tb_user " +
            "order by cnt desc "+
            "", nativeQuery = true)
    List<Map<String,Object>> getUserChart();


    @Modifying
    @Query(value = " " +
            "delete from tb_user " +
            "where user_type = 4 " +
            "  and user_no = (select a.worker_no from tb_worker_apply a " +
            "where phone = :phone) "+
            "", nativeQuery = true)
    int deleteUser(@Param("phone") String phone);
}
