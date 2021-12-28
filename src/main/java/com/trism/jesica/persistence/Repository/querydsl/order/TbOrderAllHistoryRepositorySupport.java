package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderAllHistory;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderAllHistoryRepositorySupport {


    class TbOrderAllHistoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderAllHistoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderAllHistoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderAllHistory.class);
            this.queryFactory = queryFactory;
        }
    }
}
