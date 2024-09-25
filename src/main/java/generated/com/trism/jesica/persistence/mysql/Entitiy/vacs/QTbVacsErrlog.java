package com.trism.jesica.persistence.mysql.Entitiy.vacs;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbVacsErrlog is a Querydsl query type for TbVacsErrlog
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbVacsErrlog extends EntityPathBase<TbVacsErrlog> {

    private static final long serialVersionUID = -1031097905L;

    public static final QTbVacsErrlog tbVacsErrlog = new QTbVacsErrlog("tbVacsErrlog");

    public final StringPath acntNo = createString("acntNo");

    public final StringPath bankCd = createString("bankCd");

    public final StringPath errCd = createString("errCd");

    public final NumberPath<Long> errNo = createNumber("errNo", Long.class);

    public final StringPath orgCd = createString("orgCd");

    public final NumberPath<java.math.BigDecimal> trAmt = createNumber("trAmt", java.math.BigDecimal.class);

    public final StringPath trIl = createString("trIl");

    public final StringPath trNo = createString("trNo");

    public final StringPath trSi = createString("trSi");

    public QTbVacsErrlog(String variable) {
        super(TbVacsErrlog.class, forVariable(variable));
    }

    public QTbVacsErrlog(Path<? extends TbVacsErrlog> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbVacsErrlog(PathMetadata metadata) {
        super(TbVacsErrlog.class, metadata);
    }

}

