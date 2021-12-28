package com.trism.jesica.dto;

import com.trism.jesica.persistence.Entitiy.business.TbUser;
import com.trism.jesica.persistence.Entitiy.business.TbUserStaff;
import com.trism.jesica.persistence.type.UserType;
import lombok.Data;

import java.time.LocalDateTime;


@Data
public class TbUserDto {

    Long userNo;
    private UserType userType;
    private Integer headNo;
    private Integer branchNo;
    private Integer storeNo;
    private LocalDateTime insertDate;

    public TbUser insertData() {
        return TbUserStaff.builder()
                .userNo(this.userNo)
                .userType(this.userType)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .storeNo(this.storeNo)
                .build();
    }
    /*public TbUserStaff insertData() {
        return TbUserStaff.builder()
                .userNo(this.userNo)
                .userId(this.userId)
                .userPwd(this.userPwd)
                .userType(this.userType)
                .updateDate(this.updateDate)
                .updateUserId(this.insertUserId)
                .dataStatus(this.dataStatus)
                .blockTypeCode(this.blockTypeCode)
                .headNo(this.headNo)
                .branchNo(this.branchNo)
                .storeNo(this.storeNo)
                .name(this.name)
                .phone(this.phone)
                .memo(this.memo)
                .build();
    }*/
}
