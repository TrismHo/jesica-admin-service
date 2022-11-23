package com.trism.jesica.persistence.Entitiy.business;

import static com.querydsl.core.types.PathMetadataFactory.*;

import com.querydsl.core.types.dsl.*;

import com.querydsl.core.types.PathMetadata;
import javax.annotation.Generated;
import com.querydsl.core.types.Path;
import com.querydsl.core.types.dsl.PathInits;


/**
 * QTbStore is a Querydsl query type for TbStore
 */
@Generated("com.querydsl.codegen.EntitySerializer")
public class QTbStore extends EntityPathBase<TbStore> {

    private static final long serialVersionUID = 238843013L;

    private static final PathInits INITS = PathInits.DIRECT2;

    public static final QTbStore tbStore = new QTbStore("tbStore");

    public final com.trism.jesica.persistence.core.entity.QBaseEntity _super = new com.trism.jesica.persistence.core.entity.QBaseEntity(this);

    public final StringPath addr1 = createString("addr1");

    public final StringPath addr2 = createString("addr2");

    public final StringPath addr3 = createString("addr3");

    public final StringPath addr4 = createString("addr4");

    public final StringPath addr5 = createString("addr5");

    public final StringPath alldayOpenYn = createString("alldayOpenYn");

    public final StringPath authTel = createString("authTel");

    public final StringPath bankAccount = createString("bankAccount");

    public final StringPath bankOwner = createString("bankOwner");

    public final StringPath bankTypeCode = createString("bankTypeCode");

    public final StringPath blockTypeCode = createString("blockTypeCode");

    public final QTbBranch branch;

    public final NumberPath<Integer> branchNo = createNumber("branchNo", Integer.class);

    public final QTbStoreBusinessInfo businessInfo;

    public final NumberPath<Integer> cash = createNumber("cash", Integer.class);

    public final NumberPath<Integer> cashDefault = createNumber("cashDefault", Integer.class);

    public final NumberPath<Integer> cookingTime = createNumber("cookingTime", Integer.class);

    public final ListPath<com.trism.jesica.persistence.Entitiy.cust.TbCustFavorite, com.trism.jesica.persistence.Entitiy.cust.QTbCustFavorite> custFavorites = this.<com.trism.jesica.persistence.Entitiy.cust.TbCustFavorite, com.trism.jesica.persistence.Entitiy.cust.QTbCustFavorite>createList("custFavorites", com.trism.jesica.persistence.Entitiy.cust.TbCustFavorite.class, com.trism.jesica.persistence.Entitiy.cust.QTbCustFavorite.class, PathInits.DIRECT2);

    public final StringPath cybankAccount = createString("cybankAccount");

    public final StringPath cybankOwner = createString("cybankOwner");

    public final StringPath cybankTypeCode = createString("cybankTypeCode");

    public final EnumPath<com.trism.jesica.persistence.type.DataStatus> dataStatus = createEnum("dataStatus", com.trism.jesica.persistence.type.DataStatus.class);

    public final NumberPath<Integer> dayPayType = createNumber("dayPayType", Integer.class);

    public final NumberPath<Integer> deposit = createNumber("deposit", Integer.class);

    public final NumberPath<Integer> dlvyAreaYn = createNumber("dlvyAreaYn", Integer.class);

    public final NumberPath<Integer> dlvyMinAmt = createNumber("dlvyMinAmt", Integer.class);

    public final NumberPath<Integer> dlvyNo = createNumber("dlvyNo", Integer.class);

    public final NumberPath<Integer> dlvyYn = createNumber("dlvyYn", Integer.class);

    public final StringPath erpCode = createString("erpCode");

    public final StringPath erpType = createString("erpType");

    public final StringPath exStoreCd = createString("exStoreCd");

    public final QTbHead head;

    public final NumberPath<Integer> headNo = createNumber("headNo", Integer.class);

    public final StringPath imgFile1 = createString("imgFile1");

    public final StringPath imgFileSmall = createString("imgFileSmall");

    //inherited
    public final DateTimePath<java.time.LocalDateTime> insertDate = _super.insertDate;

    public final StringPath insertUserId = createString("insertUserId");

    public final NumberPath<java.math.BigDecimal> lat = createNumber("lat", java.math.BigDecimal.class);

