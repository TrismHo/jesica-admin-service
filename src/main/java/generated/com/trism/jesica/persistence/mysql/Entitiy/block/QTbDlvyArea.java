package com.trism.jesica.persistence.mysql.Entitiy.block;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbDlvyArea is a Querydsl query type for TbDlvyArea
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyArea extends EntityPathBase<TbDlvyArea> {

    private static final long serialVersionUID = -546261837L;

    public static final QTbDlvyArea tbDlvyArea = new QTbDlvyArea("tbDlvyArea");

    public final com.trism.jesica.persistence.mysql.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.mysql.core.entity.QBaseEntity(this);

    public final NumberPath<Integer> areaChargeType = createNumber("areaChargeType", Integer.class);

    public final StringPath areaName = createString("areaName");

    public final NumberPath<Long> areaNo = createNumber("areaNo", Long.class);

    public final NumberPath<Integer> custPrice = createNumber("custPrice", Integer.class);

    public final NumberPath<Integer> dataStatus = createNumber("dataStatus", Integer.class);

    public final NumberPath<Integer> dlvyPrice = createNumber("dlvyPrice", Integer.class);

    public final NumberPath<Long> groupNo = createNumber("groupNo", Long.class);

    public final NumberPath<Integer> groupType = createNumber("groupType", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public final NumberPath<Integer> viewOrder = createNumber("viewOrder", Integer.class);

    public QTbDlvyArea(String variable) {
        super(TbDlvyArea.class, forVariable(variable));
    }

    public QTbDlvyArea(Path<? extends TbDlvyArea> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbDlvyArea(PathMetadata metadata) {
        super(TbDlvyArea.class, metadata);
    }

}

