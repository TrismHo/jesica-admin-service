package com.trism.jesica.persistence.mysql.Repository.querydsl.system;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbSystemCodeRepositorySupport {


    class TbSystemCodeRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbSystemCodeRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbSystemCodeRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbSystemCode.class);
            this.queryFactory = queryFactory;
        }
    }
}
