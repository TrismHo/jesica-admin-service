package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbUserStaff is a Querydsl query type for TbUserStaff
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbUserStaff extends EntityPathBase<TbUserStaff> {

    private static final long serialVersionUID = -1458137223L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbUserStaff tbUserStaff = new QTbUserStaff("tbUserStaff");

    public final QTbUser _super = new QTbUser(this);

    public final StringPath blockTypeCode = createString("blockTypeCode");

    public final QTbBranch branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    //inherited
    public final StringPath insertUserId = _super.insertUserId;

    //inherited
    public final NumberPath<Integer> isFirstLogin = _super.isFirstLogin;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> lastLoginDtm = _super.lastLoginDtm;

    public final StringPath memo = createString("memo");

    public final StringPath name = createString("name");

    public final StringPath phone = createString("phone");

    //inherited
    public final BooleanPath pushMarketingYn = _super.pushMarketingYn;

    //inherited
    public final BooleanPath pushNoticeYn = _super.pushNoticeYn;

    //inherited
    public final BooleanPath pushOrderYn = _super.pushOrderYn;

    //inherited
    public final NumberPath<Integer> pwdFailCount = _super.pwdFailCount;

    //inherited
    public final DateTimePath<java.time.LocalDateTime> pwdUpdateDtm = _super.pwdUpdateDtm;

    public final QTbStore store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateUserId = createString("updateUserId");

    //inherited
    public final ListPath<TbUserDevice, QTbUserDevice> userDevices = _super.userDevices;

    //inherited
    public final StringPath userId = _super.userId;

    //inherited
    public final NumberPath<Long> userNo = _super.userNo;

    //inherited
    public final StringPath userPwd = _super.userPwd;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.type.UserType> userType = _super.userType;

    public QTbUserStaff(String variable) {
        this(TbUserStaff.class, forVariable(variable), INITS);
    }

    public QTbUserStaff(Path<? extends TbUserStaff> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbUserStaff(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbUserStaff(PathMetadata metadata, PathInits inits) {
        this(TbUserStaff.class, metadata, inits);
    }

    public QTbUserStaff(Class<? extends TbUserStaff> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.head = inits.isInitialized("head") ? new QTbHead(forProperty("head"), inits.get("head")) : null;
        this.store = inits.isInitialized("store") ? new QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

