package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbBranchCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbBranchCashLogRepository extends JpaRepository<TbBranchCashLog, Long>, JpaSpecificationExecutor<TbBranchCashLog> {

}
