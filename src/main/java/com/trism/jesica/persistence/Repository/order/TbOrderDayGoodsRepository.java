package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderDayGoods;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderDayGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderDayGoodsRepository extends JpaRepository<TbOrderDayGoods, Long>, TbOrderDayGoodsRepositorySupport {

}
