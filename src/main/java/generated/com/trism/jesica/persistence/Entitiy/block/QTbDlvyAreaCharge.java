package com.trism.jesica.persistence.Entitiy.block;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbDlvyAreaCharge is a Querydsl query type for TbDlvyAreaCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyAreaCharge extends EntityPathBase<TbDlvyAreaCharge> {

    private static final long serialVersionUID = 1558623355L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbDlvyAreaCharge tbDlvyAreaCharge = new QTbDlvyAreaCharge("tbDlvyAreaCharge");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    public final StringPath areaChargeName = createString("areaChargeName");

    public final NumberPath<Long> areaChargeNo = createNumber("areaChargeNo", Long.class);

    public final NumberPath<Integer> areaChargeType = createNumber("areaChargeType", Integer.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbBranch branch;

    public final NumberPath<Long> branchNo = createNumber("branchNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final com.trism.jesica.persistence.Entitiy.business.QTbHead head;

    public final NumberPath<Long> headNo = createNumber("headNo", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public QTbDlvyAreaCharge(String variable) {
        this(TbDlvyAreaCharge.class, forVariable(variable), INITS);
    }

    public QTbDlvyAreaCharge(Path<? extends TbDlvyAreaCharge> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbDlvyAreaCharge(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbDlvyAreaCharge(PathMetadata metadata, PathInits inits) {
        this(TbDlvyAreaCharge.class, metadata, inits);
    }

    public QTbDlvyAreaCharge(Class<? extends TbDlvyAreaCharge> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new com.trism.jesica.persistence.Entitiy.business.QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new com.trism.jesica.persistence.Entitiy.business.QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

