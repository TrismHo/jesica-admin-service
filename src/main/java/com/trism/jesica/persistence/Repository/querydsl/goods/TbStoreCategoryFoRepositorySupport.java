package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreCategoryFoRepositorySupport {


    class TbStoreCategoryFoRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreCategoryFoRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreCategoryFoRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreCategoryFo.class);
            this.queryFactory = queryFactory;
        }
    }
}
