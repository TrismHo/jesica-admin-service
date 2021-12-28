package com.trism.jesica.persistence.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbNoticePlatform is a Querydsl query type for TbNoticePlatform
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbNoticePlatform extends EntityPathBase<TbNoticePlatform> {

    private static final long serialVersionUID = -1544888991L;

    public static final QTbNoticePlatform tbNoticePlatform = new QTbNoticePlatform("tbNoticePlatform");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath body = createString("body");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Long> noticeNo = createNumber("noticeNo", Long.class);

    public final StringPath title = createString("title");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewYn = createNumber("viewYn", Integer.class);

    public QTbNoticePlatform(String variable) {
        super(TbNoticePlatform.class, forVariable(variable));
    }

    public QTbNoticePlatform(Path<? extends TbNoticePlatform> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbNoticePlatform(PathMetadata metadata) {
        super(TbNoticePlatform.class, metadata);
    }

}

