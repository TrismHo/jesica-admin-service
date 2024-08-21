package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbHeadCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbHeadCashLogRepository extends JpaRepository<TbHeadCashLog, Long>, JpaSpecificationExecutor<TbHeadCashLog> {

}
