package com.trism.jesica.persistence.oracle.Entity;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QMnA1Today is a Querydsl query type for MnA1Today
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QMnA1Today extends EntityPathBase<MnA1Today> {

    private static final long serialVersionUID = 1899410365L;

    public static final QMnA1Today mnA1Today = new QMnA1Today("mnA1Today");

    public final StringPath ordNo = createString("ordNo");

    public final StringPath putDate = createString("putDate");

    public QMnA1Today(String variable) {
        super(MnA1Today.class, forVariable(variable));
    }

    public QMnA1Today(Path<? extends MnA1Today> path) {
        super(path.getType(), path.getMetadata());
    }

    public QMnA1Today(PathMetadata metadata) {
        super(MnA1Today.class, metadata);
    }

}

