package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBranchBusinessInfo;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbBranchBusinessInfoRepositorySupport {


    class TbBranchBusinessInfoRepositorySupportImpl extends BaseQueryDslRepositorySupport

            implements TbBranchBusinessInfoRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbBranchBusinessInfoRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbBranchBusinessInfo.class);
            this.queryFactory = queryFactory;
        }
    }
}
