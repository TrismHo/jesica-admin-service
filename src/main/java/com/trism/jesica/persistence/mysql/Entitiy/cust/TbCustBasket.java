package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 고객_장바구니
 */
@Entity
@Table(name = "tb_cust_basket")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCustBasket extends CreatedDateEntity {
    /**
     * 장바구니 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "basket_no")
    private Long basketNo;

    /**
     * 고객(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no", referencedColumnName = "cust_no", nullable = false)
    @JsonManagedReference
    private TbCust cust;

    /**
     * 스토어(FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", referencedColumnName = "store_no", nullable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 상품 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_goods_no", referencedColumnName = "store_goods_no", nullable = false)
    @JsonManagedReference
    private TbStoreGoods storeGoods;


    /**
     * 고객 장바구니 상품옵션(양방향)
     */
    @OneToOne(fetch = FetchType.EAGER, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JsonManagedReference
    private TbCustBasketOption basketOption;


    /**
     * 만료 일시
     */
    @Column(name = "expire_date")
    private LocalDateTime expireDate;

    /**
     * 데이터 상태(0:삭제, 1:정상)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 상품명
     */
    @Column(name = "goods_name")
    private String goodsName;

    /**
     * 상품가격
     */
    @Column(name = "goods_price")
    private Integer goodsPrice;

    /**
     * 상품 개수
     */
    @Column(name = "goods_cnt")
    private Integer goodsCnt;

    /**
     * 기본 옵션 아이템 번호(1~N)
     */
    @Column(name = "basic_item_no")
    private Integer basicItemNo;

    /**
     * 기본옵션 상품 이름
     */
    @Column(name = "basic_item_name")
    private String basicItemName;

    /**
     * 전체가격(옵션 포함)
     */
    @Column(name = "total_amt")
    private Integer totalAmt;

    /**
     * 과세여부 (0: no, 1:yes)
     */
    @Column(name = "tax_yn")
    private Boolean taxYn;




     @Builder
    public TbCustBasket(Long basketNo, TbCust cust, TbStore store, TbStoreGoods storeGoods, TbCustBasketOption basketOption, LocalDateTime expireDate, DataStatus dataStatus, String goodsName, Integer goodsPrice, Integer goodsCnt, Integer basicItemNo, String basicItemName, Integer totalAmt, Boolean taxYn) {
        this.basketNo = basketNo;
        this.cust = cust;
        this.store = store;
        this.storeGoods = storeGoods;
        this.basketOption = basketOption;
        this.expireDate = expireDate;
        this.dataStatus = dataStatus;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsCnt = goodsCnt;
        this.basicItemNo = basicItemNo;
        this.basicItemName = basicItemName;
        this.totalAmt = totalAmt;
        this.taxYn = taxYn;
         if (ObjectUtils.isNotEmpty(basketOption)) {
             this.basketOption = basketOption;
             this.basketOption.setBasket(this);
         }
    }
}
