package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategoryGoods;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreCategoryGoodsRepositorySupport {


    class TbStoreCategoryGoodsRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreCategoryGoodsRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreCategoryGoodsRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreCategoryGoods.class);
            this.queryFactory = queryFactory;
        }
    }
}
