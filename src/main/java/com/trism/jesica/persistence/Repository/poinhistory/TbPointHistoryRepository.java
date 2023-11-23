package com.trism.jesica.persistence.Repository.poinhistory;

import com.trism.jesica.persistence.Entitiy.poinhistory.TbPointHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbPointHistoryRepository extends JpaRepository<TbPointHistory, String>, JpaSpecificationExecutor<TbPointHistory> {
    List<TbPointHistory> findByUserNo(@Param("userNo") Long userNo);
}
