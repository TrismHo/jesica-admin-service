package com.trism.jesica.persistence.mysql.Repository.business;

/*import com.trism.manna.dto.TbHeadDTO;*/

import com.trism.jesica.dto.TbDlvyShareDTO;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbDeliveryShare;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDeliveryShareRepository extends JpaRepository<TbDeliveryShare, Long>, JpaSpecificationExecutor<TbDeliveryShare> {

    @Query(value = "select give_dlvy_no as giveDlvyNo, " +
            "accept_dlvy_no as acceptDlvyNo, " +
            "(select dlvy_name from tb_delivery where dlvy_no = accept_dlvy_no) as acceptDlvyName, " +
            "delay_time as delayTime " +
            "from tb_delivery_share " +
            "where give_dlvy_no = :dlvyNo " +
            "", nativeQuery = true)
    List<TbDlvyShareDTO> getDlvyShareList(@Param("dlvyNo") Long dlvyNo);


    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_delivery_share " +
            "( give_dlvy_no," +
            "accept_dlvy_no "+
            ") "+
            "value " +
            "(:dlvyNo," +
            ":acceptNo " +
            ") " +
            "", nativeQuery = true)
    int saveToList(@Param("dlvyNo") Long dlvyNo, @Param("acceptNo") Long acceptNo);

    @Modifying
    @Query(value = "delete from tb_delivery_share " +
            "where give_dlvy_no = :dlvyNo " +
            "and accept_dlvy_no = :acceptNo " +
            "", nativeQuery = true)
    int deleteToList(@Param("dlvyNo") Long dlvyNo, @Param("acceptNo") Long acceptNo);

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_delivery_share set " +
            "delay_time = :delayTime " +
            "where give_dlvy_no = :giveDlvyNo " +
            "and accept_dlvy_no =:acceptDlvyNo " +
            "", nativeQuery = true)
    int updateDelayTime(
            @Param("giveDlvyNo") Long giveDlvyNo,
            @Param("acceptDlvyNo") Long acceptDlvyNo,
            @Param("delayTime") Integer delayTime
    );
}
