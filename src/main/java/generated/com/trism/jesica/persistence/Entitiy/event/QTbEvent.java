package com.trism.jesica.persistence.Entitiy.event;

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

    private static final long serialVersionUID = 1325859736L;

    public static final QTbEvent tbEvent = new QTbEvent("tbEvent");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath body = createString("body");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final DateTimePath<java.sql.Timestamp> endDate = createDateTime("endDate", java.sql.Timestamp.class);

    public final NumberPath<Long> eventId = createNumber("eventId", Long.class);

    public final StringPath imgFileSmall = createString("imgFileSmall");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final DateTimePath<java.sql.Timestamp> startDate = createDateTime("startDate", java.sql.Timestamp.class);

    public final StringPath title = createString("title");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewServiceType = createNumber("viewServiceType", Integer.class);

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

