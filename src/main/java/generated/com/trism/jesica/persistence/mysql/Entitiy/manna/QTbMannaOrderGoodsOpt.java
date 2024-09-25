package com.trism.jesica.persistence.mysql.Entitiy.manna;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbMannaOrderGoodsOpt is a Querydsl query type for TbMannaOrderGoodsOpt
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbMannaOrderGoodsOpt extends EntityPathBase<TbMannaOrderGoodsOpt> {

    private static final long serialVersionUID = -882363431L;

    public static final QTbMannaOrderGoodsOpt tbMannaOrderGoodsOpt = new QTbMannaOrderGoodsOpt("tbMannaOrderGoodsOpt");

    public final NumberPath<Integer> optGoodsCnt = createNumber("optGoodsCnt", Integer.class);

    public final StringPath optGoodsName = createString("optGoodsName");

    public final NumberPath<Long> optGoodsNo = createNumber("optGoodsNo", Long.class);

    public final NumberPath<Long> optGoodsPrice = createNumber("optGoodsPrice", Long.class);

    public final NumberPath<Long> optGoodsSeq = createNumber("optGoodsSeq", Long.class);

    public final NumberPath<Long> ordGoodsSeq = createNumber("ordGoodsSeq", Long.class);

    public final NumberPath<Long> ordNo = createNumber("ordNo", Long.class);

    public QTbMannaOrderGoodsOpt(String variable) {
        super(TbMannaOrderGoodsOpt.class, forVariable(variable));
    }

    public QTbMannaOrderGoodsOpt(Path<? extends TbMannaOrderGoodsOpt> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbMannaOrderGoodsOpt(PathMetadata metadata) {
        super(TbMannaOrderGoodsOpt.class, metadata);
    }

}

