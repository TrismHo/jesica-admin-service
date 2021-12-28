package com.trism.jesica.persistence.Entitiy.goods;

import com.fasterxml.jackson.annotation.JsonBackReference;
import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.core.entity.BaseEntity;
import com.trism.jesica.persistence.type.DataStatus;
import com.trism.jesica.persistence.type.GoodsStatus;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.util.List;

/**
 * 가맹점(스토어) 상품
 */
@Entity
@Table(name = "tb_store_goods")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@AllArgsConstructor
@Builder
@Getter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
//@IdClass(TbStoreGoodsID.class)
public class TbStoreGoods extends BaseEntity {

    /**
     * 가맹점 상품 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "store_goods_no")
    private Long storeGoodsNo;

    @Column(name = "store_no")
    private Long storeNo;
    /**
     * 스토어 (FK)
     */
//    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false)
    @JsonManagedReference
    public TbStore store;


/*    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumns(value = {@JoinColumn(name = "store_no", referencedColumnName = "store_no", insertable = false, updatable = false)})
    @JsonManagedReference
    private TbStoreCategory storeCategory;*/

    /**
     * 입력 사용자 고유 ID
     */
    @Column(name = "insert_user_id", length = 20)
    private String insertUserId;

    /**
     * 수정 사용자 고유 ID
     */
    @Column(name = "update_user_id", length = 20)
    private String updateUserId;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    @Enumerated(EnumType.ORDINAL)
    private DataStatus dataStatus;

    /**
     * 상품 명
     */
    @Column(name = "goods_name", length = 100)
    private String goodsName;

    /**
     * 마스터_가맹점_번호
     */
    @Column(name = "master_store_no")
    private Long subStoreNo;

    /**
     * 재고관리_여부 (0: 관리안함, 1: 재고관리)
     */
    @Column(name = "stock_yn")
    private Boolean stockYn;

    /**
     * 재고수량
     */
    @Column(name = "stock_cnt")
    private Integer stockCnt;

    /**
     * 성인인증_구분 (1: 필요, 0: 불필요)
     */
    @Column(name = "adult_yn")
    private Boolean adultYn;

    /**
     * 과세_여부 (0:비과세, 1:과세)
     */
    @Column(name = "tax_yn")
    private Boolean taxYn;

    /**
     * 정렬 순서
     */
    @Column(name = "view_order")
    private Integer viewOrder;

    /**
     * 누적 주문 개수
     */
    @Column(name = "total_sell_cnt")
    private Integer totalSellCnt;

    /**
     * 상품_상태 (0: 판매안함, 1: 판매중, 2: 품절)
     */
    @Column(name = "goods_status")
    @Enumerated(EnumType.ORDINAL)
    private GoodsStatus goodsStatus;

    /**
     * 기본_옵션_유무 default 0
     */
    @Column(name = "basic_option_yn")
    private Boolean basicOptionYn;
    /**
     * 상품 가격
     */
    @Column(name = "goods_price")
    private Integer goodsPrice;

    /**
     * 상품 할인 가격
     */
    @Column(name = "goods_dc_price")
    private Integer goodsDcPrice;

    /**
     * 상품_할인_시작일 (YYYYMMDDHHMI)
     */
    @Column(name = "goods_dc_start")
    private String goodsDcStart;

    /**
     * 상품_할인_종료일 (YYYYMMDDHHMI)
     */
    @Column(name = "goods_dc_end", length = 12)
    private String goodsDcEnd;

    /**
     * 상품 판매제한 1일
     */
    @Column(name = "goods_limit_day")
    private Integer goodsLimitDay;

    /**
     * 상품 판매제한 1 회
     */
    @Column(name = "goods_limit_once")
    private Integer goodsLimitOnce;

    /**
     * 바코드
     */
    @Column(name = "barcode", length = 20)
    private String barcode;

    /**
     * 바코드 2
     */
    @Column(name = "barcode_2", length = 20)
    private String barcode2;

    /**
     * 매입 원가
     */
    @Column(name = "buy_price")
    private Integer buyPrice;

    /**
     * 매입_과세_여부 (0:비과세, 1:과세)
     */
    @Column(name = "buy_tax_yn")
    private Boolean buyTaxYn;

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
     * 검색 문자열
     */
    @Column(name = "search_text", length = 100)
    private String searchText;

    /**
     * 상품설명
     */
    @Column(name = "goods_detail", length = 1000)
    private String goodsDetail;

    @OneToMany(fetch = FetchType.LAZY, mappedBy = "storeGoods")
    @OrderBy(value = "insertDate DESC")
    @JsonBackReference
    private List<TbStoreCategoryGoods> storeCategoryGoods;


  /*  @PrePersist
    public void defaultInit() {
        this.dataStatus = DataStatus.OK;
        this.stockYn = false;
        this.stockCnt = 0;
        this.adultYn = false;
        this.taxYn = false;
        this.viewOrder = 0;
        this.totalSellCnt = 0;
        this.goodsStatus = GoodsStatus.NOT_FOR_SALE;
        this.goodsPrice = 0;
        this.goodsDcPrice = 0;
        this.goodsLimitDay = 0;
        this.goodsLimitOnce = 0;
        this.basicOptionYn = false;
    }*/

    @Builder
    private TbStoreGoods(Long storeGoodsNo , Long storeNo , String insertUserId, String updateUserId, DataStatus dataStatus, String goodsName,
                               Boolean stockYn, Integer stockCnt, Boolean adultYn, Boolean taxYn, Integer viewOrder, Long subStoreNo, Integer totalSellCnt,
                               GoodsStatus goodsStatus, Boolean basicOptionYn, Integer goodsPrice, Integer goodsDcPrice, String goodsDcStart,
                               String goodsDcEnd, Integer goodsLimitDay, Integer goodsLimitOnce, String barcode, String barcode2,
                               Integer buyPrice, Boolean buyTaxYn, String imgFile1, String imgFile2, String imgFile3, String imgFileSmall,
                               String searchText, String goodsDetail) {
        this.storeGoodsNo = storeGoodsNo;
        this.storeNo = storeNo;
        this.insertUserId = insertUserId;
        this.updateUserId = updateUserId;
        this.dataStatus = dataStatus;
        this.goodsName = goodsName;
        this.stockYn = stockYn;
        this.stockCnt = stockCnt;
        this.adultYn = adultYn;
        this.taxYn = taxYn;
        this.viewOrder = viewOrder;
        this.subStoreNo = subStoreNo;
        this.totalSellCnt = totalSellCnt;
        this.goodsStatus = goodsStatus;
        this.basicOptionYn = basicOptionYn;
        this.goodsPrice = goodsPrice;
        this.goodsDcPrice = goodsDcPrice;
        this.goodsDcStart = goodsDcStart;
        this.goodsDcEnd = goodsDcEnd;
        this.goodsLimitDay = goodsLimitDay;
        this.goodsLimitOnce = goodsLimitOnce;
        this.barcode = barcode;
        this.barcode2 = barcode2;
        this.buyPrice = buyPrice;
        this.buyTaxYn = buyTaxYn;
        this.imgFile1 = imgFile1;
        this.imgFile2 = imgFile2;
        this.imgFile3 = imgFile3;
        this.imgFileSmall = imgFileSmall;
        this.searchText = searchText;
        this.goodsDetail = goodsDetail;
    }

}
