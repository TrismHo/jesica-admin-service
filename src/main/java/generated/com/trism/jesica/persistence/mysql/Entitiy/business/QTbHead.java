package com.trism.jesica.persistence.mysql.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbHead is a Querydsl query type for TbHead
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbHead extends EntityPathBase<TbHead> {

    private static final long serialVersionUID = -467247504L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbHead tbHead = new QTbHead("tbHead");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath actualAddr = createString("actualAddr");

    public final StringPath actualOwner = createString("actualOwner");

    public final StringPath actualTel = createString("actualTel");

    public final StringPath authTel = createString("authTel");

    public final StringPath bankAccount = createString("bankAccount");

    public final StringPath bankOwner = createString("bankOwner");

    public final StringPath bankTypeCode = createString("bankTypeCode");

    public final ListPath<TbBranch, QTbBranch> branches = this.<TbBranch, QTbBranch>createList("branches", TbBranch.class, QTbBranch.class, PathInits.DIRECT2);

    public final QTbBrand brand;

    public final NumberPath<Integer> brandNo = createNumber("brandNo", Integer.class);

    public final QTbHeadBusinessInfo businessInfo;

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final NumberPath<Integer> cashDefault = createNumber("cashDefault", Integer.class);

    public final StringPath cybankAccount = createString("cybankAccount");

    public final StringPath cybankOwner = createString("cybankOwner");

    public final StringPath cybankTypeCode = createString("cybankTypeCode");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final NumberPath<Integer> deposit = createNumber("deposit", Integer.class);

    public final BooleanPath dlvyMngYn = createBoolean("dlvyMngYn");

    public final StringPath headName = createString("headName");

    public final NumberPath<Long> headNo = createNumber("headNo", Long.class);

    public final StringPath headTel = createString("headTel");

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

    public QTbHead(String variable) {
        this(TbHead.class, forVariable(variable), INITS);
    }

    public QTbHead(Path<? extends TbHead> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbHead(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbHead(PathMetadata metadata, PathInits inits) {
        this(TbHead.class, metadata, inits);
    }

    public QTbHead(Class<? extends TbHead> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.brand = inits.isInitialized("brand") ? new QTbBrand(forProperty("brand")) : null;
        this.businessInfo = inits.isInitialized("businessInfo") ? new QTbHeadBusinessInfo(forProperty("businessInfo"), inits.get("businessInfo")) : null;
    }

}

