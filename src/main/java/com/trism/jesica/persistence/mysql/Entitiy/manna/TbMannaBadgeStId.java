package com.trism.jesica.persistence.mysql.Entitiy.manna;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.io.Serializable;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class TbMannaBadgeStId implements Serializable {

    private static final long serialVersionUID = 1L;

    private Long badgeFileNo;

    private String stCode;
}
