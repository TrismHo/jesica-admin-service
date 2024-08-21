package com.trism.jesica.persistence.mysql.Repository.paymenthistory;

import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCancel;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbPayCancelRepository extends JpaRepository<TbPayCancel, Long>, JpaSpecificationExecutor<TbPayCancel> {

    List<TbPayCancel> findByOrderNo(@Param("orderNo") Long orderNo);
}
