package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderDayExtra;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayExtraRepositorySupport {


    class TbOrderDayExtraRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayExtraRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayExtraRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDayExtra.class);
            this.queryFactory = queryFactory;
        }
    }
}
