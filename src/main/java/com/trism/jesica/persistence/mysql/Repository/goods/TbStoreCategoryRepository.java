package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.dto.TbStoreCategoryDTO;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbStoreCategoryRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

/*import com.trism.manna.persistence.id.TbStoreCategoryID;*/

public interface TbStoreCategoryRepository extends JpaRepository<TbStoreCategory, Long>, JpaSpecificationExecutor<TbStoreCategory>, TbStoreCategoryRepositorySupport {
    @Modifying
    @Query(value = "delete from tb_store_category " +
            "where store_cat_no = :storeCatNo " +
            "and store_no = :storeNo " +
            "", nativeQuery = true)
    int delete(@Param("storeCatNo") Long storeCatNo,
                @Param("storeNo") Integer storeNo
    );


    @Query(value = "select store_cat_no as storeCatNo, " +
            "store_no as storeNo, " +
            "cat_name as catName, " +
            "cat_value as catValue, " +
            "cat_level as catLevel, " +
            "view_order as viewOrder, " +
            "parent_cat_no as parentCatNo, " +
            "data_status as dataStatus, " +
            "memo as memo " +
            "from tb_store_category " +
            "where store_no = :storeNo " +
            "", nativeQuery = true)
    List<TbStoreCategoryDTO> findByStoreNo(@Param("storeNo") Integer storeNo);


    @Query(value = "select store_cat_no as storeCatNo, " +
            "store_no as storeNo, " +
            "cat_name as catName, " +
            "cat_value as catValue, " +
            "cat_level as catLevel, " +
            "view_order as viewOrder, " +
            "parent_cat_no as parentCatNo, " +
            "data_status as dataStatus, " +
            "memo as memo " +
            "from tb_store_category " +
            "order by catLevel asc " +
            "", nativeQuery = true)
    List<TbStoreCategoryDTO> findAllCategory();

    @Query(value = "select q1.store_cat_no as storeCatNo, " +
            "q1.store_no as storeNo, " +
            "q1.cat_name as catName, " +
            "q1.cat_value as catValue, " +
            "q1.cat_level as catLevel, " +
            "q1.view_order as viewOrder, " +
            "q1.parent_cat_no as parentCatNo, " +
            "q1.data_status as dataStatus, " +
            "q1.memo as memo " +
            "from tb_store_category q1 " +
            "where q1.store_no = :storeNo " +
            "and q1.cat_level = :catLevel "+
            "order by view_order asc", nativeQuery = true)
    List<TbStoreCategoryDTO> findByStoreNoAndCatLevel(@Param("storeNo") Integer storeNo, @Param("catLevel") Integer catLevel );

    @Query(value = "select q1.store_cat_no as storeCatNo, " +
            "q1.store_no as storeNo, " +
            "q1.cat_name as catName, " +
            "q1.cat_value as catValue, " +
            "q1.cat_level as catLevel, " +
            "q1.view_order as viewOrder, " +
            "q1.parent_cat_no as parentCatNo, " +
            "q1.data_status as dataStatus, " +
            "q1.memo as memo " +
            "from tb_store_category q1 " +
            "where q1.store_no = :storeNo " +
            "and q1.parent_cat_no = :parentCatNo "+
            "and q1.cat_level = :catLevel "+
            "order by view_order asc", nativeQuery = true)
    List<TbStoreCategoryDTO> findByStoreNoAndCatLevelAndParentCatNo(@Param("storeNo") Integer storeNo, @Param("catLevel") Integer catLevel , @Param("parentCatNo") Integer parentCatNo);

    @Query(value = "select q1.store_cat_no as storeCatNo, " +
            "q1.store_no as storeNo, " +
            "q1.cat_name as catName, " +
            "q1.cat_value as catValue, " +
            "q1.cat_level as catLevel, " +
            "q1.view_order as viewOrder, " +
            "q1.parent_cat_no as parentCatNo, " +
            "q1.data_status as dataStatus, " +
            "q1.memo as memo " +
            "from tb_store_category q1 left outer join tb_store_category_goods q2 " +
            "on (q2.store_cat_no = q1.store_cat_no) " +
            "where q1.store_no = :storeNo " +
            "and q2.store_goods_no = :storeGoodsNo " +
            "order by view_order asc " +
            "", nativeQuery = true)
    List<TbStoreCategoryDTO> getTbStoreCategoryList(@Param("storeNo") Long storeNo, @Param("storeGoodsNo") Integer storeGoodsNo);
}
