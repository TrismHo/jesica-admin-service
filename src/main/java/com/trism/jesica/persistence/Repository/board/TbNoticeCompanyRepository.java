package com.trism.jesica.persistence.Repository.board;

import com.trism.jesica.persistence.Entitiy.board.TbNoticeCompany;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface TbNoticeCompanyRepository extends JpaRepository<TbNoticeCompany, Long>, JpaSpecificationExecutor<TbNoticeCompany> {
    @Modifying(clearAutomatically = true)
    @Query(value = "UPDATE tb_notice_company SET data_status = '0' WHERE notice_no = :noticeNo" +
            "", nativeQuery = true)
    int deleteNotice(@Param("noticeNo") Long noticeNo);
}