package com.trism.jesica.persistence.mysql.Repository.service;

import com.trism.jesica.persistence.mysql.Entitiy.service.TbStoreServiceCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbStoreServiceChargeRepository extends JpaRepository<TbStoreServiceCharge, Long>, JpaSpecificationExecutor<TbStoreServiceCharge> {

    TbStoreServiceCharge findByStoreNoAndPlatformType(@Param("char") Long chargeNo, @Param("") Integer platformType);
}
