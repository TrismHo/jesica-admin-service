package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.Data;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 만나 가맹점 등록 첨부파일
 */
@Entity
@Table(name = "manna_st_regist_file")
@Data
public class TbMannaStRegistFile implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * Sequence(PK)
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "regist_file_no", nullable = false)
    private Integer registFileNo;

    /**
     * 가맹점코드
     */
    @Column(name = "st_code", length = 10)
    private String stCode;

    /**
     * 등록일시
     */
    @Column(name = "insert_date")
    private LocalDateTime insertDate;

    /**
     * 파일명
     */
    @Column(name = "file_name", length = 100)
    private String fileName;

    /**
     * 다운로드경로
     */
    @Column(name = "file_path", length = 200)
    private String filePath;
}
