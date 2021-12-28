package com.trism.jesica.persistence.Repository.goods;

import com.trism.jesica.persistence.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.Repository.querydsl.goods.TbStoreGoodsRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;

public interface TbStoreGoodsRepository extends  JpaRepository<TbStoreGoods, Long>, JpaSpecificationExecutor<TbStoreGoods>, TbStoreGoodsRepositorySupport {

}
