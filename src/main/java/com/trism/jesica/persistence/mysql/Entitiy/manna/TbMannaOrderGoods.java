package com.trism.jesica.persistence.mysql.Entitiy.manna;

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
public class TbMannaOrderGoods {
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
     * 만나주문_상품옵션_일련번호
     */
    @Column(name = "ord_goods_no", nullable = false)
    private Long ordGoodsNo = null;

    /**
     * 상품이름
     */
    @Column(name = "goods_name")
    private String goodsName = null;

    /**
     * 주문_상품개수(추가상품은 상품개수)
     */
    @Column(name = "ord_cnt")
    private Integer ordCnt = null;


    /**
     * 상품 주문 가격
     */
    @Column(name = "ord_price")
    private Long ordPrice = null;

    /**
     * 옵션_1_이름
     */
    @Column(name = "option_1_name")
    private String option1Name = null;

    /**
     * 옵션_2_이름
     */
    @Column(name = "option_2_name")
    private String option2Name = null;

    /**
     * 옵션_3_이름
     */
    @Column(name = "option_3_name")
    private String option3Name = null;

    /**
     * 옵션_4_이름
     */
    @Column(name = "option_4_name")
    private String option4Name = null;

    /**
     * 옵션_1_가격
     */
    @Column(name = "option_1_price")
    private Integer option1Price = null;

    /**
     * 옵션_2_가격
     */
    @Column(name = "option_2_price")
    private Integer option2Price = null;

    /**
     * 옵션_3_가격
     */
    @Column(name = "option_3_price")
    private Integer option3Price = null;

    /**
     * 옵션_4_가격
     */
    @Column(name = "option_4_price")
    private Integer option4Price = null;

}
