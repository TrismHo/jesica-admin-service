package com.trism.jesica.persistence.Repository.board;

import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbNoticePlatformRepository extends JpaRepository<TbNoticePlatform, Long>, JpaSpecificationExecutor<TbNoticePlatform> {

    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_notice_platform SET data_status = '0' WHERE notice_no = :noticeNo" +
            "", nativeQuery = true)
    int deleteNotice(@Param("noticeNo") Long noticeNo);
}