package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreRepositorySupport {


    class TbStoreRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStore.class);
            this.queryFactory = queryFactory;
        }
    }
}
