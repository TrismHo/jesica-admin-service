package com.trism.jesica.persistence.mappedsuper;

import com.trism.jesica.persistence.Entitiy.goods.TbStoreOption;
import com.trism.jesica.persistence.id.TbOrderGoodsOptionID;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;

/**
 * 주문배달 상품옵션
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString
@EqualsAndHashCode
@AllArgsConstructor
@MappedSuperclass
@IdClass(TbOrderGoodsOptionID.class)
public class BaseOrderGoodsOptionEntity {
    /**
     * 주문_상품_일련번호
     */
    @Id
    @Column(name = "order_goods_no", nullable = false)
    private Long orderGoodsNo;

    /**
     * 가맹점_옵션_일련번호
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_opt_no", referencedColumnName = "store_opt_no", nullable = false)
    private TbStoreOption storeOption;


    /**
     * 옵션_아이템_번호(1~N)
     */
    @Id
    @Column(name = "opt_item_no", nullable = false)
    private Integer optItemNo;


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
}
