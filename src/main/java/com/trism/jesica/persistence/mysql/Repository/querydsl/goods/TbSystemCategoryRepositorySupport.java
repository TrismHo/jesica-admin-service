package com.trism.jesica.persistence.mysql.Repository.querydsl.goods;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbSystemCategory;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbSystemCategoryRepositorySupport {


    class TbSystemCategoryRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbSystemCategoryRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbSystemCategoryRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbSystemCategory.class);
            this.queryFactory = queryFactory;
        }
    }
}
