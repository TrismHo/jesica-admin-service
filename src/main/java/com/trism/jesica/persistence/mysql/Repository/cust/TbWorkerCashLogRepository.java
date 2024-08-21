package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbWorkerCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbWorkerCashLogRepository extends JpaRepository<TbWorkerCashLog, Long>, JpaSpecificationExecutor<TbWorkerCashLog> {

}
