package com.trism.jesica.persistence.mysql.Entitiy.board;

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

    private static final long serialVersionUID = -922875733L;

    public static final QTbAppBanner tbAppBanner = new QTbAppBanner("tbAppBanner");

    public final StringPath appCode = createString("appCode");

    public final StringPath bannerFile = createString("bannerFile");

    public final NumberPath<Long> bannerNo = createNumber("bannerNo", Long.class);

    public final NumberPath<Integer> bannerType = createNumber("bannerType", Integer.class);

    public final NumberPath<Long> boardNo = createNumber("boardNo", Long.class);

    public final NumberPath<Integer> boardType = createNumber("boardType", Integer.class);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final StringPath langCode = createString("langCode");

    public final NumberPath<Integer> platformType = createNumber("platformType", Integer.class);

    public final StringPath schemeUrl = createString("schemeUrl");

    public final NumberPath<Integer> serviceType = createNumber("serviceType", Integer.class);

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

