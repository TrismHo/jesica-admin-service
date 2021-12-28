package com.trism.jesica.persistence.Entitiy.goods;

import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.type.ItemStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 가맹점_상품_기본옵션_아이템
 */
@Entity
@Table(name = "tb_store_goods_item")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbStoreGoodsItemId.class)
public class TbStoreGoodsItem extends CreatedDateEntity {

    /**
     * 가맹점_상품_일련번호
     */
    @Id
    @Column(name = "store_goods_no")
    private Long storeGoodsNo;


    /**
     * 가맹점상품(FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_goods_no",insertable = false, updatable = false, referencedColumnName = "store_goods_no")
    private TbStoreGoods storeGoods;

    /**
     * 기본옵션_아이템_번호 (1~N)
     */
    @Id
    @Column(name = "basic_item_no")
    private Integer basicItemNo;

    /**
     * 정렬_순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 상품_상태 (0: 판매중지, 1: 판매중, 2: 품절)
     */
    @Column(name = "item_status")
    @Enumerated(EnumType.ORDINAL)
    private ItemStatus itemStatus;

    /**
     * 상품_이름
     */
    @Column(name = "item_name")
    private String itemName;

    /**
     * 상품 가격
     */
    @Column(name = "item_price")
    private Integer itemPrice;

    @Builder
    private TbStoreGoodsItem(
             Long storeGoodsNo,
             Integer basicItemNo,
             Integer viewOrder,
             ItemStatus itemStatus,
             String itemName,
             Integer itemPrice
    ) {
        this.storeGoodsNo = storeGoodsNo;
        this.basicItemNo = basicItemNo;
        this.viewOrder = viewOrder;
        this.itemStatus = itemStatus;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
    }


}
