package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategoryGoods;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbStoreCategoryGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

/*import com.trism.manna.persistence.id.TbStoreCategoryID;*/

public interface TbStoreCategoryGoodsRepository extends JpaRepository<TbStoreCategoryGoods, Long>, JpaSpecificationExecutor<TbStoreCategoryGoods>, TbStoreCategoryGoodsRepositorySupport {

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store_category_goods " +
            "(" +
            "store_cat_no, " +
            "store_goods_no " +
            ") " +
            "values " +
            "(" +
            " :storeCatNo " +
            ",:storeGoodsNo" +
            ") "+
            "", nativeQuery = true)
    int saveStoreCategoryGoods(@Param("storeCatNo") Long storeCatNo, @Param("storeGoodsNo") Long storeGoodsNo);

    @Modifying
    @Query(value = "delete from tb_store_category_goods " +
            "where store_cat_no = :storeCatNo " +
            "and store_goods_no = :storeGoodsNo " +
            "", nativeQuery = true)
    int deleteStoreCategoryGoods(@Param("storeCatNo") Long storeCatNo,
                             @Param("storeGoodsNo") Long storeGoodsNo);

}
