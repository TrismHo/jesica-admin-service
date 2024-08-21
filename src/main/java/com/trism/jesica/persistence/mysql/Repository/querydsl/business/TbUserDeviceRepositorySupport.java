package com.trism.jesica.persistence.mysql.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbUserDevice;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbUserDeviceRepositorySupport {


    class TbUserDeviceRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbUserDeviceRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbUserDeviceRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbUserDevice.class);
            this.queryFactory = queryFactory;
        }
    }
}
