package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCustCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbCustCashLogRepository extends JpaRepository<TbCustCashLog, Long>, JpaSpecificationExecutor<TbCustCashLog> {

}