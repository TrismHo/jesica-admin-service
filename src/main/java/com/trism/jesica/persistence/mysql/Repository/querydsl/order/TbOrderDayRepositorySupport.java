package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayRepositorySupport {


    class TbOrderDayRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDay.class);
            this.queryFactory = queryFactory;
        }
    }
}
