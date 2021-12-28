package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbUser;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbUserRepositorySupport {


    class TbUserRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbUserRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbUserRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbUser.class);
            this.queryFactory = queryFactory;
        }
    }
}
