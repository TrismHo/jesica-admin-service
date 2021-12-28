package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbSystemGoods;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbSystemGoodsRepositorySupport {


    class TbSystemGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbSystemGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbSystemGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbSystemGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
