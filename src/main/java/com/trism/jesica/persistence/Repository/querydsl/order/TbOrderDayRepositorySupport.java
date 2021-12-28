package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDay;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayRepositorySupport {


    class TbOrderDayRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDay.class);
            this.queryFactory = queryFactory;
        }
    }
}
