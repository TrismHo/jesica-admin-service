package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayExtra;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayExtraRepositorySupport {


    class TbOrderDayExtraRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayExtraRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayExtraRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDayExtra.class);
            this.queryFactory = queryFactory;
        }
    }
}
