package com.trism.jesica.persistence.mappedsuper;

import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.Column;
import javax.persistence.Id;
import javax.persistence.MappedSuperclass;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 신규생성 관리
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@ToString(callSuper = true)
@Getter
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseCallWkEntity implements Serializable {

    /**
     * 배차_일련번호
     */
    @Id
    @Column(name = "call_wk_no", nullable = false)
    private Long callWkNo;

    /**
     * 주문_일련번호
     */
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 릴레이_단계(1 or 2)
     */
    @Column(name = "relay_step", nullable = false)
    private Integer relayStep;

    /**
     * 기사_번호
     */
    @Column(name = "worker_no")
    private Integer workerNo;

    /**
     * 기사_이름
     */
    @Column(name = "worker_name")
    private String workerName;

    /**
     * 배달그룹_일련번호
     */
    @Column(name = "dlvy_no")
    private Integer dlvyNo;

    /**
     * 수주_제휴본사
     */
    @Column(name = "head_no")
    private Integer headNo;

    /**
     * 수주_총판
     */
    @Column(name = "branch_no")
    private Integer branchNo;

    /**
     * 수주_가맹점
     */
    @Column(name = "store_no")
    private Integer storeNo;

    /**
     * 주문_상태_코드 (SYS_TYPE = OS)
     */
    @Column(name = "order_status_code")
    private String orderStatusCode;

    /**
     * 배차_일시
     */
    @Column(name = "dlvy_acc_date")
    private LocalDateTime dlvyAccDate;

    /**
     * 출발_일시
     */
    @Column(name = "pickup_date")
    private LocalDateTime pickupDate;

    /**
     * 완료_일시
     */
    @Column(name = "finish_date")
    private LocalDateTime finishDate;

    /**
     * 취소_일시
     */
    @Column(name = "cancel_date")
    private LocalDateTime cancelDate;

}
