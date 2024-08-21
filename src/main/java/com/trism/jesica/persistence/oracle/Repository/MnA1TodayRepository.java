package com.trism.jesica.persistence.oracle.Repository;

import com.trism.jesica.persistence.mysql.Repository.querydsl.system.TbSystemCodeRepositorySupport;
import com.trism.jesica.persistence.oracle.Entity.MnA1Today;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;


public interface MnA1TodayRepository extends JpaRepository<MnA1Today, String>, JpaSpecificationExecutor<MnA1Today>, TbSystemCodeRepositorySupport {
}
