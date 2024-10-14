package com.trism.jesica.persistence.mysql.Entitiy.library;

import com.trism.jesica.config.EmptyStringToNullConverter;
import lombok.Data;
import org.springframework.data.annotation.CreatedDate;

import javax.persistence.*;
import java.io.Serializable;
import java.time.LocalDateTime;

/**
 * 자료실
 */
@Entity
@Table(name = "tb_library")
@Data
public class TbLibrary implements Serializable {
    private static final long serialVersionUID = 1L;

    /**
     * 문서번호
     */
    @Id
    @Column(name = "lib_no", nullable = false)
    private Long libNo;

    /**
     * 파일명(암호화)
     */
    @Column(name = "file_name", nullable = false)
    @Convert(converter = EmptyStringToNullConverter.class)
    private String fileName;

    /**
     * 파일명(원본명)
     */
    @Column(name = "file_origin_name")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String fileOriginName;

    /**
     * 파일경로
     */
    @Column(name = "file_path")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String filePath;

    /**
     * 문서명
     */
    @Column(name = "file_title")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String fileTitle;

    /**
     * 문서내용
     */
    @Column(name = "file_body")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String fileBody;

    /**
     * 등록일
     */
    @Column(name = "insert_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime insertDate;

    /**
     * 수정일
     */
    @Column(name = "update_date", updatable = false, nullable = false)
    @CreatedDate
    private LocalDateTime updateDate;

    /**
     * 등록자ID
     */
    @Column(name = "insert_user_id")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String insertUserId;

    /**
     * 수정자ID
     */
    @Column(name = "update_user_id")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String updateUserId;

    /**
     * 등록자명
     */
    @Column(name = "insert_user_name")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String insertUserName;

    /**
     * 수정자명
     */
    @Column(name = "update_user_name")
    @Convert(converter = EmptyStringToNullConverter.class)
    private String updateUserName;

    /**
     * 문서타입
     */
    @Column(name = "file_type")
    private Integer fileType;
}
