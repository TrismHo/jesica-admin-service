package com.trism.jesica.persistence.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.id.TbStoreCategoryGoodsID;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@IdClass(TbStoreCategoryGoodsID.class)
@Table(name = "tb_store_category_goods")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbStoreCategoryGoods extends CreatedDateEntity {

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_cat_no", referencedColumnName = "store_cat_no", nullable = false)
    @JsonManagedReference
    private TbStoreCategory storeCategory;

    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_goods_no",insertable = false, updatable = false, referencedColumnName = "store_goods_no", nullable = false)
    @JsonManagedReference
    private TbStoreGoods storeGoods;

}
