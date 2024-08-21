package com.trism.jesica.persistence.mysql.Repository.business;

import com.trism.jesica.dto.TbBrandDTO;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBrand;
import com.trism.jesica.persistence.mysql.Repository.querydsl.business.TbBrandRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbBrandRepository extends JpaRepository<TbBrand, Long>, TbBrandRepositorySupport {

    @Query(value = "select brand_no as brandNo, " +
            "brand_name as brandName " +
            "from tb_brand " +
            "where brand_name like :brandName " +
            "and data_status != 0 " +
            "and brand_no = :brandNo " +
            "", nativeQuery = true)
    List<TbBrandDTO> findByBrandName(@Param("brandName") String branchName , @Param("brandNo") Long brandNo);

    @Query(value = "select brand_no as brandNo, " +
            "brand_name as brandName " +
            "from tb_brand " +
            "where brand_no like :brandNo " +
            "and data_status != 0 " +
            "", nativeQuery = true)
    List<TbBrandDTO> findByBrandNo( @Param("brandNo") Long brandNo);

    @Query(value = "select brand_no as brandNo, " +
            "brand_name as brandName " +
            "from tb_brand " +
            "where data_status != 0 "+
            "", nativeQuery = true)
    List<TbBrandDTO> findByAll();
}
