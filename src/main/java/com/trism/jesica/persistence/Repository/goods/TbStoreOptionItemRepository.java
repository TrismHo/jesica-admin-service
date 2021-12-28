package com.trism.jesica.persistence.Repository.goods;

import com.trism.jesica.persistence.Entitiy.goods.TbStoreOptionItem;
import com.trism.jesica.persistence.Repository.querydsl.goods.TbStoreOptionItemRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbStoreOptionItemRepository extends  JpaRepository<TbStoreOptionItem, Long>, JpaSpecificationExecutor<TbStoreOptionItem>, TbStoreOptionItemRepositorySupport {


    @Modifying
    @Query(value = "delete from tb_store_option_item " +
            "where store_opt_no= :storeOptNo " +
            "and opt_item_no = :optItemNo " +
            "", nativeQuery = true)
    int deleteStoreOptionitem(@Param("storeOptNo") Long storeOptNo,@Param("optItemNo") Integer optItemNo
    );
   /* @Query(value = "select " +
            "store_goods_no as storeGoodsNo, " +
            "basic_item_no as basicItemNo, " +
            "view_order as viewOrder, " +
            "item_status as itemStatus, " +
            "item_name as itemName, " +
            "item_price as itemPrice " +
            "from tb_store_goods_item " +
            "where store_goods_no = :storeGoodsNo " +
            "", nativeQuery = true)
    List<TbStoreGoodsItemDTO> findByStoreGoodsNo(@Param("storeGoodsNo") Long storeGoodsNo);*/

    @Query(value = "select " +
            "ifnull(MAX(opt_item_no),0) as optItemNo " +
            "from tb_store_option_item " +
            "where store_opt_no = :storeOptNo " +
            "", nativeQuery = true)
    int getTbStoreOptionItemMaxNo(@Param("storeOptNo") Long storeOptNo);
}
