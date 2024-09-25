package com.trism.jesica.persistence.mysql.Entitiy.system;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSiteMenu is a Querydsl query type for TbSiteMenu
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSiteMenu extends EntityPathBase<TbSiteMenu> {

    private static final long serialVersionUID = -1578785529L;

    public static final QTbSiteMenu tbSiteMenu = new QTbSiteMenu("tbSiteMenu");

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> menuGroup = createNumber("menuGroup", Integer.class);

    public final StringPath menuIcon = createString("menuIcon");

    public final NumberPath<Integer> menuLevel = createNumber("menuLevel", Integer.class);

    public final StringPath menuName = createString("menuName");

    public final NumberPath<Long> menuNo = createNumber("menuNo", Long.class);

    public final StringPath menuUrl = createString("menuUrl");

    public final NumberPath<Integer> visibleLevel = createNumber("visibleLevel", Integer.class);

    public QTbSiteMenu(String variable) {
        super(TbSiteMenu.class, forVariable(variable));
    }

    public QTbSiteMenu(Path<? extends TbSiteMenu> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSiteMenu(PathMetadata metadata) {
        super(TbSiteMenu.class, metadata);
    }

}

