package com.trism.jesica.persistence.mysql.mappedsuper;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QBaseBusinessInfoEntity is a Querydsl query type for BaseBusinessInfoEntity
 */
@Generated("com.querydsl.codegen.SupertypeSerializer")
public class QBaseBusinessInfoEntity extends EntityPathBase<BaseBusinessInfoEntity> {

    private static final long serialVersionUID = 1945540332L;

    public static final QBaseBusinessInfoEntity baseBusinessInfoEntity = new QBaseBusinessInfoEntity("baseBusinessInfoEntity");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final DateTimePath<java.time.LocalDateTime> authDate = createDateTime("authDate", java.time.LocalDateTime.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.AuthStatus> authStatus = createEnum("authStatus", com.trism.jesica.persistence.mysql.type.AuthStatus.class);

    public final StringPath bizAddr = createString("bizAddr");

    public final StringPath bizEmail = createString("bizEmail");

    public final StringPath bizItem = createString("bizItem");

    public final StringPath bizName = createString("bizName");

    public final StringPath bizNum = createString("bizNum");

    public final StringPath bizOwner = createString("bizOwner");

    public final StringPath bizTel = createString("bizTel");

    public final StringPath bizType = createString("bizType");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.CorpType> corpType = createEnum("corpType", com.trism.jesica.persistence.mysql.type.CorpType.class);

    public final NumberPath<Long> groupNo = createNumber("groupNo", Long.class);

    public final EnumPath<com.trism.jesica.persistence.mysql.type.GroupType> groupType = createEnum("groupType", com.trism.jesica.persistence.mysql.type.GroupType.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateUserId = createString("updateUserId");

    public QBaseBusinessInfoEntity(String variable) {
        super(BaseBusinessInfoEntity.class, forVariable(variable));
    }

    public QBaseBusinessInfoEntity(Path<? extends BaseBusinessInfoEntity> path) {
        super(path.getType(), path.getMetadata());
    }

    public QBaseBusinessInfoEntity(PathMetadata metadata) {
        super(BaseBusinessInfoEntity.class, metadata);
    }

}

