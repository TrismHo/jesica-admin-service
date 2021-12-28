package com.trism.jesica.persistence.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.id.TbStoreGoodsOptionID;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 가맹점_상품별_옵션연결
 */
@Entity
@IdClass(TbStoreGoodsOptionID.class)
@Table(name = "tb_store_goods_option")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbStoreGoodsOption extends CreatedDateEntity {


    /**
     * 가맹점 상품 일련번호
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_goods_no", referencedColumnName = "store_goods_no")
    @JsonManagedReference
    private TbStoreGoods storeGoods;

    /**
     * 가맹점 옵션 일련번호
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_opt_no", referencedColumnName = "store_opt_no")
    @JsonManagedReference
    private TbStoreOption storeOption;


    /**
     * 정렬순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

}
