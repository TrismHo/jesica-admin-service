package com.trism.jesica.persistence.mysql.Entitiy.vacs;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbVacsTotl is a Querydsl query type for TbVacsTotl
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbVacsTotl extends EntityPathBase<TbVacsTotl> {

    private static final long serialVersionUID = 1040710723L;

    public static final QTbVacsTotl tbVacsTotl = new QTbVacsTotl("tbVacsTotl");

    public final NumberPath<java.math.BigDecimal> authCnt = createNumber("authCnt", java.math.BigDecimal.class);

    public final StringPath bankCd = createString("bankCd");

    public final NumberPath<java.math.BigDecimal> caninpAmt = createNumber("caninpAmt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> caninpCnt = createNumber("caninpCnt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> canoutAmt = createNumber("canoutAmt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> canoutCnt = createNumber("canoutCnt", java.math.BigDecimal.class);

    public final StringPath lstIl = createString("lstIl");

    public final NumberPath<java.math.BigDecimal> nameCnt = createNumber("nameCnt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> norinpAmt = createNumber("norinpAmt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> norinpCnt = createNumber("norinpCnt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> noroutAmt = createNumber("noroutAmt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> noroutCnt = createNumber("noroutCnt", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> norqueCnt = createNumber("norqueCnt", java.math.BigDecimal.class);

    public final StringPath orgCd = createString("orgCd");

    public final StringPath trIl = createString("trIl");

    public final NumberPath<java.math.BigDecimal> umsCnt = createNumber("umsCnt", java.math.BigDecimal.class);

    public QTbVacsTotl(String variable) {
        super(TbVacsTotl.class, forVariable(variable));
    }

    public QTbVacsTotl(Path<? extends TbVacsTotl> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbVacsTotl(PathMetadata metadata) {
        super(TbVacsTotl.class, metadata);
    }

}

