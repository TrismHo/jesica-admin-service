package com.trism.jesica.persistence.mysql.Entitiy.manna;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCust;
import lombok.Data;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;

import javax.persistence.*;
import java.math.BigDecimal;
import java.time.LocalDateTime;

/**
 * 만나오더
 */
@Entity
@Table(name = "manna_order")
@Data
public class TbMannaOrder  {
    private static final long serialVersionUID = 1L;

    /**
     * 주문번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "ord_no", insertable = false, nullable = false)
    private Long ordNo;

    /**
     * 회원번호
     */
    @JsonIgnore
    @ManyToOne(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "uid",  referencedColumnName = "cust_no",  nullable = true)
    private TbCust tbCust;

    /**
     * 회원번호
     */
/*    @Column(name = "uid", nullable = false)
    private String uid = null;*/


    /**
     * 주문날짜
     */
    @Column(name = "ord_date", nullable = false)
    private LocalDateTime ordDate = null;

    /**
     * 주문경로(1063:제시카, 1069:양파오더 , 1070:세날, 온동네: 1105)
     */
    @Column(name = "ord_path_cd", nullable = false)
    private String ordPathCd = null;


    /**
     * 삭제여부(0:삭제, 1: 정상)
     */
    @Column(name = "data_status", nullable = false)
    private Integer dataStatus = null;

    /**
     * 주문 가맹점 코드
     */
    @Column(name = "ord_st_code")
    private String ordStCode = null;

    /**
     * 주문 가맹점 코드
     */
    @Column(name = "goods_name")
    private String goodsName = null;

    /**
     * 가맹점 이름
     */
    @Column(name = "st_name")
    private String stName = null;

    /**
     * 쿠폰할인 금액
     */
    @Column(name = "ord_amt")
    private Long ordAmt = null;

    /**
     * 쿠폰할인 금액
     */
    @Column(name = "coupon_amt")
    private Long couponAmt = null;

    /**
     * 이벤트 할인
     */
    @Column(name = "event_amt")
    private Long eventAmt = null;

    /**
     * 지불금액
     */
    @Column(name = "pay_amt")
    private Long payAmt = null;

    /**
     * 주문_상태 (1: 배달접수, 2: 배차, 3: 출발, 4: 완료, 5: 취소, 6: 대기, 7: 대기예약, 8: 입장요청)
     */
    @Column(name = "ord_status")
    private Integer ordStatus = null;

    /**
     * 배달_서비스_구분 ( 1: 일반배달, 2: 빠른배달)
     */
    @Column(name = "dvry_service_type")
    private String dvryServiceType = null;

    /**
     * 고객 연락처
     */
    @Column(name = "ord_cu_tel")
    private String ordCuTel = null;

    /**
     * 주문_구분 (1: 배달, 2: 포장, 3: 대기, 4: 예약)
     */
    @Column(name = "ord_type")
    private String ordType = null;

    /**
     * 가맹점 전화번호
     */
    @Column(name = "st_tel")
    private String stTel = null;

    /**
     * 주문확인(0: 미확인, 1:; 확인, 9: 무관)
     */
    @Column(name = "ord_confirm_type")
    private String ordConfirmType = null;

    /**
     * 취소사유
     */
    @Column(name = "cancel_memo")
    private String cancelMemo = null;

    /**
     * 가맹점 이미지
     */
    @Column(name = "st_image")
    private String stImage = null;

    /**
     * 포장_예정시간(매장방문시간)
     */
    @Column(name = "takeout_date")
    private String takeoutDate = null;

    /**
     * 테이블_구분(0.해당없음, 1.테이블, 2.KIOSK)
     */
    @Column(name = "table_type")
    private String tableType = null;

    /**
     * 테이블번호(0: 알수없음)
     */
    @Column(name = "table_no")
    private Long tableNo = null;

    /**
     * 성인
     */
    @Column(name = "adult_cnt")
    private Long adultCnt = null;

    /**
     * 유아
     */
    @Column(name = "child_cnt")
    private Long childCnt = null;

    /**
     * 가맹점별 대기 순번
     */
    @Column(name = "ord_st_wait_no")
    private Long ordStWaitNo = null;

