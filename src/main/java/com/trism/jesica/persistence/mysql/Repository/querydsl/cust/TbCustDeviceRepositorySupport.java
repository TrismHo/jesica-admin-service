package com.trism.jesica.persistence.mysql.Repository.querydsl.cust;

import com.querydsl.jpa.impl.JPAQueryFactory;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustDevice;
import com.trism.jesica.persistence.mysql.core.support.BaseQueryDslRepositorySupport;

public interface TbCustDeviceRepositorySupport {


    class TbCustDeviceRepositorySupportImpl extends BaseQueryDslRepositorySupport implements TbCustDeviceRepositorySupport {

        private final JPAQueryFactory queryFactory;

        public TbCustDeviceRepositorySupportImpl(JPAQueryFactory queryFactory) {
            super(TbCustDevice.class);
            this.queryFactory = queryFactory;
        }
    }
}
