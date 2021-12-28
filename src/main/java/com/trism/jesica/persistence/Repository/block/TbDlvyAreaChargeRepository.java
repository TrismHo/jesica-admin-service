package com.trism.jesica.persistence.Repository.block;

import com.trism.jesica.persistence.Entitiy.block.TbDlvyAreaCharge;
import com.trism.jesica.persistence.type.DataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyAreaChargeRepository extends JpaRepository<TbDlvyAreaCharge, Long>, JpaSpecificationExecutor<TbDlvyAreaCharge> {

    List<TbDlvyAreaCharge> findByBranchNo(@Param("storeNo") Long storeNo);
    List<TbDlvyAreaCharge> findByDataStatus(@Param("dataStatus") DataStatus dataStauts);
}