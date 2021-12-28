package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreOptionItem is a Querydsl query type for TbStoreOptionItem
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreOptionItem extends EntityPathBase<TbStoreOptionItem> {

    private static final long serialVersionUID = -1202717149L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreOptionItem tbStoreOptionItem = new QTbStoreOptionItem("tbStoreOptionItem");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath itemName = createString("itemName");

    public final NumberPath<Integer> itemPrice = createNumber("itemPrice", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.ItemStatus> itemStatus = createEnum("itemStatus", com.trism.jesica.persistence.type.ItemStatus.class);

    public final NumberPath<Integer> optItemNo = createNumber("optItemNo", Integer.class);

    public final QTbStoreOption storeOption;

    public final NumberPath<Long> storeOptNo = createNumber("storeOptNo", Long.class);

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbStoreOptionItem(String variable) {
        this(TbStoreOptionItem.class, forVariable(variable), INITS);
    }

    public QTbStoreOptionItem(Path<? extends TbStoreOptionItem> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreOptionItem(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreOptionItem(PathMetadata metadata, PathInits inits) {
        this(TbStoreOptionItem.class, metadata, inits);
    }

    public QTbStoreOptionItem(Class<? extends TbStoreOptionItem> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.storeOption = inits.isInitialized("storeOption") ? new QTbStoreOption(forProperty("storeOption"), inits.get("storeOption")) : null;
    }

}

