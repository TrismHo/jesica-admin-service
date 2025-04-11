package com.trism.jesica.persistence.mysql.Repository.event;

import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;
import java.util.Optional;

public interface TbEventRepository extends JpaRepository<TbEvent, Long>, JpaSpecificationExecutor<TbEvent> {

    Optional<TbEvent> findByEventNoAndPlatformType(Long eventNo, Integer platformType);

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_event SET data_status = '0' WHERE event_no = :eventNo" +
            "", nativeQuery = true)
    int deleteEvent(@Param("eventNo") Long eventNo);

    @Query(value = "select " +
            "event_no as eventNo " +
            ",title as title " +
            ",body as body " +
            ",insert_user_id as insertUserId " +
            ",insert_date as insertDate " +
            "from " +
            "tb_event " +
            "where data_status = 1 "+
            "and view_yn = 1 "+
            "and platform_type = :platfromType "+
            "order by insert_date desc LIMIT 20" +
            "", nativeQuery = true)
    List<Map<String,Object>> findAllLimit(@Param("platfromType") Integer platfromType);
}
