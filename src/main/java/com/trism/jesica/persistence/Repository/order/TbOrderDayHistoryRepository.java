package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderDayHistoryRepositorySupport;
import com.trism.jesica.persistence.id.TbOrderHistoryID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderDayHistoryRepository extends JpaRepository<TbOrderDayHistory, TbOrderHistoryID>, TbOrderDayHistoryRepositorySupport {

}
