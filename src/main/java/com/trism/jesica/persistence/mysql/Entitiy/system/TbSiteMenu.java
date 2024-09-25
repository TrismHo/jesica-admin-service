package com.trism.jesica.persistence.mysql.Entitiy.system;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

@Data
@Entity
@Table(name = "jesicar_main.tb_site_menu")
public class TbSiteMenu implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 메뉴_번호
     */
    @Id
    @Column(name = "menu_no", nullable = false)
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long menuNo;

    /**
     * 등록_일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 데이터_상태 (0: 삭제, 1: 정상, 2: 정지)
     */
    @Column(name = "data_status")
    private Integer dataStatus = 1;

    /**
     * 메뉴_URL
     */
    @Column(name = "menu_url", nullable = false)
    private String menuUrl;

    /**
     * 메뉴_명
     */
    @Column(name = "menu_name")
    private String menuName;

    /**
     * 메뉴_그룹
     */
    @Column(name = "menu_group")
    private Integer menuGroup;

    /**
     * 메뉴_레벨
     */
    @Column(name = "menu_level")
    private Integer menuLevel;

    /**
     * 메뉴_아이콘
     */
    @Column(name = "menu_icon")
    private String menuIcon;

    /**
     * 메뉴_아이콘
     */
    @Column(name = "visible_level")
    private Integer visibleLevel;

}
