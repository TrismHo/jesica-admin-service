package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaOrderGoods is a Querydsl query type for TbMannaOrderGoods
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaOrderGoods extends EntityPathBase<TbMannaOrderGoods> {

    private static final long serialVersionUID = 1715304570L;

    public static final QTbMannaOrderGoods tbMannaOrderGoods = new QTbMannaOrderGoods("tbMannaOrderGoods");

    public final StringPath goodsName = createString("goodsName");

    public final StringPath option1Name = createString("option1Name");

    public final NumberPath<Integer> option1Price = createNumber("option1Price", Integer.class);

    public final StringPath option2Name = createString("option2Name");

    public final NumberPath<Integer> option2Price = createNumber("option2Price", Integer.class);

    public final StringPath option3Name = createString("option3Name");

    public final NumberPath<Integer> option3Price = createNumber("option3Price", Integer.class);

    public final StringPath option4Name = createString("option4Name");

    public final NumberPath<Integer> option4Price = createNumber("option4Price", Integer.class);

    public final NumberPath<Integer> ordCnt = createNumber("ordCnt", Integer.class);

    public final NumberPath<Long> ordGoodsNo = createNumber("ordGoodsNo", Long.class);

    public final NumberPath<Long> ordGoodsSeq = createNumber("ordGoodsSeq", Long.class);

    public final NumberPath<Long> ordNo = createNumber("ordNo", Long.class);

    public final NumberPath<Long> ordPrice = createNumber("ordPrice", Long.class);

    public QTbMannaOrderGoods(String variable) {
        super(TbMannaOrderGoods.class, forVariable(variable));
    }

    public QTbMannaOrderGoods(Path<? extends TbMannaOrderGoods> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaOrderGoods(PathMetadata metadata) {
        super(TbMannaOrderGoods.class, metadata);
    }

}

