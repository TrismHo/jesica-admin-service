package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreGoodsRepositorySupport {


    class TbStoreGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
