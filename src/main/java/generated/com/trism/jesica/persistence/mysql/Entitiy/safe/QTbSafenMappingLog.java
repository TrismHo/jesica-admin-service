package com.trism.jesica.persistence.mysql.Entitiy.safe;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSafenMappingLog is a Querydsl query type for TbSafenMappingLog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSafenMappingLog extends EntityPathBase<TbSafenMappingLog> {

    private static final long serialVersionUID = 1954839284L;

    public static final QTbSafenMappingLog tbSafenMappingLog = new QTbSafenMappingLog("tbSafenMappingLog");

    public final DateTimePath<java.time.LocalDateTime> limitedDate = createDateTime("limitedDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath mappingNum = createString("mappingNum");

    public final StringPath result = createString("result");

    public final DateTimePath<java.time.LocalDateTime> returnDate = createDateTime("returnDate", java.time.LocalDateTime.class);

    public final StringPath safenNum = createString("safenNum");

    public final DateTimePath<java.time.LocalDateTime> sendDate = createDateTime("sendDate", java.time.LocalDateTime.class);

    public QTbSafenMappingLog(String variable) {
        super(TbSafenMappingLog.class, forVariable(variable));
    }

    public QTbSafenMappingLog(Path<? extends TbSafenMappingLog> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSafenMappingLog(PathMetadata metadata) {
        super(TbSafenMappingLog.class, metadata);
    }

}

