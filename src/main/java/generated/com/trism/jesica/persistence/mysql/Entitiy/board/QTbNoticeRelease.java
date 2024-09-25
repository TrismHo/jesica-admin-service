package com.trism.jesica.persistence.mysql.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbNoticeRelease is a Querydsl query type for TbNoticeRelease
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbNoticeRelease extends EntityPathBase<TbNoticeRelease> {

    private static final long serialVersionUID = -332982515L;

    public static final QTbNoticeRelease tbNoticeRelease = new QTbNoticeRelease("tbNoticeRelease");

    public final StringPath body = createString("body");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> noticeNo = createNumber("noticeNo", Long.class);

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final NumberPath<Integer> programType = createNumber("programType", Integer.class);

    public final StringPath title = createString("title");

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public final StringPath updateUserId = createString("updateUserId");

    public QTbNoticeRelease(String variable) {
        super(TbNoticeRelease.class, forVariable(variable));
    }

    public QTbNoticeRelease(Path<? extends TbNoticeRelease> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbNoticeRelease(PathMetadata metadata) {
        super(TbNoticeRelease.class, metadata);
    }

}

