package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 이벤트 알림 발송관리
 */
@Entity
@Table(name = "manna_event_push")
@Data
public class TbMannaEventPush  {
    private static final long serialVersionUID = 1L;

    /**
     * 발송로그 일련번호(ext)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "log_no", insertable = false, nullable = false)
    private Long logNo;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    private LocalDateTime insertDate;

    /**
     * 이벤트_일련번호(ext)
     */
    @Column(name = "evnt_seq_no", nullable = false)
    private Long evntSeqNo = null;

    /**
     * 그룹_코드(ext)
     */
    @Column(name = "gr_code", nullable = false)
    private String grCode = null;


    /**
     * 그룹_명
     */
    @Column(name = "gr_name", nullable = false)
    private String grName = null;

    /**
     * 발송대상(1:내가게 픽한회원, 2:내가게 주문회원, 3:우리동네 픽한회원)
     */
    @Column(name = "param1")
    private String param1 = null;

    /**
     * 발송대상 주문건수
     */
    @Column(name = "param2")
    private String param2 = null;

    /**
     * 공유가게리스트
     */
    @Column(name = "param3")
    private String param3 = null;

    /**
     * 발송건수
     */
    @Column(name = "send_cnt")
    private Integer sendCnt = null;

    /**
     * 이벤트_시작일
     */
    @Column(name = "ev_start_date")
    private LocalDateTime evStartDate = null;

    /**
     * 이벤트_종료일
     */
    @Column(name = "ev_end_date")
    private LocalDateTime evEndDate = null;

    /**
     * 이벤트_제목
     */
    @Column(name = "ev_title")
    private String evTitle = null;

    /**
     * 이벤트_할인(1:정액, 2:정률, 3:횟수제한정액, 4:횟수제한정률)
     */
    @Column(name = "ev_type")
    private String evType = null;

    /**
     * 이벤트_할인금액(원/%)
     */
    @Column(name = "ev_price")
    private String evPrice = null;

    /**
     * 이벤트_할인금액_최대
     */
    @Column(name = "ev_price_max")
    private String evPriceMax = null;

    /**
     * 이벤트_주문_구분(1:배달, 2:포장, 3:대기, 4:예약, 5:테이블)
     */
    @Column(name = "ev_ord_type")
    private String evOrdType = null;

    /**
     * 이벤트_배달_구분(1:0원배달, 2:0순위배달)
     */
    @Column(name = "ev_dvry_type")
    private String evDvryType = null;

    /**
     * 브랜드 타입
     */
    @Column(name = "brand_type_cd")
    private String brandTypeCd = null;

    @Transient
    private String appName = null;


  /*  @Column(name = "app_code")
    private String appCode = null;
    @Transient
    private String appName = null;*/


}
