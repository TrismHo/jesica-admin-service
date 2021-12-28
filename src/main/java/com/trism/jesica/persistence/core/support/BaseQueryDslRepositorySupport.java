package com.trism.jesica.persistence.core.support;

import org.springframework.data.jpa.repository.support.QuerydslRepositorySupport;
import org.springframework.util.Assert;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;


public class BaseQueryDslRepositorySupport extends QuerydslRepositorySupport {

    public BaseQueryDslRepositorySupport(Class<?> domainClass) {
        super(domainClass);

    }

    @PersistenceContext
    @Override
    public void setEntityManager(EntityManager entityManager) {
        Assert.notNull(entityManager, "EntityManager must not be null!");
        super.setEntityManager(entityManager);
    }
}
