package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbHead;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbHeadRepositorySupport {


    class TbHeadRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbHeadRepositorySupport {
        private final JPAQueryFactory queryFactory;

        public TbHeadRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbHead.class);
            this.queryFactory = queryFactory;
        }
    }
}
