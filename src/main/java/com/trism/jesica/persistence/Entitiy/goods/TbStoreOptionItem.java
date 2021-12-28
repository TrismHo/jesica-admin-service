package com.trism.jesica.persistence.Entitiy.goods;

import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.id.TbStoreOptionItemID;
import com.trism.jesica.persistence.type.ItemStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 가맹점_상품옵션_항목
 */
@Entity
@Table(name = "tb_store_option_item")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbStoreOptionItemID.class)
public class TbStoreOptionItem extends CreatedDateEntity {
    @Id
    @Column(name = "store_opt_no")
    private Long storeOptNo;

    /**
     * 가맹점 옵션
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_opt_no",insertable = false, updatable = false, referencedColumnName = "store_opt_no")
    private TbStoreOption storeOption;

    /**
     * 옵션 아이템 번호 (1~N)
     */
    @Id
    @Column(name = "opt_item_no")
    private Integer optItemNo;

    /**
     * 정렬순서
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
     * 상품 이름
     */
    @Column(name = "item_name")
    private String itemName;

    /**
     * 상품가격
     */
    @Column(name = "item_price")
    private Integer itemPrice;

/*    @PrePersist
    private void defaultInit() {
        this.itemStatus = ItemStatus.STOP_SELLING;
    }*/

    @Builder
    public TbStoreOptionItem(Long storeOptNo, Integer optItemNo, Integer viewOrder, ItemStatus itemStatus, String itemName, Integer itemPrice) {
        this.storeOptNo = storeOptNo;
        this.optItemNo = optItemNo;
        this.viewOrder = viewOrder;
        this.itemStatus = itemStatus;
        this.itemName = itemName;
        this.itemPrice = itemPrice;
    }
}
