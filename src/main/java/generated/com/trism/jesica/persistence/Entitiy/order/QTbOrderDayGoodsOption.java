package com.trism.jesica.persistence.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbOrderDayGoodsOption is a Querydsl query type for TbOrderDayGoodsOption
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderDayGoodsOption extends EntityPathBase<TbOrderDayGoodsOption> {

    private static final long serialVersionUID = -1889991857L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbOrderDayGoodsOption tbOrderDayGoodsOption = new QTbOrderDayGoodsOption("tbOrderDayGoodsOption");

    public final com.trism.jesica.persistence.mappedsuper.QBaseOrderGoodsOptionEntity _super;

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
    public final com.trism.jesica.persistence.Entitiy.goods.QTbStoreOption storeOption;

    //inherited
    public final NumberPath<Integer> viewOrder;

    public QTbOrderDayGoodsOption(String variable) {
        this(TbOrderDayGoodsOption.class, forVariable(variable), INITS);
    }

    public QTbOrderDayGoodsOption(Path<? extends TbOrderDayGoodsOption> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbOrderDayGoodsOption(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbOrderDayGoodsOption(PathMetadata metadata, PathInits inits) {
        this(TbOrderDayGoodsOption.class, metadata, inits);
    }

    public QTbOrderDayGoodsOption(Class<? extends TbOrderDayGoodsOption> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this._super = new com.trism.jesica.persistence.mappedsuper.QBaseOrderGoodsOptionEntity(type, metadata, inits);
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

