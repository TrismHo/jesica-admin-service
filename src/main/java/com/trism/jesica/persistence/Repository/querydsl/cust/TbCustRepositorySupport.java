package com.trism.jesica.persistence.Repository.querydsl.cust;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbCustRepositorySupport {


    class TbCustRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbCustRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbCustRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbCust.class);
            this.queryFactory = queryFactory;
        }
    }
}
