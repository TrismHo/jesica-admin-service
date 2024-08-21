package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.dto.TbSystemCategoryDTO;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbSystemCategory;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbSystemCategoryRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbSystemCategoryRepository extends JpaRepository<TbSystemCategory, String>, TbSystemCategoryRepositorySupport {

    @Query(value = "select cat_type as catType, " +
            "cat_code as catCode, " +
            "cat_level as catLevel, " +
            "cat_name as catName, " +
            "cat_value as catValue, " +
            "view_order as viewOrder, " +
            "parent_cat_code as parentCatCode, " +
            "data_status as dataStatus " +
            "from tb_system_category " +
            "where cat_type = :catType " +
            "and cat_level = :catLevel "+
            "and data_status != 0 ", nativeQuery = true)
    List<TbSystemCategoryDTO> findByCatType(@Param("catType") String catType, @Param("catLevel") Integer catLevel);

    @Query(value = "select cat_type as catType, " +
            "cat_code as catCode, " +
            "cat_level as catLevel, " +
            "cat_name as catName, " +
            "cat_value as catValue, " +
            "view_order as viewOrder, " +
            "parent_cat_code as parentCatCode, " +
            "data_status as dataStatus " +
            "from tb_system_category " +
            "where parent_cat_code = :parentCatCode " +
            "and cat_level = :catLevel "+
            "and cat_type = 'IP' "+
            "and data_status != 0 ", nativeQuery = true)
    List<TbSystemCategoryDTO> findByCatLevelAndParentCatCode(@Param("parentCatCode") String parentCatCode, @Param("catLevel") Integer catLevel);

    @Query(value = "select cat_type as catType, " +
            "cat_code as catCode, " +
            "cat_level as catLevel, " +
            "cat_name as catName, " +
            "cat_value as catValue, " +
            "view_order as viewOrder, " +
            "parent_cat_code as parentCatNo, " +
            "data_status as dataStatus, " +
            "memo as memo " +
            "from tb_system_category " +
            "where cat_type = 'IP' "+
            "order by catLevel asc " +
            "", nativeQuery = true)
    List<TbSystemCategoryDTO> findAllCategory();

    TbSystemCategoryDTO findByCatCode(String CatCode);

}
