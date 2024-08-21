package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.*;
import org.hibernate.annotations.NotFound;
import org.hibernate.annotations.NotFoundAction;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.time.LocalDateTime;
import java.util.List;

/**
 * 만나_쿠폰
 */
@Getter
@Setter
@EqualsAndHashCode // 필수
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "manna_coupon_publish")
public class TbMannaCouponPublish {
    private static final long serialVersionUID = 1L;

    /**
     * 발행 일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "publish_no", insertable = false, nullable = false)
    private Long publishNo;

    /**
     * 쿠폰 등록내역
     */
    @OneToMany(fetch = FetchType.LAZY)
    @NotFound(action = NotFoundAction.IGNORE)
    @JoinColumn(name = "publish_no", referencedColumnName = "publish_no" , insertable = false, updatable = false)
    private List<TbMannaCouponRegist> mannaCouponRegist;

    /**
     * 쿠폰번호
     */
    @Column(name = "cpn_no")
    private Long cpnNo;

    /**
     * 쿠폰 코드
     */
    @Column(name = "cpn_code", nullable = false)
    private String cpnCode = null;

    /**
     * 쿠폰상태(0:삭제 , 1:미등록 ,2:등록)
     */
    @Column(name = "cpn_status")
    private Integer cpnStatus;

    /**
     *  발행자(관리자)
     */
    @Column(name = "insert_user_id")
    private String insertUserId;

    /**
     * 발행일
     */
    @Column(name = "insert_date", updatable = false)
    @CreatedDate
    private LocalDateTime insertDate;

    /**
     * 가맹점 번호
     */
    @Column(name = "st_code")
    private String stCode;
    /**
     * 1인당 등록제한
     */
    @Column(name = "regist_max")
    private Long registMax;

    /**
     * 최대 등록제한
     */
    @Column(name = "total_regist_max")
    private Long totalRegistMax;
}
