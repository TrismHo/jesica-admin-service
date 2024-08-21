package com.trism.jesica.persistence.mysql.Entitiy.paymenthistory;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.mysql.Entitiy.cust.TbCustSub;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.mysql.type.ServiceType;

import javax.persistence.*;

@Entity
@Table(name = "tb_pay_cert")
public class TbPayCert extends CreatedDateEntity{

    private static final long serialVersionUID = 1L;

    /**
     * 거래번호
     */
    @Id
    @Column(name = "tid", nullable = false)
    private String tid;


    @Column(name = "order_no",insertable = false, updatable = false )
    private Long orderNo;

    /**
     * 카드정보
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "order_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbPayApproval tbPayApproval;

    /**
     * PG 결제요청 결과코드 ["00": 정상, 이외 실패]
     */
    @Column(name = "status")
    private String status;

    /**
     * 고객번호
     */
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "cust_no" , insertable = false, updatable = false)
    @JsonManagedReference
    private TbCustSub cust;

    /**
     * 결제요청URL
     */
    @Column(name = "req_url")
    private String reqUrl;

    /**
     * 인증 결과 메시지
     */
    @Column(name = "rmesg1")
    private String rmesg1;

    /**
     * 서비스타입
     */
    @Column(name = "service_type")
    private ServiceType serviceType;

    /**
     * 거래금액
     */
    @Column(name = "amount")
    private Integer amount;


    /**
     * 거래번호
     */
    public void setTid(String tid) {
        this.tid = tid;
    }

    /**
     * 거래번호
     */
    public String getTid() {
        return tid;
    }

    /**
     * 주문ID
     */
    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }

    /**
     * 주문ID
     */
    public Long getOrderNo() {
        return orderNo;
    }

    /**
     * 주문ID
     */
    public void setTbPayApproval(TbPayApproval tbPayCardData) {
        this.tbPayApproval = tbPayApproval;
    }

    /**
     * 주문ID
     */
    public TbPayApproval getTbPayApproval() {
        return tbPayApproval;
    }

    /**
     * PG 결제요청 결과코드 ["00": 정상, 이외 실패]
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * PG 결제요청 결과코드 ["00": 정상, 이외 실패]
     */
    public String getStatus() {
        return status;
    }

    /**
     * 고객번호
     */
    public void setCustNo(TbCustSub cust) {
        this.cust = cust;
    }

    /**
     * 고객번호
     */
    public TbCustSub getCust() {
        return cust;
    }

    /**
     * 결제요청URL
     */
    public void setReqUrl(String reqUrl) {
        this.reqUrl = reqUrl;
    }

    /**
     * 결제요청URL
     */
    public String getReqUrl() {
        return reqUrl;
    }

    /**
     * 인증 결과 메시지
     */
    public void setRmesg1(String rmesg1) {
        this.rmesg1 = rmesg1;
    }

    /**
     * 인증 결과 메시지
     */
    public String getRmesg1() {
        return rmesg1;
    }

    /**
     * 거래금액
     */
    public void setAmount(Integer amount) {
        this.amount = amount;
    }

    /**
     * 거래금액
     */
    public Integer getAmount() {
        return amount;
    }



    /*@Override
    public String toString() {
        return "TbPayCert{" +
                "tid=" + tid + '\'' +
                "orderNo=" + orderNo + '\'' +
                "status=" + status + '\'' +
                "custNo=" + custNo + '\'' +
                "reqUrl=" + reqUrl + '\'' +
                "rmesg1=" + rmesg1 + '\'' +
                "amount=" + amount + '\'' +
                "insertDate=" + insertDate + '\'' +
                '}';
    }*/
}
