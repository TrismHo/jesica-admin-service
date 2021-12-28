package com.trism.jesica.persistence.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderDayGoods is a Querydsl query type for TbOrderDayGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderDayGoods extends EntityPathBase<TbOrderDayGoods> {

    private static final long serialVersionUID = 155296314L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderDayGoods tbOrderDayGoods = new QTbOrderDayGoods("tbOrderDayGoods");

    public final com.trism.jesica.persistence.mappedsuper.QBaseOrderGoodsEntity _super;

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
    public final EnumPath<com.trism.jesica.persistence.type.GoodsType> goodsType;

    public final QTbOrderDay order;

    public final ListPath<TbOrderDayGoodsOption, QTbOrderDayGoodsOption> orderDayGoodsOptions = this.<TbOrderDayGoodsOption, QTbOrderDayGoodsOption>createList("orderDayGoodsOptions", TbOrderDayGoodsOption.class, QTbOrderDayGoodsOption.class, PathInits.DIRECT2);

    //inherited
    public final NumberPath<Long> orderGoodsNo;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.business.QTbStore store;

    // inherited
    public final com.trism.jesica.persistence.Entitiy.goods.QTbStoreGoods storeGoods;

    //inherited
    public final BooleanPath taxYn;

    //inherited
    public final NumberPath<Integer> totalAmt;

    public QTbOrderDayGoods(String variable) {
        this(TbOrderDayGoods.class, forVariable(variable), INITS);
    }

    public QTbOrderDayGoods(Path<? extends TbOrderDayGoods> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderDayGoods(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderDayGoods(PathMetadata metadata, PathInits inits) {
        this(TbOrderDayGoods.class, metadata, inits);
    }

    public QTbOrderDayGoods(Class<? extends TbOrderDayGoods> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseOrderGoodsEntity(type, metadata, inits);
        this.basicItemName = _super.basicItemName;
        this.basicItemNo = _super.basicItemNo;
        this.dataStatus = _super.dataStatus;
        this.goodsCnt = _super.goodsCnt;
        this.goodsName = _super.goodsName;
        this.goodsPrice = _super.goodsPrice;
        this.goodsType = _super.goodsType;
        this.order = inits.isInitialized("order") ? new QTbOrderDay(forProperty("order"), inits.get("order")) : null;
        this.orderGoodsNo = _super.orderGoodsNo;
        this.store = _super.store;
        this.storeGoods = _super.storeGoods;
        this.taxYn = _super.taxYn;
        this.totalAmt = _super.totalAmt;
    }

}

