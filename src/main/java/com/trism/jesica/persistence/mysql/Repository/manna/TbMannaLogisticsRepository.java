package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaLogistics;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface TbMannaLogisticsRepository extends JpaRepository<TbMannaLogistics, Long> {

    List<TbMannaLogistics> findByOrdNo(Long ordNo);

    List<TbMannaLogistics> findByOrdNoIn(List<Long> ordNoList);

    Optional<TbMannaLogistics> findByTrackingNum(String trackingNum);

    Optional<TbMannaLogistics> findByLogisticsNo(Long logisticsNo);

    Optional<TbMannaLogistics> findFirstByOrdNoOrderByLogisticsNoDesc(Long ordNo);

}
