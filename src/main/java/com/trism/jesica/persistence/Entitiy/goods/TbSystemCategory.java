package com.trism.jesica.persistence.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.CatLevel;
import com.trism.jesica.persistence.type.CatType;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 시스템 카테고리
 */
@Entity
@Table(name = "tb_system_category")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {"systemGoods", "storeCategoryFos"})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbSystemCategory extends BaseEntity {


    /**
     * 카테고리 코드
     */
    @Id
    @Column(name = "cat_code", length = 6, nullable = false)
    private String catCode;

    /**
     * 카테고리_타입 (FO: 주문배달, IP: 공산품, MA: 전통시장)
     */
    @Column(name = "cat_type", length = 2, nullable = false)
    @Enumerated(EnumType.STRING)
    private CatType catType;

    /**
     * 카테고리_레벨 (1~3)
     */
    @Column(name = "cat_level", nullable = false)
    @Enumerated(EnumType.ORDINAL)
    private CatLevel catLevel;

    /**
     * 카테고리_이름
     */
    @Column(name = "cat_name", length = 100)
    private String catName;

    /**
     * 카테고리 상세 값
     */
    @Column(name = "cat_value", length = 20)
    private String catValue;

    /**
     * 출력순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 상위 카테고리 코드
     */
    @Column(name = "parent_cat_code", length = 6)
    private String parentCatCode;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;

    /**
     * 시스템 상품 (FK 양방향)
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "systemCategory")
    @JsonBackReference
    private List<TbSystemGoods> systemGoods;

    /**
     * 가맹점 카테고리 배달음식 (FK 양방향)
     */
    @OneToMany(fetch = FetchType.LAZY, mappedBy = "systemCategory")
    @JsonBackReference
    private List<TbStoreCategoryFo> storeCategoryFos;

    @PrePersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
        this.catLevel = CatLevel.LV1;
        this.viewOrder = 0;
    }
}
