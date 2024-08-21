package com.trism.jesica.persistence.mysql.Repository.order;

import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAllGoods;
import com.trism.jesica.persistence.mysql.Repository.querydsl.order.TbOrderAllGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbOrderAllGoodsRepository extends JpaRepository<TbOrderAllGoods, Long>, TbOrderAllGoodsRepositorySupport {

}
