package com.trism.jesica.persistence.mysql.Repository.goods;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.Repository.querydsl.goods.TbStoreGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreGoodsRepository extends  JpaRepository<TbStoreGoods, Long>, JpaSpecificationExecutor<TbStoreGoods>, TbStoreGoodsRepositorySupport {

}
