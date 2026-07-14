package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaq;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;
import java.util.Optional;

@Repository
public interface TbMannaFaqRepository
        extends JpaRepository<TbMannaFaq, Long> {

    /**
     * FAQ 목록 조회
     */
    @Query(
            "select f " +
                    "from TbMannaFaq f " +
                    "where f.dataStatus = 1 " +
                    "and (:faqCategoryNo is null " +
                    "     or f.faqCategoryNo = :faqCategoryNo) " +
                    "and (:useYn is null " +
                    "     or :useYn = '' " +
                    "     or f.useYn = :useYn) " +
                    "and (:keyword is null " +
                    "     or :keyword = '' " +
                    "     or f.faqQ like concat('%', :keyword, '%') " +
                    "     or f.faqA like concat('%', :keyword, '%')) " +
                    "order by f.displayOrder asc, f.faqNo asc"
    )
    List<TbMannaFaq> getFaqList(
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("useYn") String useYn,
            @Param("keyword") String keyword
    );

    /**
     * 정상 FAQ 전체 목록 조회
     */
    List<TbMannaFaq> findByDataStatusOrderByDisplayOrderAscFaqNoAsc(
            Integer dataStatus
    );

    /**
     * FAQ 상세 조회
     */
    Optional<TbMannaFaq> findByFaqNoAndDataStatus(
            Long faqNo,
            Integer dataStatus
    );

    /**
     * 카테고리별 FAQ 목록 조회
     */
    List<TbMannaFaq>
    findByFaqCategoryNoAndDataStatusOrderByDisplayOrderAscFaqNoAsc(
            Long faqCategoryNo,
            Integer dataStatus
    );

    /**
     * 카테고리에 연결된 FAQ 개수
     */
    long countByFaqCategoryNoAndDataStatus(
            Long faqCategoryNo,
            Integer dataStatus
    );

    /**
     * 해당 카테고리의 최대 노출 순서
     */
    @Query(
            "select coalesce(max(f.displayOrder), 0) " +
                    "from TbMannaFaq f " +
                    "where f.faqCategoryNo = :faqCategoryNo " +
                    "and f.dataStatus = 1"
    )
    Integer findMaxDisplayOrderByFaqCategoryNo(
            @Param("faqCategoryNo") Long faqCategoryNo
    );
    @Query(
            "select f " +
                    "from TbMannaFaq f " +
                    "where f.dataStatus = 1 " +
                    "and f.useYn = 'Y' " +
                    "and (:faqCategoryNo is null " +
                    "     or f.faqCategoryNo = :faqCategoryNo) " +
                    "and (:keyword is null " +
                    "     or :keyword = '' " +
                    "     or lower(f.faqQ) like lower(concat('%', :keyword, '%')) " +
                    "     or lower(f.faqA) like lower(concat('%', :keyword, '%'))) " +
                    "order by f.displayOrder asc, f.faqNo asc"
    )
    List<TbMannaFaq> getMobileFaqList(
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("keyword") String keyword
    );

    /**
     * 모바일 FAQ 상세 조회
     */
    Optional<TbMannaFaq>
    findByFaqNoAndUseYnAndDataStatus(
            Long faqNo,
            String useYn,
            Integer dataStatus
    );

    /**
     * 사용 중인 FAQ 카테고리별 개수
     */
    long countByFaqCategoryNoAndUseYnAndDataStatus(
            Long faqCategoryNo,
            String useYn,
            Integer dataStatus
    );
    /**
     * FAQ 노출 순서 수정
     */
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(
            "update TbMannaFaq f " +
                    "set f.displayOrder = :displayOrder, " +
                    "    f.updateId = :updateId, " +
                    "    f.updateDate = current_timestamp " +
                    "where f.faqNo = :faqNo " +
                    "and f.dataStatus = 1"
    )
    int updateDisplayOrder(
            @Param("faqNo") Long faqNo,
            @Param("displayOrder") Integer displayOrder,
            @Param("updateId") String updateId
    );

    /**
     * FAQ 수정
     */
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(
            "update TbMannaFaq f " +
                    "set f.faqCategoryNo = :faqCategoryNo, " +
                    "    f.faqQ = :faqQ, " +
                    "    f.faqA = :faqA, " +
                    "    f.useYn = :useYn, " +
                    "    f.displayOrder = :displayOrder, " +
                    "    f.updateId = :updateId, " +
                    "    f.updateDate = current_timestamp " +
                    "where f.faqNo = :faqNo " +
                    "and f.dataStatus = 1"
    )
    int update(
            @Param("faqNo") Long faqNo,
            @Param("faqCategoryNo") Long faqCategoryNo,
            @Param("faqQ") String faqQ,
            @Param("faqA") String faqA,
            @Param("useYn") String useYn,
            @Param("displayOrder") Integer displayOrder,
            @Param("updateId") String updateId
    );

    /**
     * FAQ 논리 삭제
     */
    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query(
            "update TbMannaFaq f " +
                    "set f.dataStatus = 0, " +
                    "    f.updateId = :updateId, " +
                    "    f.updateDate = current_timestamp " +
                    "where f.faqNo = :faqNo " +
                    "and f.dataStatus = 1"
    )
    int softDeleteFaq(
            @Param("faqNo") Long faqNo,
            @Param("updateId") String updateId
    );
}
