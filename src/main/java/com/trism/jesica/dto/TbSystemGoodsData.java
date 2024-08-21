package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbSystemGoods;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;

@Data
public class TbSystemGoodsData {

    /**
     * 상품 일련번호
     */
    private Long goodsNo;

    /**
     * 카테고리 타입, 카테고리 코드 FK
     */
    private String  catCode;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    private DataStatus dataStatus;

    /**
     * 바코드
     */
    private String barcode;

    /**
     * 상품이름
     */
    private String goodsName;

    /**
     * 상품가격
     */
    private Integer goodsPrice;

    /**
     * 상품메모
     */
    private String goodsMemo;

    /**
     * 과세여부
     */
    private Boolean taxYn;


    /**
     * 이미지 파일명 썸네일
     */
    private String imgFileSmall;

    /**
     * 이미지 파일 1
     */
    private String imgFile1;

    /**
     * 이미지 파일 2
     */
    private String imgFile2;

    /**
     * 이미지 파일 3
     */
    private String imgFile3;


    /**
     * 상품 설명
     */
    private String goodsDetail;

    public TbSystemGoods updateData() {
        return TbSystemGoods.builder()
                .goodsNo(this.goodsNo)
                .catCode(this.catCode)
                .dataStatus(this.dataStatus)
                .barcode(this.barcode)
                .goodsName(this.goodsName)
                .goodsPrice(this.goodsPrice)
                .goodsMemo(this.goodsMemo)
                .taxYn(this.taxYn)
                .goodsMemo(this.goodsMemo)
                .imgFileSmall(this.imgFileSmall)
                .imgFile1(this.imgFile1)
                .imgFile2(this.imgFile2)
                .imgFile3(this.imgFile3)
                /*.goodsDetail(this.goodsDetail)*/

                .build();
    }

}
