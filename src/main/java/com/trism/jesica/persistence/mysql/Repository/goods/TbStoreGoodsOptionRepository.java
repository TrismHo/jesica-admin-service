package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoodsOption;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbStoreGoodsOptionRepository extends  JpaRepository<TbStoreGoodsOption, Long>, JpaSpecificationExecutor<TbStoreGoodsOption> {

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store_goods_option " +
            "(" +
            "store_opt_no, " +
            "store_goods_no, " +
            "view_order " +
            ") " +
            "values " +
            "(" +
            " :storeOptNo " +
            ",:storeGoodsNo" +
            ",:viewOrder" +
            ") "+
            "", nativeQuery = true)
    int addStoreGoodsOption(@Param("storeOptNo") Long storeOptNo, @Param("storeGoodsNo") Long storeGoodsNo, @Param("viewOrder") Integer viewOrder);

    @Modifying
    @Query(value = "delete from tb_store_goods_option " +
            "where store_opt_no = :storeOptNo " +
            "and store_goods_no = :storeGoodsNo " +
            "", nativeQuery = true)
    int deleteStoreGoodsOption(@Param("storeOptNo") Long storeOptNo,
                             @Param("storeGoodsNo") Long storeGoodsNo);



    @Query(value = "select " +
            "ifnull(MAX(view_order),0) as viewOrder " +
            "from tb_store_goods_option " +
            "where store_goods_no = :storeGoodsNo" +
            "", nativeQuery = true)
    int getTbStoreGoodsOptionMaxNo(@Param("storeGoodsNo") Long storeGoodsNo);
}
