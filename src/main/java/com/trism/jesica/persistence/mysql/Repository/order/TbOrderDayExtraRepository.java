package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayExtra;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderDayExtraRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbOrderDayExtraRepository extends JpaRepository<TbOrderDayExtra, Long>, TbOrderDayExtraRepositorySupport, JpaSpecificationExecutor<TbOrderDayExtra> {

}
