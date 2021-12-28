package com.trism.jesica.persistence.Repository.order;

import com.trism.jesica.persistence.Entitiy.order.TbOrderAllGoods;
import com.trism.jesica.persistence.Repository.querydsl.order.TbOrderAllGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderAllGoodsRepository extends JpaRepository<TbOrderAllGoods, Long>, TbOrderAllGoodsRepositorySupport {

}
