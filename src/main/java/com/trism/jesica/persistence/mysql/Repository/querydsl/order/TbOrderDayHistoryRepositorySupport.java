package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayHistory;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayHistoryRepositorySupport {


    class TbOrderDayHistoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayHistoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayHistoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDayHistory.class);
            this.queryFactory = queryFactory;
        }
    }
}
