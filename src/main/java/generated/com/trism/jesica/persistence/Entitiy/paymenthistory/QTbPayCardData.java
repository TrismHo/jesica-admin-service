package com.trism.jesica.persistence.Entitiy.paymenthistory;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbPayCardData is a Querydsl query type for TbPayCardData
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbPayCardData extends EntityPathBase<TbPayCardData> {

    private static final long serialVersionUID = 1600598996L;

    public static final QTbPayCardData tbPayCardData = new QTbPayCardData("tbPayCardData");

    public final StringPath authNo = createString("authNo");

    public final NumberPath<Integer> cardApplPrice = createNumber("cardApplPrice", Integer.class);

    public final StringPath cardEmpPrtnCode = createString("cardEmpPrtnCode");

    public final StringPath cardNomlMobPrtnCode = createString("cardNomlMobPrtnCode");

    public final StringPath cardNum = createString("cardNum");

    public final StringPath checkFlag = createString("checkFlag");

    public final StringPath corpFlag = createString("corpFlag");

    public final NumberPath<Integer> couponDiscount = createNumber("couponDiscount", Integer.class);

    public final StringPath couponFlag = createString("couponFlag");

    public final StringPath fnCd1 = createString("fnCd1");

    public final StringPath fnNm = createString("fnNm");

    public final StringPath interest = createString("interest");

    public final StringPath ispCardCode = createString("ispCardCode");

    public final StringPath issuerCode = createString("issuerCode");

    public final StringPath memberNum = createString("memberNum");

    public final StringPath naverPointCshrApplAmt = createString("naverPointCshrApplAmt");

    public final StringPath naverPointCshrApplYn = createString("naverPointCshrApplYn");

    public final StringPath naverPointUseFreePoint = createString("naverPointUseFreePoint");

    public final StringPath prtcCode = createString("prtcCode");

    public final StringPath purchaseCode = createString("purchaseCode");

    public final StringPath rmesg2 = createString("rmesg2");

    public final StringPath srcCode = createString("srcCode");

    public final StringPath tid = createString("tid");

    public final NumberPath<Integer> usePoint = createNumber("usePoint", Integer.class);

    public QTbPayCardData(String variable) {
        super(TbPayCardData.class, forVariable(variable));
    }

    public QTbPayCardData(Path<? extends TbPayCardData> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbPayCardData(PathMetadata metadata) {
        super(TbPayCardData.class, metadata);
    }

}

