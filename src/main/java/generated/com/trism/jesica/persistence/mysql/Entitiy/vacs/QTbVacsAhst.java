package com.trism.jesica.persistence.mysql.Entitiy.vacs;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbVacsAhst is a Querydsl query type for TbVacsAhst
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbVacsAhst extends EntityPathBase<TbVacsAhst> {

    private static final long serialVersionUID = 1040137944L;

    public static final QTbVacsAhst tbVacsAhst = new QTbVacsAhst("tbVacsAhst");

    public final StringPath bankCd = createString("bankCd");

    public final StringPath caninpSi = createString("caninpSi");

    public final StringPath cmsCd = createString("cmsCd");

    public final StringPath iacctNm = createString("iacctNm");

    public final StringPath iacctNo = createString("iacctNo");

    public final StringPath inpSi = createString("inpSi");

    public final StringPath inpSt = createString("inpSt");

    public final StringPath iorgCd = createString("iorgCd");

    public final StringPath mediaGb = createString("mediaGb");

    public final NumberPath<java.math.BigDecimal> mitaAmt = createNumber("mitaAmt", java.math.BigDecimal.class);

    public final StringPath orgCd = createString("orgCd");

    public final NumberPath<java.math.BigDecimal> trAmt = createNumber("trAmt", java.math.BigDecimal.class);

    public final StringPath trCd = createString("trCd");

    public final StringPath trIl = createString("trIl");

    public final StringPath trNo = createString("trNo");

    public final StringPath trSi = createString("trSi");

    public QTbVacsAhst(String variable) {
        super(TbVacsAhst.class, forVariable(variable));
    }

    public QTbVacsAhst(Path<? extends TbVacsAhst> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbVacsAhst(PathMetadata metadata) {
        super(TbVacsAhst.class, metadata);
    }

}

