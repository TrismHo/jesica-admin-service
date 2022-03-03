package com.trism.jesica.dto;

import lombok.Data;

@Data
public class TbCustData {

    Long custNo;
    String loginPwd;
    String custName;
    String custTel;
    Integer dataStatus;
    String gender;
    Integer smsYn;
    Integer pushOrderYn;
    Integer pushNoticeYn;
    Integer pushMarketingYn;
}
