package com.trism.jesica.persistence.mysql.Entitiy.block;

import com.trism.jesica.persistence.mysql.id.TbDlvyAreaGeoID;
import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;

/**
 * 배송_블록설정
 */
@Table(name = "tb_dlvy_area_geo")
@Data
@IdClass(TbDlvyAreaGeoID.class)
@Entity
public class TbDlvyAreaGeo implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 블록ID
     */
    @Id
    @Column(name = "area_no", nullable = false)
    private Long areaNo;

    /**
     * 좌표순서
     */
    @Id
    @Column( name = "geo_idx", nullable = false)
    private Integer geoIdx;

    /**
     *  위도
     */
    @Column(name = "lat")
    private Float lat = null;

    /**
     * 경도
     */
    @Column(name = "lng")
    private Float lng = null;


}
