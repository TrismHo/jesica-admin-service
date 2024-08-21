package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAllHistory;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderAllHistoryRepositorySupport {


    class TbOrderAllHistoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderAllHistoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderAllHistoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderAllHistory.class);
            this.queryFactory = queryFactory;
        }
    }
}
