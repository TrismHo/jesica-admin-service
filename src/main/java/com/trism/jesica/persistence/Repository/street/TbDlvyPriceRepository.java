package com.trism.jesica.persistence.Repository.street;

import com.trism.jesica.persistence.Entitiy.street.TbDlvyPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyPriceRepository extends JpaRepository<TbDlvyPrice, Long>, JpaSpecificationExecutor<TbDlvyPrice> {
    List<TbDlvyPrice> findByPriceChargeNoOrderByDayAscStartTimeAsc(@Param("areaChargeNo") Long priceChargeNo);

}