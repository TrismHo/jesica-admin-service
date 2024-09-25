package com.trism.jesica.persistence.mysql.Entitiy.block;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;


/**
 * QTbDlvyAreaGeo is a Querydsl query type for TbDlvyAreaGeo
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbDlvyAreaGeo extends EntityPathBase<TbDlvyAreaGeo> {

    private static final long serialVersionUID = -55230050L;

    public static final QTbDlvyAreaGeo tbDlvyAreaGeo = new QTbDlvyAreaGeo("tbDlvyAreaGeo");

    public final NumberPath<Long> areaNo = createNumber("areaNo", Long.class);

    public final NumberPath<Integer> geoIdx = createNumber("geoIdx", Integer.class);

    public final NumberPath<Float> lat = createNumber("lat", Float.class);

    public final NumberPath<Float> lng = createNumber("lng", Float.class);

    public QTbDlvyAreaGeo(String variable) {
        super(TbDlvyAreaGeo.class, forVariable(variable));
    }

    public QTbDlvyAreaGeo(Path<? extends TbDlvyAreaGeo> path) {
        super(path.getType(), path.getMetadata());
    }

    public QTbDlvyAreaGeo(PathMetadata metadata) {
        super(TbDlvyAreaGeo.class, metadata);
    }

}

