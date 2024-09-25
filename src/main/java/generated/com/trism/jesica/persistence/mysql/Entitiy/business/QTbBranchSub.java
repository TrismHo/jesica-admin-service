package com.trism.jesica.persistence.mysql.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbBranchSub is a Querydsl query type for TbBranchSub
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbBranchSub extends EntityPathBase<TbBranchSub> {

    private static final long serialVersionUID = -842273106L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbBranchSub tbBranchSub = new QTbBranchSub("tbBranchSub");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath actualAddr = createString("actualAddr");

    public final StringPath actualOwner = createString("actualOwner");

    public final StringPath actualTel = createString("actualTel");

    public final StringPath authTel = createString("authTel");

    public final StringPath bankAccount = createString("bankAccount");

    public final StringPath bankOwner = createString("bankOwner");

    public final StringPath bankTypeCode = createString("bankTypeCode");

    public final StringPath branchName = createString("branchName");

    public final NumberPath<Long> branchNo = createNumber("branchNo", Long.class);

    public final StringPath branchTel = createString("branchTel");

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final NumberPath<Integer> cashDefault = createNumber("cashDefault", Integer.class);

    public final StringPath cybankAccount = createString("cybankAccount");

    public final StringPath cybankOwner = createString("cybankOwner");

    public final StringPath cybankTypeCode = createString("cybankTypeCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final NumberPath<Integer> deposit = createNumber("deposit", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final QTbHeadSub head;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath memoArea = createString("memoArea");

    public final StringPath memoEtc = createString("memoEtc");

    public final StringPath memoService = createString("memoService");

    public final StringPath pinNum = createString("pinNum");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.ServiceYn> serviceYn = createEnum("serviceYn", com.trism.jesica.persistence.mysql.type.ServiceYn.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public QTbBranchSub(String variable) {
        this(TbBranchSub.class, forVariable(variable), INITS);
    }

    public QTbBranchSub(Path<? extends TbBranchSub> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbBranchSub(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbBranchSub(PathMetadata metadata, PathInits inits) {
        this(TbBranchSub.class, metadata, inits);
    }

    public QTbBranchSub(Class<? extends TbBranchSub> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.head = inits.isInitialized("head") ? new QTbHeadSub(forProperty("head"), inits.get("head")) : null;
    }

}

