package com.trism.jesica.persistence.Repository.paymenthistory;

import com.trism.jesica.persistence.Entitiy.paymenthistory.TbPayApproval;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbPayApprovalRepository extends JpaRepository<TbPayApproval, String>, JpaSpecificationExecutor<TbPayApproval> {
    TbPayApproval findByTid(@Param("tid") String tid);
}