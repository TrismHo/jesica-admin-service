package com.trism.jesica.persistence.mysql.Entitiy.service;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbServiceChargeGroup is a Querydsl query type for TbServiceChargeGroup
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbServiceChargeGroup extends EntityPathBase<TbServiceChargeGroup> {

    private static final long serialVersionUID = 145104009L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbServiceChargeGroup tbServiceChargeGroup = new QTbServiceChargeGroup("tbServiceChargeGroup");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranch branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final StringPath chargeName = createString("chargeName");

    public final NumberPath<Long> chargeNo = createNumber("chargeNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public QTbServiceChargeGroup(String variable) {
        this(TbServiceChargeGroup.class, forVariable(variable), INITS);
    }

    public QTbServiceChargeGroup(Path<? extends TbServiceChargeGroup> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbServiceChargeGroup(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbServiceChargeGroup(PathMetadata metadata, PathInits inits) {
        this(TbServiceChargeGroup.class, metadata, inits);
    }

    public QTbServiceChargeGroup(Class<? extends TbServiceChargeGroup> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.mysql.Entitiy.business.QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

