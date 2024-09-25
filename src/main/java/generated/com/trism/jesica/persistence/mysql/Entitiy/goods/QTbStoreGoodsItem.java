package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreGoodsItem is a Querydsl query type for TbStoreGoodsItem
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreGoodsItem extends EntityPathBase<TbStoreGoodsItem> {

    private static final long serialVersionUID = -1576725510L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreGoodsItem tbStoreGoodsItem = new QTbStoreGoodsItem("tbStoreGoodsItem");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> basicItemNo = createNumber("basicItemNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath itemName = createString("itemName");

    public final NumberPath<Integer> itemPrice = createNumber("itemPrice", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.ItemStatus> itemStatus = createEnum("itemStatus", com.trism.jesica.persistence.mysql.type.ItemStatus.class);

    public final QTbStoreGoods storeGoods;

    public final NumberPath<Long> storeGoodsNo = createNumber("storeGoodsNo", Long.class);

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbStoreGoodsItem(String variable) {
        this(TbStoreGoodsItem.class, forVariable(variable), INITS);
    }

    public QTbStoreGoodsItem(Path<? extends TbStoreGoodsItem> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreGoodsItem(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreGoodsItem(PathMetadata metadata, PathInits inits) {
        this(TbStoreGoodsItem.class, metadata, inits);
    }

    public QTbStoreGoodsItem(Class<? extends TbStoreGoodsItem> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.storeGoods = inits.isInitialized("storeGoods") ? new QTbStoreGoods(forProperty("storeGoods"), inits.get("storeGoods")) : null;
    }

}

