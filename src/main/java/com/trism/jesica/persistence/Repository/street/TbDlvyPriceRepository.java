package com.trism.jesica.persistence.Repository.street;

import com.trism.jesica.persistence.Entitiy.street.TbDlvyPrice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyPriceRepository extends JpaRepository<TbDlvyPrice, Long>, JpaSpecificationExecutor<TbDlvyPrice> {
    List<TbDlvyPrice> findByGroupNoAndDataStatusOrderByDayAscStartTimeAscRadiusAsc(@Param("groupNo") Long groupNo,@Param("dataStatus") Integer dataStatus);
    List<TbDlvyPrice> findByGroupNoAndGroupType(@Param("groupNo") Long groupNo,@Param("groupType") Integer groupType);

}