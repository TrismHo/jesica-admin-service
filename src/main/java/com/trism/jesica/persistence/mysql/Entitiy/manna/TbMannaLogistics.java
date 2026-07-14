package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 택배 발송 정보
 */
@Entity
@Table(name = "manna_logistics")
@Data
public class TbMannaLogistics {
    private static final long serialVersionUID = 1L;

    /**
     * 택배발송_순번
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "logistics_no", nullable = false)
    private Long logisticsNo;

    /**
     * 주문_번호
     */
    @Column(name = "ord_no", nullable = false)
    private Long ordNo;

    /**
     * 상품_번호
     */
    @Column(name = "ord_goods_no")
    private Long ordGoodsNo;

    /**
     * 택배사_코드
     */
    @Column(name = "courier_code", length = 10)
    private String courierCode;

    /**
     * 택배사_이름
     */
    @Column(name = "courier_name", length = 20)
    private String courierName;

    /**
     * 송장_번호
     */
    @Column(name = "tracking_num", length = 20)
    private String trackingNum;

    /**
     * 마지막_배송상태
     */
    @Column(name = "status_code", length = 10)
    private String statusCode;

    /**
     * 등록일시
     */
    @Column(name = "put_date", insertable = false, updatable = false)
    private LocalDateTime putDate;

    /**
     * 상태변경일시
     */
    @Column(name = "mod_date")
    private LocalDateTime modDate;

    /**
     * 배송완료일시
     */
    @Column(name = "end_date")
    private LocalDateTime endDate;

    /**
     * 발송자_이름
     */
    @Column(name = "sender_name", length = 40)
    private String senderName;

    /**
     * 수신자_이름
     */
    @Column(name = "receiver_name", length = 40)
    private String receiverName;

    /**
     * 상품명
     */
    @Column(name = "product_name", length = 40)
    private String productName;


    @OneToMany(fetch = FetchType.LAZY)
    @JoinColumn(name = "logistics_no", referencedColumnName = "logistics_no", insertable = false, updatable = false)
    private List<TbMannaLogisticsHistory> historyList;
}
