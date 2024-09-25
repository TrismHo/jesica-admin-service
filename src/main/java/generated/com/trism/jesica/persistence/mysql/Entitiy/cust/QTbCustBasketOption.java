package com.trism.jesica.persistence.mysql.Entitiy.cust;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbCustBasketOption is a Querydsl query type for TbCustBasketOption
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCustBasketOption extends EntityPathBase<TbCustBasketOption> {

    private static final long serialVersionUID = -1046045461L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbCustBasketOption tbCustBasketOption = new QTbCustBasketOption("tbCustBasketOption");

    public final QTbCustBasket basket;

    public final NumberPath<Long> basketNo = createNumber("basketNo", Long.class);

    public final StringPath itemName = createString("itemName");

    public final NumberPath<Integer> itemNo = createNumber("itemNo", Integer.class);

    public final NumberPath<Integer> itemPrice = createNumber("itemPrice", Integer.class);

    public final StringPath optName = createString("optName");

    public final NumberPath<Long> storeOptNo = createNumber("storeOptNo", Long.class);

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbCustBasketOption(String variable) {
        this(TbCustBasketOption.class, forVariable(variable), INITS);
    }

    public QTbCustBasketOption(Path<? extends TbCustBasketOption> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbCustBasketOption(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbCustBasketOption(PathMetadata metadata, PathInits inits) {
        this(TbCustBasketOption.class, metadata, inits);
    }

    public QTbCustBasketOption(Class<? extends TbCustBasketOption> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.basket = inits.isInitialized("basket") ? new QTbCustBasket(forProperty("basket"), inits.get("basket")) : null;
    }

}

