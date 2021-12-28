package com.trism.jesica.persistence.Repository.call;

import com.trism.jesica.persistence.Entitiy.call.TbCallHistory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.List;

public interface TbCallHistoryRepository extends JpaRepository<TbCallHistory, Long>, JpaSpecificationExecutor<TbCallHistory> {

    List<TbCallHistory> findByOrderNo(@Param("orderNo") Long orderNo);
}