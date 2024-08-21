package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreGoodsRepositorySupport {


    class TbStoreGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
