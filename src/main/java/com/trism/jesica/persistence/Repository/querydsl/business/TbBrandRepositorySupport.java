package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbBrand;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbBrandRepositorySupport {


    class TbBrandRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbBrandRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbBrandRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbBrand.class);
            this.queryFactory = queryFactory;
        }
    }
}
