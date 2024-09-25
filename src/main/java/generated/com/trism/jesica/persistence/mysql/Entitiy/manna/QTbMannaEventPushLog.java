package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaEventPushLog is a Querydsl query type for TbMannaEventPushLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaEventPushLog extends EntityPathBase<TbMannaEventPushLog> {

    private static final long serialVersionUID = -1268376286L;

    public static final QTbMannaEventPushLog tbMannaEventPushLog = new QTbMannaEventPushLog("tbMannaEventPushLog");

    public final NumberPath<Long> custNo = createNumber("custNo", Long.class);

    public final StringPath custTel = createString("custTel");

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> openDate = createDateTime("openDate", java.time.LocalDateTime.class);

    public QTbMannaEventPushLog(String variable) {
        super(TbMannaEventPushLog.class, forVariable(variable));
    }

    public QTbMannaEventPushLog(Path<? extends TbMannaEventPushLog> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaEventPushLog(PathMetadata metadata) {
        super(TbMannaEventPushLog.class, metadata);
    }

}

