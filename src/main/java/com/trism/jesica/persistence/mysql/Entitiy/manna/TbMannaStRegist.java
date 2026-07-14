package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

/**
 * 만나 가맹점 등록정보
 */
@Entity
@Table(name = "manna_st_regist")
@Data
public class TbMannaStRegist {
    private static final long serialVersionUID = 1L;

    /**
     * 가맹점코드(PK)
     */
    @Id
    @Column(name = "st_code", length = 10, nullable = false)
    private String stCode;

    /**
     * 가맹점명
     */
    @Column(name = "st_name", length = 60)
    private String stName;

    /**
     * 총판코드
     */
    @Column(name = "br_code", length = 10)
    private String brCode;

    /**
     * 총판명
     */
    @Column(name = "br_name", length = 60)
    private String brName;

    /**
     * 등록일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 수정일시
     */
    @Column(name = "update_date")
    private LocalDateTime updateDate;

    /**
     * 배민사용여부(Y/N)
     */
    @Column(name = "baemin_yn", length = 1)
    private String baeminYn;

    /**
     * 쿠팡사용여부(Y/N)
     */
    @Column(name = "coupang_yn", length = 1)
    private String coupangYn;

    /**
     * 요기요사용여부(Y/N)
     */
    @Column(name = "yogiyo_yn", length = 1)
    private String yogiyoYn;

    /**직거래 사용여부(Y/N)
     */
    @Column(name = "directsale_yn", length = 1)
    private String directsaleYn;

    /**
     * 배민사이트계정
     */
    @Column(name = "baemin_id", length = 20)
    private String baeminId;

    /**
     * 배민사이트비번
     */
    @Column(name = "baemin_pwd", length = 100)
    private String baeminPwd;

    /**
     * 크롤링 타입(0:없음, 1:배민, 2:쿠팡, 3:요기요)
     */
    @Column(name = "crawling_type")
    private String crawlingType;

    /**
     * 크롤링 상품수
     */
    @Column(name = "crawling_cnt")
    private Integer crawlingCnt;

    /**
     * 마지막 크롤링 시간
     */
    @Column(name = "crawling_date")
    private LocalDateTime crawlingDate;
}
