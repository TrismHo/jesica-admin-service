package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaEventPush;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.domain.Specification;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TbMannaEventPushRepository extends JpaRepository<TbMannaEventPush, Long>, JpaSpecificationExecutor<TbMannaEventPush> {
    Page<TbMannaEventPush> findAll(Specification<TbMannaEventPush> specification, Pageable pageable);
    Optional<TbMannaEventPush> findByLogNo(@Param("logNo") Long logNo);
}
