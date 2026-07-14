package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaLogisticsHistory;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TbMannaLogisticsHistoryRepository
        extends JpaRepository<TbMannaLogisticsHistory, TbMannaLogisticsHistory.Pk> {

    List<TbMannaLogisticsHistory> findByLogisticsNoOrderByTransDateAsc(Long logisticsNo);

    List<TbMannaLogisticsHistory> findByLogisticsNoOrderByTransDateDesc(Long logisticsNo);

    List<TbMannaLogisticsHistory> findByLogisticsNoInOrderByTransDateAsc(List<Long> logisticsNoList);
}
