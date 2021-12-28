package com.trism.jesica.persistence.type;

/**
 * 사용자_구분 (0: 마스터/시스템, 1: 제휴본사, 2: 총판, 3: 가맹점, 4: 배송원, 5: 고객, 6: 상담원)
 */
public enum UserType {
    UT_MASTER_SYSTEM,
    UT_HEAD,
    UT_BRANCH,
    UT_STORE,
    UT_DELIVERY,
    UT_CUST,
    UT_CONSULTANT
}
