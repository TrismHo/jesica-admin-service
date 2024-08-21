package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import lombok.Data;

import javax.persistence.Transient;
import java.time.LocalDateTime;


@Data
public class TbStoreRentalCarData {


    private Long storeNo;
    private Integer rentalCarNo;
    private LocalDateTime insertDate;
    private DataStatus dataStatus;
    private String safeChk;
    private String carNum;
    private String carModel;
    private String safenNum;

    @Transient
    private String error;

    public TbStoreRentalCar insertData() {
        return TbStoreRentalCar.builder()
                .storeNo(this.storeNo)
                .carNum(this.carNum)
                .carModel(this.carModel)
                .insertDate(this.insertDate)
                .dataStatus(this.dataStatus)
                .safenNum(this.safenNum)
                .build();
    }


    public TbStoreRentalCar updateData() {
        return TbStoreRentalCar.builder()
                .storeNo(this.storeNo)
                .rentalCarNo(this.rentalCarNo)
                .carModel(this.carModel)
                .carNum(this.carNum)
                .dataStatus(this.dataStatus)
                .safenNum(this.safenNum)
                .build();
    }

}
