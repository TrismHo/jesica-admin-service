package com.trism.jesica.persistence.mysql.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.order.TbOrderAllGoods;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderAllGoodsRepositorySupport {


    class TbOrderAllGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderAllGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderAllGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderAllGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
