package com.trism.jesica.persistence.mysql.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStore;
import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.CatLevel;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.hibernate.annotations.Where;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * 가맹점_카테고리(상품그룹)
 */
@Entity
@Table(name = "tb_store_category")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
/*@ToString(callSuper = true, exclude = {"storeGoods"})*/
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
//@IdClass(TbStoreCategoryID.class)
public class TbStoreCategory extends BaseEntity implements Serializable {

    /**
     * 가맹점_카테고리_일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_cat_no", nullable = false)
    private Long storeCatNo;

    /**
     * 상위 카테고리 번호
     */
    @Column(name = "store_no")
    private Integer storeNo;
//    private TbStoreCategory parentCatNo;

    /**
     * 상위 카테고리 번호
     */
    @Column(name = "parent_cat_no")
    private Long parentCatNo;
//    private TbStoreCategory parentCatNo;

    /**
     * 스토어(FK)
     */

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false, nullable = false)
    @Where(clause = "data_status = 1")
    @JsonManagedReference
    private TbStore store;


    /**
     * 카테고리 레벨(1~3)
     */
    @Column(name = "cat_level")
    @Enumerated(EnumType.ORDINAL)
    private CatLevel catLevel;

    /**
     * 카테고리 이름
     */
    @Column(name = "cat_name", length = 100)
    private String catName;

    /**
     * 카테고리 상세 값
     */
    @Column(name = "cat_value", length = 20)
    private String catValue;

    /**
     * 카테고리 순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 메모
     */
    @Column(name = "memo", length = 100)
    private String memo;

/*    @OneToMany(fetch = FetchType.LAZY, mappedBy = "storeCategory")
    @Where(clause = "data_status = 1")
    @OrderBy(value = "insertDate DESC")
    @JsonBackReference
    private List<TbStoreGoods> storeGoods;*/

    @OneToMany(mappedBy = "storeCategory", fetch = FetchType.LAZY)
    @OrderBy(value = "insertDate DESC")
    @JsonBackReference
    private List<TbStoreCategoryGoods> storeCategoryGoods;

/*    @PrePersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
    }*/


    @Builder
    private TbStoreCategory(Long storeCatNo ,Integer storeNo, Long parentCatNo, CatLevel catLevel, String catName, String catValue, Integer viewOrder, DataStatus dataStatus,
                         String memo) {
        this.storeCatNo = storeCatNo;
        this.storeNo = storeNo;
        this.parentCatNo = parentCatNo;
        this.catLevel = catLevel;
        this.catName = catName;
        this.catValue = catValue;
        this.viewOrder = viewOrder;
        this.dataStatus = dataStatus;
        this.memo = memo;
    }
}
