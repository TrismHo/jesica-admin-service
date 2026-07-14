package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.IdClass;
import javax.persistence.Table;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 뱃지 이미지 가맹점 매핑
 */
@Entity
@Table(name = "manna_badge_st")
@IdClass(TbMannaBadgeStId.class)
@Data
public class TbMannaBadgeSt implements Serializable {

    private static final long serialVersionUID = 1L;

    /**
     * 뱃지 파일 번호
     * manna_badge_file.badge_file_no
     */
    @Id
    @Column(name = "badge_file_no", nullable = false)
    private Long badgeFileNo;

    /**
     * 뱃지 사용 가맹점 코드
     */
    @Id
    @Column(name = "st_code", nullable = false, length = 30)
    private String stCode;

    /**
     * 등록자 ID
     */
    @Column(name = "insert_user_id", length = 50)
    private String insertUserId;

    /**
     * 등록일시
     */
    @Column(
            name = "insert_date",
            nullable = false,
            insertable = false,
            updatable = false
    )
    private LocalDateTime insertDate;

    /**
     * 수정자 ID
     */
    @Column(name = "update_user_id", length = 50)
    private String updateUserId;

    /**
     * 수정일시
     */
    @Column(
            name = "update_date",
            insertable = false
    )
    private LocalDateTime updateDate;
}
