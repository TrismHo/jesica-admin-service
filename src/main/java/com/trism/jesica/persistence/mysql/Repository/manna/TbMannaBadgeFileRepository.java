package com.trism.jesica.persistence.mysql.Repository.manna;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeFile;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

public interface TbMannaBadgeFileRepository extends JpaRepository<TbMannaBadgeFile, Long> {

    /**
     * 뱃지 타입별 목록 조회
     * badgeType
     * 1: 공통 뱃지
     * 2: 개별 뱃지
     */
    List<TbMannaBadgeFile> findByBadgeTypeAndDataStatusOrderByInsertDateDesc(
            Integer badgeType,
            Integer dataStatus
    );

    /**
     * 사용 가능한 뱃지 목록 조회
     * 공통/개별 구분해서 사용 가능 목록 조회할 때 사용
     */
    List<TbMannaBadgeFile> findByBadgeTypeAndUsingYnAndDataStatusOrderByInsertDateDesc(
            Integer badgeType,
            String usingYn,
            Integer dataStatus
    );

    /**
     * 가맹점 코드로 개별 뱃지 조회
     */
    List<TbMannaBadgeFile> findByStCodeAndDataStatusOrderByInsertDateDesc(
            String stCode,
            Integer dataStatus
    );

    /**
     * 가맹점 코드 + 사용중 여부로 조회
     */
    List<TbMannaBadgeFile> findByStCodeAndUsingYnAndDataStatusOrderByInsertDateDesc(
            String stCode,
            String usingYn,
            Integer dataStatus
    );

    /**
     * 특정 뱃지 사용 여부 확인
     */
    Optional<TbMannaBadgeFile> findByBadgeFileNoAndDataStatus(
            Long badgeFileNo,
            Integer dataStatus
    );

    /**
     * 개별 뱃지 중 이미 사용중인지 확인
     */
    boolean existsByBadgeFileNoAndBadgeTypeAndUsingYnAndDataStatus(
            Long badgeFileNo,
            Integer badgeType,
            String usingYn,
            Integer dataStatus
    );

    /**
     * 가맹점에 사용중인 개별 뱃지가 있는지 확인
     */
    boolean existsByStCodeAndBadgeTypeAndUsingYnAndDataStatus(
            String stCode,
            Integer badgeType,
            String usingYn,
            Integer dataStatus
    );


    @Query("select b " +
            "from TbMannaBadgeFile b " +
            "where (:badgeType is null or b.badgeType = :badgeType) " +
            "and b.dataStatus <> 0 " +
            "and (:usingYn is null or b.usingYn = :usingYn) " +
            "and (:dataStatus is null or b.dataStatus = :dataStatus) " +
            "and (:stCode is null or exists (" +
            "    select 1 " +
            "    from TbMannaBadgeSt s " +
            "    where s.badgeFileNo = b.badgeFileNo " +
            "    and s.stCode like concat('%', :stCode, '%')" +
            ")) " +
            "and (:originalFileName is null or b.originalFileName like concat('%', :originalFileName, '%')) " +
            "and (:startDate is null or b.insertDate >= :startDate) " +
            "and (:endDate is null or b.insertDate <= :endDate)")
    Page<TbMannaBadgeFile> getBadgeFilePageList(
            @Param("badgeType") Integer badgeType,
            @Param("usingYn") String usingYn,
            @Param("dataStatus") Integer dataStatus,
            @Param("stCode") String stCode,
            @Param("originalFileName") String originalFileName,
            @Param("startDate") LocalDateTime startDate,
            @Param("endDate") LocalDateTime endDate,
            Pageable pageable
    );

    @Modifying(clearAutomatically = true, flushAutomatically = true)
    @Query("update TbMannaBadgeFile b " +
            "set b.dataStatus = 0 " +
            "where b.badgeFileNo = :badgeFileNo " +
            "and b.dataStatus <> 0")
    int deleteBadgeFile(
            @Param("badgeFileNo") Long badgeFileNo
    );
}
