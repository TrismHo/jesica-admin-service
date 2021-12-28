package com.trism.jesica.persistence.Repository.cust;

import com.trism.jesica.persistence.Entitiy.cust.TbCustAddr;
import com.trism.jesica.persistence.Repository.querydsl.cust.TbCustAddrRepositorySupport;
import com.trism.jesica.persistence.id.TbCustAddrID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustAddrRepository extends JpaRepository<TbCustAddr, TbCustAddrID>, TbCustAddrRepositorySupport {
}
