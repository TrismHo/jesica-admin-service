package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbWorkerCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbWorkerCashLogRepository extends JpaRepository<TbWorkerCashLog, Long>, JpaSpecificationExecutor<TbWorkerCashLog> {

}