package com.trism.jesica.persistence.Repository.service;

import com.trism.jesica.persistence.Entitiy.service.TbServiceChargeGroup;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbServiceChargeGroupRepository extends JpaRepository<TbServiceChargeGroup, Long>, JpaSpecificationExecutor<TbServiceChargeGroup> {

    TbServiceChargeGroup findByChargeNo (@Param("chargeNo") Long chargeNo);


    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_service_charge_group SET " +
            "charge_name = :chargeName " +
            "where "+
            "charge_no = :chargeNo " +
            "", nativeQuery = true)
    int insertGroupName (@Param("chargeName") String chargeName ,@Param("chargeNo") Long chargeNo);
}