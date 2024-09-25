package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbMannaCouponPublish is a Querydsl query type for TbMannaCouponPublish
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaCouponPublish extends EntityPathBase<TbMannaCouponPublish> {

    private static final long serialVersionUID = -1589369609L;

    public static final QTbMannaCouponPublish tbMannaCouponPublish = new QTbMannaCouponPublish("tbMannaCouponPublish");

    public final StringPath cpnCode = createString("cpnCode");

    public final NumberPath<Long> cpnNo = createNumber("cpnNo", Long.class);

    public final NumberPath<Integer> cpnStatus = createNumber("cpnStatus", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final StringPath insertUserId = createString("insertUserId");

    public final ListPath<TbMannaCouponRegist, QTbMannaCouponRegist> mannaCouponRegist = this.<TbMannaCouponRegist, QTbMannaCouponRegist>createList("mannaCouponRegist", TbMannaCouponRegist.class, QTbMannaCouponRegist.class, PathInits.DIRECT2);

    public final NumberPath<Long> publishNo = createNumber("publishNo", Long.class);

    public final NumberPath<Long> registMax = createNumber("registMax", Long.class);

    public final StringPath stCode = createString("stCode");

    public final NumberPath<Long> totalRegistMax = createNumber("totalRegistMax", Long.class);

    public QTbMannaCouponPublish(String variable) {
        super(TbMannaCouponPublish.class, forVariable(variable));
    }

    public QTbMannaCouponPublish(Path<? extends TbMannaCouponPublish> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaCouponPublish(PathMetadata metadata) {
        super(TbMannaCouponPublish.class, metadata);
    }

}

