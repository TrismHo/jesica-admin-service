package com.trism.jesica.persistence.mysql.Entitiy.car;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreRentalCar is a Querydsl query type for TbStoreRentalCar
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreRentalCar extends EntityPathBase<TbStoreRentalCar> {

    private static final long serialVersionUID = 3966659L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreRentalCar tbStoreRentalCar = new QTbStoreRentalCar("tbStoreRentalCar");

    public final StringPath carModel = createString("carModel");

    public final StringPath carNum = createString("carNum");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> rentalCarNo = createNumber("rentalCarNo", Integer.class);

    public final StringPath safenNum = createString("safenNum");

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public QTbStoreRentalCar(String variable) {
        this(TbStoreRentalCar.class, forVariable(variable), INITS);
    }

    public QTbStoreRentalCar(Path<? extends TbStoreRentalCar> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreRentalCar(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreRentalCar(PathMetadata metadata, PathInits inits) {
        this(TbStoreRentalCar.class, metadata, inits);
    }

    public QTbStoreRentalCar(Class<? extends TbStoreRentalCar> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

