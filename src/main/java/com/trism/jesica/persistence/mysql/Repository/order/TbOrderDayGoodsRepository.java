package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayGoods;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderDayGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderDayGoodsRepository extends JpaRepository<TbOrderDayGoods, Long>, TbOrderDayGoodsRepositorySupport {

}
