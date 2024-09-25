package com.trism.jesica.persistence.mysql.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderAllGoodsOption is a Querydsl query type for TbOrderAllGoodsOption
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderAllGoodsOption extends EntityPathBase<TbOrderAllGoodsOption> {

    private static final long serialVersionUID = 121318110L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderAllGoodsOption tbOrderAllGoodsOption = new QTbOrderAllGoodsOption("tbOrderAllGoodsOption");

    public final com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderGoodsOptionEntity _super;

    //inherited
    public final StringPath itemName;

    //inherited
    public final NumberPath<Integer> itemPrice;

    //inherited
    public final NumberPath<Integer> optItemNo;

    //inherited
    public final StringPath optName;

    public final QTbOrderDayGoods orderDayGoods;

    //inherited
    public final NumberPath<Long> orderGoodsNo;

    // inherited
    public final com.trism.jesica.persistence.mysql.Entitiy.goods.QTbStoreOption storeOption;

    //inherited
    public final NumberPath<Integer> viewOrder;

    public QTbOrderAllGoodsOption(String variable) {
        this(TbOrderAllGoodsOption.class, forVariable(variable), INITS);
    }

    public QTbOrderAllGoodsOption(Path<? extends TbOrderAllGoodsOption> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderAllGoodsOption(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderAllGoodsOption(PathMetadata metadata, PathInits inits) {
        this(TbOrderAllGoodsOption.class, metadata, inits);
    }

    public QTbOrderAllGoodsOption(Class<? extends TbOrderAllGoodsOption> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mysql.mappedsuper.QBaseOrderGoodsOptionEntity(type, metadata, inits);
        this.itemName = _super.itemName;
        this.itemPrice = _super.itemPrice;
        this.optItemNo = _super.optItemNo;
        this.optName = _super.optName;
        this.orderDayGoods = inits.isInitialized("orderDayGoods") ? new QTbOrderDayGoods(forProperty("orderDayGoods"), inits.get("orderDayGoods")) : null;
        this.orderGoodsNo = _super.orderGoodsNo;
        this.storeOption = _super.storeOption;
        this.viewOrder = _super.viewOrder;
    }

}

