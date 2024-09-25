package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaCoupon is a Querydsl query type for TbMannaCoupon
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaCoupon extends EntityPathBase<TbMannaCoupon> {

    private static final long serialVersionUID = 805800184L;

    public static final QTbMannaCoupon tbMannaCoupon = new QTbMannaCoupon("tbMannaCoupon");

    public final NumberPath<Long> cpnNo = createNumber("cpnNo", Long.class);

    public final StringPath cpnTitle = createString("cpnTitle");

    public final StringPath cpnUseYn = createString("cpnUseYn");

    public final DateTimePath<java.time.LocalDateTime> periodE = createDateTime("periodE", java.time.LocalDateTime.class);

    public final DateTimePath<java.time.LocalDateTime> periodS = createDateTime("periodS", java.time.LocalDateTime.class);

    public QTbMannaCoupon(String variable) {
        super(TbMannaCoupon.class, forVariable(variable));
    }

    public QTbMannaCoupon(Path<? extends TbMannaCoupon> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaCoupon(PathMetadata metadata) {
        super(TbMannaCoupon.class, metadata);
    }

}

