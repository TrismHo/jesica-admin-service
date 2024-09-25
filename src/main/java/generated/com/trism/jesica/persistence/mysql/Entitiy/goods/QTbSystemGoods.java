package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbSystemGoods is a Querydsl query type for TbSystemGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSystemGoods extends EntityPathBase<TbSystemGoods> {

    private static final long serialVersionUID = -1034791083L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbSystemGoods tbSystemGoods = new QTbSystemGoods("tbSystemGoods");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath barcode = createString("barcode");

    public final StringPath catCode = createString("catCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final StringPath goodsDetail = createString("goodsDetail");

    public final StringPath goodsMemo = createString("goodsMemo");

    public final StringPath goodsName = createString("goodsName");

    public final NumberPath<Long> goodsNo = createNumber("goodsNo", Long.class);

    public final NumberPath<Integer> goodsPrice = createNumber("goodsPrice", Integer.class);

    public final StringPath imgFile1 = createString("imgFile1");

    public final StringPath imgFile2 = createString("imgFile2");

    public final StringPath imgFile3 = createString("imgFile3");

    public final StringPath imgFileSmall = createString("imgFileSmall");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final QTbSystemCategory systemCategory;

    public final BooleanPath taxYn = createBoolean("taxYn");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public QTbSystemGoods(String variable) {
        this(TbSystemGoods.class, forVariable(variable), INITS);
    }

    public QTbSystemGoods(Path<? extends TbSystemGoods> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbSystemGoods(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbSystemGoods(PathMetadata metadata, PathInits inits) {
        this(TbSystemGoods.class, metadata, inits);
    }

    public QTbSystemGoods(Class<? extends TbSystemGoods> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.systemCategory = inits.isInitialized("systemCategory") ? new QTbSystemCategory(forProperty("systemCategory")) : null;
    }

}

