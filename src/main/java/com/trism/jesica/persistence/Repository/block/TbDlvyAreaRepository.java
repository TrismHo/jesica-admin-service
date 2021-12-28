package com.trism.jesica.persistence.Repository.block;

import com.trism.jesica.persistence.Entitiy.block.TbDlvyArea;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyAreaRepository extends JpaRepository<TbDlvyArea, Long>, JpaSpecificationExecutor<TbDlvyArea> {
    List<TbDlvyArea> findByAreaChargeNo(@Param("areaChargeNo") Long areaChargeNo);

    @Query(value = "select " +
            "ifnull(MAX(view_order),0) as viewOrder " +
            "from tb_dlvy_area " +
            "where area_charge_no = :areaChargeNo " +
            "", nativeQuery = true)
    int getMaxViewOrder(@Param("areaChargeNo") Long areaChargeNo);


    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_dlvy_area SET " +
            "view_order = :newViewOrder " +
            "where "+
            "area_charge_no = :areaChargeNo " +
            "and area_no = :areaNo "+
            "and view_order = :viewOrder "+
            "", nativeQuery = true)
    int deliveryBlockSort(@Param("areaNo") Long areaNo ,
                          @Param("areaChargeNo") Long areaChargeNo,
                          @Param("viewOrder") Integer viewOrder,
                          @Param("newViewOrder") Integer newViewOrder
    );


}

