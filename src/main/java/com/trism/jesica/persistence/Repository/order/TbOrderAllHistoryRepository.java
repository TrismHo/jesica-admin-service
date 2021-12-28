package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderAllHistory;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderAllHistoryRepositorySupport;
import com.trism.jesica.persistence.id.TbOrderHistoryID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderAllHistoryRepository extends JpaRepository<TbOrderAllHistory, TbOrderHistoryID>, TbOrderAllHistoryRepositorySupport {

}
