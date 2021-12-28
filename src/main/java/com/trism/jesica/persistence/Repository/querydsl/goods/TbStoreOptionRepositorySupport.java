package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreOptionRepositorySupport {


    class TbStoreOptionRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreOptionRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreOptionRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreOption.class);
            this.queryFactory = queryFactory;
        }
    }
}
