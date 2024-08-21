package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayHistory;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderDayHistoryRepositorySupport;
import com.trism.jesica.persistence.mysql.id.TbOrderHistoryID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderDayHistoryRepository extends JpaRepository<TbOrderDayHistory, TbOrderHistoryID>, TbOrderDayHistoryRepositorySupport {

}
