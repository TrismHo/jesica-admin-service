package com.trism.jesica.persistence.mysql.Entitiy.board;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbAppBannerLocation is a Querydsl query type for TbAppBannerLocation
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbAppBannerLocation extends EntityPathBase<TbAppBannerLocation> {

    private static final long serialVersionUID = -1923731072L;

    public static final QTbAppBannerLocation tbAppBannerLocation = new QTbAppBannerLocation("tbAppBannerLocation");

    public final StringPath addr1 = createString("addr1");

    public final StringPath addr2 = createString("addr2");

    public final NumberPath<Long> bannerNo = createNumber("bannerNo", Long.class);

    public final NumberPath<Long> bnrLocNo = createNumber("bnrLocNo", Long.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> updateDate = createDateTime("updateDate", java.time.LocalDateTime.class);

    public QTbAppBannerLocation(String variable) {
        super(TbAppBannerLocation.class, forVariable(variable));
    }

    public QTbAppBannerLocation(Path<? extends TbAppBannerLocation> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbAppBannerLocation(PathMetadata metadata) {
        super(TbAppBannerLocation.class, metadata);
    }

}

