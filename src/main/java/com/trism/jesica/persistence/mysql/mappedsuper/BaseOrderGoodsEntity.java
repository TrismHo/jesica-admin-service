package com.trism.jesica.persistence.mysql.mappedsuper;

import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.type.GoodsType;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * 주문배달_상품
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseOrderGoodsEntity {

    /**
     * 주문 상품 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "order_goods_no", nullable = false)
    private Long orderGoodsNo;

    /**
     * 가맹점 상품 일련번호
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_goods_no", referencedColumnName = "store_goods_no")
    private TbStoreGoods storeGoods;

    /**
     * 가맹점 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", referencedColumnName = "store_no", nullable = false)
    private TbStore store;


    /**
     * 상품 이름
     */
    @Column(name = "goods_name", length = 100)
    private String goodsName;

    /**
     * 상품_가격 (개별가)
     */
    @Column(name = "goods_price")
    private Integer goodsPrice;

    /**
     * 상품 개수
     */
    @Column(name = "goods_cnt")
    private Integer goodsCnt;

    /**
     * 상품_구분 (1: 일반, 2: 무료상품, 3: 경품)
     */
    @Column(name = "goods_type")
    @Enumerated(EnumType.ORDINAL)
    private GoodsType goodsType;

    /**
     * 구매_가격 (옵션포함 전체가격)
     */
    @Column(name = "total_amt")
    private Integer totalAmt;

    /**
     * 과세_여부 (0: no, 1: yes)
     */
    @Column(name = "tax_yn")
    private Boolean taxYn;

    /**
     * 데이터_상태 (0: 삭제/취소, 1: 정상)
     */
    private Boolean dataStatus;
    /**
     * 기본옵션_아이템_번호
     */
    @Column(name = "basic_item_no")
    private Integer basicItemNo;

    /**
     * 기본옵션_상품_이름
     */
    @Column(name = "basic_item_name", length = 100)
    private String basicItemName;


    @PrePersist
    private void defaultInit() {
        this.goodsPrice = 0;
        this.goodsCnt = 1;
        this.goodsType = GoodsType.NORMAL;
        this.taxYn = false;
        this.dataStatus = true;
    }
}
