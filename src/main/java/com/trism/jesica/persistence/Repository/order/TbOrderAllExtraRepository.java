package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderAllExtra;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderAllExtraRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbOrderAllExtraRepository extends JpaRepository<TbOrderAllExtra, Long>, TbOrderAllExtraRepositorySupport, JpaSpecificationExecutor<TbOrderAllExtra> {

}
