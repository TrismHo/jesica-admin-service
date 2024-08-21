package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBrand;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbBrandRepositorySupport {


    class TbBrandRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbBrandRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbBrandRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbBrand.class);
            this.queryFactory = queryFactory;
        }
    }
}
