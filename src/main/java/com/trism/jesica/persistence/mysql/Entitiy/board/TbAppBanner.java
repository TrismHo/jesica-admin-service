package com.trism.jesica.persistence.mysql.Entitiy.board;

import com.trism.jesica.config.EmptyStringToNullConverter;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "tb_app_banner")
@Accessors(chain = true)
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
@NoArgsConstructor(access = AccessLevel.PROTECTED)
public class TbAppBanner {

    private static final long serialVersionUID = 1L;

    /**
     * 배너_일련번호
     */
    @Id
    @Column(name = "banner_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long bannerNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = 1;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;

    /**
     * 노출여부 (0: 숨김, 1: 노출)
     */
    @Column(name = "view_yn")
    private Integer viewYn;

    /**
     * 등록_사용자_ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 노출서비스 (0: 메인, 2: 탁송, 3: 맛집, 4: 마트, 5: 맛집예약)
     */
    @Column(name = "service_type", nullable = false)
    private Integer serviceType;

    /**
     * 배너_노출순서 (서비스별 정렬순서)
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 배너_파일경로
     */
    @Column(name = "banner_file")
    private String bannerFile;

    /**
     * 게시판종류(1: 이벤트, 2: 공지)
     */
    @Column(name = "board_type")
    private Integer boardType;

    /**
     * 게시판PK
     */
    @Column(name = "board_no")
    private Long boardNo;

    /**
     * 플랫폼 타입(0. 사용안함, 1. 제시카, 2. 양파오더 ,3. 세날)
     */
    @Column(name = "platform_type", nullable = false)
    private Integer platformType = 0;

    /**
     * 노출방식(0. 전체(기본), 1. 주소)
     */
    @Column(name = "banner_type", nullable = false)
    private Integer bannerType = 0;

    /**
     * 적용 언어코드(sys_type=LANG)
     */
    @Column(name = "lang_code", nullable = false)
    private String langCode = "";

    /**
     * 앱스키마 URL
     */
    @Column(name = "scheme_url", nullable = false)
    private String schemeUrl = "";

    /**
     * 앱코드
     */
    @Column(name = "app_code")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String appCode;

    @Builder
    public TbAppBanner(
            Long bannerNo,
            String insertUserId,
            Integer platformType,
            Integer serviceType,
            Integer viewYn,
            Integer boardType,
            Integer viewOrder,
            Long boardNo,
            String bannerFile,
            Integer dataStatus,
            Integer bannerType,
            String langCode,
            String schemeUrl,
            String appCode
    ) {
        this.bannerNo = bannerNo;
        this.platformType = platformType;
        this.insertUserId = insertUserId;
        this.serviceType = serviceType;
        this.viewYn = viewYn;
        this.boardType = boardType;
        this.viewOrder = viewOrder;
        this.boardNo = boardNo;
        this.bannerFile = bannerFile;
        this.dataStatus = dataStatus;
        this.bannerType = bannerType;
        this.langCode = langCode;
        this.schemeUrl = schemeUrl;
        this.appCode = appCode;
    }

    public void updateDisabledTbAppBanner() {
        this.dataStatus = 0;
    }
}
