package com.trism.jesica.persistence.Repository.block;

import com.trism.jesica.persistence.Entitiy.block.TbDlvyAreaGeo;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbDlvyAreaGeoRepository extends JpaRepository<TbDlvyAreaGeo, Long>, JpaSpecificationExecutor<TbDlvyAreaGeo> {
    List<TbDlvyAreaGeo> findByAreaNo(@Param("areaNo") Long areaNo);

}