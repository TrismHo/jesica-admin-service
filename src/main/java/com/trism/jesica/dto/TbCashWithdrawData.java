package com.trism.jesica.dto;

import com.trism.jesica.persistence.mysql.Entitiy.cash.TbCashWithdraw;
import lombok.Data;

import java.time.LocalDateTime;


@Data
public class TbCashWithdrawData  {

    private Long withdrawNo;
    private String insertUserId;
    private Integer groupType;
    private Integer groupNo;
    private String groupName;
    private String phone;
    private Integer withdrawStatus;
    private LocalDateTime withdrawDate;
    private Integer reqAmount;
    private Integer cash;
    private Integer fee;
    private String bankCode;
    private String bankName;
    private String accountNo;
    private String accountName;
    private String memo;

    public TbCashWithdraw insertData() {
        return TbCashWithdraw.builder()
                .withdrawNo(this.withdrawNo)
                .insertUserId(this.insertUserId)
                .groupType(this.groupType)
                .groupNo(this.groupNo)
                .groupName(this.groupName)
                .phone(this.phone)
                .withdrawStatus(this.withdrawStatus)
                .withdrawDate(this.withdrawDate)
                .reqAmount(this.reqAmount)
                .cash(this.cash)
                .fee(this.fee)
                .bankCode(this.bankCode)
                .bankName(this.bankName)
                .accountNo(this.accountNo)
                .accountName(this.accountName)
                .memo(this.memo)
                .build();
    }
}
