package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbBranchRepositorySupport {


    class TbBranchRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbBranchRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbBranchRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbBranch.class);
            this.queryFactory = queryFactory;
        }
    }
}
