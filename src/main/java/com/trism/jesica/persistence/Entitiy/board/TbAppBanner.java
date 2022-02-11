package com.trism.jesica.persistence.Entitiy.board;

import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.Data;

import javax.persistence.*;

@Data
@Entity
@Table(name = "tb_app_banner")
public class TbAppBanner extends BaseEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 배너_일련번호
     */
    @Id
    @Column(name = "banner_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer bannerNo;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus = null;

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

}
