package com.trism.jesica.persistence.Entitiy.order;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbOrderCharge is a Querydsl query type for TbOrderCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbOrderCharge extends EntityPathBase<TbOrderCharge> {

    private static final long serialVersionUID = -1609267244L;

    public static final QTbOrderCharge tbOrderCharge = new QTbOrderCharge("tbOrderCharge");

    public final NumberPath<Integer> acceptBranchNo = createNumber("acceptBranchNo", Integer.class);

    public final NumberPath<Integer> acceptDlvyNo = createNumber("acceptDlvyNo", Integer.class);

    public final StringPath acceptStoreName = createString("acceptStoreName");

    public final NumberPath<Integer> acceptStoreNo = createNumber("acceptStoreNo", Integer.class);

    public final NumberPath<Integer> cancelYn = createNumber("cancelYn", Integer.class);

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final NumberPath<Integer> dlvyShareType = createNumber("dlvyShareType", Integer.class);

    public final NumberPath<Integer> dlvyTotalAmt = createNumber("dlvyTotalAmt", Integer.class);

    public final NumberPath<Integer> giveBranchNo = createNumber("giveBranchNo", Integer.class);

    public final NumberPath<Integer> giveDlvyNo = createNumber("giveDlvyNo", Integer.class);

    public final StringPath giveStoreName = createString("giveStoreName");

    public final NumberPath<Integer> giveStoreNo = createNumber("giveStoreNo", Integer.class);

    public final DateTimePath<java.sql.Timestamp> insertDate = createDateTime("insertDate", java.sql.Timestamp.class);

    public final NumberPath<Integer> mngPrice = createNumber("mngPrice", Integer.class);

    public final NumberPath<Integer> mngRateAccept = createNumber("mngRateAccept", Integer.class);

    public final NumberPath<Integer> mngRateGive = createNumber("mngRateGive", Integer.class);

    public final NumberPath<Integer> mngRatePlatform = createNumber("mngRatePlatform", Integer.class);

    public final NumberPath<Integer> mngRateType = createNumber("mngRateType", Integer.class);

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final NumberPath<Integer> payAmt = createNumber("payAmt", Integer.class);

    public final NumberPath<Integer> payMethod = createNumber("payMethod", Integer.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final NumberPath<Integer> svcPrice = createNumber("svcPrice", Integer.class);

    public final NumberPath<Integer> svcPrice0 = createNumber("svcPrice0", Integer.class);

    public final NumberPath<Integer> svcPrice1 = createNumber("svcPrice1", Integer.class);

    public final NumberPath<Integer> svcPrice2 = createNumber("svcPrice2", Integer.class);

    public final NumberPath<Integer> svcPrice3 = createNumber("svcPrice3", Integer.class);

    public final NumberPath<Integer> totalAmt = createNumber("totalAmt", Integer.class);

    public final NumberPath<Integer> workerIncome = createNumber("workerIncome", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbOrderCharge(String variable) {
        super(TbOrderCharge.class, forVariable(variable));
    }

    public QTbOrderCharge(Path<? extends TbOrderCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbOrderCharge(PathMetadata metadata) {
        super(TbOrderCharge.class, metadata);
    }

}

