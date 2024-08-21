package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.GenderType;

import java.time.LocalDateTime;

public interface TbCustDTO {

    /**
     * 고객 일련번호
     */
     Long getCustNo();

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
     DataStatus getDataStatus();

    /**
     * 앱로그인 ID
     */
     String getLoginId();

    /**
     * 앱 로그인 PWD
     */
     String getLoginPwd();

    /**
     * SNS 토큰 1 (외부로그인)
     */
    String getSnsToken1();

    /**
     * SNS 토큰 2 (외부로그인)
     */
     String getSnsToken2();

     String getCustName();

     String getCustTel();

     Integer getCash();

     Integer getMileage();

     GenderType getGender();
     Integer getSmsYn();

     Integer getPushOrderYn();

     Integer getPushNoticeYn();

     Integer getPushMarketingYn();

     Integer getIsMember();

     Integer getUseCount();

     Integer getPoint();




     Integer getAccPoint();

     Long getExtCustNo();

     Integer getPlatformType();

     String getExtRecommStCode();

     String getExtRecommStName();


     String getAddr1();




     String getAddr2();

     String getExtBrCode();

     String getExtMasterStCode();


    String getRecommCode();

    String getRecommCount();

    String getRecommCustNo();

    String getRecommCustName();

    String getRecommCustTel();

    LocalDateTime getUpdateDate();


     LocalDateTime getInsertDate();

}
