package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbHeadCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbHeadCashLogRepository extends JpaRepository<TbHeadCashLog, Long>, JpaSpecificationExecutor<TbHeadCashLog> {

}