package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaqCategory;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TbMannaFaqCategoryRepository
        extends JpaRepository<TbMannaFaqCategory, Long> {

    /**
     * 정상 카테고리 전체 조회
     */
    List<TbMannaFaqCategory>
    findByDataStatusOrderByFaqCategoryNoAsc(
            Integer dataStatus
    );

    /**
     * 사용 여부와 데이터 상태 기준 카테고리 조회
     */
    List<TbMannaFaqCategory>
    findByUseYnAndDataStatusOrderByFaqCategoryNoAsc(
            String useYn,
            Integer dataStatus
    );

    /**
     * 카테고리 상세 조회
     */
    Optional<TbMannaFaqCategory>
    findByFaqCategoryNoAndDataStatus(
            Long faqCategoryNo,
            Integer dataStatus
    );

    /**
     * 카테고리 존재 여부
     */
    boolean existsByFaqCategoryNoAndDataStatus(
            Long faqCategoryNo,
            Integer dataStatus
    );

    /**
     * 동일한 카테고리명 존재 여부
     */
    boolean existsByFaqCategoryNameAndDataStatus(
            String faqCategoryName,
            Integer dataStatus
    );

    /**
     * 자신의 카테고리 번호를 제외하고 동일한 이름이 존재하는지 확인
     */
    boolean existsByFaqCategoryNameAndDataStatusAndFaqCategoryNoNot(
            String faqCategoryName,
            Integer dataStatus,
            Long faqCategoryNo
    );

/*    *//**
     * 마지막 노출 순서 조회
     *//*
    @Query(
            "select coalesce(max(c.displayOrder), 0) " +
                    "from TbMannaFaqCategory c " +
                    "where c.dataStatus = 1"
    )
    Integer findMaxDisplayOrder();*/

    /**
     * 카테고리 순서 변경
     */
  /*  @Modifying(
            clearAutomatically = true,
            flushAutomatically = true
    )
    @Query(
            "update TbMannaFaqCategory c " +
                    "set c.displayOrder = :displayOrder, " +
                    "    c.updateId = :updateId, " +
                    "    c.updateDate = current_timestamp " +
                    "where c.faqCategoryNo = :faqCategoryNo " +
                    "and c.dataStatus = 1"
    )
    int updateDisplayOrder(
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("displayOrder") Integer displayOrder,
            @Param("updateId") String updateId
    );
*/
    /**
     * 카테고리 수정
     */
    @Modifying(
            clearAutomatically = true,
            flushAutomatically = true
    )
    @Query(
            "update TbMannaFaqCategory c " +
                    "set c.faqCategoryName = :faqCategoryName, " +
                    "    c.useYn = :useYn, " +
                    "    c.updateId = :updateId, " +
                    "    c.updateDate = current_timestamp " +
                    "where c.faqCategoryNo = :faqCategoryNo " +
                    "and c.dataStatus = 1"
    )
    int updateCategory(
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("faqCategoryName") String faqCategoryName,
            @Param("useYn") String useYn,
            @Param("updateId") String updateId
    );



    /**
     * 카테고리 논리 삭제
     */
    @Modifying(
            clearAutomatically = true,
            flushAutomatically = true
    )
    @Query(
            "update TbMannaFaqCategory c " +
                    "set c.dataStatus = 0, " +
                    "    c.updateId = :updateId, " +
                    "    c.updateDate = current_timestamp " +
                    "where c.faqCategoryNo = :faqCategoryNo " +
                    "and c.dataStatus = 1"
    )
    int softDeleteCategory(
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("updateId") String updateId
    );
}
