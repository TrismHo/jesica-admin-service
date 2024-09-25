package com.trism.jesica.persistence.mysql.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbNoticeCompany is a Querydsl query type for TbNoticeCompany
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbNoticeCompany extends EntityPathBase<TbNoticeCompany> {

    private static final long serialVersionUID = -473093245L;

    public static final QTbNoticeCompany tbNoticeCompany = new QTbNoticeCompany("tbNoticeCompany");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final StringPath body = createString("body");

    public final EnumPath<com.trism.jesica.persistence.mysql.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.mysql.type.DataStatus.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final StringPath groupName = createString("groupName");

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath insertUserName = createString("insertUserName");

    public final NumberPath<Long> noticeNo = createNumber("noticeNo", Long.class);

    public final NumberPath<Integer> storeNo = createNumber("storeNo", Integer.class);

    public final StringPath title = createString("title");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewYn = createNumber("viewYn", Integer.class);

    public QTbNoticeCompany(String variable) {
        super(TbNoticeCompany.class, forVariable(variable));
    }

    public QTbNoticeCompany(Path<? extends TbNoticeCompany> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbNoticeCompany(PathMetadata metadata) {
        super(TbNoticeCompany.class, metadata);
    }

}

