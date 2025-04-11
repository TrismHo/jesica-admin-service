package com.trism.jesica.persistence.mysql.Repository.board;

import com.trism.jesica.persistence.mysql.Entitiy.board.TbNoticePlatform;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Map;

public interface TbNoticePlatformRepository extends JpaRepository<TbNoticePlatform, Long>, JpaSpecificationExecutor<TbNoticePlatform> {

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_notice_platform SET data_status = '0' WHERE notice_no = :noticeNo" +
            "", nativeQuery = true)
    int deleteNotice(@Param("noticeNo") Long noticeNo);

    TbNoticePlatform findByNoticeNoAndGroupTypeAndPlatformType(Long noticeNo, Integer groupType, Integer platformType);

    @Query(value = "select " +
            "notice_no as noticeNo " +
            ",title as title " +
            ",body as body " +
            ",group_type as groupType " +
            ",insert_user_id as insertUserId " +
            ",insert_date as insertDate " +
            ",platform_type as platformType "+
            "from " +
            "tb_notice_platform " +
            "where data_status = 1 "+
            "and view_yn = 1 "+
            "and platform_type = :platformType "+
            "order by insert_date desc LIMIT 20" +
            "", nativeQuery = true)
    List<Map<String,Object>> findAllLimit(@Param("platformType") Integer platformType);
}
