package com.trism.jesica.persistence.mysql.type;

/**
 * 상품_상태 (0: 판매중지, 1: 판매중, 2: 품절)
 */
public enum ItemStatus {
    STOP_SELLING,
    SALE,
    SOLD_OUT
}
