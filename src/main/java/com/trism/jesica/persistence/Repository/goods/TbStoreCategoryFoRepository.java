package com.trism.jesica.persistence.Repository.goods;

import com.trism.jesica.dto.TbStoreCategoryFoDTO;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo;
import com.trism.jesica.persistence.Repository.querydsl.goods.TbStoreCategoryFoRepositorySupport;
import com.trism.jesica.persistence.id.TbStoreCategoryFoID;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbStoreCategoryFoRepository extends JpaRepository<TbStoreCategoryFo, TbStoreCategoryFoID>, TbStoreCategoryFoRepositorySupport {


    @Query(value = "select " +
            "store_no as storeNo, " +
            "cat_code as catCode," +
            "cat_level as catLevel, " +
            "parent_cat_code as parentCatCode " +
            "from tb_store_category_fo " +
            "where store_no = :storeNo " +
            "", nativeQuery = true)
    List<TbStoreCategoryFoDTO> findByStoreNo(@Param("storeNo") Long storeNo
    );

    @Modifying(clearAutomatically = true)
    @Query(value = "insert into tb_store_category_fo " +
            "( " +
            "insert_date " +
            ",store_no " +
            ",cat_code " +
            ",cat_level" +
            ",parent_cat_code) " +
            "value " +
            "(now() " +
            ",:storeNo " +
            ",:cateCode " +
            ",:catLevel " +
            ",:parentCatCode) " +
            "", nativeQuery = true)
    int insertCategoryFo(@Param("storeNo") Long storeNo,
                     @Param("cateCode") String cateCode,
                     @Param("catLevel") Integer catLevel,
                     @Param("parentCatCode") String parentCatCode
    );

    @Modifying
    @Query(value = "delete from tb_store_category_fo " +
            "where store_no = :storeNo " +
            "and cat_code = :catCode " +
            "", nativeQuery = true)
    int deleteCategoryFo(@Param("storeNo") Long storeNo,
                     @Param("catCode") String catCode
    );
}
