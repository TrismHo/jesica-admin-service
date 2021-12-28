package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbBranchBusinessInfo;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

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
