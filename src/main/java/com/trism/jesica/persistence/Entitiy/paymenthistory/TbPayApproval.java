package com.trism.jesica.persistence.Entitiy.paymenthistory;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.Entitiy.cust.TbCustSub;
import com.trism.jesica.persistence.type.ServiceType;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Entity
@Table(name = "tb_pay_approval")
public class TbPayApproval implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 승인 거래번호(P_TID)
     */
    @Id
    @Column(name = "tid", nullable = false)
    private String tid;

    /**
     * 주문번호(P_OID)
     */
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 결과코드 ["00":성공, 이외 실패 (실패코드 4byte)]
     */
    @Column(name = "status")
    private String status;

    /**
     * 상점ID(P_MID)
     */
    @Column(name = "mid")
    private String mid;

    /**
     * 결과 메시지(P_RMESG1)
     */
    @Column(name = "rmesg1")
    private String rmesg1;

    /**
     * 지불수단(P_TYPE)[신용카드(안심클릭,ISP) : CARD, 실시간계좌이체 : BANK, 가상계좌(무통장입금) : VBANK, 휴대폰 : MOBILE, 문화상품권 : CULTURE, 해피머니상품권 : HPMN, 전자지갑 : EWALLET, 알리페이,페이팔 외 기타 : ETC_]
     */
    @Column(name = "pay_type")
    private String payType;

    @Column(name = "auth_dtm", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime authDtm;

    /**
     * 거래금액(P_AMT)
     */
    @Column(name = "amount")
    private Integer amount;

    /**
     * 구매자명(P_UNAME)
     */
    @Column(name = "user_name")
    private String userName;

    /**
     * 가맹점명(P_MNAME)
     */
    @Column(name = "member_name")
    private String memberName;

    /**
     * 서비스타입
     */
    @Column(name = "service_type")
    private ServiceType serviceType;


    /**
     * 가맹점 임의 데이터(P_NOTI)
     */
    @Column(name = "noti")
    private String noti;

    /**
     * 고객번호
     */
    @Column(name = "cust_no")
    private Long custNo;

    /**
     * 사용자
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="cust_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbCustSub cust;


    /**
     * 카드정보
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="tid", insertable = false, updatable = false)
    @JsonManagedReference
    private TbPayCardData payCardData;

    /**
     * 주문결제 인증결과 tid
     */
    @Column(name = "cert_tid")
    private String certTid;

    /**
     * 가맹점 번호
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name ="store_no", insertable = false, updatable = false)
    @JsonManagedReference
    private TbStore store;

    /**
     * 주문결제 인증결과 tid
     */
    @Column(name = "store_no")
    private Long storeNo;

    /**
     * 승인 거래번호(P_TID)
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 승인 거래번호(P_TID)
     */
    public String getTid() {
        return tid;
    }

    /**
     * 주문번호(P_OID)
     */
    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * 주문번호(P_OID)
     */
    public Long getOrderNo() {
        return orderNo;
    }

    /**
     * 결과코드 ["00":성공, 이외 실패 (실패코드 4byte)]
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 결과코드 ["00":성공, 이외 실패 (실패코드 4byte)]
     */
    public String getStatus() {
        return status;
    }

    /**
     * 상점ID(P_MID)
     */
    public void setMid(String mid) {
        this.mid = mid;
    }

    /**
     * 상점ID(P_MID)
     */
    public String getMid() {
        return mid;
    }

    /**
     * 결과 메시지(P_RMESG1)
     */
    public void setRmesg1(String rmesg1) {
        this.rmesg1 = rmesg1;
    }

    /**
     * 결과 메시지(P_RMESG1)
     */
    public String getRmesg1() {
        return rmesg1;
    }

    /**
     * 지불수단(P_TYPE)[신용카드(안심클릭,ISP) : CARD, 실시간계좌이체 : BANK, 가상계좌(무통장입금) : VBANK, 휴대폰 : MOBILE, 문화상품권 : CULTURE, 해피머니상품권 : HPMN, 전자지갑 : EWALLET, 알리페이,페이팔 외 기타 : ETC_]
     */
    public void setPayType(String payType) {
        this.payType = payType;
    }

    /**
     * 지불수단(P_TYPE)[신용카드(안심클릭,ISP) : CARD, 실시간계좌이체 : BANK, 가상계좌(무통장입금) : VBANK, 휴대폰 : MOBILE, 문화상품권 : CULTURE, 해피머니상품권 : HPMN, 전자지갑 : EWALLET, 알리페이,페이팔 외 기타 : ETC_]
     */
    public String getPayType() {
        return payType;
    }

    /**
     * 승인일자(P_AUTH_DT : YYYYMMDDhhmmss)
     */
    public void setAuthDtm(LocalDateTime authDtm) {
        this.authDtm = authDtm;
    }

    /**
     * 승인일자(P_AUTH_DT : YYYYMMDDhhmmss)
     */
    public LocalDateTime getAuthDtm() {
        return authDtm;
    }

    /**
     * 거래금액(P_AMT)
     */
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    /**
     * 거래금액(P_AMT)
     */
    public Integer getAmount() {
        return amount;
    }

    /**
     * 구매자명(P_UNAME)
     */
    public void setUserName(String userName) {
        this.userName = userName;
    }

    /**
     * 구매자명(P_UNAME)
     */
    public String getUserName() {
        return userName;
    }

    /**
     * 가맹점명(P_MNAME)
     */
    public void setMemberName(String memberName) {
        this.memberName = memberName;
    }

    /**
     * 가맹점명(P_MNAME)
     */
    public String getMemberName() {
        return memberName;
    }

    /**
     * 가맹점 임의 데이터(P_NOTI)
     */
    public void setNoti(String noti) {
        this.noti = noti;
    }

    /**
     * 가맹점 임의 데이터(P_NOTI)
     */
    public String getNoti() {
        return noti;
    }

    /**
     * 고객번호
     */
    public void setCustNo(Long custNo) {
        this.custNo = custNo;
    }

    /**
     * 고객번호
     */
    public Long getCustNo() {
        return custNo;
    }

    /**
     * 주문결제 인증결과 tid
     */
    public void setCertTid(String certTid) {
        this.certTid = certTid;
    }

    /**
     * 주문결제 인증결과 tid
     */
    public String getCertTid() {
        return certTid;
    }

    /**
     * 가맹점번호
     */
    public void setStore(TbStore store) {
        this.store = store;
    }

    /**
     * 가맹점 번호
     */
    public TbStore getStore() {
        return store;
    }

    /**
     * 고객정보
     */
    public void setCust(TbCustSub cust) {
        this.cust = cust;
    }

    /**
     * 고객정보
     */
    public TbCustSub getCust() {
        return cust;
    }

    /**
     * 가맹점번호
     */
    public void setStoreNo(Long storeNo) {
        this.storeNo = storeNo;
    }

    /**
     * 가맹점 번호
     */
    public Long getStoreNo() {
        return storeNo;
    }

    /**
     * 가맹점번호
     */
    public void setPayCardData(String tid) {
        this.tid = tid;
    }

    /**
     * 가맹점 번호
     */
    public TbPayCardData getPayCardData() {
        return payCardData;
    }

    @Override
    public String toString() {
        return "TbPayApproval{" +
                "tid=" + tid + '\'' +
                "orderNo=" + orderNo + '\'' +
                "status=" + status + '\'' +
                "mid=" + mid + '\'' +
                "rmesg1=" + rmesg1 + '\'' +
                "payType=" + payType + '\'' +
                "authDtm=" + authDtm + '\'' +
                "amount=" + amount + '\'' +
                "userName=" + userName + '\'' +
                "memberName=" + memberName + '\'' +
                "noti=" + noti + '\'' +
                "custNo=" + custNo + '\'' +
                "certTid=" + certTid + '\'' +
                '}';
    }
}
