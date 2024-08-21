package com.trism.jesica.persistence.mysql.Entitiy.car;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 차량렌트정보
 */
@Data
@Table(name = "tb_rental_info")
@Entity
public class TbRentalInfo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * PK
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "rental_no", insertable = false, nullable = false)
    private Long rentalNo;

    /**
     * 등록일
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 고객_전화번호
     */
    @Column(name = "cust_tel")
    private String custTel = null;

    /**
     * 운전자_전화번호1
     */
    @Column(name = "cust_driver_tel1")
    private String custDriverTel1 = null;

    /**
     * 운전자_전화번호2
     */
    @Column(name = "cust_driver_tel2")
    private String custDriverTel2 = null;

    /**
     * 렌터카업체명
     */
    @Column(name = "store_name")
    private String storeName = null;

    /**
     * 차량번호
     */
    @Column(name = "car_num")
    private String carNum = null;

    /**
     * 외부예약번호
     */
    @Column(name = "reserv_num")
    private String reservNum = null;

    /**
     * 인수예정시간
     */
    @Column(name = "reserv_start_date")
    private LocalDateTime reservStartDate;

    /**
     * 반납예정시간
     */
    @Column(name = "reserv_end_date")
    private LocalDateTime reservEndDate;

    /**
     * 안심번호
     */
    @Column(name = "safen_num")
    private String safenNum = null;

    /**
     * 안심번호_할당시간
     */
    @Column(name = "safen_start_date")
    private LocalDateTime safenStartDate;

    /**
     * 안심번호_종료시간
     */
    @Column(name = "safen_end_date")
    private LocalDateTime safenEndDate;

    /**
     * 인수_주문_번호
     */
    @Column(name = "take_order_no")
    private Long takeOrderNo = null;

    /**
     * 반납_주문_번호
     */
    @Column(name = "return_order_no")
    private Long returnOrderNo = null;

    /**
     * 안심번호 매핑번호 추가
     */
    @Column(name = "mapping_num")
    private String mappingNum = null;

    /**
     * 안심번호 매핑번호 count
     */
    @Column(name = "mapping_count")
    private Integer mappingCount = null;

}
