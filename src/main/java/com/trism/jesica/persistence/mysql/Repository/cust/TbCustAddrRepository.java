package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustAddr;
import com.trism.jesica.persistence.mysql.Repository.querydsl.cust.TbCustAddrRepositorySupport;
import com.trism.jesica.persistence.mysql.id.TbCustAddrID;
import org.springframework.data.jpa.repository.JpaRepository;

public interface TbCustAddrRepository extends JpaRepository<TbCustAddr, TbCustAddrID>, TbCustAddrRepositorySupport {
}
