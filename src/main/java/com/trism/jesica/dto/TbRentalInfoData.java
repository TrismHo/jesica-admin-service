package com.trism.jesica.dto;

import lombok.Data;

import java.time.LocalDateTime;

@Data
public class TbRentalInfoData {

    private Long rentalNo;

    private LocalDateTime insertDate;

    private String custTel;
    private String custDriverTel1;
    private String custDriverTel2;
    private String storeName;
    private String carNum;
    private String reservNum;

    //String 타입으로 바꿔서 씀
    private String reservStartDate;
    private String reservEndDate;

    private String safenNum;
    private LocalDateTime safenStartDate;
    private LocalDateTime safenEndDate;
    private Long takeOrderNo;
    private Long returnOrderNo;

}
