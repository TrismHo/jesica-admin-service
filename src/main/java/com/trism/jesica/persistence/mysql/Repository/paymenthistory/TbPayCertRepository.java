package com.trism.jesica.persistence.mysql.Repository.paymenthistory;

import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCert;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbPayCertRepository extends JpaRepository<TbPayCert, String>, JpaSpecificationExecutor<TbPayCert> {

    TbPayCert findByOrderNo(@Param("orderNo") Long orderNo);
}
