package com.trism.jesica.persistence.mysql.Repository.block;

import com.trism.jesica.persistence.mysql.Entitiy.block.TbDlvyArea;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyAreaRepository extends JpaRepository<TbDlvyArea, Long>, JpaSpecificationExecutor<TbDlvyArea> {
    List<TbDlvyArea> findByGroupNoAndGroupTypeAndAreaChargeTypeNot(@Param("groupNo") Long groupNo, @Param("groupType") Integer groupType, @Param("areaChargeType") Integer areaChargeType);
    List<TbDlvyArea> findByGroupNoAndGroupTypeAndAreaChargeType(@Param("groupNo") Long groupNo, @Param("groupType") Integer groupType, @Param("areaChargeType") Integer areaChargeType);
    List<TbDlvyArea> findByAreaNoAndGroupNoAndGroupTypeAndAreaChargeTypeNot(@Param("areaNo") Long areaNo,@Param("groupNo") Long groupNo, @Param("groupType") Integer groupType, @Param("areaChargeType") Integer areaChargeType);
    List<TbDlvyArea> findByAreaNoAndGroupNoAndGroupTypeAndAreaChargeType(@Param("areaNo") Long areaNo,@Param("groupNo") Long groupNo, @Param("groupType") Integer groupType, @Param("areaChargeType") Integer areaChargeType);
    /*List<TbDlvyArea> findByAreaNo(@Param("areaNo") Long groupNo, @Param("groupType") Integer groupType);*/

    @Query(value = "select " +
            "ifnull(MAX(view_order),0) as viewOrder " +
            "from tb_dlvy_area " +
            "where group_no = :groupNo " +
            "and area_charge_type != :areaChargeType ", nativeQuery = true)
    int getMaxViewOrder(@Param("groupNo") Long groupNo,@Param("areaChargeType") Integer areaChargeType);


    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_dlvy_area SET " +
            "view_order = :newViewOrder " +
            "where "+
            "group_no = :groupNo " +
            "and area_no = :areaNo "+
            "and group_type = :groupType "+
            "and view_order = :viewOrder "+
            "", nativeQuery = true)
    int deliveryBlockSort(@Param("areaNo") Long areaNo ,
                          @Param("groupNo") Long groupNo,
                          @Param("groupType") Integer groupType,
                          @Param("viewOrder") Integer viewOrder,
                          @Param("newViewOrder") Integer newViewOrder
    );


}

