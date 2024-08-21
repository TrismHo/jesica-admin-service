package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbHead;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbHeadRepositorySupport {


    class TbHeadRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbHeadRepositorySupport {
        private final JPAQueryFactory queryFactory;

        public TbHeadRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbHead.class);
            this.queryFactory = queryFactory;
        }
    }
}
