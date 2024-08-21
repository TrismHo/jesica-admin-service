package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoodsItem;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreGoodsItemRepositorySupport {

    class TbStoreGoodsItemRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreGoodsItemRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreGoodsItemRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreGoodsItem.class);
            this.queryFactory = queryFactory;
        }
    }
}
