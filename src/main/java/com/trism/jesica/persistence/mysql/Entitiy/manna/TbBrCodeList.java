package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 만나오더
 */
@Entity
@Table(name = "manna_br_code_list")
@Data
public class TbBrCodeList {
    private static final long serialVersionUID = 1L;


    /**
     * 총판코드
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "br_code", nullable = false)
    private String brCode = null;

    /**
     * 총판명
     */
    @Column(name = "br_name", nullable = false)
    private String brName = null;

    /**
     * 등록일시
     */
    @Column(name = "put_date")
    private LocalDateTime putDate = null;

    /**
     * 수정일시
     */
    @Column(name = "mod_date")
    private LocalDateTime modDate = null;


    /**
     * 등록자
     */
    @Column(name = "put_user_id")
    private String putUserId = null;

    /**
     * 수정자
     */
    @Column(name = "mod_user_id")
    private String modUserId = null;

    /**
     * 사용여부
     */
    @Column(name = "use_yn")
    private Long use_yn = null;

}
