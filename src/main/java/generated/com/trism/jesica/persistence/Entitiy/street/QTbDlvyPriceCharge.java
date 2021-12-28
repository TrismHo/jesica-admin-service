package com.trism.jesica.persistence.Entitiy.street;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbDlvyPriceCharge is a Querydsl query type for TbDlvyPriceCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyPriceCharge extends EntityPathBase<TbDlvyPriceCharge> {

    private static final long serialVersionUID = -1829168327L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbDlvyPriceCharge tbDlvyPriceCharge = new QTbDlvyPriceCharge("tbDlvyPriceCharge");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranch branch;

    public final NumberPath<Long> branchNo = createNumber("branchNo", Long.class);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbHead head;

    public final NumberPath<Long> headNo = createNumber("headNo", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath priceChargeName = createString("priceChargeName");

    public final NumberPath<Long> priceChargeNo = createNumber("priceChargeNo", Long.class);

    public QTbDlvyPriceCharge(String variable) {
        this(TbDlvyPriceCharge.class, forVariable(variable), INITS);
    }

    public QTbDlvyPriceCharge(Path<? extends TbDlvyPriceCharge> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbDlvyPriceCharge(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbDlvyPriceCharge(PathMetadata metadata, PathInits inits) {
        this(TbDlvyPriceCharge.class, metadata, inits);
    }

    public QTbDlvyPriceCharge(Class<? extends TbDlvyPriceCharge> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.Entitiy.business.QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

