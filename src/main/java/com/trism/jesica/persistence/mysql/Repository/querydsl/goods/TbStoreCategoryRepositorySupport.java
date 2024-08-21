package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreCategory;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbStoreCategoryRepositorySupport {


    class TbStoreCategoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbStoreCategoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbStoreCategoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbStoreCategory.class);
            this.queryFactory = queryFactory;
        }
    }
}
