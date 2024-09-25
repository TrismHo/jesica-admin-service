package com.trism.jesica.persistence.mysql.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderAllGoods is a Querydsl query type for TbOrderAllGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderAllGoods extends EntityPathBase<TbOrderAllGoods> {

    private static final long serialVersionUID = -2122292983L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderAllGoods tbOrderAllGoods = new QTbOrderAllGoods("tbOrderAllGoods");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderGoodsEntity _super;

    //inherited
    public final StringPath basicItemName;

    //inherited
    public final NumberPath<Integer> basicItemNo;

    //inherited
    public final BooleanPath dataStatus;

    //inherited
    public final NumberPath<Integer> goodsCnt;

    //inherited
    public final StringPath goodsName;

    //inherited
    public final NumberPath<Integer> goodsPrice;

    //inherited
    public final EnumPath<com.trism.jesica.persistence.mysql.type.GoodsType> goodsType;

    public final QTbOrderAll order;

    //inherited
    public final NumberPath<Long> orderGoodsNo;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.business.QTbStore store;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreGoods storeGoods;

    //inherited
    public final BooleanPath taxYn;

    //inherited
    public final NumberPath<Integer> totalAmt;

    public QTbOrderAllGoods(String variable) {
        this(TbOrderAllGoods.class, forVariable(variable), INITS);
    }

    public QTbOrderAllGoods(Path<? extends TbOrderAllGoods> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderAllGoods(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderAllGoods(PathMetadata metadata, PathInits inits) {
        this(TbOrderAllGoods.class, metadata, inits);
    }

    public QTbOrderAllGoods(Class<? extends TbOrderAllGoods> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderGoodsEntity(type, metadata, inits);
        this.basicItemName = _super.basicItemName;
        this.basicItemNo = _super.basicItemNo;
        this.dataStatus = _super.dataStatus;
        this.goodsCnt = _super.goodsCnt;
        this.goodsName = _super.goodsName;
        this.goodsPrice = _super.goodsPrice;
        this.goodsType = _super.goodsType;
        this.order = inits.isInitialized("order") ? new QTbOrderAll(forProperty("order"), inits.get("order")) : null;
        this.orderGoodsNo = _super.orderGoodsNo;
        this.store = _super.store;
        this.storeGoods = _super.storeGoods;
        this.taxYn = _super.taxYn;
        this.totalAmt = _super.totalAmt;
    }

}

