package com.trism.jesica.persistence.Repository.querydsl.order;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.order.TbOrderAllExtra;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbOrderAllExtraRepositorySupport {


    class TbOrderAllExtraRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbOrderAllExtraRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbOrderAllExtraRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbOrderAllExtra.class);
            this.queryFactory = queryFactory;
        }

        public void test() {

        }
    }
}
