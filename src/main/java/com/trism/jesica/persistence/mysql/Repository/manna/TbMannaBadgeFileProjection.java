package com.trism.jesica.persistence.mysql.projection;

import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaBadgeFile;

public interface TbMannaBadgeFileProjection {

    TbMannaBadgeFile getBadgeFile();

    Long getBadgeStCount();
}
