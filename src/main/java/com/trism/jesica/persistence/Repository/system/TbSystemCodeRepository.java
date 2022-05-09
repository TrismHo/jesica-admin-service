package com.trism.jesica.persistence.Repository.system;

import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Repository.querydsl.system.TbSystemCodeRepositorySupport;
import com.trism.jesica.persistence.type.DataStatus;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;


public interface TbSystemCodeRepository extends JpaRepository<TbSystemCode, String>, JpaSpecificationExecutor<TbSystemCode>, TbSystemCodeRepositorySupport {
    List<TbSystemCode> findBySysType(@Param("sysType") String sysType);
    List<TbSystemCode> findBySysTypeAndDataStatus(@Param("sysType") String sysType,@Param("dataStatus") DataStatus dataStatus);
    TbSystemCode findBySysTypeAndSysCode(@Param("sysType") String sysType, @Param("sysCode") String sysCode);
}
