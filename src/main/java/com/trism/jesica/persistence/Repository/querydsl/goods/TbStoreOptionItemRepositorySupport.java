package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreOptionItem;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreOptionItemRepositorySupport {


    class TbStoreOptionRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreOptionItemRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreOptionRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreOptionItem.class);
            this.queryFactory = queryFactory;
        }
    }
}
