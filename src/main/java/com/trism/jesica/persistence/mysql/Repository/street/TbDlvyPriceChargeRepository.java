package com.trism.jesica.persistence.mysql.Repository.street;

import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPriceCharge;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyPriceChargeRepository extends JpaRepository<TbDlvyPriceCharge, Long>, JpaSpecificationExecutor<TbDlvyPriceCharge> {
    List<TbDlvyPriceCharge> findByBranchNo(@Param("storeNo") Long storeNo);

}
