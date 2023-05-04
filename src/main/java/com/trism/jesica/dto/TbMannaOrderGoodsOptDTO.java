package com.trism.jesica.dto;


public interface TbMannaOrderGoodsOptDTO {


    /**
     * 주문번호
     */
    Long getOrdNo();

    /**
     * 만나주문상품 Seq
     */
    Long getOrdGoodsSeq();

    /**
     * 만나주문 추가상품 seq
     */
    Long getOptGoodsSeq();

    /**
     * 만나주문 추가상품 일련번호
     */
    Long getOptGoodsNo();

    /**
     * 상품이름
     */
    String getOptGoodsName();

    /**
     * 주문_상품개수(추가상품은 상품개수)
     */
    Integer getOptGoodsCnt();


    /**
     * 상품 주문 가격
     */
    Long getOptGoodsPrice();






}
