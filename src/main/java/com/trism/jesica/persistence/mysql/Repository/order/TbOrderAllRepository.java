package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderAllRepositorySupport;
import org.springframework.data.jpa.repository.EntityGraph;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbOrderAllRepository extends JpaRepository<TbOrderAll, Long>, TbOrderAllRepositorySupport ,  JpaSpecificationExecutor<TbOrderAll> {

    @EntityGraph(attributePaths = "orderHistories")
    TbOrderAll findByOrderNo(@Param("orderNo") Long orderNo);
}
