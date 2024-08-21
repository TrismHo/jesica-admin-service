package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCustCashLogRepository extends JpaRepository<TbCustCashLog, Long>, JpaSpecificationExecutor<TbCustCashLog> {

}
