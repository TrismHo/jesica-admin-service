package com.trism.jesica.persistence.mysql.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreGoodsOption is a Querydsl query type for TbStoreGoodsOption
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreGoodsOption extends EntityPathBase<TbStoreGoodsOption> {

    private static final long serialVersionUID = 1058767772L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreGoodsOption tbStoreGoodsOption = new QTbStoreGoodsOption("tbStoreGoodsOption");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final QTbStoreGoods storeGoods;

    public final QTbStoreOption storeOption;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbStoreGoodsOption(String variable) {
        this(TbStoreGoodsOption.class, forVariable(variable), INITS);
    }

    public QTbStoreGoodsOption(Path<? extends TbStoreGoodsOption> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreGoodsOption(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreGoodsOption(PathMetadata metadata, PathInits inits) {
        this(TbStoreGoodsOption.class, metadata, inits);
    }

    public QTbStoreGoodsOption(Class<? extends TbStoreGoodsOption> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.storeGoods = inits.isInitialized("storeGoods") ? new QTbStoreGoods(forProperty("storeGoods"), inits.get("storeGoods")) : null;
        this.storeOption = inits.isInitialized("storeOption") ? new QTbStoreOption(forProperty("storeOption"), inits.get("storeOption")) : null;
    }

}

