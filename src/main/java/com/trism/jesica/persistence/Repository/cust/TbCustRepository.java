package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCust;
import com.trism.jesica.persistence.Repository.querydsl.cust.TbCustRepositorySupport;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustRepository extends JpaRepository<TbCust, Long>, TbCustRepositorySupport {
}
