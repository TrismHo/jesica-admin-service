package com.trism.jesica.persistence.mysql.Repository.cust;

import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustSns;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TbCustSnsRepository extends JpaRepository<TbCustSns, Long> {
    List<TbCustSns> findByCustNoIn(List<Long> custNoList);
}
