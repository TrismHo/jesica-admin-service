package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbHeadBusinessInfo;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbHeadBusinessInfoRepositorySupport {


    class TbHeadBusinessInfoRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbHeadBusinessInfoRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbHeadBusinessInfoRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbHeadBusinessInfo.class);
            this.queryFactory = queryFactory;
        }
    }
}
