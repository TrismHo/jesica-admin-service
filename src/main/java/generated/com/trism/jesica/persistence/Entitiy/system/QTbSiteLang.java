package com.trism.jesica.persistence.Entitiy.system;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbSiteLang is a Querydsl query type for TbSiteLang
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbSiteLang extends EntityPathBase<TbSiteLang> {

    private static final long serialVersionUID = -745574942L;

    public static final QTbSiteLang tbSiteLang = new QTbSiteLang("tbSiteLang");

    public final BooleanPath tslActive = createBoolean("tslActive");

    public final StringPath tslComment = createString("tslComment");

    public final NumberPath<Long> tslId = createNumber("tslId", Long.class);

    public final DateTimePath<java.time.LocalDateTime> tslInsertDtm = createDateTime("tslInsertDtm", java.time.LocalDateTime.class);

    public final StringPath tslKeyFour = createString("tslKeyFour");

    public final StringPath tslKeyGroup = createString("tslKeyGroup");

    public final StringPath tslKeyOne = createString("tslKeyOne");

    public final StringPath tslKeyThree = createString("tslKeyThree");

    public final StringPath tslKeyTwo = createString("tslKeyTwo");

    public final StringPath tslMemo = createString("tslMemo");

    public final NumberPath<Byte> tslMenuType = createNumber("tslMenuType", Byte.class);

    public final StringPath tslName = createString("tslName");

    public final NumberPath<Byte> tslType = createNumber("tslType", Byte.class);

    public final DateTimePath<java.time.LocalDateTime> tslUpdateDtm = createDateTime("tslUpdateDtm", java.time.LocalDateTime.class);

    public final StringPath tslValueEn = createString("tslValueEn");

    public final StringPath tslValueKh = createString("tslValueKh");

    public final StringPath tslValueKo = createString("tslValueKo");

    public QTbSiteLang(String variable) {
        super(TbSiteLang.class, forVariable(variable));
    }

    public QTbSiteLang(Path<? extends TbSiteLang> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbSiteLang(PathMetadata metadata) {
        super(TbSiteLang.class, metadata);
    }

}

