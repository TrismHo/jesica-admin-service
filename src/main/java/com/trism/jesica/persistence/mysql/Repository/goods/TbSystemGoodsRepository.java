package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbSystemGoods;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbSystemGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbSystemGoodsRepository extends JpaRepository<TbSystemGoods, Long>, JpaSpecificationExecutor<TbSystemGoods>, TbSystemGoodsRepositorySupport {
}
