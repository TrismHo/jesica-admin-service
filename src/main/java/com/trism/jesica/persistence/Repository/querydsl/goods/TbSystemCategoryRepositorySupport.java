package com.trism.jesica.persistence.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.goods.TbSystemCategory;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbSystemCategoryRepositorySupport {


    class TbSystemCategoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbSystemCategoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbSystemCategoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbSystemCategory.class);
            this.queryFactory = queryFactory;
        }
    }
}
