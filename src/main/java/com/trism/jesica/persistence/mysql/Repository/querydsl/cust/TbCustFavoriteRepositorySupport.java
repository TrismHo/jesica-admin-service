package com.trism.jesica.persistence.mysql.Repository.querydsl.cust;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustFavorite;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbCustFavoriteRepositorySupport {


    class TbCustFavoriteRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbCustFavoriteRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbCustFavoriteRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbCustFavorite.class);
            this.queryFactory = queryFactory;
        }
    }
}
