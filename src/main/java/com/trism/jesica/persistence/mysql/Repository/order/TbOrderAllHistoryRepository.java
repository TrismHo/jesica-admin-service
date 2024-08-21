package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAllHistory;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderAllHistoryRepositorySupport;
import com.trism.jesica.persistence.mysql.id.TbOrderHistoryID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderAllHistoryRepository extends JpaRepository<TbOrderAllHistory, TbOrderHistoryID>, TbOrderAllHistoryRepositorySupport {

}
