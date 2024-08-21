package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbStoreCashLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreCashLogRepository extends JpaRepository<TbStoreCashLog, Long>, JpaSpecificationExecutor<TbStoreCashLog> {

}
