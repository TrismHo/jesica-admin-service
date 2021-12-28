package com.trism.jesica.persistence.Repository.querydsl.cust;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.cust.TbCustAddr;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbCustAddrRepositorySupport {


    class TbCustAddrRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbCustAddrRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbCustAddrRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbCustAddr.class);
            this.queryFactory = queryFactory;
        }
    }
}
