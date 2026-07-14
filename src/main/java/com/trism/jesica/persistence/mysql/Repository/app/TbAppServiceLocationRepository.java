package com.trism.jesica.persistence.mysql.Repository.app;

import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppServiceLocation;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TbAppServiceLocationRepository extends JpaRepository<TbAppServiceLocation, Integer> {

    // service_no로 location 조회
    List<TbAppServiceLocation> findByServiceNoOrderByLocationNoDesc(Integer serviceNo);
    Integer deleteByServiceNo(Integer serviceNo);
}
