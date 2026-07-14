package com.trism.jesica.persistence.mysql.Entitiy.library;

import lombok.Data;

/**
 * 자료실
 */
@Data
public class LibraryUpdateReq {
    private String fileTitle;
    private String fileBody;
    private Integer dataStatus;
}
