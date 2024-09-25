package com.trism.jesica.persistence.mysql.Entitiy.event;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbEvent is a Querydsl query type for TbEvent
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbEvent extends EntityPathBase<TbEvent> {

    private static final long serialVersionUID = -1961709236L;

    public static final QTbEvent tbEvent = new QTbEvent("tbEvent");

    public final com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QCreatedDateEntity(this);

    public final StringPath appCode = createString("appCode");

    public final StringPath body = createString("body");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final DateTimePath<java.time.LocalDateTime> endDate = createDateTime("endDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> eventNo = createNumber("eventNo", Long.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> startDate = createDateTime("startDate", java.time.LocalDateTime.class);

    public final StringPath title = createString("title");

    public final NumberPath<Integer> viewYn = createNumber("viewYn", Integer.class);

    public QTbEvent(String variable) {
        super(TbEvent.class, forVariable(variable));
    }

    public QTbEvent(Path<? extends TbEvent> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbEvent(PathMetadata metadata) {
        super(TbEvent.class, metadata);
    }

}

