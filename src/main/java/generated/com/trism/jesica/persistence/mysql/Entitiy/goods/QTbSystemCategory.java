package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbSystemCategory is a Querydsl query type for TbSystemCategory
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSystemCategory extends EntityPathBase<TbSystemCategory> {

    private static final long serialVersionUID = -258504545L;

    public static final QTbSystemCategory tbSystemCategory = new QTbSystemCategory("tbSystemCategory");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath catCode = createString("catCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.CatLevel> catLevel = createEnum("catLevel", com.trism.jesica.persistence.mysql.type.CatLevel.class);

    public final StringPath catName = createString("catName");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.CatType> catType = createEnum("catType", com.trism.jesica.persistence.mysql.type.CatType.class);

    public final StringPath catValue = createString("catValue");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath memo = createString("memo");

    public final StringPath parentCatCode = createString("parentCatCode");

    public final ListPath<TbStoreCategoryFo, QTbStoreCategoryFo> storeCategoryFos = this.<TbStoreCategoryFo, QTbStoreCategoryFo>createList("storeCategoryFos", TbStoreCategoryFo.class, QTbStoreCategoryFo.class, PathInits.DIRECT2);

    public final ListPath<TbSystemGoods, QTbSystemGoods> systemGoods = this.<TbSystemGoods, QTbSystemGoods>createList("systemGoods", TbSystemGoods.class, QTbSystemGoods.class, PathInits.DIRECT2);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbSystemCategory(String variable) {
        super(TbSystemCategory.class, forVariable(variable));
    }

    public QTbSystemCategory(Path<? extends TbSystemCategory> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSystemCategory(PathMetadata metadata) {
        super(TbSystemCategory.class, metadata);
    }

}

