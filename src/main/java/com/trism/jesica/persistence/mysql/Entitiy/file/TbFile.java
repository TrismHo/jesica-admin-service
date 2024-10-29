package com.trism.jesica.persistence.mysql.Entitiy.file;

import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.datatype.jsr310.deser.LocalDateTimeDeserializer;
import com.trism.jesica.persistence.mysql.core.entity.CreatedDateEntity;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;
import java.time.LocalDateTime;

/**
 * 파일
 */
@Entity
@Table(name = "tb_file")
@Data
@Getter
@Setter
public class TbFile extends CreatedDateEntity {
    private static final long serialVersionUID = 1L;

    /**
     * 파일번호
     */
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "file_no", insertable = false, nullable = false)
    private Long fileNo;

    /**
     * 파일 원본명
     */
    @Column(name = "file_origin_name", nullable = false)
    private String fileOriginName = null;

    /**
     * 파일 이름(변환)
     */
    @Column(name = "file_name", nullable = false)
    private String fileName = null;

    /**
     * 파일 경로
     */
    @Column(name = "file_path", nullable = false)
    private String filePath = null;

    /**
     * 파일 경로
     */
    @Column(name = "file_content_type", nullable = false)
    private String fileContentType = null;



    /**
     * 파일크기
     */
    @Column(name = "file_size")
    private Long fileSize = null;

    /**
     * 등록일
     */
    @JsonDeserialize(using = LocalDateTimeDeserializer.class)
    @Column(name = "insert_date" , updatable = false, nullable = false)
    private LocalDateTime insertDate;


    /**
     * 문서번호
     */
    @Column(name = "lib_no")
    private Long libNo = null;
}
