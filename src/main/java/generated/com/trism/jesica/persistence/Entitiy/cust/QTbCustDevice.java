package com.trism.jesica.persistence.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustDevice is a Querydsl query type for TbCustDevice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustDevice extends EntityPathBase<TbCustDevice> {

    private static final long serialVersionUID = 990335410L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustDevice tbCustDevice = new QTbCustDevice("tbCustDevice");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    public final NumberPath<Integer> appVer = createNumber("appVer", Integer.class);

    public final QTbCust cust;

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final StringPath deviceId = createString("deviceId");

    public final StringPath deviceName = createString("deviceName");

    public final StringPath deviceOsVer = createString("deviceOsVer");

    public final EnumPath<com.trism.jesica.persistence.type.DeviceType> deviceType = createEnum("deviceType", com.trism.jesica.persistence.type.DeviceType.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final DateTimePath<java.time.LocalDateTime> lastLoginDate = createDateTime("lastLoginDate", java.time.LocalDateTime.class);

    public final StringPath loginKey = createString("loginKey");

    public final EnumPath<com.trism.jesica.persistence.type.LoginType> loginType = createEnum("loginType", com.trism.jesica.persistence.type.LoginType.class);

    public final StringPath pushKey = createString("pushKey");

    public QTbCustDevice(String variable) {
        this(TbCustDevice.class, forVariable(variable), INITS);
    }

    public QTbCustDevice(Path<? extends TbCustDevice> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustDevice(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustDevice(PathMetadata metadata, PathInits inits) {
        this(TbCustDevice.class, metadata, inits);
    }

    public QTbCustDevice(Class<? extends TbCustDevice> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.cust = inits.isInitialized("cust") ? new QTbCust(forProperty("cust"), inits.get("cust")) : null;
    }

}

