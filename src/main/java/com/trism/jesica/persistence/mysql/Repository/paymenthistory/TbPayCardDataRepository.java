package com.trism.jesica.persistence.mysql.Repository.paymenthistory;

import com.trism.jesica.persistence.mysql.Entitiy.paymenthistory.TbPayCardData;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

public interface TbPayCardDataRepository extends JpaRepository<TbPayCardData, String>, JpaSpecificationExecutor<TbPayCardData> {
    TbPayCardData findByTid(@Param("tid") String tid);
}
