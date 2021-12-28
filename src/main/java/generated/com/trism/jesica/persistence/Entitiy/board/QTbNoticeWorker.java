package com.trism.jesica.persistence.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbNoticeWorker is a Querydsl query type for TbNoticeWorker
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbNoticeWorker extends EntityPathBase<TbNoticeWorker> {

    private static final long serialVersionUID = 1319381996L;

    public static final QTbNoticeWorker tbNoticeWorker = new QTbNoticeWorker("tbNoticeWorker");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath body = createString("body");

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final StringPath groupName = createString("groupName");

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath insertUserName = createString("insertUserName");

    public final NumberPath<Long> noticeNo = createNumber("noticeNo", Long.class);

    public final StringPath title = createString("title");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewYn = createNumber("viewYn", Integer.class);

    public QTbNoticeWorker(String variable) {
        super(TbNoticeWorker.class, forVariable(variable));
    }

    public QTbNoticeWorker(Path<? extends TbNoticeWorker> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbNoticeWorker(PathMetadata metadata) {
        super(TbNoticeWorker.class, metadata);
    }

}

