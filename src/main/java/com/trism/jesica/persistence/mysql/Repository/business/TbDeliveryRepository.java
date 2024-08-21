package com.trism.jesica.persistence.mysql.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/

import com.trism.jesica.dto.TbDlvyDTO;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbDelivery;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDeliveryRepository extends JpaRepository<TbDelivery, Long>, JpaSpecificationExecutor<TbDelivery> {

    @Query(value = "select dlvy_no as dlvyNo, " +
            "dlvy_name as dlvyName " +
            "from tb_delivery " +
            "where dlvy_name like :dlvyName " +
            "and data_status != 0 " +
            "", nativeQuery = true)
    List<TbDlvyDTO> findByDlvyName(@Param("dlvyName") String dlvyName);

    @Query(value = "select dlvy_no as dlvyNo, " +
            "dlvy_name as dlvyName " +
            "from tb_delivery " +
            "where head_no = :headNo " +
            "and data_status != 0 " +
            "", nativeQuery = true)
    List<TbDlvyDTO> findByHeadNo(@Param("headNo") Long headNo);

    @Query(value = "select dlvy_no as dlvyNo, " +
            "dlvy_name as dlvyName " +
            "from tb_delivery " +
            "where data_status != 0 " +
            "", nativeQuery = true)
    List<TbDlvyDTO> findByAll();


    @Query(value = "select dlvy_no as dlvyNo, " +
            "dlvy_name as dlvyName " +
            "from tb_delivery " +
            "where data_status != 0 " +
            "and branch_no = :branchNo " +
            "and dlvy_group_type = :dlvyGroupType " +
            "or dlvy_group_type = 3" +
            "", nativeQuery = true)
    List<TbDlvyDTO> findByBranchNo(@Param("branchNo") Integer branchNo, @Param("dlvyGroupType") Integer dlvyGroupType);

}
