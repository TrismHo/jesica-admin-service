package com.trism.jesica.persistence.Entitiy.paymenthistory;

import com.trism.jesica.persistence.core.entity.CreatedDateEntity;
import com.trism.jesica.persistence.type.ServiceType;
import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 주문결제 승인 취소
 */
@Entity
@Data
@Table(name = "tb_pay_cancel")
public class TbPayCancel extends CreatedDateEntity{
    private static final long serialVersionUID = 1L;

    /**
     * 취소no
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "cancel_no", insertable = false, nullable = false)
    private Long cancelNo;

    /**
     * 주문번호
     */
    @Column(name = "order_no", nullable = false)
    private Long orderNo;

    /**
     * 승인TID
     */
    @Column(name = "tid", nullable = false)
    private String tid;

    /**
     * 상점ID
     */
    @Column(name = "mid")
    private String mid = "NULL";

    /**
     * 지불수단 코드
     */
    @Column(name = "pay_method")
    private String payMethod = "NULL";

    /**
     * 전문 생성시간
     */
    @Column(name = "req_date")
    private LocalDateTime reqDate;

    /**
     * 가맹점 요청 IP
     */
    @Column(name = "client_ip")
    private String clientIp;

    /**
     * 취소요청 사유
     */
    @Column(name = "msg")
    private String msg;

    /**
     * 서비스타입
     */
    @Column(name = "service_type")
    private ServiceType serviceType;

    /**
     * 전문위변조 HASH
     */
    @Column(name = "hash_data")
    private String hashData;

    /**
     * 요청결과 [00:성공 그외 실패]
     */
    @Column(name = "result_code")
    private String resultCode;

    /**
     * 결과메시지
     */
    @Column(name = "result_msg")
    private String resultMsg;

    /**
     * 취소일자(yyyymmdd)
     */
    @Column(name = "cancel_date")
    private String cancelDate;

    /**
     * 취소시간(hhmmss)
     */
    @Column(name = "cancel_time")
    private String cancelTime;

    /**
     * 현금영수증 취소 승인번호
     */
    @Column(name = "cshr_cancel_num")
    private String cshrCancelNum;

    /**
     * 취소금액
     */
    @Column(name = "price")
    private Integer price;

    /**
     * 부분취소 남은금액
     */
    @Column(name = "remain_price")
    private Integer remainPrice;

    /**
     * 부분환불 TID
     */
    @Column(name = "partial_refund_tid")
    private String partialRefundTid;

    /**
     * 부분취소 횟수
     */
    @Column(name = "prtc_cnt")
    private Integer prtcCnt ;

    /**
     * 부분취소 구분 ["0":재승인방식, "1":부분취소]
     */
    @Column(name = "prtc_type")
    private Integer prtcType;

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public Long getCancelNo() {
        return cancelNo;
    }

    public void setCancelNo(Long cancelNo) {
        this.cancelNo = cancelNo;
    }

    public Long getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(Long orderNo) {
        this.orderNo = orderNo;
    }

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getPayMethod() {
        return payMethod;
    }

    public void setPayMethod(String payMethod) {
        this.payMethod = payMethod;
    }

    public LocalDateTime getReqDate() {
        return reqDate;
    }

    public void setReqDate(LocalDateTime reqDate) {
        this.reqDate = reqDate;
    }

    public String getClientIp() {
        return clientIp;
    }

    public void setClientIp(String clientIp) {
        this.clientIp = clientIp;
    }

    public String getMsg() {
        return msg;
    }

    public void setMsg(String msg) {
        this.msg = msg;
    }

    public String getHashData() {
        return hashData;
    }

    public void setHashData(String hashData) {
        this.hashData = hashData;
    }

    public String getResultCode() {
        return resultCode;
    }

    public void setResultCode(String resultCode) {
        this.resultCode = resultCode;
    }

    public String getResultMsg() {
        return resultMsg;
    }

    public void setResultMsg(String resultMsg) {
        this.resultMsg = resultMsg;
    }

    public String getCancelDate() {
        return cancelDate;
    }

    public void setCancelDate(String cancelDate) {
        this.cancelDate = cancelDate;
    }

    public String getCancelTime() {
        return cancelTime;
    }

    public void setCancelTime(String cancelTime) {
        this.cancelTime = cancelTime;
    }

    public String getCshrCancelNum() {
        return cshrCancelNum;
    }

    public void setCshrCancelNum(String cshrCancelNum) {
        this.cshrCancelNum = cshrCancelNum;
    }

    public Integer getPrice() {
        return price;
    }

    public void setPrice(Integer price) {
        this.price = price;
    }

    public Integer getRemainPrice() {
        return remainPrice;
    }

    public void setRemainPrice(Integer remainPrice) {
        this.remainPrice = remainPrice;
    }

    public String getPartialRefundTid() {
        return partialRefundTid;
    }

    public void setPartialRefundTid(String partialRefundTid) {
        this.partialRefundTid = partialRefundTid;
    }

    public Integer getPrtcCnt() {
        return prtcCnt;
    }

    public void setPrtcCnt(Integer prtcCnt) {
        this.prtcCnt = prtcCnt;
    }

    public Integer getPrtcType() {
        return prtcType;
    }

    public void setPrtcType(Integer prtcType) {
        this.prtcType = prtcType;
    }

}