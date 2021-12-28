package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderDayExtra;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderDayExtraRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbOrderDayExtraRepository extends JpaRepository<TbOrderDayExtra, Long>, TbOrderDayExtraRepositorySupport, JpaSpecificationExecutor<TbOrderDayExtra> {

}
