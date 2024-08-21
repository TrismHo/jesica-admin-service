package com.trism.jesica.persistence.mysql.Repository.worker;

import com.trism.jesica.dto.TbWorkerApplyAttachDTO;
import com.trism.jesica.persistence.mysql.Entitiy.worker.TbWorkerApplyAttach;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbWorkerApplyAttachRepository extends JpaRepository<TbWorkerApplyAttach, Integer>, JpaSpecificationExecutor<TbWorkerApplyAttach> {
    List<TbWorkerApplyAttachDTO> findByApplyNo(@Param("applyNo") Integer applyNo);


    @Modifying
    @Query(value = "update tb_worker_apply_attach set " +
            "auth_status = :authStatus ," +
            "update_user_id = :updateUserId, " +
            "reject_memo = :rejcectMemo, " +
            "update_date = now() " +
            "where attach_no = :attachNo "+
            "and apply_attach_type = :applyAttachType ", nativeQuery = true)
    int attachApproval(@Param("attachNo") Long attachNo, @Param("applyAttachType") Integer applyAttachType, @Param("authStatus") Integer authStatus, @Param("updateUserId") String updateUserId, @Param("rejcectMemo") String rejcectMemo);

    @Modifying
    @Query(value = " " +
            "delete from tb_worker_apply_attach " +
            "where apply_no in (select a.apply_no from tb_worker_apply a " +
            "where phone = :phone) "+
            "", nativeQuery = true)
    int deleteWorkerApplyAttach(@Param("phone") String phone);


}
