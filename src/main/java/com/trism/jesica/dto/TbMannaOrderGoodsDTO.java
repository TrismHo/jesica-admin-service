package com.trism.jesica.dto;


public interface TbMannaOrderGoodsDTO {


    /**
     * 주문번호
     */
    Long getOrdNo();

    /**
     * 주문상품 Seq
     */
    Long getOrdGoodsSeq();

    /**
     * 만나주문_상품옵션_일련번호
     */
    Long getOrdGoodsNo();

    /**
     * 상품이름
     */
    String getGoodsName();

    /**
     * 주문_상품개수(추가상품은 상품개수)
     */
    Integer getOrdCnt();


    /**
     * 상품 주문 가격
     */
    Long getOrdPrice();

    /**
     * 옵션_1_이름
     */
    String getOption1Name();

    /**
     * 옵션_2_이름
     */
    String getOption2Name();

    /**
     * 옵션_3_이름
     */
    String getOption3Name();

    /**
     * 옵션_4_이름
     */
    String getOption4Name();

    /**
     * 옵션_1_가격
     */
    Integer getOption1Price();

    /**
     * 옵션_2_가격
     */
    Integer getOption2Price();

    /**
     * 옵션_3_가격
     */
    Integer getOption3Price();

    /**
     * 옵션_4_가격
     */
    Integer getOption4Price();

    /**
     * 할인 가격
     */
    Integer getOrdDnPrice();

    /**
     * 가격구분( 1: 정상가 , 2: 할인가)
     */
    String getOrdPriceType();



}
