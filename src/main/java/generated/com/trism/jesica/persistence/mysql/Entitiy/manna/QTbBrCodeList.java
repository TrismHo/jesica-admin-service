package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbBrCodeList is a Querydsl query type for TbBrCodeList
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbBrCodeList extends EntityPathBase<TbBrCodeList> {

    private static final long serialVersionUID = -228260330L;

    public static final QTbBrCodeList tbBrCodeList = new QTbBrCodeList("tbBrCodeList");

    public final StringPath brCode = createString("brCode");

    public final StringPath brName = createString("brName");

    public final DateTimePath<java.time.LocalDateTime> modDate = createDateTime("modDate", java.time.LocalDateTime.class);

    public final StringPath modUserId = createString("modUserId");

    public final DateTimePath<java.time.LocalDateTime> putDate = createDateTime("putDate", java.time.LocalDateTime.class);

    public final StringPath putUserId = createString("putUserId");

    public final NumberPath<Long> use_yn = createNumber("use_yn", Long.class);

    public QTbBrCodeList(String variable) {
        super(TbBrCodeList.class, forVariable(variable));
    }

    public QTbBrCodeList(Path<? extends TbBrCodeList> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbBrCodeList(PathMetadata metadata) {
        super(TbBrCodeList.class, metadata);
    }

}

