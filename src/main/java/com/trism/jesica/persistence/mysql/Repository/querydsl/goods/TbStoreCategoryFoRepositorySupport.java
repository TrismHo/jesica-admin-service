package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategoryFo;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreCategoryFoRepositorySupport {


    class TbStoreCategoryFoRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreCategoryFoRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreCategoryFoRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreCategoryFo.class);
            this.queryFactory = queryFactory;
        }
    }
}
