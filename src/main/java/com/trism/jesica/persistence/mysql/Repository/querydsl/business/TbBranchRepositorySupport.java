package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBranch;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbBranchRepositorySupport {


    class TbBranchRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbBranchRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbBranchRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbBranch.class);
            this.queryFactory = queryFactory;
        }
    }
}
