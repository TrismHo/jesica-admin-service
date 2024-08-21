package com.trism.jesica.persistence.mysql.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.core.entity.BaseEntity;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

/**
 * 시스템 상품
 */
@Entity
@Table(name = "tb_system_goods")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbSystemGoods extends BaseEntity {

    /**
     * 상품 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "goods_no", nullable = false)
    private Long goodsNo;

    /**
     * 카테고리 타입, 카테고리 코드 FK
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns({@JoinColumn(name = "cat_code",insertable = false, updatable = false, referencedColumnName = "cat_code")})
    @JsonManagedReference
    private TbSystemCategory systemCategory;


    @Column(name = "cat_code")
    private String catCode;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    private DataStatus dataStatus;

    /**
     * 바코드
     */
    @Column(name = "barcode", length = 20)
    private String barcode;

    /**
     * 상품이름
     */
    @Column(name = "goods_name", length = 100)
    private String goodsName;

    /**
     * 상품가격
     */
    @Column(name = "goods_price")
    private Integer goodsPrice;

    /**
     * 상품메모
     */
    @Column(name = "goods_memo", length = 200)
    private String goodsMemo;

    /**
     * 과세여부
     */
    @Column(name = "tax_yn")
    private Boolean taxYn;


    /**
     * 이미지 파일명 썸네일
     */
    @Column(name = "img_file_small", length = 100)
    private String imgFileSmall;

    /**
     * 이미지 파일 1
     */
    @Column(name = "img_file_1", length = 100)
    private String imgFile1;

    /**
     * 이미지 파일 2
     */
    @Column(name = "img_file_2", length = 100)
    private String imgFile2;

    /**
     * 이미지 파일 3
     */
    @Column(name = "img_file_3", length = 100)
    private String imgFile3;


    /**
     * 상품 설명
     */
    @Column(name = "goods_detail")
    private String goodsDetail;

/*    @PrePersist
    public void defaultInit() {
        this.taxYn = false;
        this.goodsPrice = 0;
        this.dataStatus = DataStatus.OK;
    }*/


    @Builder
    public TbSystemGoods(Long goodsNo,
                         String catCode,
                        DataStatus dataStatus,
                        String barcode,
                        String goodsName,
                        Integer goodsPrice,
                        String goodsMemo,
                        Boolean taxYn,
                        String imgFileSmall,
                        String imgFile1,
                        String imgFile2,
                        String imgFile3) {
        this.goodsNo = goodsNo;
        this.catCode = catCode;
        this.dataStatus = dataStatus;
        this.barcode = barcode;
        this.goodsName = goodsName;
        this.goodsPrice = goodsPrice;
        this.goodsMemo = goodsMemo;
        this.taxYn = taxYn;
        this.imgFileSmall = imgFileSmall;
        this.imgFile1 = imgFile1;
        this.imgFile2 = imgFile2;
        this.imgFile3 = imgFile3;
    }
}
