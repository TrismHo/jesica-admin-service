package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.dto.TbMannaOrderGoodsDTO;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaOrderGoods;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbMannaOrderGoodsRepository extends JpaRepository<TbMannaOrderGoods, Long>, JpaSpecificationExecutor<TbMannaOrderGoods> {

    @Query(value =  "" +
            "SELECT " +
            "        ord_no as ordNo, " +
            "        ord_goods_seq as ordGoodsSeq, " +
            "        ord_goods_no as ordGoodsNo, " +
            "        goods_name as goodsName, " +
            "        ord_cnt as ordCnt, " +
            "        ord_price as ordPrice, " +
            "        option_1_name as option1Name, " +
            "        option_1_price as option1Price, " +
            "        option_2_name as option2Name, " +
            "        option_2_price as option2Price, " +
            "        option_3_name as option3Name, " +
            "        option_3_price as option3Price, " +
            "        option_4_name as option4Name, " +
            "        option_4_price as option4price, " +
            "        ord_dn_price as ordDnPrice, " +
            "        ord_price_type as ordPriceType " +
            "from manna_order_goods  " +
            "where ord_no = :ordNo " +
            "" , nativeQuery = true)
    List<TbMannaOrderGoodsDTO> findByList(@Param("ordNo") Long ordNo);
}
