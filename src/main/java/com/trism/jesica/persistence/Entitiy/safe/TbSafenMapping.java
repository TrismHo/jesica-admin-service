package com.trism.jesica.persistence.Entitiy.safe;

import com.trism.jesica.persistence.type.DataStatus;
import lombok.AccessLevel;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;
import org.springframework.data.jpa.domain.support.AuditingEntityListener;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 안심번호_매핑
 */
@Entity
@Table(name = "tb_safen_mapping")
@EntityListeners(AuditingEntityListener.class)
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@DynamicInsert
@DynamicUpdate
@Inheritance(strategy = InheritanceType.JOINED)
public class TbSafenMapping implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 안심번호
     */
    @Id
    @Column(name = "safen_num", insertable = false, nullable = false)
    private String safenNum;

    /**
     * 입력_일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지) - car_no연결시 정상처리
     */
    @Column(name = "data_status", nullable = false)
    private DataStatus dataStatus;

    /**
     * 렌터카_일련번호
     */
    @Column(name = "rental_car_no")
    private Integer rentalCarNo = null;

   /* *//**
     * 매핑_여부 (0: 미할당, 1: 할당)
     *//*
    @Column(name = "mapping_yn")
    private Integer mappingYn = null;

    *//**
     * 매핑_전화번호
     *//*
    @Column(name = "mapping_num")
    private String mappingNum = null;

    *//**
     * 매핑_시작일
     *//*
    @Column(name = "start_date")
    private LocalDateTime startDate;

    *//**
     * 매핑_종료일
     *//*
    @Column(name = "end_date")
    private LocalDateTime endDate;*/

    
}