package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbBranchCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbBranchCashLogRepository extends JpaRepository<TbBranchCashLog, Long>, JpaSpecificationExecutor<TbBranchCashLog> {

}