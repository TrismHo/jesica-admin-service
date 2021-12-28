package com.trism.jesica.persistence.Repository.querydsl.business;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.Entitiy.business.TbUserDevice;
import com.trism.jesica.persistence.core.support.BaseQueryDslRepositorySupport;

public interface TbUserDeviceRepositorySupport {


    class TbUserDeviceRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbUserDeviceRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbUserDeviceRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbUserDevice.class);
            this.queryFactory = queryFactory;
        }
    }
}
