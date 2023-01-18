package com.trism.jesica.persistence.Repository.event;

import com.trism.jesica.persistence.Entitiy.event.TbEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Optional;

public interface TbEventRepository extends JpaRepository<TbEvent, Long>, JpaSpecificationExecutor<TbEvent> {

    Optional<TbEvent> findByEventNoAndPlatformType(Long eventNo, Integer platformType);

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_event SET data_status = '0' WHERE event_no = :eventNo" +
            "", nativeQuery = true)
    int deleteEvent(@Param("eventNo") Long eventNo);
}