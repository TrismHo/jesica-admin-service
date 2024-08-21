package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.goods.TbStoreGoods;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.GoodsStatus;
import lombok.Data;


@Data
public class TbStoreGoodsData {

    private Long storeGoodsNo;

    private Long storeNo;
    private Integer headNo;
    private Integer branchNo;

    private String insertUserId;

    private String updateUserId;

    private DataStatus dataStatus;

    private String goodsName;

    private Long subStoreNo;

    private Boolean stockYn;

    private Integer stockCnt;

    private Boolean adultYn;

    private Boolean taxYn;

    private Integer viewOrder;

    private Integer totalSellCnt;

    private GoodsStatus goodsStatus;

    private Boolean basicOptionYn;

    private Integer goodsPrice;

    private Integer goodsDcPrice;

    private String goodsDcStart;

    private String goodsDcEnd;

    private Integer goodsLimitDay;

    private Integer goodsLimitOnce;

    private String barcode;

    private String barcode2;

    private Integer buyPrice;

    private Boolean buyTaxYn;

    private String imgFileSmall;

    private String imgFile1;

    private String imgFile2;

    private String imgFile3;

    private String searchText;

    private String goodsDetail;

    public TbStoreGoods insertData() {
        return TbStoreGoods.builder()
                .storeGoodsNo(this.storeGoodsNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .goodsName(this.goodsName)
                .stockYn(this.stockYn)
                .stockCnt(this.stockCnt)
                .adultYn(this.adultYn)
                .taxYn(this.taxYn)
                .viewOrder(this.viewOrder)
                .subStoreNo(this.subStoreNo)
                .totalSellCnt(this.totalSellCnt)
                .goodsStatus(this.goodsStatus)
                .basicOptionYn(this.basicOptionYn)
                .goodsPrice(this.goodsPrice)
                .goodsDcPrice(this.goodsDcPrice)
                .goodsDcStart(this.goodsDcStart)
                .goodsDcEnd(this.goodsDcEnd)
                .goodsLimitDay(this.goodsLimitDay)
                .goodsLimitOnce(this.goodsLimitOnce)
                .barcode(this.barcode)
                .barcode2(this.barcode2)
                .buyPrice(this.buyPrice)
                .buyTaxYn(this.buyTaxYn)
                .imgFileSmall(this.imgFileSmall)
                .imgFile1(this.imgFile1)
                .imgFile2(this.imgFile2)
                .imgFile3(this.imgFile3)
                .searchText(this.searchText)
                .goodsDetail(this.goodsDetail)
                .build();
    }


    public TbStoreGoods updateData() {
        return TbStoreGoods.builder()
                .storeGoodsNo(this.storeGoodsNo)
                .storeNo(this.storeNo)
                .insertUserId(this.insertUserId)
                .updateUserId(this.updateUserId)
                .dataStatus(this.dataStatus)
                .goodsName(this.goodsName)
                .stockYn(this.stockYn)
                .stockCnt(this.stockCnt)
                .adultYn(this.adultYn)
                .taxYn(this.taxYn)
                .viewOrder(this.viewOrder)
                .subStoreNo(this.subStoreNo)
                .totalSellCnt(this.totalSellCnt)
                .goodsStatus(this.goodsStatus)
                .basicOptionYn(this.basicOptionYn)
                .goodsPrice(this.goodsPrice)
                .goodsDcPrice(this.goodsDcPrice)
                .goodsDcStart(this.goodsDcStart)
                .goodsDcEnd(this.goodsDcEnd)
                .goodsLimitDay(this.goodsLimitDay)
                .goodsLimitOnce(this.goodsLimitOnce)
                .barcode(this.barcode)
                .barcode2(this.barcode2)
                .buyPrice(this.buyPrice)
                .buyTaxYn(this.buyTaxYn)
                .imgFileSmall(this.imgFileSmall)
                .imgFile1(this.imgFile1)
                .imgFile2(this.imgFile2)
                .imgFile3(this.imgFile3)
                .searchText(this.searchText)
                .goodsDetail(this.goodsDetail)
                .build();
    }

}
