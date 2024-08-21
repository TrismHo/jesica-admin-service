package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderDayGoods;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderDayGoodsRepositorySupport {


    class TbOrderDayGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderDayGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderDayGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderDayGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
