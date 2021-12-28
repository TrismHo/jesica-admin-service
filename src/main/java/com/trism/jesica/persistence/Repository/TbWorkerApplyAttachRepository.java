package com.trism.jesica.persistence.Repository;

import com.trism.jesica.dto.TbWorkerApplyAttachDTO;
import com.trism.jesica.persistence.Entitiy.TbWorkerApplyAttach;
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
            "update_date = now() " +
            "where attach_no = :attachNo "+
            "and apply_attach_type = :applyAttachType ", nativeQuery = true)
    int attachApproval(@Param("attachNo") Long attachNo, @Param("applyAttachType") Integer applyAttachType, @Param("authStatus") Integer authStatus, @Param("updateUserId") Integer updateUserId);


}