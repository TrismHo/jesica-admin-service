package com.trism.jesica.persistence.mysql.Repository.app;

import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppVersion;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbAppVersionRepository extends JpaRepository<TbAppVersion, String>, JpaSpecificationExecutor<TbAppVersion> {

    List<TbAppVersion> findByDeviceTypeAndAppCode(@Param("deviceType") Integer deviceType,@Param("appCode") String appCode);
}