    /**
     * 예약일시
     */
    @Column(name = "resv_date")
    private LocalDateTime resvDate = null;

    /**
     * 최종수정_일시
     */
    @Column(name = "mod_date")
    private LocalDateTime modDate = null;

    /**
     * 배차_일시
     */
    @Column(name = "cth_date")
    private LocalDateTime cthDate = null;

    /**
     * 출발일시
     */
    @Column(name = "pickup_date")
    private LocalDateTime pickupDate = null;

    /**
     * 완료_일시
     */
    @Column(name = "end_date")
    private LocalDateTime endDate = null;

    /**
     * 취소_일시
     */
    @Column(name = "cancel_date")
    private LocalDateTime cancelDate = null;

    /**
     *  배차 배송원이름
     */
    @Column(name = "cth_wk_name")
    private String cthWkName = null;

    /**
     * 배차_배송원_전화번호
     */
    @Column(name = "cth_wk_tel")
    private String cthWkTel = null;

    /**
     * 봉사료 금액
     */
    @Column(name = "srv_amt")
    private Long srvAmt = null;

    /**
     * 도착_주소_4(지번_전체주소)
     */
    @Column(name = "ea_addr_4")
    private String eaAddr4 = null;

    /**
     * 도착_주소_5(상세주소)
     */
    @Column(name = "ea_addr_5")
    private String eaAddr5 = null;

    /**
     * 도착_주소_6(도로명_전체주소)
     */
    @Column(name = "ea_addr_6")
    private String eaAddr6 = null;


    /**
     * 도착_위도_좌표_(Y좌표, LATITUDE)
     */
    @Column(name = "ea_lat_Y")
    private String eaLatY = null;

    /**
     * 도착_경도_좌표_(X좌표, LONGITUDE)
     */
    @Column(name = "ea_lng_x")
    private String eaLngX = null;

    /**
     * 배달거리
     */
    @Column(name = "dvry_distance")
    private BigDecimal dvryDistance = null;

    /**
     * 고객 요청사항
     */
    @Column(name = "ord_cu_st_memo")
    private String ordCuStMemo = null;

    /**
     * 배달 요청사항
     */
    @Column(name = "ord_cu_wk_memo")
    private String ordCuWkMemo = null;

    /**
     * 주문 고객명
     */
    @Column(name = "ord_cu_name")
    private String ordCuName = null;

    /**
     * 누적주문횟수
     */
    @Column(name = "total_use_count")
    private String totalUseCount = null;


    /**
     * 총판코드
     */
    @Column(name = "br_code")
    private String brCode = null;

    /**
     * 마스터 가맹점코드
     */
    @Column(name = "master_st_code")
    private String masterStCode = null;

    /**
     * 예상소요시간
     */
    @Column(name = "arr_time")
    private Long arrTime = null;
    /**
     * 추천인 일련번호
     */
    @Column(name = "recomm_cust_no")
    private Long recommCustNo = null;
    /**
     * 추천 리워드 지급상태
     */
    @Column(name = "recomm_reward_status")
    private Integer recommRewardStatus = null;
    /**
     * 추천 리워드 지급액
     */
    @Column(name = "recomm_reward_amt")
    private Long recommRewardAmt = null;
    /**
     * 쿠폰 번호
     */
    @Column(name = "ext_coupon_no")
    private Long extCouponNo = null;
    /**
     * 쿠폰 제목
     */
    @Column(name = "coupon_title")
    private String couponTitle = null;

    /**
     * 포인트 사용금액
     */
    @Column(name = "point_use_amt")
    private Long pointUseAmt = null;

    /**
     * 결제타입(1 후결제 ,1 선결제)
     */
    @Column(name = "charge_type")
    private String chargeType = null;

    /**
     * 결제수단(1 현금 ,2 카드)
     */
    @Column(name = "pay_type")
    private String payType = null;

    /**
     * 브랜드 타입( tb_system_code , AC , code_value)
     */
    @Column(name = "brand_type_cd")
    private String brandTypeCd = null;


    @Transient
    private String extBrCode = null;
    @Transient
    private String extMasterStCode = null;
    @Transient
    private String extRecommStCode = null;

}
