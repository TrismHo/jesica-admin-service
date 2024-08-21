package com.trism.jesica.persistence.mysql.Repository.safe;

import com.trism.jesica.persistence.mysql.Entitiy.safe.TbSafenMappingLog;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbSafenMappingLogRepository extends JpaRepository<TbSafenMappingLog, Long>, JpaSpecificationExecutor<TbSafenMappingLog> {

    List<TbSafenMappingLog> findBySafenNum(@Param("safenNum") String safenNum);
}
