package com.trism.jesica.persistence.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 이벤트 알림 발송 및 화인 내역
 */
@Entity
@Table(name = "manna_event_push_log")
@Data
public class TbMannaEventPushLog {
    private static final long serialVersionUID = 1L;

    /**
     * 발송로그 일련번호(ext)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "log_no", insertable = false, nullable = false)
    private Long logNo;

    /**
     * 고객일련번호
     */
    @Column(name = "cust_no", updatable = false, nullable = false)
    private Long custNo;

    /**
     * 고객전화번호
     */
    @Column(name = "cust_tel", nullable = false)
    private String custTel = null;

    /**
     * 알림확인시간
     */
    @Column(name = "open_date", nullable = false)
    private LocalDateTime openDate = null;
}
