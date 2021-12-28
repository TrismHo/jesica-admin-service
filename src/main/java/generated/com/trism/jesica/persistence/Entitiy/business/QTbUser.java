package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbUser is a Querydsl query type for TbUser
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbUser extends EntityPathBase<TbUser> {

    private static final long serialVersionUID = 2085972903L;

    public static final QTbUser tbUser = new QTbUser("tbUser");

    public final com.trism.jesica.persistence.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.core.entity.QCreatedDateEntity(this);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> isFirstLogin = createNumber("isFirstLogin", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> lastLoginDtm = createDateTime("lastLoginDtm", java.time.LocalDateTime.class);

    public final BooleanPath pushMarketingYn = createBoolean("pushMarketingYn");

    public final BooleanPath pushNoticeYn = createBoolean("pushNoticeYn");

    public final BooleanPath pushOrderYn = createBoolean("pushOrderYn");

    public final NumberPath<Integer> pwdFailCount = createNumber("pwdFailCount", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> pwdUpdateDtm = createDateTime("pwdUpdateDtm", java.time.LocalDateTime.class);

    public final ListPath<TbUserDevice, QTbUserDevice> userDevices = this.<TbUserDevice, QTbUserDevice>createList("userDevices", TbUserDevice.class, QTbUserDevice.class, PathInits.DIRECT2);

    public final StringPath userId = createString("userId");

    public final NumberPath<Long> userNo = createNumber("userNo", Long.class);

    public final StringPath userPwd = createString("userPwd");

    public final EnumPath<com.trism.jesica.persistence.type.UserType> userType = createEnum("userType", com.trism.jesica.persistence.type.UserType.class);

    public QTbUser(String variable) {
        super(TbUser.class, forVariable(variable));
    }

    public QTbUser(Path<? extends TbUser> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbUser(PathMetadata metadata) {
        super(TbUser.class, metadata);
    }

}

