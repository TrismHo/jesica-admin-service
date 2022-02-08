package com.trism.jesica.persistence.Entitiy.call;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbCallCharge is a Querydsl query type for TbCallCharge
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbCallCharge extends EntityPathBase<TbCallCharge> {

    private static final long serialVersionUID = 40700848L;

    public static final QTbCallCharge tbCallCharge = new QTbCallCharge("tbCallCharge");

    public final NumberPath<Integer> acceptBranchNo = createNumber("acceptBranchNo", Integer.class);

    public final NumberPath<Integer> acceptDlvyNo = createNumber("acceptDlvyNo", Integer.class);

    public final StringPath acceptStoreName = createString("acceptStoreName");

    public final NumberPath<Integer> acceptStoreNo = createNumber("acceptStoreNo", Integer.class);

    public final NumberPath<Integer> callCharge = createNumber("callCharge", Integer.class);

    public final NumberPath<Integer> cancelYn = createNumber("cancelYn", Integer.class);

    public final NumberPath<Integer> discountAmt = createNumber("discountAmt", Integer.class);

    public final NumberPath<Integer> dlvyTotalAmt = createNumber("dlvyTotalAmt", Integer.class);

    public final NumberPath<Integer> giveBranchNo = createNumber("giveBranchNo", Integer.class);

    public final NumberPath<Integer> giveDlvyNo = createNumber("giveDlvyNo", Integer.class);

    public final StringPath giveStoreName = createString("giveStoreName");

    public final NumberPath<Integer> giveStoreNo = createNumber("giveStoreNo", Integer.class);

    public final DateTimePath<java.time.LocalDateTime> insertDate = createDateTime("insertDate", java.time.LocalDateTime.class);

    public final NumberPath<Integer> mngPrice = createNumber("mngPrice", Integer.class);

    public final NumberPath<Integer> mngRateType = createNumber("mngRateType", Integer.class);

    public final NumberPath<Integer> orderAmt = createNumber("orderAmt", Integer.class);

    public final NumberPath<Long> orderNo = createNumber("orderNo", Long.class);

    public final NumberPath<Integer> payAmt = createNumber("payAmt", Integer.class);

    public final NumberPath<Integer> payAmtCc = createNumber("payAmtCc", Integer.class);

    public final NumberPath<Integer> payAmtPt = createNumber("payAmtPt", Integer.class);

    public final NumberPath<Integer> pgCharge = createNumber("pgCharge", Integer.class);

    public final NumberPath<Integer> pgIncome = createNumber("pgIncome", Integer.class);

    public final NumberPath<Integer> serviceAmt = createNumber("serviceAmt", Integer.class);

    public final NumberPath<Integer> totalAmt = createNumber("totalAmt", Integer.class);

    public final NumberPath<Integer> workerIncome = createNumber("workerIncome", Integer.class);

    public final StringPath workerName = createString("workerName");

    public final NumberPath<Integer> workerNo = createNumber("workerNo", Integer.class);

    public QTbCallCharge(String variable) {
        super(TbCallCharge.class, forVariable(variable));
    }

    public QTbCallCharge(Path<? extends TbCallCharge> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbCallCharge(PathMetadata metadata) {
        super(TbCallCharge.class, metadata);
    }

}

