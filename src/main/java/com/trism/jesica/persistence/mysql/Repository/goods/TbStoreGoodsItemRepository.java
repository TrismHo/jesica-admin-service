package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.dto.TbStoreGoodsItemDTO;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoodsItem;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbStoreGoodsItemRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbStoreGoodsItemRepository extends  JpaRepository<TbStoreGoodsItem, Long>, JpaSpecificationExecutor<TbStoreGoodsItem>, TbStoreGoodsItemRepositorySupport {

   /* @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store_goods_item" +
            "( " +
            ",storeGoodsNo " +
            ",viewOrder " +
            ",itemStatus" +
            ",itemName" +
            ",itemPrice)" +
            "values " +
            ",:storeGoodsNo" +
            ",:viewOrder " +
            ",:itemStatus " +
            ",:itemName " +
            ",:itemPrice) " +
            "", nativeQuery = true)
    int insertStoreGoodsitem(@Param("storeGoodsNo") Long storeGoodsNo,
                     @Param("viewOrder") String viewOrder,
                     @Param("itemStatus") Integer itemStatus,
                     @Param("itemName") String itemName,
                     @Param("itemPrice") Integer itemPrice
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "update tb_store_goods_item set " +
            "bank_account = :basicItemNo, " +
            "bank_owner = :viewOrder, " +
            "dlvy_mng_yn = :itemStatus, " +
            "actual_owner = :itemName, " +
            "actual_addr = :itemPrice, " +
            "where head_no = :storeGoodsNo", nativeQuery = true)
    int updateStoreGoodsitem(
            @Param("storeGoodsNo") Long storeGoodsNo,
            @Param("basicItemNo") Integer basicItemNo,
            @Param("viewOrder") String viewOrder,
            @Param("itemStatus") Integer itemStatus,
            @Param("itemName") String itemName,
            @Param("itemPrice") Integer itemPrice
    );*/

    @Modifying
    @Query(value = "delete from tb_store_goods_item " +
            "where store_goods_no = :storeGoodsNo " +
            "and basic_item_no = :basicItemNo " +
            "", nativeQuery = true)
    int deleteStoreGoodsitem(@Param("storeGoodsNo") Long storeGoodsNo,
                         @Param("basicItemNo") Integer basicItemNo
    );
    @Query(value = "select " +
            "store_goods_no as storeGoodsNo, " +
            "basic_item_no as basicItemNo, " +
            "view_order as viewOrder, " +
            "item_status as itemStatus, " +
            "item_name as itemName, " +
            "item_price as itemPrice " +
            "from tb_store_goods_item " +
            "where store_goods_no = :storeGoodsNo " +
            "", nativeQuery = true)
    List<TbStoreGoodsItemDTO> findByStoreGoodsNo(@Param("storeGoodsNo") Long storeGoodsNo);

    @Query(value = "select " +
            "ifnull(MAX(basic_item_no),0) as basicItemNo " +
            "from tb_store_goods_item " +
            "where store_goods_no = :storeGoodsNo " +
            "", nativeQuery = true)
    int getTbStoreGoodsItemMaxNo(@Param("storeGoodsNo") Long storeGoodsNo);
}
