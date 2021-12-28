package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreOption is a Querydsl query type for TbStoreOption
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreOption extends EntityPathBase<TbStoreOption> {

    private static final long serialVersionUID = 459933424L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreOption tbStoreOption = new QTbStoreOption("tbStoreOption");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final BooleanPath mandatoryYn = createBoolean("mandatoryYn");

    public final NumberPath<Integer> maxSelectCnt = createNumber("maxSelectCnt", Integer.class);

    public final NumberPath<Integer> minSelectCnt = createNumber("minSelectCnt", Integer.class);

    public final StringPath optName = createString("optName");

    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final ListPath<TbStoreOptionItem, QTbStoreOptionItem> storeOptions = this.<TbStoreOptionItem, QTbStoreOptionItem>createList("storeOptions", TbStoreOptionItem.class, QTbStoreOptionItem.class, PathInits.DIRECT2);

    public final NumberPath<Long> storeOptNo = createNumber("storeOptNo", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public QTbStoreOption(String variable) {
        this(TbStoreOption.class, forVariable(variable), INITS);
    }

    public QTbStoreOption(Path<? extends TbStoreOption> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreOption(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreOption(PathMetadata metadata, PathInits inits) {
        this(TbStoreOption.class, metadata, inits);
    }

    public QTbStoreOption(Class<? extends TbStoreOption> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

