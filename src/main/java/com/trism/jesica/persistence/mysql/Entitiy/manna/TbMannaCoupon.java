package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.*;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.time.LocalDateTime;

/**
 * 만나_쿠폰
 */
@Getter
@Setter
@EqualsAndHashCode // 필수
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "manna_coupon")
public class TbMannaCoupon {
    private static final long serialVersionUID = 1L;

    /**
     * 쿠폰번호
     */
    @Id
    @Column(name = "cpn_no", insertable = false, nullable = false)
    private Long cpnNo;

    /**
     * 쿠폰 사용여부
     */
    @Column(name = "cpn_use_yn", nullable = false)
    private String cpnUseYn = null;

    /**
     * 쿠폰명
     */
    @Column(name = "cpn_title", nullable = false)
    private String cpnTitle = null;

    /**
     * 발급 시작일
     */
    @Column(name = "period_s")
    private LocalDateTime periodS = null;

    /**
     * 발급 종료일
     */
    @Column(name = "period_e")
    private LocalDateTime periodE = null;


}
