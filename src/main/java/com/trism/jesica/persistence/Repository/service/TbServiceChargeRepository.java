package com.trism.jesica.persistence.Repository.service;

import com.trism.jesica.dto.TbServiceChargeDTO;
import com.trism.jesica.persistence.Entitiy.service.TbServiceCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbServiceChargeRepository extends JpaRepository<TbServiceCharge, Long>, JpaSpecificationExecutor<TbServiceCharge> {

    TbServiceCharge findByChargeNoAndPlatformTypeAndServiceType(@Param("chargeNo") Long chargeNo, @Param("platformType") Integer platformType, @Param("serviceType") Integer serviceType);


    @Query(value = "select charge_no as chargeNo, " +
            "platform_type as platformType, " +
            "service_type as serviceType, " +
            "svc_rate_0 as svcRate0, " +
            "svc_rate_1 as svcRate1, " +
            "svc_rate_2 as svcRate2, " +
            "svc_rate_3 as svcRate3, " +
            "head_no_1 as headNo1, " +
            "branch_no_1 as branchNo1, " +
            "head_no_2 as headNo2, " +
            "branch_no_2 as branchNo2, " +
            "head_no_3 as headNo3, " +
            "branch_no_3 as branchNo3 " +
            "from tb_service_charge " +
            "where charge_no = :chargeNo " +
            "", nativeQuery = true)
    List<TbServiceChargeDTO> findByChargeNo (@Param("chargeNo") Long chargeNo);

}