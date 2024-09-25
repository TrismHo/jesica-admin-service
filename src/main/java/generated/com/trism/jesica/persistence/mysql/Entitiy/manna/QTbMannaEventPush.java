package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaEventPush is a Querydsl query type for TbMannaEventPush
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaEventPush extends EntityPathBase<TbMannaEventPush> {

    private static final long serialVersionUID = -352682302L;

    public static final QTbMannaEventPush tbMannaEventPush = new QTbMannaEventPush("tbMannaEventPush");

    public final StringPath evDvryType = createString("evDvryType");

    public final DateTimePath<java.time.LocalDateTime> evEndDate = createDateTime("evEndDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> evntSeqNo = createNumber("evntSeqNo", Long.class);

    public final StringPath evOrdType = createString("evOrdType");

    public final StringPath evPrice = createString("evPrice");

    public final StringPath evPriceMax = createString("evPriceMax");

    public final DateTimePath<java.time.LocalDateTime> evStartDate = createDateTime("evStartDate", java.time.LocalDateTime.class);

    public final StringPath evTitle = createString("evTitle");

    public final StringPath evType = createString("evType");

    public final StringPath grCode = createString("grCode");

    public final StringPath grName = createString("grName");

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Long> logNo = createNumber("logNo", Long.class);

    public final StringPath param1 = createString("param1");

    public final StringPath param2 = createString("param2");

    public final StringPath param3 = createString("param3");

    public final NumberPath<Integer> sendCnt = createNumber("sendCnt", Integer.class);

    public QTbMannaEventPush(String variable) {
        super(TbMannaEventPush.class, forVariable(variable));
    }

    public QTbMannaEventPush(Path<? extends TbMannaEventPush> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaEventPush(PathMetadata metadata) {
        super(TbMannaEventPush.class, metadata);
    }

}

