package com.trism.jesica.persistence.mysql.Entitiy.vacs;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbVacsVact is a Querydsl query type for TbVacsVact
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbVacsVact extends EntityPathBase<TbVacsVact> {

    private static final long serialVersionUID = 1040756332L;

    public static final QTbVacsVact tbVacsVact = new QTbVacsVact("tbVacsVact");

    public final StringPath acctNo = createString("acctNo");

    public final StringPath acctSt = createString("acctSt");

    public final StringPath bankCd = createString("bankCd");

    public final StringPath closeIl = createString("closeIl");

    public final StringPath cmfNm = createString("cmfNm");

    public final StringPath cmsCd = createString("cmsCd");

    public final StringPath fstIl = createString("fstIl");

    public final StringPath groupType = createString("groupType");

    public final StringPath lstIl = createString("lstIl");

    public final StringPath openIl = createString("openIl");

    public final StringPath orgCd = createString("orgCd");

    public final StringPath regIl = createString("regIl");

    public final NumberPath<java.math.BigDecimal> seqNo = createNumber("seqNo", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> trAmt = createNumber("trAmt", java.math.BigDecimal.class);

    public final StringPath tramtCond = createString("tramtCond");

    public final StringPath trbeginIl = createString("trbeginIl");

    public final StringPath trbeginSi = createString("trbeginSi");

    public final StringPath trendIl = createString("trendIl");

    public final StringPath trendSi = createString("trendSi");

    public final StringPath trmcCond = createString("trmcCond");

    public QTbVacsVact(String variable) {
        super(TbVacsVact.class, forVariable(variable));
    }

    public QTbVacsVact(Path<? extends TbVacsVact> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbVacsVact(PathMetadata metadata) {
        super(TbVacsVact.class, metadata);
    }

}

