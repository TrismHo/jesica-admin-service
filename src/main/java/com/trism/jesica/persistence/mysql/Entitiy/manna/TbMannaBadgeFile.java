package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;
import org.hibernate.annotations.Formula;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 뱃지 이미지 파일
 */
@Entity
@Table(name = "manna_badge_file")
@Data
public class TbMannaBadgeFile {

    private static final long serialVersionUID = 1L;

    /**
     * 뱃지 파일 번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "badge_file_no", nullable = false)
    private Long badgeFileNo;

    /**
     * 뱃지 타입
     * 1: 공통 뱃지
     * 2: 개별 뱃지
     */
    @Column(name = "badge_type", nullable = false)
    private Integer badgeType;

    /**
     * 기존 가맹점 코드
     *
     * manna_badge_st로 분리했다면 추후 제거 가능
     */
    @Column(name = "st_code", length = 30)
    private String stCode;

    /**
     * 원본 파일명
     */
    @Column(name = "original_file_name", nullable = false, length = 255)
    private String originalFileName;

    /**
     * 저장 파일명
     */
    @Column(name = "stored_file_name", nullable = false, length = 255)
    private String storedFileName;

    /**
     * 파일 경로
     */
    @Column(name = "file_path", nullable = false, length = 500)
    private String filePath;

    /**
     * 파일 접근 URL
     */
    @Column(name = "file_url", length = 500)
    private String fileUrl;

    /**
     * 파일 크기
     */
    @Column(name = "file_size")
    private Long fileSize;

    /**
     * 파일 확장자
     */
    @Column(name = "file_ext", length = 20)
    private String fileExt;

    /**
     * 사용중 여부
     * Y: 사용중
     * N: 미사용
     */
    @Column(name = "using_yn", nullable = false, length = 1)
    private String usingYn;

    /**
     * 데이터 상태
     * 0: 삭제
     * 1: 정상
     * 2: 정지
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus;

    /**
     * 해당 뱃지를 사용하는 가맹점 수
     *
     * 조회 전용 필드이며 manna_badge_file 컬럼은 아님
     */
    @Formula(
            "(select count(*) " +
                    " from manna_badge_st mbs " +
                    " where mbs.badge_file_no = badge_file_no)"
    )
    private Long badgeStCount;

    /**
     * 등록자 ID
     */
    @Column(name = "insert_user_id", length = 50)
    private String insertUserId;

    /**
     * 등록일시
     */
    @Column(name = "insert_date", insertable = false, updatable = false)
    private LocalDateTime insertDate;

    /**
     * 수정자 ID
     */
    @Column(name = "update_user_id", length = 50)
    private String updateUserId;

    /**
     * 수정일시
     */
    @Column(name = "update_date", insertable = false)
    private LocalDateTime updateDate;
}
