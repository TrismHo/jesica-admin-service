package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderAll;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderAllRepositorySupport {


    class TbOrderAllRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderAllRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderAllRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderAll.class);
            this.queryFactory = queryFactory;
        }
    }
}
