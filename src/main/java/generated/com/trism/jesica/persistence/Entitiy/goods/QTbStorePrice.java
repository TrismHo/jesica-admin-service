package com.trism.jesica.persistence.Entitiy.goods;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbStorePrice is a Querydsl query type for TbStorePrice
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStorePrice extends EntityPathBase<TbStorePrice> {

    private static final long serialVersionUID = -538380434L;

    public static final QTbStorePrice tbStorePrice = new QTbStorePrice("tbStorePrice");

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

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final NumberPath<Integer> timeCharge = createNumber("timeCharge", Integer.class);

    public final NumberPath<Integer> timeChargeYn = createNumber("timeChargeYn", Integer.class);

    public final NumberPath<Integer> timeDlvyCharge = createNumber("timeDlvyCharge", Integer.class);

    public final StringPath timeEnd = createString("timeEnd");

    public final StringPath timeStart = createString("timeStart");

    public final NumberPath<Integer> useYn = createNumber("useYn", Integer.class);

    public final NumberPath<Integer> weatherCharge = createNumber("weatherCharge", Integer.class);

    public final NumberPath<Integer> weatherChargeYn = createNumber("weatherChargeYn", Integer.class);

    public final NumberPath<Integer> weatherDlvyCharge = createNumber("weatherDlvyCharge", Integer.class);

    public QTbStorePrice(String variable) {
        super(TbStorePrice.class, forVariable(variable));
    }

    public QTbStorePrice(Path<? extends TbStorePrice> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbStorePrice(PathMetadata metadata) {
        super(TbStorePrice.class, metadata);
    }

}

