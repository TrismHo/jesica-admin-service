package com.trism.jesica.persistence.Repository.querydsl.system;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbSystemCodeRepositorySupport {


    class TbSystemCodeRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbSystemCodeRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbSystemCodeRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbSystemCode.class);
            this.queryFactory = queryFactory;
        }
    }
}
