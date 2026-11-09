package com.trism.jesica.persistence.mysql.Repository.app;

import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppService;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

import java.util.List;

public interface TbAppServiceRepository    extends JpaRepository<TbAppService, Integer>,
        JpaSpecificationExecutor<TbAppService> {

    // 정상 데이터만 리스트 (data_status=1)
    List<TbAppService> findByDataStatusOrderByServiceNoAsc(Integer dataStatus);

    TbAppService findByServiceName(String serviceName);
}
