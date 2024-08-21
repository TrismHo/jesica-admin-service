package com.trism.jesica.persistence.mysql.Repository.system;

import com.trism.jesica.persistence.mysql.Entitiy.system.TbServiceProperty;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbServicePropertyRepository extends JpaRepository<TbServiceProperty, String>, JpaSpecificationExecutor<TbServiceProperty> {

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_service_property set " +
            "prop_value = :propValue " +
            ",memo = :memo " +
            ",update_date = now() " +
            "where prop_name = :propName", nativeQuery = true)
    int update(@Param("propName") String propName,
               @Param("propValue") String propValue,
               @Param("memo") String memo
     );

/*    @Query(value =  "" +
            "SELECT " +
            "        ord_no as ordNo, " +
            "        ord_goods_seq as ordGoodsSeq, " +
            "        opt_goods_seq as optGoodsSeq, " +
            "        opt_goods_no as optGoodsNo, " +
            "        opt_goods_name as optGoodsName, " +
            "        opt_goods_cnt as optGoodsCnt, " +
            "        opt_goods_price as optGoodsPrice " +
            "from manna_order_goods_opt  " +
            "where ord_no = :ordNo " +
            "" , nativeQuery = true)*/
    List<TbServiceProperty> findByPlatformTypeAndDataStatus(@Param("platfromType") int platfromType, @Param("dataStatus") int dataStatus);
}
