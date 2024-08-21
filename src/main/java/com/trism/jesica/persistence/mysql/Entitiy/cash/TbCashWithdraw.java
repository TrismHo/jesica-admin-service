package com.trism.jesica.persistence.mysql.Entitiy.cash;

import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_cash_withdraw")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@Setter
@ToString(callSuper = true, exclude = {})
@EqualsAndHashCode(callSuper = true)
@DynamicInsert
@DynamicUpdate
public class TbCashWithdraw extends CreatedDateEntity {

    private static final long serialVersionUID = 1L;

    /**
     * 쿠폰_일련번호
     */
    @Id
    @Column(name = "withdraw_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long withdrawNo;


    /**
     * 등록_사용자_ID
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 그룹타입
     */
    @Column(name = "group_type")
    private Integer groupType;

    /**
     * 그룹번호
     */
    @Column(name = "group_no", nullable = false)
    private Integer groupNo;

    /**
     * 그룹명
     */
    @Column(name = "group_name")
    private String groupName;

    /**
     * 연락처
     */
    @Column(name = "phone")
    private String phone;

    /**
     * 출금 상태
     */
    @Column(name = "withdraw_status")
    private Integer withdrawStatus;

    /**
     * 출금 시간
     */
    @Column(name = "withdraw_date")
    private LocalDateTime withdrawDate;

    /**
     * 요청액
     */
    @Column(name = "req_amount")
    private Integer reqAmount;

    /**
     * 출금액
     */
    @Column(name = "cash")
    private Integer cash;

    /**
     * 수수료
     */
    @Column(name = "fee")
    private Integer fee;

    /**
     * 은행코드
     */
    @Column(name = "bank_code")
    private String bankCode;

    /**
     * 은행명
     */
    @Column(name = "bank_name")
    private String bankName;

    /**
     * 계좌번호
     */
    @Column(name = "account_no")
    private String accountNo;

    /**
     * 예금주
     */
    @Column(name = "account_name")
    private String accountName;

    /**
     * 메모
     */
    @Column(name = "memo")
    private String memo;


    @Builder
    public TbCashWithdraw(
            Long withdrawNo,
            String insertUserId,
            Integer groupType,
            Integer groupNo,
            String groupName,
            String phone,
            Integer withdrawStatus,
            LocalDateTime withdrawDate,
            Integer reqAmount,
            Integer cash,
            Integer fee,
            String bankCode,
            String bankName,
            String accountNo,
            String accountName,
            String memo
    ) {
        this.withdrawNo = withdrawNo;
        this.insertUserId = insertUserId;
        this.groupType = groupType;
        this.groupNo = groupNo;
        this.groupName = groupName;
        this.phone = phone;
        this.withdrawStatus = withdrawStatus;
        this.withdrawDate = withdrawDate;
        this.reqAmount = reqAmount;
        this.cash = cash;
        this.fee = fee;
        this.bankCode = bankCode;
        this.bankName = bankName;
        this.accountNo = accountNo;
        this.accountName = accountName;
        this.memo = memo;

    }

}
