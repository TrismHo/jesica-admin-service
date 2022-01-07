package com.trism.jesica.persistence.Repository.board;

import com.trism.jesica.persistence.Entitiy.board.TbNoticeRelease;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbNoticeReleaseRepository extends JpaRepository<TbNoticeRelease, Long>, JpaSpecificationExecutor<TbNoticeRelease> {

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_notice_release SET data_status = '0' WHERE notice_no = :noticeNo" +
            "", nativeQuery = true)
    int deleteNotice(@Param("noticeNo") Long noticeNo);


    @Query(value = "select " +
            "notice_no as noticeNo " +
            ",title as title " +
            ",body as body " +
            ",insert_user_id as insertUserId " +
            ",insert_date as insertDate " +
            "from " +
            "tb_notice_release " +
            "where data_status = 1 "+
            "order by insert_date asc LIMIT 20" +
            "", nativeQuery = true)
    List<Map<String,Object>> findAllLimit();
}