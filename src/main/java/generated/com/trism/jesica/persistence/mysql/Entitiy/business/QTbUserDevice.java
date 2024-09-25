package com.trism.jesica.persistence.mysql.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbUserDevice is a Querydsl query type for TbUserDevice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbUserDevice extends EntityPathBase<TbUserDevice> {

    private static final long serialVersionUID = -544827759L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbUserDevice tbUserDevice = new QTbUserDevice("tbUserDevice");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath appCode = createString("appCode");

    public final NumberPath<Integer> appVer = createNumber("appVer", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final StringPath deviceId = createString("deviceId");

    public final StringPath deviceName = createString("deviceName");

    public final StringPath deviceOsVer = createString("deviceOsVer");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DeviceType> deviceType = createEnum("deviceType", com.trism.jesica.persistence.mysql.type.DeviceType.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final DateTimePath<java.time.LocalDateTime> lastLoginDate = createDateTime("lastLoginDate", java.time.LocalDateTime.class);

    public final StringPath loginKey = createString("loginKey");

    public final StringPath pushKey = createString("pushKey");

    public final QTbUser user;

    public QTbUserDevice(String variable) {
        this(TbUserDevice.class, forVariable(variable), INITS);
    }

    public QTbUserDevice(Path<? extends TbUserDevice> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbUserDevice(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbUserDevice(PathMetadata metadata, PathInits inits) {
        this(TbUserDevice.class, metadata, inits);
    }

    public QTbUserDevice(Class<? extends TbUserDevice> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.user = inits.isInitialized("user") ? new QTbUser(forProperty("user")) : null;
    }

}

