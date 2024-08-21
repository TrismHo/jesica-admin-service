package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderDayRepositorySupport;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbOrderDayRepository extends JpaRepository<TbOrderDay, Long>, TbOrderDayRepositorySupport , JpaSpecificationExecutor<TbOrderDay> {

    @EntityGraph(attributePaths = "orderHistories")
    TbOrderDay findByOrderNo(@Param("orderNo") Long orderNo);
}
