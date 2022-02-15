package com.trism.jesica.persistence.Entitiy.car;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import com.trism.jesica.persistence.Entitiy.business.TbStore;
import com.trism.jesica.persistence.type.DataStatus;
import lombok.AccessLevel;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 가맹점_렌터카
 */
@Entity
@Table(name = "tb_store_rental_car")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@DynamicInsert
@DynamicUpdate
@Inheritance(strategy = InheritanceType.JOINED)
public class TbStoreRentalCar {
    private static final long serialVersionUID = 1L;

    /**
     * 렌터카_일련번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_car_no", insertable = false, nullable = false)
    private Integer rentalCarNo;

    @Column(name = "store_no")
    private Long storeNo;
    /**
     * 스토어 (FK)
     */
//    @Id
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "store_no", insertable = false, updatable = false)
    @JsonManagedReference
    public TbStore store;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    private LocalDateTime insertDate;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus;

    /**
     * 번호판
     */
    @Column(name = "car_num")
    private String carNum = null;

    /**
     * 모델명
     */
    @Column(name = "car_model")
    private String carModel = null;

    /**
     * 모델명
     */
    @Column(name = "safen_num")
    private String safenNum = null;


    @Builder
    private TbStoreRentalCar(Long storeNo ,
                         Integer rentalCarNo,
                         DataStatus dataStatus,
                         LocalDateTime insertDate,
                         String carNum,
                         String carModel,
                         String safenNum
                         ) {
        this.storeNo = storeNo;
        this.rentalCarNo = rentalCarNo;
        this.dataStatus = dataStatus;
        this.insertDate = insertDate;
        this.carModel = carModel;
        this.carNum = carNum;
        this.safenNum = safenNum;
    }

}