package com.trism.jesica.persistence.Entitiy.manna;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

/**
 * 만나_양파_주문내역
 */
@Getter
@Setter
@EqualsAndHashCode // 필수
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "manna_order_goods")
public class TbMannaOrderGoodsOpt {
    private static final long serialVersionUID = 1L;

    /**
     * 주문번호
     */
    @Id
    @Column(name = "ord_no", insertable = false, nullable = false)
    private Long ordNo;

    /**
     * 상품주문 seq
     */
    @Column(name = "ord_goods_seq", nullable = false)
    private Long ordGoodsSeq = null;

    /**
     * 만나주문 추가상품 seq
     */
    @Column(name = "opt_goods_seq", nullable = false)
    private Long optGoodsSeq = null;

    /**
     * 만나주문_추가_상품옵션_일련번호
     */
    @Column(name = "ord_goods_no", nullable = false)
    private Long optGoodsNo = null;

    /**
     * 상품이름
     */
    @Column(name = "opt_goods_name")
    private String optGoodsName = null;

    /**
     * 주문_상품개수(추가상품은 상품개수)
     */
    @Column(name = "opt_goods_cnt")
    private Integer optGoodsCnt = null;


    /**
     * 상품 주문 가격
     */
    @Column(name = "opt_goods_price")
    private Long optGoodsPrice = null;


}
