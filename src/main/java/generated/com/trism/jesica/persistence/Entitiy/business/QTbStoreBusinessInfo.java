package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStoreBusinessInfo is a Querydsl query type for TbStoreBusinessInfo
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStoreBusinessInfo extends EntityPathBase<TbStoreBusinessInfo> {

    private static final long serialVersionUID = -1091706445L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStoreBusinessInfo tbStoreBusinessInfo = new QTbStoreBusinessInfo("tbStoreBusinessInfo");

    public final com.trism.jesica.persistence.mappedsuper.QBaseBusinessInfoEntity _super = new com.trism.jesica.persistence.mappedsuper.QBaseBusinessInfoEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> authDate = _super.authDate;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.type.AuthStatus> authStatus = _super.authStatus;

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
    public final EnumPath<com.trism.jesica.persistence.type.CorpType> corpType = _super.corpType;

    //inherited
    public final NumberPath<Long> groupNo = _super.groupNo;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.type.GroupType> groupType = _super.groupType;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    //inherited
    public final StringPath insertUserId = _super.insertUserId;

    public final QTbStore store;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    //inherited
    public final StringPath updateUserId = _super.updateUserId;

    public QTbStoreBusinessInfo(String variable) {
        this(TbStoreBusinessInfo.class, forVariable(variable), INITS);
    }

    public QTbStoreBusinessInfo(Path<? extends TbStoreBusinessInfo> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStoreBusinessInfo(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStoreBusinessInfo(PathMetadata metadata, PathInits inits) {
        this(TbStoreBusinessInfo.class, metadata, inits);
    }

    public QTbStoreBusinessInfo(Class<? extends TbStoreBusinessInfo> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

