package com.trism.jesica.persistence.Repository.manna;

import com.trism.jesica.dto.TbMannaOrderGoodsOptDTO;
import com.trism.jesica.persistence.Entitiy.manna.TbMannaOrderGoodsOpt;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbMannaOrderGoodsOptRepository extends JpaRepository<TbMannaOrderGoodsOpt, Long>, JpaSpecificationExecutor<TbMannaOrderGoodsOpt> {

    @Query(value =  "" +
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
            "" , nativeQuery = true)
    List<TbMannaOrderGoodsOptDTO> findByListOption(@Param("ordNo") Long ordNo);
}
