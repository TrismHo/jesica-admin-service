package com.trism.jesica.persistence.oracle.Entity;

import lombok.*;
import lombok.experimental.Accessors;
import org.hibernate.annotations.DynamicInsert;
import org.hibernate.annotations.DynamicUpdate;

import javax.persistence.*;

@Entity
@Table(name = "MN_A1_TODAY")
@NoArgsConstructor(access = AccessLevel.PROTECTED)
@Accessors(chain = true)
@Getter
@ToString(callSuper = true, exclude = {})
@DynamicInsert
@DynamicUpdate
public class MnA1Today {

    private static final long serialVersionUID = 1L;

    /**
     * 쿠폰_일련번호
     */
    @Id
    @Column(name = "ORD_NO", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private String ordNo;

    /**
     * 등록_사용자_ID
     */
    @Column(name = "PUT_DATE")
    private String putDate;
}
