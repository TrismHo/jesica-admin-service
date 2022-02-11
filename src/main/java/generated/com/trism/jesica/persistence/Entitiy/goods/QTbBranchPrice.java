package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbBranchPrice is a Querydsl query type for TbBranchPrice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbBranchPrice extends EntityPathBase<TbBranchPrice> {

    private static final long serialVersionUID = 1400723201L;

    public static final QTbBranchPrice tbBranchPrice = new QTbBranchPrice("tbBranchPrice");

    public final NumberPath<Long> branchNo = createNumber("branchNo", Long.class);

    public final NumberPath<Integer> dayCharge = createNumber("dayCharge", Integer.class);

    public final NumberPath<Integer> dayChargeYn = createNumber("dayChargeYn", Integer.class);

    public final NumberPath<Integer> dayDlvyCharge = createNumber("dayDlvyCharge", Integer.class);

    public final StringPath dayFilter = createString("dayFilter");

    public final NumberPath<Integer> dlvyAddDistance = createNumber("dlvyAddDistance", Integer.class);

    public final NumberPath<Integer> dlvyAddition = createNumber("dlvyAddition", Integer.class);

    public final NumberPath<Integer> dlvyBaseDistance = createNumber("dlvyBaseDistance", Integer.class);

    public final NumberPath<Integer> dlvyMaximum = createNumber("dlvyMaximum", Integer.class);

    public final NumberPath<Integer> dlvyPrice = createNumber("dlvyPrice", Integer.class);

    public final NumberPath<Integer> meterAddDistance = createNumber("meterAddDistance", Integer.class);

    public final NumberPath<Integer> meterAddition = createNumber("meterAddition", Integer.class);

    public final NumberPath<Integer> meterBaseDistance = createNumber("meterBaseDistance", Integer.class);

    public final NumberPath<Integer> meterMaximum = createNumber("meterMaximum", Integer.class);

    public final NumberPath<Integer> meterPrice = createNumber("meterPrice", Integer.class);

    public final NumberPath<Integer> meterUseYn = createNumber("meterUseYn", Integer.class);

    public final NumberPath<Integer> serviceAreaYn = createNumber("serviceAreaYn", Integer.class);

    public final NumberPath<Integer> timeCharge = createNumber("timeCharge", Integer.class);

    public final NumberPath<Integer> timeChargeYn = createNumber("timeChargeYn", Integer.class);

    public final NumberPath<Integer> timeDlvyCharge = createNumber("timeDlvyCharge", Integer.class);

    public final StringPath timeEnd = createString("timeEnd");

    public final StringPath timeStart = createString("timeStart");

    public final NumberPath<Integer> weatherCharge = createNumber("weatherCharge", Integer.class);

    public final NumberPath<Integer> weatherChargeYn = createNumber("weatherChargeYn", Integer.class);

    public final NumberPath<Integer> weatherDlvyCharge = createNumber("weatherDlvyCharge", Integer.class);

    public QTbBranchPrice(String variable) {
        super(TbBranchPrice.class, forVariable(variable));
    }

    public QTbBranchPrice(Path<? extends TbBranchPrice> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbBranchPrice(PathMetadata metadata) {
        super(TbBranchPrice.class, metadata);
    }

}

