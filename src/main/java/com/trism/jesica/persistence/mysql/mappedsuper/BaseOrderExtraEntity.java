package com.trism.jesica.persistence.mysql.mappedsuper;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbBranchSub;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbHeadSub;
import com.trism.jesica.persistence.mysql.Entitiy.business.TbStoreSub;
import lombok.*;
import lombok.experimental.Accessors;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 주문배달 추가정보
 */
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@ToString
@EqualsAndHashCode
@Getter
@AllArgsConstructor
@MappedSuperclass
public abstract class BaseOrderExtraEntity implements Serializable {
    /**
     * 주문 일련번호
     */
    @Id
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 고객 전화번호_2
     */
    @Column(name = "cust_tel_2", length = 15)
    private String custTel2;

    /**
     * 마스터 가맹점 번호 (멀티가맹점) (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "master_store_no", referencedColumnName = "store_no")
    @JsonManagedReference
    private TbStoreSub masterStore;

    /**
     * 주문_제휴본사_번호 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_head_no", referencedColumnName = "head_no")
    @JsonManagedReference
    private TbHeadSub orderHead;

    /**
     * 주문_총판_번호 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_branch_no", referencedColumnName = "branch_no")
    @JsonManagedReference
    private TbBranchSub orderBranch;

    /**
     * 발주_제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "give_head_no", referencedColumnName = "head_no")
    @JsonManagedReference
    private TbHeadSub giveHead;

    /**
     * 발주 총판 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "give_branch_no", referencedColumnName = "branch_no")
    @JsonManagedReference
    private TbBranchSub giveBranch;

    /**
     * 수주 제휴본사 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accept_head_no", referencedColumnName = "head_no")
    @JsonManagedReference
    private TbHeadSub acceptHead;

    /**
     * 수주 총판 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accept_branch_no", referencedColumnName = "branch_no")
    @JsonManagedReference
    private TbBranchSub acceptBranch;

    /**
     * 수주 가맹점 (FK)
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "accept_store_no", referencedColumnName = "store_no")
    @JsonManagedReference
    private TbStoreSub acceptStore;

    /**
     * 수주 가맹점 연락처
     */
    @Column(name = "accept_store_tel", length = 10)
    private String acceptStoreTel;

    /**
     * 출발 주소 1(레벨1)
     */
    @Column(name = "depart_addr_1", length = 30)
    private String departAddr1;

    /**
     * 출발 주소 2(레벨2)
     */
    @Column(name = "depart_addr_2", length = 50)
    private String departAddr2;

    /**
     * 출발 주소 3(레벨3)
     */
    @Column(name = "depart_addr_3", length = 100)
    private String departAddr3;

    /**
     * 출발 주소 4(나머지주소)
     */
    @Column(name = "depart_addr_4", length = 100)
    private String departAddr4;

    /**
     * 출발 주소 5(사용자 입력주소)
     */
    @Column(name = "depart_addr_5", length = 200)
    private String departAddr5;

    /**
     * 도착 주소 1(레벨1)
     */
    @Column(name = "dest_addr_1", length = 30)
    private String destAddr1;

    /**
     * 도착 주소 2(레벨2)
     */
    @Column(name = "dest_addr_2", length = 50)
    private String destAddr2;

    /**
     * 도착 주소 5(사용자 입력주소)
     */
    @Column(name = "dest_addr_5", length = 200)
    private String destAddr5;

    /**
     * 출발 연락처
     */
    @Column(name = "depart_tel", length = 15)
    private String departTel;

    /**
     * 출발메모(담당자 등)
     */
    @Column(name = "depart_memo", length = 200)
    private String departMemo;

    /**
     * 출발 연락처
     */
    @Column(name = "dest_tel", length = 15)
    private String destTel;

    /**
     * 도착메모(담당자 등)
     */
    @Column(name = "dest_memo", length = 200)
    private String destMemo;

    /**
     * 고객 요청 메모
     */
    @Column(name = "cust_memo", length = 200)
    private String custMemo;

    /**
     * 주문 메모(내부 사용자용)
     */
    @Column(name = "order_memo", length = 500)
    private String orderMemo;

    /**
     * 취소 메모
     */
    @Column(name = "cancel_memo", length = 100)
    private String cancelMemo;

    /**
     * 취소사유_구분_코드 (SYS_TYPE = OC)
     */
    @Column(name = "order_cancel_code", length = 4)
    private String orderCancelCode;
}
