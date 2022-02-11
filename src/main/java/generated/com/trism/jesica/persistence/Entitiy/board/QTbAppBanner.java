package com.trism.jesica.persistence.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbAppBanner is a Querydsl query type for TbAppBanner
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbAppBanner extends EntityPathBase<TbAppBanner> {

    private static final long serialVersionUID = -89631497L;

    public static final QTbAppBanner tbAppBanner = new QTbAppBanner("tbAppBanner");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath bannerFile = createString("bannerFile");

    public final NumberPath<Integer> bannerNo = createNumber("bannerNo", Integer.class);

    public final NumberPath<Long> boardNo = createNumber("boardNo", Long.class);

    public final NumberPath<Integer> boardType = createNumber("boardType", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public final NumberPath<Integer> viewYn = createNumber("viewYn", Integer.class);

    public QTbAppBanner(String variable) {
        super(TbAppBanner.class, forVariable(variable));
    }

    public QTbAppBanner(Path<? extends TbAppBanner> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbAppBanner(PathMetadata metadata) {
        super(TbAppBanner.class, metadata);
    }

}

