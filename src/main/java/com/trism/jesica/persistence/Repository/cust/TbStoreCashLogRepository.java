package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbStoreCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreCashLogRepository extends JpaRepository<TbStoreCashLog, Long>, JpaSpecificationExecutor<TbStoreCashLog> {

}