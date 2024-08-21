package com.trism.jesica.persistence.mysql.Entitiy.cust;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import lombok.*;
import lombok.experimental.Accessors;
import org.apache.commons.lang3.ObjectUtils;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 고객 장바구니 상품옵션
 */
@Entity
@Table(name = "tb_cust_basket_option")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Builder
@Getter
@ToString(exclude = {})
@EqualsAndHashCode
@DynamicInsert
@DynamicUpdate
public class TbCustBasketOption {
    /**
     * 장바구니 일련번호
     */
    @Id
    @Column(name = "basket_no")
    private Long basketNo;

    /**
     * 장바구니 (FK)
     */
    @MapsId
    @OneToOne(optional = false, cascade = {CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH})
    @JoinColumn(name = "basket_no", referencedColumnName = "basket_no")
    @JsonManagedReference
    private TbCustBasket basket;


    /**
     * 가맹점 옵션 일련번호
     */
    @Column(name = "store_opt_no")
    private Long storeOptNo;

    /**
     * 아이템번호 (1~N)
     */
    @Column(name = "item_no")
    private Integer itemNo;

    /**
     * 옵션_정렬_순서 (tb_store_goods_option)
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 옵션 명칭
     */
    @Column(name = "opt_name")
    private String optName;

    /**
     * 상품 이름
     */
    @Column(name = "item_name")
    private String itemName;

    /**
     * 상품 가격
     */
    @Column(name = "item_price")
    private Integer itemPrice;


    public void setBasket(TbCustBasket basket) {
        if (ObjectUtils.isNotEmpty(basket)) {
            this.basket = basket;
            setBasketNo(this.basket.getBasketNo());
        }
    }

    private void setBasketNo(Long basketNo) {
        this.basketNo = basketNo;
    }

    @Builder
    public TbCustBasketOption(Long basketNo, TbCustBasket basket, Long storeOptNo, Integer itemNo, Integer viewOrder, String optName, String itemName, Integer itemPrice) {
        this.basketNo = basketNo;
        this.basket = basket;
        this.storeOptNo = storeOptNo;
        this.itemNo = itemNo;
        this.viewOrder = viewOrder;
        this.optName = optName;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
        setBasket(basket);
    }
}
