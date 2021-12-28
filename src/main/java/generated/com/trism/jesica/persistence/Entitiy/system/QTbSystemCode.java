package com.trism.jesica.persistence.Entitiy.system;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSystemCode is a Querydsl query type for TbSystemCode
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSystemCode extends EntityPathBase<TbSystemCode> {

    private static final long serialVersionUID = 1317902729L;

    public static final QTbSystemCode tbSystemCode = new QTbSystemCode("tbSystemCode");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath codeName = createString("codeName");

    public final StringPath codeValue = createString("codeValue");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath memo = createString("memo");

    public final StringPath sysCode = createString("sysCode");

    public final StringPath sysName = createString("sysName");

    public final StringPath sysType = createString("sysType");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbSystemCode(String variable) {
        super(TbSystemCode.class, forVariable(variable));
    }

    public QTbSystemCode(Path<? extends TbSystemCode> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSystemCode(PathMetadata metadata) {
        super(TbSystemCode.class, metadata);
    }

}

