package com.trism.jesica.persistence.mysql.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.id.TbStoreCategoryFoID;
import com.trism.jesica.persistence.mysql.type.CatLevel;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 가맹점 카테고리 배달음식
 */
@Entity
@Table(name = "tb_store_category_fo")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
@IdClass(TbStoreCategoryFoID.class)
public class TbStoreCategoryFo extends CreatedDateEntity {


    @Column(name = "store_no")
    private Long storeNo;

    @Column(name = "cat_code")
    private String catCode;

    /**
     * 스토어(FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 시스템 카테고리 코드(FK)
     */
    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cat_code" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbSystemCategory systemCategory;


    /**
     * 카테고리 레벨 (1~3)
     */
    @Column(name = "cat_level")
    @Enumerated(EnumType.ORDINAL)
    private CatLevel catLevel;

    /**
     * 상위 카테고리 코드
     */
    @Column(name = "parent_cat_code", length = 6)
    private String parentCatCode;

    @Builder
    private TbStoreCategoryFo(Long storeNo , String catCode, CatLevel catLevel, String parentCatCode) {
        this.storeNo = storeNo;
        this.catCode = catCode;
        this.catLevel = catLevel;
        this.parentCatCode = parentCatCode;
    }

}
