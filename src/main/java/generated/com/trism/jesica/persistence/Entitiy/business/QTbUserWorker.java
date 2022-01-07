package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbUserWorker is a Querydsl query type for TbUserWorker
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbUserWorker extends EntityPathBase<TbUserWorker> {

    private static final long serialVersionUID = -2142170619L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbUserWorker tbUserWorker = new QTbUserWorker("tbUserWorker");

    public final QTbUser _super = new QTbUser(this);

    public final StringPath addr = createString("addr");

    public final EnumPath<com.trism.jesica.persistence.type.AttendStatusType> attendStatus = createEnum("attendStatus", com.trism.jesica.persistence.type.AttendStatusType.class);

    public final StringPath bankAccount = createString("bankAccount");

    public final StringPath bankOwner = createString("bankOwner");

    public final StringPath bankTypeCode = createString("bankTypeCode");

    public final StringPath blockTypeCode = createString("blockTypeCode");

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final NumberPath<Integer> cashDefault = createNumber("cashDefault", Integer.class);

    public final StringPath cybankAccount = createString("cybankAccount");

    public final StringPath cybankTypeCode = createString("cybankTypeCode");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final NumberPath<Integer> deposit = createNumber("deposit", Integer.class);

    public final StringPath gender = createString("gender");

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    //inherited
    public final StringPath insertUserId = _super.insertUserId;

    //inherited
    public final NumberPath<Integer> isFirstLogin = _super.isFirstLogin;

    public final StringPath joinDate = createString("joinDate");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> lastLoginDtm = _super.lastLoginDtm;

    public final StringPath licenseExpDate = createString("licenseExpDate");

    public final NumberPath<Integer> licenseExpYn = createNumber("licenseExpYn", Integer.class);

    public final StringPath licenseFile = createString("licenseFile");

    public final StringPath licenseNum = createString("licenseNum");

    public final StringPath licenseType = createString("licenseType");

    public final StringPath memo = createString("memo");

    public final StringPath name = createString("name");

    public final StringPath phone = createString("phone");

    public final StringPath pinNum = createString("pinNum");

    public final StringPath profileFile = createString("profileFile");

    public final StringPath profileFileSmall = createString("profileFileSmall");

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

    public final StringPath registNum = createString("registNum");

    public final StringPath retireDate = createString("retireDate");

    public final QTbStore store;

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

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

    public final NumberPath<Integer> workerPayType = createNumber("workerPayType", Integer.class);

    public QTbUserWorker(String variable) {
        this(TbUserWorker.class, forVariable(variable), INITS);
    }

    public QTbUserWorker(Path<? extends TbUserWorker> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbUserWorker(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbUserWorker(PathMetadata metadata, PathInits inits) {
        this(TbUserWorker.class, metadata, inits);
    }

    public QTbUserWorker(Class<? extends TbUserWorker> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.store = inits.isInitialized("store") ? new QTbStore(forProperty("store"), inits.get("store")) : null;
    }

}