    public final NumberPath<java.math.BigDecimal> lng = createNumber("lng", java.math.BigDecimal.class);

    public final EnumPath<com.trism.jesica.persistence.type.MasterChargeType> masterChargeYn = createEnum("masterChargeYn", com.trism.jesica.persistence.type.MasterChargeType.class);

    public final EnumPath<com.trism.jesica.persistence.type.MasterGoodsType> masterGoodsYn = createEnum("masterGoodsYn", com.trism.jesica.persistence.type.MasterGoodsType.class);

    public final NumberPath<Long> masterStoreNo = createNumber("masterStoreNo", Long.class);

    public final StringPath memo = createString("memo");

    public final StringPath mngrName = createString("mngrName");

    public final EnumPath<com.trism.jesica.persistence.type.MultiType> multiType = createEnum("multiType", com.trism.jesica.persistence.type.MultiType.class);

    public final NumberPath<Integer> nightPayType = createNumber("nightPayType", Integer.class);

    public final NumberPath<Integer> openStatus = createNumber("openStatus", Integer.class);

    public final StringPath orderStatusCode = createString("orderStatusCode");

    public final StringPath pinNum = createString("pinNum");

    public final StringPath poi = createString("poi");

    public final NumberPath<Integer> returnUseYn = createNumber("returnUseYn", Integer.class);

    public final NumberPath<Integer> safenUseYn = createNumber("safenUseYn", Integer.class);

    public final EnumPath<com.trism.jesica.persistence.type.ServiceType> serviceType = createEnum("serviceType", com.trism.jesica.persistence.type.ServiceType.class);

    public final EnumPath<com.trism.jesica.persistence.type.ServiceYn> serviceYn = createEnum("serviceYn", com.trism.jesica.persistence.type.ServiceYn.class);

    public final ListPath<com.trism.jesica.persistence.Entitiy.goods.TbStoreCategory, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategory> storeCategories = this.<com.trism.jesica.persistence.Entitiy.goods.TbStoreCategory, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategory>createList("storeCategories", com.trism.jesica.persistence.Entitiy.goods.TbStoreCategory.class, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategory.class, PathInits.DIRECT2);

    public final ListPath<com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategoryFo> storeCategoryFos = this.<com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategoryFo>createList("storeCategoryFos", com.trism.jesica.persistence.Entitiy.goods.TbStoreCategoryFo.class, com.trism.jesica.persistence.Entitiy.goods.QTbStoreCategoryFo.class, PathInits.DIRECT2);

    public final StringPath storeIntro = createString("storeIntro");

    public final StringPath storeName = createString("storeName");

    public final StringPath storeNameInapp = createString("storeNameInapp");

    public final NumberPath<Long> storeNo = createNumber("storeNo", Long.class);

    public final StringPath storeTel = createString("storeTel");

    public final StringPath storeUrl = createString("storeUrl");

    public final NumberPath<Integer> takeoutYn = createNumber("takeoutYn", Integer.class);

    public final NumberPath<Integer> takeoverUseYn = createNumber("takeoverUseYn", Integer.class);

    //inherited
    public final DateTimePath<java.time.LocalDateTime> updateDate = _super.updateDate;

    public final StringPath updateUserId = createString("updateUserId");

    public QTbStore(String variable) {
        this(TbStore.class, forVariable(variable), INITS);
    }

    public QTbStore(Path<? extends TbStore> path) {
        this(path.getType(), path.getMetadata(), PathInits.getFor(path.getMetadata(), INITS));
    }

    public QTbStore(PathMetadata metadata) {
        this(metadata, PathInits.getFor(metadata, INITS));
    }

    public QTbStore(PathMetadata metadata, PathInits inits) {
        this(TbStore.class, metadata, inits);
    }

    public QTbStore(Class<? extends TbStore> type, PathMetadata metadata, PathInits inits) {
        super(type, metadata, inits);
        this.branch = inits.isInitialized("branch") ? new QTbBranch(forProperty("branch"), inits.get("branch")) : null;
        this.businessInfo = inits.isInitialized("businessInfo") ? new QTbStoreBusinessInfo(forProperty("businessInfo"), inits.get("businessInfo")) : null;
        this.head = inits.isInitialized("head") ? new QTbHead(forProperty("head"), inits.get("head")) : null;
    }

}

