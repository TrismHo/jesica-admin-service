package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDayHistory;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayHistoryRepositorySupport {


    class TbOrderDayHistoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayHistoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayHistoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDayHistory.class);
            this.queryFactory = queryFactory;
        }
    }
}
