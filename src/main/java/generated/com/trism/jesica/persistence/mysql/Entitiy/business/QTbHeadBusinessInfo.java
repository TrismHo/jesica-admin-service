package com.trism.jesica.persistence.mysql.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbHeadBusinessInfo is a Querydsl query type for TbHeadBusinessInfo
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbHeadBusinessInfo extends EntityPathBase<TbHeadBusinessInfo> {

    private static final long serialVersionUID = 847856414L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbHeadBusinessInfo tbHeadBusinessInfo = new QTbHeadBusinessInfo("tbHeadBusinessInfo");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseBusinessInfoEntity _super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseBusinessInfoEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> authDate = _super.authDate;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.AuthStatus> authStatus = _super.authStatus;

    //inherited
    public final StringPath bizAddr = _super.bizAddr;

    //inherited
    public final StringPath bizEmail = _super.bizEmail;

    //inherited
    public final StringPath bizItem = _super.bizItem;

    //inherited
    public final StringPath bizName = _super.bizName;

    //inherited
    public final StringPath bizNum = _super.bizNum;

    //inherited
    public final StringPath bizOwner = _super.bizOwner;

    //inherited
    public final StringPath bizTel = _super.bizTel;

    //inherited
    public final StringPath bizType = _super.bizType;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.CorpType> corpType = _super.corpType;

    //inherited
    public final NumberPath<Long> groupNo = _super.groupNo;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.GroupType> groupType = _super.groupType;

    public final QTbHead head;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    //inherited
    public final StringPath insertUserId = _super.insertUserId;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    //inherited
    public final StringPath updateUserId = _super.updateUserId;

    public QTbHeadBusinessInfo(String variable) {
        this(TbHeadBusinessInfo.class, forVariable(variable), INITS);
    }

    public QTbHeadBusinessInfo(Path<? extends TbHeadBusinessInfo> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbHeadBusinessInfo(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbHeadBusinessInfo(PathMetadata metadata, PathInits inits) {
        this(TbHeadBusinessInfo.class, metadata, inits);
    }

    public QTbHeadBusinessInfo(Class<? extends TbHeadBusinessInfo> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.head = inits.isInitialized("head") ? new QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

