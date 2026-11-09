package com.trism.jesica.Service;

import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.Util.ImageUtil;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.Data;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.*;
import com.trism.jesica.exception.ErrorCode;
import com.trism.jesica.exception.ServiceException;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppService;
import com.trism.jesica.persistence.mysql.Entitiy.app.TbAppVersion;
import com.trism.jesica.persistence.mysql.Entitiy.block.TbDlvyArea;
import com.trism.jesica.persistence.mysql.Entitiy.block.TbDlvyAreaGeo;
import com.trism.jesica.persistence.mysql.Entitiy.board.*;
import com.trism.jesica.persistence.mysql.Entitiy.business.*;
import com.trism.jesica.persistence.mysql.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.mysql.Entitiy.cash.TbCashWithdraw;
import com.trism.jesica.persistence.mysql.Entitiy.coupon.TbCoupon;
import com.trism.jesica.persistence.mysql.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.mysql.Entitiy.file.TbFile;
import com.trism.jesica.persistence.mysql.Entitiy.goods.*;
import com.trism.jesica.persistence.mysql.Entitiy.library.TbLibrary;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaCouponRegist;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaq;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaFaqCategory;
import com.trism.jesica.persistence.mysql.Entitiy.manna.TbMannaLogisticsSurcharge;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.mysql.Entitiy.service.TbStoreServiceCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreDlvyCharge;
import com.trism.jesica.persistence.mysql.Entitiy.storedlvy.TbStoreMngCharge;
import com.trism.jesica.persistence.mysql.Entitiy.street.TbDlvyPrice;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteAcl;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSiteMenu;
import com.trism.jesica.persistence.mysql.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.mysql.Entitiy.vacs.TbVacsVact;
import com.trism.jesica.persistence.mysql.Entitiy.worker.TbWorkerApply;
import com.trism.jesica.persistence.mysql.Repository.app.TbAppServiceRepository;
import com.trism.jesica.persistence.mysql.Repository.app.TbAppVersionRepository;
import com.trism.jesica.persistence.mysql.Repository.block.TbDlvyAreaGeoRepository;
import com.trism.jesica.persistence.mysql.Repository.block.TbDlvyAreaRepository;
import com.trism.jesica.persistence.mysql.Repository.board.*;
import com.trism.jesica.persistence.mysql.Repository.business.*;
import com.trism.jesica.persistence.mysql.Repository.call.TbCallAllRepository;
import com.trism.jesica.persistence.mysql.Repository.car.TbRentalInfoRepository;
import com.trism.jesica.persistence.mysql.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.mysql.Repository.cash.TbCashWithdrawRepository;
import com.trism.jesica.persistence.mysql.Repository.coupon.TbCouponRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustLocationRepository;
import com.trism.jesica.persistence.mysql.Repository.cust.TbCustRepository;
import com.trism.jesica.persistence.mysql.Repository.event.TbEventRepository;
import com.trism.jesica.persistence.mysql.Repository.file.TbFileRepository;
import com.trism.jesica.persistence.mysql.Repository.goods.*;
import com.trism.jesica.persistence.mysql.Repository.library.TbLibraryRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaCouponPublishRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaCouponRegistRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaFaqRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaFaqCategoryRepository;
import com.trism.jesica.persistence.mysql.Repository.manna.TbMannaLogisticsSurchargeRepository;
import com.trism.jesica.persistence.mysql.Repository.safe.TbSafenMappingRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeGroupRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbServiceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.service.TbStoreServiceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.storedlvy.TbStoreDlvyChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.storedlvy.TbStoreMngChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.street.TbDlvyPriceChargeRepository;
import com.trism.jesica.persistence.mysql.Repository.street.TbDlvyPriceRepository;
import com.trism.jesica.persistence.mysql.Repository.system.TbSiteAclRepository;
import com.trism.jesica.persistence.mysql.Repository.system.TbSystemCodeRepository;
import com.trism.jesica.persistence.mysql.Repository.vacs.TbVacsVactRepository;
import com.trism.jesica.persistence.mysql.Repository.worker.TbWorkerApplyAttachRepository;
import com.trism.jesica.persistence.mysql.Repository.worker.TbWorkerApplyRepository;
import com.trism.jesica.persistence.mysql.Repository.worker.TbWorkerChargeRepository;
import com.trism.jesica.persistence.mysql.type.AttendStatusType;
import com.trism.jesica.persistence.mysql.type.DataStatus;
import com.trism.jesica.persistence.mysql.type.ServiceType;
import com.trism.jesica.persistence.mysql.type.UserType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpSession;
import java.io.*;
import java.net.URLDecoder;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.*;
import java.util.stream.Collectors;

@RequiredArgsConstructor
@Service
@Slf4j
public class ApiService {
    private final TbAppServiceRepository tbAppServiceRepository;
    private final TbFileRepository tbFileRepository;
    private final TbLibraryRepository tbLibraryRepository;
    private final TbMannaCouponPublishRepository tbMannaCouponPublishRepository;
    private final TbAppBannerLocationRepository tbAppBannerLocationRepository;
    private final TbCustLocationRepository tbCustLocationRepository;

    private final JesicaProperties jesicaProperties;

    private final TbHeadRepository tbHeadRepository;

    private final TbBranchRepository tbBranchRepository;

    private final TbStoreRepository tbStoreRepository;

    private final TbStoreCategoryFoRepository tbStoreCategoryFoRepository;

    private final TbStoreGoodsRepository tbStoreGoodsRepository;

    private final TbStoreGoodsItemRepository tbStoreGoodsItemRepository;

    private final TbStoreCategoryRepository tbStoreCategoryRepository;

    private final TbStoreOptionRepository tbStoreOptionRepository;

    private final TbStoreOptionItemRepository tbStoreOptionItemRepository;

    private final TbStoreCategoryGoodsRepository tbStoreCategoryGoodsRepository;

    private final TbStoreGoodsOptionRepository tbStoreGoodsOptionRepository;

    private final TbHeadBusinessInfoRepository tbHeadBusinessInfoRepository;
    private final TbBranchBusinessInfoRepository tbBranchBusinessInfoRepository;
    private final TbStoreBusinessInfoRepository tbStoreBusinessInfoRepository;
    private final TbDeliveryRepository tbDeliveryRepository;
    private final TbBrandRepository tbBrandRepository;
    private final TbSystemCodeRepository tbSystemCodeRepository;
    private final TbUserRepository tbUserRepository;
    private final TbUserWorkerRepository tbUserWorkerRepository;
    private final TbDeliveryShareRepository tbDeliveryShareRepository;
    private final TbDlvyAreaRepository tbDlvyAreaRepository;
    private final TbDlvyAreaGeoRepository tbDlvyAreaGeoRepository;
    private final TbSystemGoodsRepository tbSystemGoodsRepository;
    private final TbDlvyPriceChargeRepository tbDlvyPriceChargeRepository;
    private final TbDlvyPriceRepository tbDlvyPriceRepository;
    private final TbStoreDlvyChargeRepository tbStoreDlvyChargeRepository;
    private final TbStoreMngChargeRepository tbStoreMngChargeRepository;
    private final TbUserStaffRepository tbUserStaffRepository;
    private final TbNoticePlatformRepository tbNoticePlatformRepository;
    private final TbNoticeCompanyRepository tbNoticeCompanyRepository;
    private final TbNoticeWorkerRepository tbNoticeWorkerRepository;
    private final TbEventRepository tbEventRepository;
    private final TbServiceChargeGroupRepository tbServiceChargeGroupRepository;
    private final TbServiceChargeRepository tbServiceChargeRepository;
    private final TbStoreServiceChargeRepository tbStoreServiceChargeRepository;
    private final TbSystemCategoryRepository tbSystemCategoryRepository;
    private final KeyGeneratorConfig keyGeneratorConfig;
    private final TbWorkerApplyAttachRepository tbWorkerApplyAttachRepository;
    private final TbWorkerApplyRepository tbWorkerApplyRepository;
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;
    private final TbSafenMappingRepository tbSafenMappingRepository;
    private final TbNoticeReleaseRepository tbNoticeReleaseRepository;
    private final TbCallAllRepository tbCallAllRepository;
    private final TbWorkerChargeRepository tbWorkerChargeRepository;
    private final TbStoreChargeRepository tbStoreChargeRepository;
    private final TbStorePriceRepository tbStorePriceRepository;
    private final TbBranchPriceRepository tbBranchPriceRepository;
    private RestTemplateUtil restTemplateUtil;
    private final TbCouponRepository tbCouponRepository;
    private final BoardService boardService;
    private final TbAppBannerRepository tbAppBannerRepository;
    private final TbCashWithdrawRepository tbCashWithdrawRepository;
    private final TbCustRepository tbCustRepository;
    private final TbSiteAclRepository tbSiteAclRepository;
    private final TbVacsVactRepository tbVacsVactRepository;
    private final TbRentalInfoRepository tbRentalInfoRepository;
    private final TbMannaCouponRegistRepository tbMannaCouponRegistRepository;
    private final TbAppVersionRepository tbAppVersionRepository;
    private final TbMannaLogisticsSurchargeRepository tbMannaLogisticsSurchargeRepository;

    private final TbMannaFaqRepository tbMannaFaqRepository;
    private final TbMannaFaqCategoryRepository tbMannaFaqCategoryRepository;


    @Transactional
    public int insertTbHead(TbHeadData tbHeadData, TbBusinessInfoData tbBusinessInfoData) {
        int result = 0;
        try{
            if(tbHeadData.getHeadNo() != null) {
                result = 0;
            } else {
                //아이디가 없으면 insert

                CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());
                //계좌번호 암호화
                String bankEncrpt = cipherAESUtils.encryptAES(tbHeadData.insertData().getBankAccount());

                //예금주 암호화
                String ownerEncrpt = cipherAESUtils.encryptAES(tbHeadData.insertData().getBankOwner());

                //PIN번호 암호화
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbHeadData.insertData().getPinNum());
                TbHead tbHead =  tbHeadRepository.save(tbHeadData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));

                tbBusinessInfoData.setGroupNo(Integer.parseInt(tbHead.getHeadNo().toString()));
                tbHeadBusinessInfoRepository.insertTbBusiness(
                        tbBusinessInfoData.getGroupNo(),
                        tbBusinessInfoData.getInsertUserId(),
                        tbBusinessInfoData.getGroupType(),
                        tbBusinessInfoData.getCorpType(),
                        tbBusinessInfoData.getAuthStatus(),
                        tbBusinessInfoData.getAuthDate(),
                        tbBusinessInfoData.getBizNum(),
                        tbBusinessInfoData.getBizName(),
                        tbBusinessInfoData.getBizOwner(),
                        tbBusinessInfoData.getBizType(),
                        tbBusinessInfoData.getBizItem(),
                        tbBusinessInfoData.getBizAddr(),
                        tbBusinessInfoData.getBizTel(),
                        tbBusinessInfoData.getBizEmail()
                );
                result = 1;
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }



    @Transactional
    public int updateTbHead(TbHeadData tbHeadData, TbBusinessInfoData tbBusinessInfoData) {
        int result = 0;
        try{
            if(tbHeadData.getHeadNo() != null) {
                if(tbHeadRepository.existsById(tbHeadData.getHeadNo())){
                    //아이디가 있으면 update
                    TbHead tbHead =  tbHeadRepository.save(tbHeadData.insertData());
                    tbBusinessInfoData.setGroupNo(Integer.parseInt(tbHead.getHeadNo().toString()));
                    tbHeadBusinessInfoRepository.updateTbBusiness(
                            tbBusinessInfoData.getGroupNo(),
                            tbBusinessInfoData.getInsertUserId(),
                            tbBusinessInfoData.getGroupType(),
                            tbBusinessInfoData.getCorpType(),
                            tbBusinessInfoData.getAuthStatus(),
                            tbBusinessInfoData.getAuthDate(),
                            tbBusinessInfoData.getBizNum(),
                            tbBusinessInfoData.getBizName(),
                            tbBusinessInfoData.getBizOwner(),
                            tbBusinessInfoData.getBizType(),
                            tbBusinessInfoData.getBizItem(),
                            tbBusinessInfoData.getBizAddr(),
                            tbBusinessInfoData.getBizTel(),
                            tbBusinessInfoData.getBizEmail()
                    );
                    result = 1;
                } else {
                    //아이디가 없으면 insert
                    result = 0;
                }
            }


        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int insertTbBranch(TbBranchData tbBranchData, TbBusinessInfoData tbBusinessInfoData) {
        int result = 0;
        try{
            if(tbBranchData.getBranchNo() != null) {
                result =0;
            } else {
                //아이디가 없으면 insert
                CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());
                //계좌번호 암호화
                String bankEncrpt = cipherAESUtils.encryptAES(tbBranchData.insertData().getBankAccount());

                //예금주 암호화
                String ownerEncrpt = cipherAESUtils.encryptAES(tbBranchData.insertData().getBankOwner());

                //PIN번호 암호화
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbBranchData.insertData().getPinNum());
             /*   String pinEncrpt = null;
                bankEncrpt = null;
                ownerEncrpt = null;*/
                TbBranch tbBranch =  tbBranchRepository.save(tbBranchData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));

                tbBusinessInfoData.setGroupNo(Integer.parseInt(tbBranch.getBranchNo().toString()));
                tbBranchBusinessInfoRepository.insertTbBusiness(
                        tbBusinessInfoData.getGroupNo(),
                        tbBusinessInfoData.getInsertUserId(),
                        tbBusinessInfoData.getGroupType(),
                        tbBusinessInfoData.getCorpType(),
                        tbBusinessInfoData.getAuthStatus(),
                        tbBusinessInfoData.getAuthDate(),
                        tbBusinessInfoData.getBizNum(),
                        tbBusinessInfoData.getBizName(),
                        tbBusinessInfoData.getBizOwner(),
                        tbBusinessInfoData.getBizType(),
                        tbBusinessInfoData.getBizItem(),
                        tbBusinessInfoData.getBizAddr(),
                        tbBusinessInfoData.getBizTel(),
                        tbBusinessInfoData.getBizEmail()
                );

                TbBranchPrice tbBranchPrice = new TbBranchPrice();
                tbBranchPrice.setBranchNo(tbBranch.getBranchNo());
                tbBranchPriceRepository.save(tbBranchPrice);

                result = 1;

            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int updateTbBranch(TbBranchData tbBranchData, TbBusinessInfoData tbBusinessInfoData,TbBranchPrice tbBranchPrice) {
        int result = 0;
        try{
            if(tbBranchData.getBranchNo() != null) {
                if(tbBranchRepository.existsById(tbBranchData.getBranchNo())){
                    //아이디가 있으면 update
                    TbBranch tbBranch = tbBranchRepository.save(tbBranchData.insertData());
                    tbBusinessInfoData.setGroupNo(Integer.parseInt(tbBranch.getBranchNo().toString()));
                    result = tbBranchBusinessInfoRepository.updateTbBusiness(
                            tbBusinessInfoData.getGroupNo(),
                            tbBusinessInfoData.getInsertUserId(),
                            tbBusinessInfoData.getGroupType(),
                            tbBusinessInfoData.getCorpType(),
                            tbBusinessInfoData.getAuthStatus(),
                            tbBusinessInfoData.getAuthDate(),
                            tbBusinessInfoData.getBizNum(),
                            tbBusinessInfoData.getBizName(),
                            tbBusinessInfoData.getBizOwner(),
                            tbBusinessInfoData.getBizType(),
                            tbBusinessInfoData.getBizItem(),
                            tbBusinessInfoData.getBizAddr(),
                            tbBusinessInfoData.getBizTel(),
                            tbBusinessInfoData.getBizEmail()
                    );

                    tbBranchPrice.setBranchNo(tbBranchData.getBranchNo());
                    tbBranchPriceRepository.save(tbBranchPrice);

                    result = 1;
                } else {
                    //아이디가 없으면 insert
                    result = 0;
                }
            } else {
                result = 0;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


    @Transactional
    public int insertTbStore(TbStoreData tbStoreData, TbBusinessInfoData tbBusinessInfoData) {
        int result = 0;
        try{
            if(tbStoreData.getStoreNo() != null) {
            } else {
                //아이디가 없으면 insert
                //아이디가 없으면 insert
                CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());
                //계좌번호 암호화
                String bankEncrpt = cipherAESUtils.encryptAES(tbStoreData.insertData().getBankAccount());

                //예금주 암호화
                String ownerEncrpt = cipherAESUtils.encryptAES(tbStoreData.insertData().getBankOwner());

                //PIN번호 암호화
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbStoreData.insertData().getPinNum());
                //String pinEncrpt = null;
    /*            bankEncrpt = null;
                ownerEncrpt = null;*/
                TbStore tbStore =  tbStoreRepository.save(tbStoreData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));

                int tbStoreMngCharge = tbStoreMngChargeRepository.saveDefault(tbStore.getStoreNo());
                int tbStoreDlvyCharge = tbStoreDlvyChargeRepository.saveDefault(tbStore.getStoreNo());

                if(tbStoreMngCharge == 1 && tbStoreDlvyCharge == 1){

                    tbBusinessInfoData.setGroupNo(Integer.parseInt(tbStore.getStoreNo().toString()));
                    result = tbStoreBusinessInfoRepository.insertTbBusiness(
                            tbBusinessInfoData.getGroupNo(),
                            tbBusinessInfoData.getInsertUserId(),
                            tbBusinessInfoData.getGroupType(),
                            tbBusinessInfoData.getCorpType(),
                            tbBusinessInfoData.getAuthStatus(),
                            tbBusinessInfoData.getAuthDate(),
                            tbBusinessInfoData.getBizNum(),
                            tbBusinessInfoData.getBizName(),
                            tbBusinessInfoData.getBizOwner(),
                            tbBusinessInfoData.getBizType(),
                            tbBusinessInfoData.getBizItem(),
                            tbBusinessInfoData.getBizAddr(),
                            tbBusinessInfoData.getBizTel(),
                            tbBusinessInfoData.getBizEmail()
                    );

                    //수수료 설정1
                    TbStoreCharge tbStoreCharge = new TbStoreCharge();
                    tbStoreCharge.setStoreNo(tbStore.getStoreNo());
                    tbStoreChargeRepository.save(tbStoreCharge);

                    //요금설정
                    TbStorePrice tbStorePrice = new TbStorePrice();
                    tbStorePrice.setStoreNo(tbStore.getStoreNo());
                    tbStorePriceRepository.save(tbStorePrice);

                    //
                }else {
                    result = 0;
                }
                result = 1;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public TbStoreGoods insertTbStoreGoods(TbStoreGoodsData tbStoreGoodsData, MultipartFile imgFile1,
                                           MultipartFile imgFile2,
                                           MultipartFile imgFile3,
                                           MultipartFile imgFileSmall) {
        try {
            /*basContents.setBcThumbnail(imgFile.getBytes());*/
            OutputStream os = null;
            if (imgFile1 != null && !imgFile1.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods");
                PrintWriter pw = null;

                byte[] bytes = imgFile1.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile1.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);

                Path fileNamePath = Paths.get("/"+tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);
                tbStoreGoodsData.setImgFile1(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            }

           /* if (imgFile2 != null) {
                String fileName = UUID.randomUUID().toString();
                Path filePath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath());
                PrintWriter pw = null;

                byte[] bytes = imgFile2.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile2.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile2.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);

                Path fileNamePath = Paths.get(mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);
                tbStoreGoodsData.setImgFile2(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            }

            if (imgFile3 != null) {
                String fileName = UUID.randomUUID().toString();
                Path filePath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath());
                PrintWriter pw = null;

                byte[] bytes = imgFile3.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile3.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile3.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);

                Path fileNamePath = Paths.get(mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);
                tbStoreGoodsData.setImgFile3(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            }
*/
            if (imgFileSmall != null && !imgFileSmall.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods");
                PrintWriter pw = null;

                byte[] bytes = imgFileSmall.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFileSmall.getOriginalFilename().lastIndexOf(".");
                String ext = imgFileSmall.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);

                Path fileNamePath = Paths.get("/"+tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);
                tbStoreGoodsData.setImgFileSmall(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        TbStoreGoods tbStoreGoods =  tbStoreGoodsRepository.save(tbStoreGoodsData.insertData());
        log.info("@@@@@@@@@@@@@tbStoreGoods={}",tbStoreGoods);
        return tbStoreGoods;
    }
    @Transactional
    public TbLibrary insertLibraryFile(TbLibrary libraryInfo, MultipartFile[] attachFile) {
        TbLibrary tbLibrarySave = null;
        try {
            libraryInfo.setInsertDate(LocalDateTime.now());
            libraryInfo.setDataStatus(1);
            tbLibrarySave = tbLibraryRepository.save(libraryInfo);
            OutputStream os = null;
            if (ObjectUtils.isNotEmpty(attachFile)) {
                LocalDate now = LocalDate.now();
                // 포맷 정의
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy");
                // 포맷 적용
                String formatedNow = now.format(formatter);


                Path filePath = Paths.get(jesicaProperties.getBaseFilePath().getPath(),"library",formatedNow);
                PrintWriter pw = null;

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }
                List<Map<String, Object>> fileList = new ArrayList<Map<String, Object>>();
                for(int i = 0; i < attachFile.length; i++) {
                    String orgFileName = attachFile[i].getOriginalFilename();
                    String orgFileExtension = orgFileName.substring(orgFileName.lastIndexOf("."));
                    String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
                    Long saveFileSize = attachFile[i].getSize();

                    log.info("================== file start ==================");
                    log.info("파일 실제 이름: "+orgFileName);
                    log.info("파일 저장 이름: "+saveFileName);
                    log.info("파일 크기: "+saveFileSize);
                    log.info("content type: "+attachFile[i].getContentType());
                    log.info("================== file   END ==================");
                    byte[] bytes = attachFile[i].getBytes();

                    //attachFile[i].transferTo(uploadFile);

                    TbFile file = new TbFile();
                    file.setLibNo(tbLibrarySave.getLibNo());
                    file.setFileOriginName(orgFileName);
                    file.setFileName(saveFileName);
                    file.setFileSize(saveFileSize);
                    file.setFilePath(filePath.toFile().getPath());
                    file.setFileContentType(attachFile[i].getContentType());
                    file.setInsertDate(LocalDateTime.now());
                    tbFileRepository.save(file);
                    //fileInfo.put("CREA_ID", creaID);
                    os = new FileOutputStream(new File(filePath.toFile().getPath(),saveFileName));
                    os.write(bytes);
                    os.close();
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return tbLibrarySave;
    }


    @Transactional(rollbackFor = Exception.class)
    public TbLibrary updateLibraryFile(TbLibrary libraryInfo,
                                       MultipartFile[] attachFile,
                                       List<Long> deleteFileNos) throws Exception {

        if (libraryInfo == null || libraryInfo.getLibNo() == null) {
            throw new IllegalArgumentException("libNo is required");
        }

        TbLibrary origin = tbLibraryRepository.findById(libraryInfo.getLibNo())
                .orElseThrow(() -> new RuntimeException("Library not found: " + libraryInfo.getLibNo()));

        // 1) 문서 필드 업데이트
        if (libraryInfo.getFileTitle() != null) {
            origin.setFileTitle(libraryInfo.getFileTitle());
        }

        if (libraryInfo.getFileBody() != null) {
            origin.setFileBody(libraryInfo.getFileBody());
        }

        if (libraryInfo.getFileType() != null) {
            origin.setFileType(libraryInfo.getFileType());
        }

        if (libraryInfo.getShopType() != null) {
            origin.setShopType(libraryInfo.getShopType());
        }

        if (libraryInfo.getDataStatus() != null) {
            origin.setDataStatus(libraryInfo.getDataStatus());
        }

        origin.setUpdateDate(LocalDateTime.now());

        TbLibrary savedLibrary = tbLibraryRepository.save(origin);

        // 2) 삭제할 파일 처리
        if (deleteFileNos != null && !deleteFileNos.isEmpty()) {
            for (Long fileNo : deleteFileNos) {
                TbFile file = tbFileRepository.findById(fileNo).orElse(null);
                if (file == null) {
                    continue;
                }

                // 이 문서의 파일만 삭제
                if (!Objects.equals(file.getLibNo(), savedLibrary.getLibNo())) {
                    continue;
                }

                File real = new File(file.getFilePath(), file.getFileName());

                if (real.exists()) {
                    boolean deleted = real.delete();

                    if (!deleted) {
                        throw new RuntimeException("File delete failed: " + real.getAbsolutePath());
                    }
                }

                tbFileRepository.delete(file);
            }
        }

        // 3) 실제 추가 업로드 파일이 있는지 확인
        boolean hasUploadFile = false;

        if (attachFile != null && attachFile.length > 0) {
            for (MultipartFile mf : attachFile) {
                if (mf != null && !mf.isEmpty()) {
                    hasUploadFile = true;
                    break;
                }
            }
        }

        // 추가할 파일이 없으면 여기서 종료
        if (!hasUploadFile) {
            return savedLibrary;
        }

        // 4) 추가 업로드 파일이 있을 때만 저장 경로 생성
        LocalDate now = LocalDate.now();
        String year = now.format(DateTimeFormatter.ofPattern("yyyy"));
        Path filePath = Paths.get(jesicaProperties.getBaseFilePath().getPath(), "library", year);

        File uploadDir = filePath.toFile();

        if (!uploadDir.exists()) {
            boolean ok = uploadDir.mkdirs();

            if (!ok && !uploadDir.exists()) {
                throw new RuntimeException("Upload dir create failed: " + uploadDir.getAbsolutePath());
            }
        }

        // 5) 추가 업로드 파일 저장
        for (MultipartFile mf : attachFile) {
            if (mf == null || mf.isEmpty()) {
                continue;
            }

            String orgFileName = mf.getOriginalFilename();

            if (orgFileName == null || orgFileName.trim().isEmpty()) {
                orgFileName = "file";
            }

            String orgFileExtension = "";
            int dot = orgFileName.lastIndexOf(".");

            if (dot >= 0) {
                orgFileExtension = orgFileName.substring(dot);
            }

            String saveFileName = UUID.randomUUID().toString().replaceAll("-", "") + orgFileExtension;
            Long saveFileSize = mf.getSize();

            log.info("================== file start ==================");
            log.info("파일 실제 이름: {}", orgFileName);
            log.info("파일 저장 이름: {}", saveFileName);
            log.info("파일 크기: {}", saveFileSize);
            log.info("content type: {}", mf.getContentType());
            log.info("================== file   END ==================");

            TbFile file = new TbFile();
            file.setLibNo(savedLibrary.getLibNo());
            file.setFileOriginName(orgFileName);
            file.setFileName(saveFileName);
            file.setFileSize(saveFileSize);
            file.setFilePath(filePath.toFile().getPath());
            file.setFileContentType(
                    mf.getContentType() != null ? mf.getContentType() : "application/octet-stream"
            );
            file.setInsertDate(LocalDateTime.now());

            tbFileRepository.save(file);

            File outFile = new File(filePath.toFile().getPath(), saveFileName);

            try (OutputStream os = new FileOutputStream(outFile)) {
                os.write(mf.getBytes());
            }
        }

        return savedLibrary;
    }

    @Transactional(rollbackFor = Exception.class)
    public void deleteLibrary(Long libNo) throws Exception {
        TbLibrary lib = tbLibraryRepository.findById(libNo)
                .orElseThrow(() -> new RuntimeException("Library not found: " + libNo));

        // 1) 첨부파일 조회
        List<TbFile> files = tbFileRepository.findByLibNo(libNo); // 아래 Repository 참고

        // 2) 실제 파일 삭제 + DB 삭제
        for (TbFile f : files) {
            File real = new File(f.getFilePath(), f.getFileName());
            if (real.exists() && !real.delete()) {
                throw new RuntimeException("File delete failed: " + real.getAbsolutePath());
            }
            tbFileRepository.delete(f);
        }

        // 3) 자료실 글 소프트삭제
        lib.setDataStatus(0);
        lib.setUpdateDate(LocalDateTime.now());
        tbLibraryRepository.save(lib);
    }

    @Transactional
    public TbStoreGoods updateTbStoreGoods(TbStoreGoodsData tbStoreGoodsData, List deleteIdList, List<TbStoreGoodsItemData> tbStoreGoodsItemDataList, MultipartFile imgFile1,
                                           MultipartFile imgFile2,
                                           MultipartFile imgFile3,
                                           MultipartFile imgFileSmall) {
        try {

            /*basContents.setBcThumbnail(imgFile.getBytes());*/
            OutputStream os = null;
            if (!imgFile1.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods");
                PrintWriter pw = null;

                byte[] bytes = imgFile1.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile1.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);

                Path fileNamePath = Paths.get("/"+tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);
                tbStoreGoodsData.setImgFile1(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbStoreGoodsData.setImgFile1(tbStoreGoodsData.getImgFile1());
            }

            /*if (imgFile2 != null) {
                String fileName = UUID.randomUUID().toString();
                Path filePath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath());
                PrintWriter pw = null;

                byte[] bytes = imgFile2.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile2.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile2.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);

                Path fileNamePath = Paths.get(mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);
                tbStoreGoodsData.setImgFile2(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbStoreGoodsData.setImgFile2(tbStoreGoodsData.getImgFile2());
            }

            if (imgFile3 != null) {
                String fileName = UUID.randomUUID().toString();
                Path filePath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath());
                PrintWriter pw = null;

                byte[] bytes = imgFile3.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile3.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile3.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(mannaProperties.getBaseImgPath().getPath(), mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);

                Path fileNamePath = Paths.get(mannaProperties.getStoreImgPath().getPath(), fileName + "." + ext);
                tbStoreGoodsData.setImgFile3(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbStoreGoodsData.setImgFile3(tbStoreGoodsData.getImgFile3());
            }*/

            if (!imgFileSmall.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods");
                PrintWriter pw = null;

                byte[] bytes = imgFileSmall.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFileSmall.getOriginalFilename().lastIndexOf(".");
                String ext = imgFileSmall.getOriginalFilename().substring(pos + 1);

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);

                Path fileNamePath = Paths.get("/"+tbStoreGoodsData.getHeadNo().toString(), tbStoreGoodsData.getBranchNo().toString(),tbStoreGoodsData.getStoreNo().toString(),"goods", fileName + "." + ext);
                tbStoreGoodsData.setImgFileSmall(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbStoreGoodsData.setImgFileSmall(tbStoreGoodsData.getImgFileSmall());
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        //결과 리턴 나중에 수정필요
        Optional<TbStoreGoods> tbStoreGoods = tbStoreGoodsRepository.findById(tbStoreGoodsData.getStoreGoodsNo());
        tbStoreGoods.ifPresent(selectUser ->{
            TbStoreGoods tbStoreGoods1 = tbStoreGoodsRepository.save(tbStoreGoodsData.updateData());
        });


        //상품등록 및 수정
        for(TbStoreGoodsItemData tbStoreGoodsItemData : tbStoreGoodsItemDataList ){
            TbStoreGoodsItem tbStoreGoodsItem1 = tbStoreGoodsItemRepository.save(tbStoreGoodsItemData.insertData());
        }
        for(Object deleteId : deleteIdList ){
            tbStoreGoodsItemRepository.deleteStoreGoodsitem(tbStoreGoodsData.getStoreGoodsNo(),Integer.parseInt(deleteId.toString()));
        }


        return tbStoreGoods.get();
    }

    @Transactional
    public int insertTbStoreOption(TbStoreOptionData tbStoreOptionData, List<TbStoreOptionItemData> tbStoreOptionItemData) {

        int result = 0;

        if(tbStoreOptionData.getStoreOptNo() != null){
            //아이디가 있으면 update
            result = 0;
        } else {
            //아이디가 없으면 insert
            TbStoreOption tbStoreOption =  tbStoreOptionRepository.save(tbStoreOptionData.insertData());
            Long storeOptNo = tbStoreOption.getStoreOptNo();
            for(TbStoreOptionItemData tbStoreOptionItemDatas : tbStoreOptionItemData ){
                if(tbStoreOptionItemDatas.getOptItemNo() == null) {

                } else {
                    tbStoreOptionItemDatas.setStoreOptNo(storeOptNo);
                    TbStoreOptionItem tbStoreOptionItem = tbStoreOptionItemRepository.save(tbStoreOptionItemDatas.insertData());
                }
            }
            log.info("@@@@@@@@tbStoreOption={}",tbStoreOption);
            result = 1;
        }

        return result;
    }


    @Transactional
    public TbStoreOption updateTbStoreOption(TbStoreOptionData tbStoreOptionData, List deleteIdList, List<TbStoreOptionItemData> tbStoreOptionItemData) {

        //결과 리턴 나중에 수정필요
        Optional<TbStoreOption> tbStoreOption = tbStoreOptionRepository.findById(tbStoreOptionData.getStoreOptNo());
        tbStoreOption.ifPresent(selectUser ->{
            log.info("@@@@ {}",tbStoreOptionData.getStoreOptNo());
            TbStoreOption tbStoreOption1 = tbStoreOptionRepository.save(tbStoreOptionData.updateData());
        });


        //상품등록 및 수정
        for(TbStoreOptionItemData tbStoreOptionItemDatas : tbStoreOptionItemData ){
            TbStoreOptionItem tbStoreOptionItem = tbStoreOptionItemRepository.save(tbStoreOptionItemDatas.insertData());
        }

        for(Object deleteId : deleteIdList ){
            tbStoreOptionItemRepository.deleteStoreOptionitem(tbStoreOptionData.getStoreOptNo(),Integer.parseInt(deleteId.toString()));
        }

        return tbStoreOption.get();
    }
    @Transactional
    public int cashWithdrawUpdate(TbCashWithdrawData tbCashWithdrawData , String withdrawDate) {
        int result = 0;

        if(tbCashWithdrawData.getWithdrawNo() != null){
            //아이디가 있으면 update
            LocalDateTime day = LocalDateTime.parse(withdrawDate, DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss"));
            tbCashWithdrawData.setWithdrawDate(day);
            TbCashWithdraw tbCashWithdraw = tbCashWithdrawRepository.save(tbCashWithdrawData.insertData());
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }

        return result;
    }

    @Transactional
    public int updateTbRentalInfoSafenNum(Integer rentalNo , String safenNum) {
        int result = 0;
        result = tbRentalInfoRepository.updateSafenNum(rentalNo, safenNum);
        return result;
    }



    @Transactional
    public int updateTbStore(TbStoreData tbStoreData,
                             TbBusinessInfoData tbBusinessInfoData,
                             List<TbStoreCategoryFoData> tbStoreCategoryFo,
                             TbStoreCharge tbStoreCharge,
                             TbStorePrice tbStorePrice,
                             List<HashMap<String,Object>> deleteList,
                             MultipartFile imgFile,
                             MultipartFile imgFileSmall) {
        int result = 0;
        try {
            /*basContents.setBcThumbnail(imgFile.getBytes());*/
            OutputStream os = null;

            if (imgFile != null && !imgFile.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);

                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),  tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString());
                PrintWriter pw = null;

                byte[] bytes = imgFile.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString() ,fileName + "." + ext);

                Path fileNamePath = Paths.get("/"+tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString(),fileName + "." + ext);
                tbStoreData.setImgFile1(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbStoreData.setImgFile1(tbStoreData.getImgFile1());
            }

            //썸네일
            if (imgFileSmall != null && !imgFileSmall.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);

                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString());
                byte[] thumbBytes = imgFileSmall.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                /*byte[] thumbImg =  ImageUtil.generatelmage(bytes,"W", 200);*/

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }

                int pos = imgFileSmall.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFileSmall.getOriginalFilename().substring( pos + 1 );

                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),  tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString(),fileName + "_thumb." + ext);

                Path fileThumbNamePath = Paths.get("/"+tbStoreData.getHeadNo().toString(),
                        tbStoreData.getBranchNo().toString(),tbStoreData.getStoreNo().toString() , fileName + "_thumb." + ext);
                tbStoreData.setImgFileSmall(fileThumbNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os.write(thumbBytes);
                os.close();

                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);

            } else {
                tbStoreData.setImgFileSmall(tbStoreData.getImgFileSmall());
            }

            if(tbStoreData.getStoreNo() != null) {
                TbStore tbStore = tbStoreRepository.save(tbStoreData.insertData());
                tbBusinessInfoData.setGroupNo(Integer.parseInt(tbStore.getStoreNo().toString()));


                for(TbStoreCategoryFoData insertVal : tbStoreCategoryFo ){
                    tbStoreCategoryFoRepository.save(insertVal.insertData());
                }
                for(HashMap<String,Object> deleteVal : deleteList ){
                    tbStoreCategoryFoRepository.deleteCategoryFo(Long.parseLong(deleteVal.get("storeNo").toString()), deleteVal.get("catCode").toString());
                }

                tbHeadBusinessInfoRepository.updateTbBusiness(
                        tbBusinessInfoData.getGroupNo(),
                        tbBusinessInfoData.getInsertUserId(),
                        tbBusinessInfoData.getGroupType(),
                        tbBusinessInfoData.getCorpType(),
                        tbBusinessInfoData.getAuthStatus(),
                        tbBusinessInfoData.getAuthDate(),
                        tbBusinessInfoData.getBizNum(),
                        tbBusinessInfoData.getBizName(),
                        tbBusinessInfoData.getBizOwner(),
                        tbBusinessInfoData.getBizType(),
                        tbBusinessInfoData.getBizItem(),
                        tbBusinessInfoData.getBizAddr(),
                        tbBusinessInfoData.getBizTel(),
                        tbBusinessInfoData.getBizEmail());
                result = 1;
                //가맹점 수수료
                tbStoreCharge.setStoreNo(tbStoreData.getStoreNo());
                tbStoreChargeRepository.save(tbStoreCharge);

                tbStorePrice.setStoreNo(tbStoreData.getStoreNo());
                tbStorePriceRepository.save(tbStorePrice);

            } else {
                result = 0;
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    @Transactional
    public int updateMultiTbStore(TbStoreMultiData tbStoreMultiData) {
        int result = 0;
        result  = tbStoreRepository.multiUpdate(tbStoreMultiData.getStoreNo()
                ,tbStoreMultiData.getMultiType()
                ,tbStoreMultiData.getMasterChargeYn()
                ,tbStoreMultiData.getMasterGoodsYn()
                ,tbStoreMultiData.getMasterStoreNo());
        return result;
    }


    @Transactional(readOnly = true)
    public List<TbHeadDTO> tbHeadSearchList(Map<String,Object> searchValue) {
        List<TbHeadDTO> result = null;
        String search = null;
        if ((String)searchValue.get("headName") != null){
            search = "%"+(String)searchValue.get("headName")+"%";
            result =  tbHeadRepository.findByHeadName(search);
        } else if(searchValue.get("headNo") != null) {
            result =  tbHeadRepository.findByHeadNo(Long.parseLong(searchValue.get("headNo").toString()));
        } else {
            result =  tbHeadRepository.findByAll();
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbBranchDTO> tbBranchSearchList(Map<String,Object> searchValue) {
        List<TbBranchDTO> result = null;
        String search = null;
        if ((String)searchValue.get("branchName") != null){
            search = "%"+(String)searchValue.get("branchName")+"%";
            result =  tbBranchRepository.findByBranchName(search ,Long.parseLong((String)searchValue.get("headNo")));
        } else if(searchValue.get("headNo") != null) {
            result =  tbBranchRepository.findByHeadNo(Long.parseLong(searchValue.get("headNo").toString()));
        } else {
            result =  tbBranchRepository.findByAll(Long.parseLong((String)searchValue.get("headNo")));
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbBrandDTO> tbBrandSearchList(Map<String,Object> searchValue) {
        List<TbBrandDTO> result = null;
        String search = null;
        if ((String)searchValue.get("brandName") != null){
            search = "%"+(String)searchValue.get("brandName")+"%";
            result =  tbBrandRepository.findByBrandName(search ,Long.parseLong((String)searchValue.get("brandNo")));
        } else {
            if(searchValue.get("brandNo") != null && searchValue.get("brandNo") != ""){
                result =  tbBrandRepository.findByBrandNo(Long.parseLong((String)searchValue.get("brandNo")));
            } else{
                result =  tbBrandRepository.findByAll();
            }
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbStoreDTO> tbStoreSearchList(Map<String,Object> searchValue) {
        List<TbStoreDTO> result = null;
        String search = null;
        if ((String)searchValue.get("storeName") != null){
            search = "%"+(String)searchValue.get("storeName")+"%";
            result =  tbStoreRepository.findByStoreNameAndHeadNoAndBranchNo(search, Long.parseLong((String)searchValue.get("headNo")),  Long.parseLong((String)searchValue.get("branchNo")));
        } else if((String)searchValue.get("multiType") != null) {
            result =  tbStoreRepository.findByMultiType(Integer.parseInt((String)searchValue.get("multiType")));
        } else if(searchValue.get("headNo") != null) {
            result =  tbStoreRepository.findByHeadNo((Long.parseLong(searchValue.get("headNo").toString())));
        } else  {
            result =  tbStoreRepository.findByAll(Long.parseLong((String)searchValue.get("headNo")), Long.parseLong((String)searchValue.get("branchNo")));
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbDlvyDTO> tbDlvySearchList(Map<String,Object> searchValue) {
        List<TbDlvyDTO> result = null;
        String search = null;
        if ((String)searchValue.get("dlvy_name") != null){
            search = "%"+(String)searchValue.get("dlvyName")+"%";
            result =  tbDeliveryRepository.findByDlvyName(search);
        } else if (searchValue.get("headNo") != null) {
            result =  tbDeliveryRepository.findByHeadNo(Long.parseLong(searchValue.get("headNo").toString()));
        } else {
            result =  tbDeliveryRepository.findByAll();
        }
        return result;
    }

    @Transactional
    public int insertCategoryFo(Long storeNo , String cateCode, Integer catLevel, String parentCatCode) {
        int result =  tbStoreCategoryFoRepository.insertCategoryFo(
                storeNo,
                cateCode,
                catLevel,
                parentCatCode);
        return result;
    }

    @Transactional
    public int deleteCategoryFo(Long storeNo , String catCode, Integer catLevel, String parentCatCode) {
        int result =  tbStoreCategoryFoRepository.deleteCategoryFo(
                storeNo,
                catCode
        );
        return result;
    }
/*
    @Transactional
    public int insertStoreGoodsitem(Long storeGoodsNo , String viewOrder, Integer itemStatus, String itemName, Integer itemPrice) {
        int result =  tbStoreGoodsItemRepository.insertStoreGoodsitem(
                storeGoodsNo,
                viewOrder,
                itemStatus,
                itemName,
                itemPrice);
        return result;
    }

    @Transactional
    public int updateStoreGoodsitem(Long storeGoodsNo , Integer basicItemNo, String viewOrder, Integer itemStatus, String itemName, Integer itemPrice) {
        int result =  tbStoreGoodsItemRepository.updateStoreGoodsitem(
                storeGoodsNo,
                basicItemNo,
                viewOrder,
                itemStatus,
                itemName,
                itemPrice);
        return result;
    }*/

    @Transactional
    public int deleteStoreGoodsitem(Long storeGoodsNo , Integer basicItemNo) {
        int result =  tbStoreGoodsItemRepository.deleteStoreGoodsitem(
                storeGoodsNo,
                basicItemNo
        );
        return result;
    }

    @Transactional
    public int insertTbStoreCategory(TbStoreCategoryData tbStoreCategoryData) {
        int result = 0;
        if(tbStoreCategoryData.getStoreCatNo() != null){
            //아이디가 있으면 update
            result = 0;
        } else {
            //아이디가 없으면 insert
            tbStoreCategoryRepository.save(tbStoreCategoryData.insertData());
            result = 1;
        }
        return result;
    }

    @Transactional
    public int updateTbStoreCategory(TbStoreCategoryData tbStoreCategoryData) {
        int result = 0;
        if(tbStoreCategoryRepository.existsById(tbStoreCategoryData.getStoreCatNo())){
            tbStoreCategoryRepository.save(tbStoreCategoryData.insertData());
            //아이디가 있으면 update
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }
        return result;
    }

    @Transactional
    public int deleteTbStoreCategory(Long storeCatNo, Integer storeNo) {
        return tbStoreCategoryRepository.delete(storeCatNo, storeNo);
    }

    @Transactional(readOnly = true)
    public List<TbStoreCategoryDTO> searchMerchangroupList(Integer storeNo) {
        List<TbStoreCategoryDTO> result = null;
        result =  tbStoreCategoryRepository.findByStoreNo(storeNo);
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbStoreCategoryDTO> tbStoreCategorySearch(Map<String,Object> searchValue) {
        if(searchValue.get("parentCatNo") == null || "".equals(searchValue.get("parentCatNo"))){
            return  tbStoreCategoryRepository.findByStoreNoAndCatLevel(Integer.parseInt(searchValue.get("storeNo").toString()),Integer.parseInt(searchValue.get("catLevel").toString()));
        } else {
            return  tbStoreCategoryRepository.findByStoreNoAndCatLevelAndParentCatNo(Integer.parseInt(searchValue.get("storeNo").toString()),Integer.parseInt(searchValue.get("catLevel").toString()),Integer.parseInt(searchValue.get("parentCatNo").toString()));
        }
    }

    @Transactional
    public int addStoreCategoryGoods(Long storeCatNo, Long storeGoodsNo) {
        return tbStoreCategoryGoodsRepository.saveStoreCategoryGoods(storeCatNo, storeGoodsNo);
    }

    @Transactional
    public int bannerLocationAreaAdd(Long bannerNo, String addr1, String addr2) {
        return tbAppBannerLocationRepository.bannerLocationAreaAdd(bannerNo, addr1, addr2);
    }

    @Transactional(readOnly = true)
    public List<TbAppBannerLocationDTO> getAppBannerLocation(Long bannerNo) {
        return tbAppBannerLocationRepository.findByBannerNo(bannerNo);
    }

    @Transactional
    public int bannerLocationAreaDelete(Long bnrLocNo, Long bannerNo) {
        return tbAppBannerLocationRepository.bannerLocationAreaDelete(bnrLocNo,bannerNo);
    }

    @Transactional
    public int deleteStoreCategoryGoods(Long storeCatNo, Long storeGoodsNo) {
        return tbStoreCategoryGoodsRepository.deleteStoreCategoryGoods(storeCatNo, storeGoodsNo);
    }


    @Transactional(readOnly = true)
    public List<TbStoreOptionSubDTO> searchStoreOption(Map<String,Object> searchValue) {
        return tbStoreOptionRepository.findByStoreNoAndMandatoryYn(Integer.parseInt(searchValue.get("storeNo").toString()), Integer.parseInt(searchValue.get("mandatoryYn").toString()));
    }

    @Transactional(readOnly = true)
    public List<TbStoreOptionSubDTO> searchStoreGoodsOption(Map<String,Object> searchValue) {
        return tbStoreOptionRepository.getStoreGoodsNo(Long.parseLong(searchValue.get("storeGoodsNo").toString()));
    }

    @Transactional
    public int addStoreGoodsOption(Long storeOptNo, Long storeGoodsNo) {
        Integer viewOrder = tbStoreGoodsOptionRepository.getTbStoreGoodsOptionMaxNo(storeGoodsNo);
        int result = 0;
        result = tbStoreGoodsOptionRepository.addStoreGoodsOption(storeOptNo, storeGoodsNo , (viewOrder+1));
        return result;
    }

    @Transactional
    public int deleteStoreGoodsOption(Long storeOptNo, Long storeGoodsNo) {
        return tbStoreGoodsOptionRepository.deleteStoreGoodsOption(storeOptNo, storeGoodsNo);
    }

    @Transactional(readOnly = true)
    public List<TbSystemCode> systemCodeList(String sysType) {
        return tbSystemCodeRepository.findBySysTypeAndDataStatusOrderByViewOrderAsc(sysType,DataStatus.OK);
    }
    @Transactional(readOnly = true)
    public List<TbAppService> getAppServiceList() {
        return tbAppServiceRepository.findByDataStatusOrderByServiceNoAsc(1);
    }

    @Transactional(readOnly = true)
    public List<TbSystemCode> systemCodeList(String sysType,String sysCode) {
        return tbSystemCodeRepository.findBySysTypeAndSysCodeLikeAndDataStatus(sysType,sysCode,DataStatus.OK);
    }

    @Transactional(readOnly = true)
    public List<TbAppVersion> getAppVersionListTypeOne(String appCode) {
        return tbAppVersionRepository.findByDeviceTypeAndAppCode(1,appCode);
    }
    @Transactional
    public List<TbVacsVact> cybankAccountReset(String bankCode, String no, Integer type, String oldBankCode, String oldNo,String owner) {

        List<TbVacsVact> vacsVact = tbVacsVactRepository.findByBankCdAndAcctSt(bankCode,"0");

        int result = 0;
        //남는 가상번호가 존재할시 세팅
        if(vacsVact.size() > 0) {
            //본사
            if (type == 1){
                result = tbHeadRepository.setCyAccountSet(vacsVact.get(0).getBankCd(), vacsVact.get(0).getAcctNo(),owner,Long.parseLong(no));
                //총판
            } else if (type == 2){
                result = tbBranchRepository.setCyAccountSet(vacsVact.get(0).getBankCd(), vacsVact.get(0).getAcctNo(),owner,Long.parseLong(no));
                //가맹점
            } else if (type == 3){
                result =tbStoreRepository.setCyAccountSet(vacsVact.get(0).getBankCd(), vacsVact.get(0).getAcctNo(),owner,Long.parseLong(no));
                //드라이버
            } else if (type == 4){
                result =tbUserWorkerRepository.setCyAccountSet(vacsVact.get(0).getBankCd(), vacsVact.get(0).getAcctNo(),owner,Long.parseLong(no));
            }
            if (result == 1){
                //성공하면 할당으로 변경+예금주명 등록
                tbVacsVactRepository.updateAcctst("1",vacsVact.get(0).getAcctNo(),vacsVact.get(0).getBankCd(),DateUtil.now_yyyymmdd(),type.toString(),owner,Long.parseLong(no));

                //기존내역을 해지로 변경
                tbVacsVactRepository.updateAcctstClose("9",oldNo,oldBankCode,DateUtil.now_yyyymmdd());
                return vacsVact;
            }else {
                return null;
            }
        }else {
            return null;
        }
    }

    @Transactional
    public TbUserWorker insertTbUserWork(TbUserWorkerData tbUserWorkerData , MultipartFile imgFile, MultipartFile imgFile2, HttpSession session) throws Exception  {

        int result = 0;
        TbUserWorker tbUserWorker = null;
        try {
            OutputStream os = null;

            SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
            SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
            Date time = new Date();
            String yyyy = format.format(time);
            String mm = format2.format(time);

            if (imgFile != null && !imgFile.isEmpty()) {
                String fileName =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm);
                PrintWriter pw = null;

                byte[] bytes = imgFile.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile.getOriginalFilename().substring( pos + 1 );
                Path upoladFullPath = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm,
                        fileName + "." + ext);

                Path fileNamePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm,
                        fileName + "." + ext);


                os = new FileOutputStream(new File(fileNamePath.toFile().getPath()));
                os.write(bytes);
                os.close();
                tbUserWorkerData.setProfileFile(upoladFullPath.toFile().getPath());
                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());
            }


            if (imgFile != null && !imgFile.isEmpty()) {
                OutputStream os2 = null;
                String fileName =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                int posThumb = imgFile.getOriginalFilename().lastIndexOf( "." );
                String extThumb = imgFile.getOriginalFilename().substring( posThumb + 1 );
                //썸네일 - 프로필사진 썸네일
                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm);
                byte[] thumbBytes = imgFile.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                byte[] thumbImg =  ImageUtil.generatelmage(thumbBytes,"W", 200);

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }
                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm,
                        fileName + "." + extThumb);
                Path fileThumbNamePath = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm,
                        fileName + "." + extThumb);
                tbUserWorkerData.setProfileFileSmall(fileThumbNamePath.toFile().getPath());
                os2 = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os2.write(thumbImg);
                os2.close();
                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);
            } else {
                /*tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());*/
            }
            if (imgFile2 != null && !imgFile2.isEmpty()) {
                OutputStream os3 = null;
                String fileName2 =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                //String fileName = RandomStringUtils.random(8,33,125,true,true);
                /*Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                    tbUserWorkerData.getHeadNo().toString(),
                    tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker");*/
                Path filePath2 = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm);
                PrintWriter pw = null;
                byte[] bytes = imgFile2.getBytes();

                File uploadFile2 = new File(filePath2.toFile().getPath());
                if (!uploadFile2.exists()) {
                    uploadFile2.mkdirs();
                }
                int pos2 = imgFile.getOriginalFilename().lastIndexOf( "." );
                String ext2 = imgFile.getOriginalFilename().substring( pos2 + 1 );
                Path upoladFullPath2 = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm,
                        fileName2 + "." + ext2);
                //Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),tbUserWorkerData.getHeadNo().toString(),tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker",fileName + "." + ext);
                Path fileNamePath2 = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm, fileName2 + "." + ext2);
                tbUserWorkerData.setLicenseFile(fileNamePath2.toFile().getPath());
                os3 = new FileOutputStream(new File(upoladFullPath2.toFile().getPath()));
                os3.write(bytes);
                os3.close();
                log.debug("upoladFullPath2={}", upoladFullPath2);
            } else {
                /*tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());*/
            }


            if (tbUserWorkerData.getUserNo() != null){
               /* ResponseEntity<Map> tokenMap = restTemplateUtil.driverStatusInit(tbUserWorkerData.getUserNo(), session);
                Map<String,Object> codeMap2 = (Map)tokenMap.getBody();//아이디가 있으면 update
                if("OK".equals(codeMap2.get("serviceStatus"))){
                    log.info("driverStatusOk:::"+tbUserWorkerData.getUserNo());
                    result = 1;
                } else {
                    log.info("driverStatusError");
                }*/
            } else {
                if("".equals(tbUserWorkerData.getUserPwd())){
                    tbUserWorkerData.setUserPwd(null);
                }else {
                    String pass = tbUserWorkerData.getUserPwd();

                    //암호화
                    String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                    tbUserWorkerData.setUserPwd(encodedPassword);
                }

                CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());
                //계좌번호 암호화
                String bankEncrpt = cipherAESUtils.encryptAES(tbUserWorkerData.insertData().getBankAccount());

                //예금주 암호화
                String ownerEncrpt = cipherAESUtils.encryptAES(tbUserWorkerData.insertData().getBankOwner());

                //주민번호 암호화
                String registrationNum = cipherAESUtils.encryptAES(tbUserWorkerData.insertData().getRegistrationNum());

                //PIN번호 암호화
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbUserWorkerData.insertData().getPinNum());
                //TbHead tbHead =  tbHeadRepository.save(tbHeadData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));
                //tbUserWorkerRepository.save(tbUserWorkerData.insertData());
                tbUserWorker =  tbUserWorkerRepository.save(tbUserWorkerData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt, registrationNum));

                //tb_wokrer_charge 세팅
                TbWorkerChargeData tbWorkerCharge = new TbWorkerChargeData();
                tbWorkerCharge.setWorkerNo(Integer.parseInt(tbUserWorker.getUserNo().toString()));
                tbWorkerChargeRepository.save(tbWorkerCharge.insertData());
                TbWorkerApply tbWorkerApply = new TbWorkerApply();
                tbWorkerApply.setWorkerNo(Integer.parseInt(tbUserWorker.getUserNo().toString()));
                tbWorkerApply.setName(tbUserWorker.getName()+"(관리자직접등록)");
                tbWorkerApply.setPhone(tbUserWorker.getPhone());
                tbWorkerApplyRepository.save(tbWorkerApply);
            }
        } catch (DataIntegrityViolationException e) {
            throw new DataIntegrityViolationException("아이디 중복 에러");
        } catch (FileNotFoundException e){
            log.info("file not found!!");
        } catch (Exception e){
            e.printStackTrace();
        }
        return tbUserWorker;
    }

    @Transactional
    public int insertTbUserStaff(TbUserStaffData tbUserStaffData,  List<TbSiteMenu> tbSiteMenus) {

        int result = 0;
        TbUserStaff tbUserStaff = null;

        try {
            OutputStream os = null;

            if (tbUserStaffData.getUserNo() != null){
            } else {
                String pass = tbUserStaffData.getUserPwd();

                //암호화
                String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                tbUserStaffData.setUserPwd(encodedPassword);

                tbUserStaff = tbUserStaffRepository.findByUserId(tbUserStaffData.getUserId());

                if(ObjectUtils.isNotEmpty(tbUserStaff)) {
                    if (!StringUtils.isEmpty(tbUserStaff.getName())) {
                        //중복
                        result = 500;
                    } else {
                        if (tbUserStaffData.getRoleType() == 1){
                            tbUserStaffData.setAppCode(null);
                        }
                        tbUserStaff =  tbUserStaffRepository.save(tbUserStaffData.insertData());
                        //시스템이나 마스터가 아닐시 관제권한 항상부여
                        result = 1;
                    }
                } else {
                    if (tbUserStaffData.getRoleType() == 1){
                        tbUserStaffData.setAppCode(null);
                    }
                    tbUserStaff = tbUserStaffRepository.save(tbUserStaffData.insertData());

                    result = 1;
                }


                // 권한등록
                List<HashMap<String,Object>> menuPermissionList = new ArrayList<HashMap<String,Object>>();
                for (int i = 0 ; i < tbSiteMenus.size() ; i++){
                    HashMap<String,Object> menuMap = new HashMap<>();
                    menuMap.put("userNo",tbUserStaff.getUserNo());
                    menuMap.put("menuNo",tbSiteMenus.get(i).getMenuNo());

                    if(tbSiteMenus.get(i).getMenuLevel() != 1){
                        //통합관리자
                        if(tbUserStaffData.getRoleType() == 1 && !tbSiteMenus.get(i).getMenuUrl().contains("system")){
                            if(tbSiteMenus.get(i).getMenuUrl().contains("library") ){
                                menuMap.put("permission","2");
                                menuMap.put("downloadAble","1");
                            } else {
                                menuMap.put("permission","2");
                                menuMap.put("downloadAble","0");
                            }

                            //앱관리자
                        } else if(tbUserStaffData.getRoleType() == 2 && !tbSiteMenus.get(i).getMenuUrl().contains("system")){
                            if(tbSiteMenus.get(i).getMenuUrl().contains("library")){
                                menuMap.put("permission","1");
                                menuMap.put("downloadAble","1");
                            } else {
                                menuMap.put("permission","2");
                                menuMap.put("downloadAble","1");
                                //앱관리자는 쿠폰관리 권한 없음
                                if(tbSiteMenus.get(i).getMenuUrl().contains("membership/coupon")){
                                    menuMap.put("permission","0");
                                    menuMap.put("downloadAble","0");
                                } else  {
                                    //앱관리자는 회원권한 조회만 가능
                                    if(tbSiteMenus.get(i).getMenuUrl().contains("board/cust")){
                                        menuMap.put("permission","1");
                                        menuMap.put("downloadAble","0");
                                    } else  {
                                        menuMap.put("permission","2");
                                        menuMap.put("downloadAble","1");
                                    }
                                }
                            }
                        } else {
                            menuMap.put("permission","0");
                            menuMap.put("downloadAble","0");
                        }
                    } else {
                        if(!tbSiteMenus.get(i).getMenuUrl().contains("system")){
                            menuMap.put("permission","1");
                            menuMap.put("downloadAble","0");
                        } else {
                            menuMap.put("permission","0");
                            menuMap.put("downloadAble","0");
                        }
                    }
                    menuPermissionList.add(menuMap);
                }
                updateAclMulTi(menuPermissionList);
            }
        } catch (DuplicateKeyException e){
            throw new DuplicateKeyException("중복에러");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int updateTbUserStaff(TbUserStaffData tbUserStaffData) {

        int result = 0;

        try {
            OutputStream os = null;

            if (tbUserStaffData.getUserNo() != null){

                String pass = tbUserStaffData.getUserPwd();
                if(!StringUtils.isEmpty(pass)) {
                    String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                    tbUserStaffData.setUserPwd(encodedPassword);
                    result = tbUserRepository.updateUser(tbUserStaffData.getUserNo(),tbUserStaffData.getUserPwd());
                } else {
                    result = 1;
                }

                //암호화
                int result2 = tbUserStaffRepository.updateUserStaff(
                        tbUserStaffData.getUserNo(),
                        tbUserStaffData.getName(),
                        tbUserStaffData.getPhone(),
                        tbUserStaffData.getMemo(),
                        tbUserStaffData.getBlockTypeCode(),
                        tbUserStaffData.getUpdateUserId(),
                        tbUserStaffData.getDataStatus().ordinal()
                );
                if(result == 1 && result2 == 1) {
                    result = 1;
                } else {
                    result = 0;
                }
            } else {
                result = 0;
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    @Transactional
    public int updateTbUserStaffUseUser(TbUserStaffData tbUserStaffData) {
        int result = 0;
        try {
            OutputStream os = null;
            if (tbUserStaffData.getUserNo() != null){
                String pass = tbUserStaffData.getUserPwd();
                if(!StringUtils.isEmpty(pass)) {
                    String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                    tbUserStaffData.setUserPwd(encodedPassword);
                    result = tbUserRepository.updateUser(tbUserStaffData.getUserNo(),tbUserStaffData.getUserPwd());
                } else {
                    result = 1;
                }
            } else {
                result = 0;
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int insertTbDelivery(TbDeliveryData tbDeliveryData ) {

        int result = 0;
        tbDeliveryData.setOpenTimeStart(tbDeliveryData.getOpenTimeStart().replaceAll(":", ""));
        tbDeliveryData.setOpenTimeEnd(tbDeliveryData.getOpenTimeEnd().replaceAll(":", ""));

        if (tbDeliveryData.getDlvyNo() != null) {
            result = 0;
        } else {
            TbDelivery tbDelivery = tbDeliveryRepository.save(tbDeliveryData.insertData());
            result = 1;
        }
        return result;
    }


    @Transactional
    public int updateTbDelivery(TbDeliveryData tbDeliveryData ) {

        tbDeliveryData.setOpenTimeStart(tbDeliveryData.getOpenTimeStart().replaceAll(":",""));
        tbDeliveryData.setOpenTimeEnd(tbDeliveryData.getOpenTimeEnd().replaceAll(":",""));

        int result = 0;
        if(tbDeliveryRepository.existsById(tbDeliveryData.getDlvyNo())){
            tbDeliveryRepository.save(tbDeliveryData.insertData());
            //아이디가 있으면 update
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }

        return result;
    }

    @Transactional
    public int updateTbUser(TbUserWorkerData tbUserWorkerData,
                            TbWorkerChargeData tbWorkerChargData ,
                            MultipartFile imgFile,
                            MultipartFile imgFile2,
                            HttpSession session) {

        int result = 0;

        TbUserWorker tbUserWorker = null;
        try {
            SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
            SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
            Date time = new Date();
            String yyyy = format.format(time);
            String mm = format2.format(time);


            if (imgFile != null && !imgFile.isEmpty()) {
                OutputStream os = null;
                String fileName =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                //String fileName = RandomStringUtils.random(8,33,125,true,true);
                /*Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                    tbUserWorkerData.getHeadNo().toString(),
                    tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker");*/
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm);
                PrintWriter pw = null;

                byte[] bytes = imgFile.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }
                int pos = imgFile.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm,
                        fileName + "." + ext);
                //Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),tbUserWorkerData.getHeadNo().toString(),tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker",fileName + "." + ext);

                Path fileNamePath = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getPath(),
                        yyyy,
                        mm, fileName + "." + ext);
                tbUserWorkerData.setProfileFile(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();
                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                /*tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());*/
            }
            if (imgFile != null && !imgFile.isEmpty()) {
                OutputStream os2 = null;
                String fileName =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                int posThumb = imgFile.getOriginalFilename().lastIndexOf( "." );
                String extThumb = imgFile.getOriginalFilename().substring( posThumb + 1 );
                //썸네일 - 프로필사진 썸네일
                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm);
                byte[] thumbBytes = imgFile.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                byte[] thumbImg =  ImageUtil.generatelmage(thumbBytes,"W", 200);

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }
                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm,
                        fileName + "." + extThumb);
                Path fileThumbNamePath = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getProfilePath().getThumbPath(),
                        yyyy,
                        mm,
                        fileName + "." + extThumb);
                tbUserWorkerData.setProfileFileSmall(fileThumbNamePath.toFile().getPath());
                os2 = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os2.write(thumbImg);
                os2.close();
                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);
            } else {
                /*tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());*/
            }
            if (imgFile2 != null && !imgFile2.isEmpty()) {
                OutputStream os3 = null;
                String fileName2 =DateUtil.now_yyyymmdd().substring(6,8) +"_"+ DateUtil.now_hhmmss()+ "_" + RandomStringUtils.random(4,33,125,true,true);
                //String fileName = RandomStringUtils.random(8,33,125,true,true);
                /*Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                    tbUserWorkerData.getHeadNo().toString(),
                    tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker");*/
                Path filePath2 = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm);
                PrintWriter pw = null;
                byte[] bytes = imgFile2.getBytes();

                File uploadFile2 = new File(filePath2.toFile().getPath());
                if (!uploadFile2.exists()) {
                    uploadFile2.mkdirs();
                }
                int pos2 = imgFile2.getOriginalFilename().lastIndexOf( "." );
                String ext2 = imgFile2.getOriginalFilename().substring( pos2 + 1 );
                Path upoladFullPath2 = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm,
                        fileName2 + "." + ext2);
                //Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),tbUserWorkerData.getHeadNo().toString(),tbUserWorkerData.getBranchNo().toString(),tbUserWorkerData.getStoreNo().toString(),"worker",fileName + "." + ext);
                Path fileNamePath2 = Paths.get(
                        jesicaProperties.getServicePath().getPath(),
                        jesicaProperties.getLicensePath().getPath(),
                        yyyy,
                        mm, fileName2 + "." + ext2);
                tbUserWorkerData.setLicenseFile(fileNamePath2.toFile().getPath());
                os3 = new FileOutputStream(new File(upoladFullPath2.toFile().getPath()));
                os3.write(bytes);
                os3.close();
                log.debug("upoladFullPath2={}", upoladFullPath2);
            } else {
                /*tbUserWorkerData.setProfileFile(tbUserWorkerData.getProfileFile());*/
            }
        } catch (DuplicateKeyException e) {
            log.info("아이디 중복 에러");
        } catch (FileNotFoundException e){
            log.info("file not found!!");
        } catch (IOException e){
            log.error(e.getMessage());
        }
        try {
            if(tbUserWorkerData.getDataStatus().ordinal() == 1){
                tbUserWorkerData.setBlockTypeCode(null);
            }
            if(tbUserWorkerData.getDataStatus().ordinal() == 2){
                tbUserWorkerData.setAttendStatus(AttendStatusType.OFF_WORK);
            }

            CipherAESUtils cipherAESUtils = new CipherAESUtils(keyGeneratorConfig.generateSecretKeySpec(),keyGeneratorConfig.generateIvParameterSpec());

            //주민번호 암호화
            String registrationNum = cipherAESUtils.encryptAES(tbUserWorkerData.insertData().getRegistrationNum());

            if(tbUserWorkerRepository.existsById(tbUserWorkerData.getUserNo())){
                tbUserWorkerRepository.updateUserWorker(
                        tbUserWorkerData.getUserNo(),
                        tbUserWorkerData.getDataStatus().ordinal(),
                        tbUserWorkerData.getAttendStatus().ordinal(),
                        tbUserWorkerData.getBlockTypeCode(),
                        tbUserWorkerData.getHeadNo(),
                        tbUserWorkerData.getStoreNo(),
                        tbUserWorkerData.getBranchNo(),
                        tbUserWorkerData.getName(),
                        tbUserWorkerData.getPhone(),
                        tbUserWorkerData.getGender(),
                        tbUserWorkerData.getRegistNum(),
                        tbUserWorkerData.getJoinDate(),
                        tbUserWorkerData.getRetireDate(),
                        tbUserWorkerData.getAddr(),
                        tbUserWorkerData.getDeposit(),
                        tbUserWorkerData.getCash(),
                        tbUserWorkerData.getCashDefault(),
                        tbUserWorkerData.getCybankTypeCode(),
                        tbUserWorkerData.getCybankAccount(),
                        tbUserWorkerData.getPinNum(),
                        tbUserWorkerData.getBankTypeCode(),
                        tbUserWorkerData.getBankAccount(),
                        tbUserWorkerData.getBankOwner(),
                        tbUserWorkerData.getProfileFile(),
                        tbUserWorkerData.getProfileFileSmall(),
                        tbUserWorkerData.getLicenseFile(),
                        tbUserWorkerData.getLicenseNum(),
                        tbUserWorkerData.getLicenseType(),
                        tbUserWorkerData.getLicenseExpDate(),
                        tbUserWorkerData.getLicenseExpYn(),
                        tbUserWorkerData.getMemo(),
                        tbUserWorkerData.getWorkerPayType(),
                        tbUserWorkerData.getDlvyLimit(),
                        registrationNum,
                        tbUserWorkerData.getInsurancePolicy()
                );
                /*tbUserWorkerRepository.save(tbUserWorkerData.insertData());*/
                //수수료등록
                tbWorkerChargData.setWorkerNo(Integer.parseInt(tbUserWorkerData.getUserNo().toString()));
                tbWorkerChargeRepository.save(tbWorkerChargData.insertData());
                result = 1;

            } else {
                //아이디가 없으면 insert
                result = 0;
            }
        } catch (Exception e){

        }
        return result;
    }


    @Transactional(readOnly = true)
    public Map<String,Object> getBranchChart() {
        return tbBranchRepository.countChart();
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMaxSellChart() {
        return tbBranchRepository.getMaxSellChart();
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMaxGoodsChart() {
        return tbBranchRepository.getMaxGoodsChart();
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getMaxDlvyManChart() {
        return tbBranchRepository.getMaxDlvyManChart();
    }

    @Transactional(readOnly = true)
    public List<TbStoreDTO> storeTxt(String storeName) {
        if(" ".equals(storeName)){
            //return tbStoreRepository.findAll();
            return tbStoreRepository.findByStoreAll(storeName);
        } else {
            //return tbStoreRepository.findByStoreName(storeName);
            return tbStoreRepository.findByStoreNameLike("%"+storeName+"%");
        }

    }

    @Transactional(readOnly = true)
    public List<TbStoreDTO> getBranchTxt(String branchName) {
        if(" ".equals(branchName)){
            //return tbStoreRepository.findAll();
            return tbBranchRepository.findByBranchNameAll(branchName);
        } else {
            //return tbStoreRepository.findByStoreName(storeName);
            return tbBranchRepository.findByBranchNameLike("%"+branchName+"%");
        }

    }

    @Transactional(readOnly = true)
    public List<TbDlvyDTO> deliveryList(Integer branchNo, String dlvyGroupType) {
        List<TbDlvyDTO> result = null;
        if("one".equals(dlvyGroupType)){
            result = tbDeliveryRepository.findByBranchNo(branchNo,1);
        }else {
            result = tbDeliveryRepository.findByBranchNo(branchNo,2);
        }
        return result;
    }


    @Transactional(readOnly = true)
    public List<TbDlvyShareDTO> deliveryShareList(Long dlvyNo) {
        return tbDeliveryShareRepository.getDlvyShareList(dlvyNo);
    }

    @Transactional
    public int deliveryshareAddList(Long dlvyNo ,List<String> addList ) {

        for(String acceptNo : addList) {
            try {
                tbDeliveryShareRepository.saveToList(dlvyNo, Long.parseLong(acceptNo));
            } catch (Exception e){
                e.printStackTrace();
                return 0;
            }
        }
        return 1;
    }
    @Transactional
    public int delayTimeSet(Long giveDlvyNo ,Long acceptDlvyNo ,Integer delayTime) {
        try {
            tbDeliveryShareRepository.updateDelayTime(giveDlvyNo, acceptDlvyNo ,delayTime);
        } catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 1;
    }
    @Transactional
    public int deliveryshareDelList(Long dlvyNo ,List<String> delList ) {
        for(String acceptNo : delList) {
            try {
                tbDeliveryShareRepository.deleteToList(dlvyNo, Long.parseLong(acceptNo));
            } catch (Exception e){
                e.printStackTrace();
                return 0;
            }
        }
        return 1;
    }
    @Transactional
    public int deleteDeliveryman(String phone ) {
        try {
            //기사 회원 조희
            Integer workerNo = tbWorkerApplyRepository.selectUserNo(phone);
            tbWorkerChargeRepository.deleteWorkerCharge(phone);
            tbUserWorkerRepository.deleteUserWorker(phone);
            tbUserRepository.deleteUser(phone);
            tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
            tbWorkerApplyRepository.deleteWorkerApply(phone);
            //worker_no가 있으면 승인이 완료된 상태이므로 worker roweh tkrwp
          /* if(workerNo != null) {
               tbWorkerChargeRepository.deleteWorkerCharge(phone);
               tbUserWorkerRepository.deleteUserWorker(phone);
               tbUserRepository.deleteUser(phone);
               tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
               tbWorkerApplyRepository.deleteWorkerApply(phone);
           } else {
           //worker_no 가 없으면 가입 전 상태이므로 apply 관련된 row만 삭제
               tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
               tbWorkerApplyRepository.deleteWorkerApply(phone);
           }*/

        } catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    @Transactional
    public int deleteDriverApply(String phone ) {
        try {
            //기사 회원 조희
            //Integer workerNo = tbWorkerApplyRepository.selectUserNo(phone);
            tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
            tbWorkerApplyRepository.deleteWorkerApply(phone);
            //worker_no가 있으면 승인이 완료된 상태이므로 worker roweh tkrwp
          /* if(workerNo != null) {
               tbWorkerChargeRepository.deleteWorkerCharge(phone);
               tbUserWorkerRepository.deleteUserWorker(phone);
               tbUserRepository.deleteUser(phone);
               tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
               tbWorkerApplyRepository.deleteWorkerApply(phone);
           } else {
           //worker_no 가 없으면 가입 전 상태이므로 apply 관련된 row만 삭제
               tbWorkerApplyAttachRepository.deleteWorkerApplyAttach(phone);
               tbWorkerApplyRepository.deleteWorkerApply(phone);
           }*/

        } catch (Exception e){
            e.printStackTrace();
            return 0;
        }
        return 1;
    }

    /*@Transactional
    public int insertTbDlvyArea(TbDlvyArea tbDlvyArea ) {

        int result = 0;
        if(tbDlvyArea.getAreaNo() != null) {
            result = 0;
        } else {
            TbDlvyArea tbDlvyAreaCharge1 = tbDlvyAreaRepository.save(tbDlvyArea);
            result = 1;
        }
        return result;
    }*/

   /* @Transactional
    public int insertTbDlvyPriceCharge(TbDlvyPriceData tbDlvyPriceData) {

        int result = 0;
        if(tbDlvyPriceData.() != null) {
            result = 0;
        } else {
            TbDlvyPriceCharge tbDlvyAreaCharge1 = tbDlvyPriceChargeRepository.save(tbDlvyPriceChargeData.insertData());
            result = 1;
        }
        return result;
    }*/

    @Transactional
    public int insertTbDlvyArea(TbDlvyArea tbDlvyArea, List<Map<String,Object>> tbDlvyAreaList ) {

        int result = 0;
        if(tbDlvyArea.getAreaNo() != null) {
            result = 0;
        } else {
            Long gruopNo = tbDlvyArea.getGroupNo();
            int viewOrder = 0;
            if(tbDlvyArea.getAreaChargeType() == 0){
                viewOrder = 0;
            } else {
                viewOrder = tbDlvyAreaRepository.getMaxViewOrder(gruopNo,0);
            }

            tbDlvyArea.setViewOrder(viewOrder+1);
            tbDlvyArea.setUpdateUserId(null);
            TbDlvyArea tbDlvyAreaResult = tbDlvyAreaRepository.save(tbDlvyArea);

            int i = 1;
            for(Map<String,Object> tbDlvyAreaGeoPoint : tbDlvyAreaList ){
                TbDlvyAreaGeo tbDlvyAreaGeo = new TbDlvyAreaGeo();
                tbDlvyAreaGeo.setAreaNo(tbDlvyAreaResult.getAreaNo());
                tbDlvyAreaGeo.setGeoIdx(i);
                tbDlvyAreaGeo.setLat(Float.parseFloat(tbDlvyAreaGeoPoint.get("y").toString()));
                tbDlvyAreaGeo.setLng(Float.parseFloat(tbDlvyAreaGeoPoint.get("x").toString()));

                TbDlvyAreaGeo tbDlvyAreaGeo1 = tbDlvyAreaGeoRepository.save(tbDlvyAreaGeo);

                i++;
            }

            result = 1;
        }
        return result;
    }
    @Transactional
    public int updateTbDlvyArea(TbDlvyArea tbDlvyArea, List<Map<String,Object>> tbDlvyAreaList ) {

        int result = 0;
        if(tbDlvyArea.getAreaNo() != null) {
/*            Long gruopNo = tbDlvyArea.getGroupNo();
            int viewOrder = tbDlvyAreaRepository.getMaxViewOrder(gruopNo);

            tbDlvyArea.setViewOrder(viewOrder+1);*/
            TbDlvyArea tbDlvyAreaResult = tbDlvyAreaRepository.save(tbDlvyArea);
            int i = 1;

            //원래 좌표제거
            tbDlvyAreaGeoRepository.deleteByAreaNo(tbDlvyArea.getAreaNo());
            for(Map<String,Object> tbDlvyAreaGeoPoint : tbDlvyAreaList ){
                TbDlvyAreaGeo tbDlvyAreaGeo = new TbDlvyAreaGeo();
                tbDlvyAreaGeo.setAreaNo(tbDlvyAreaResult.getAreaNo());
                tbDlvyAreaGeo.setGeoIdx(i);
                tbDlvyAreaGeo.setLat(Float.parseFloat(tbDlvyAreaGeoPoint.get("y").toString()));
                tbDlvyAreaGeo.setLng(Float.parseFloat(tbDlvyAreaGeoPoint.get("x").toString()));

                TbDlvyAreaGeo tbDlvyAreaGeo1 = tbDlvyAreaGeoRepository.save(tbDlvyAreaGeo);

                i++;
            }


            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int deleteTbDlvyArea(Long areaNo) {

        int result = 0;
        if(areaNo != null) {
            //블록요금제거
            tbDlvyAreaRepository.deleteById(areaNo);
            //좌표제거
            tbDlvyAreaGeoRepository.deleteByAreaNo(areaNo);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbDlvyArea> tbDlvyAreaList(Long groupNo , Integer groupType, Integer areaChargeType) {
        List<TbDlvyArea> result = null;
        if(areaChargeType == 0 ){
            result =  tbDlvyAreaRepository.findByGroupNoAndGroupTypeAndAreaChargeType(groupNo,groupType, 0);
        } else {
            result =  tbDlvyAreaRepository.findByGroupNoAndGroupTypeAndAreaChargeTypeNot(groupNo,groupType, 0);
        }

        return result;
    }
    @Transactional(readOnly = true)
    public List tbDlvyAreaGeoList(Long groupNo , Integer groupType, Integer areaChargeType) {
        List<TbDlvyArea> tbDlvyAreas = null;
        if(areaChargeType == 0 ){
            tbDlvyAreas = tbDlvyAreaRepository.findByGroupNoAndGroupTypeAndAreaChargeType(groupNo,groupType,0);
        } else {
            tbDlvyAreas = tbDlvyAreaRepository.findByGroupNoAndGroupTypeAndAreaChargeTypeNot(groupNo,groupType,0);
        }

        List result = new ArrayList();
        if(tbDlvyAreas.size() > 0 ){
            for (TbDlvyArea tbDlvyArea : tbDlvyAreas) {
                log.info("areaNo :: {}", tbDlvyArea.getAreaNo());
                result.add(tbDlvyAreaGeoRepository.findByAreaNo(tbDlvyArea.getAreaNo()));
            }
        }
        return result;
    }
    @Transactional(readOnly = true)
    public List tbDlvyAreaGeoDetail(Long groupNo , Integer groupType, Long areaNo,Integer areaChargeType) {
        List<TbDlvyArea> tbDlvyAreas = null;
        if(areaChargeType == 0 ){
            tbDlvyAreas = tbDlvyAreaRepository.findByAreaNoAndGroupNoAndGroupTypeAndAreaChargeType(areaNo,groupNo,groupType,0);
        } else {
            tbDlvyAreas = tbDlvyAreaRepository.findByAreaNoAndGroupNoAndGroupTypeAndAreaChargeTypeNot(areaNo,groupNo,groupType,0);
        }

        List result = new ArrayList();
        if(tbDlvyAreas.size() > 0 ){
            for (TbDlvyArea tbDlvyArea : tbDlvyAreas) {
                log.info("areaNo :: {}", tbDlvyArea.getAreaNo());
                result.add(tbDlvyAreaGeoRepository.findByAreaNo(tbDlvyArea.getAreaNo()));
            }
        }
        return result;
    }

    @Transactional
    public int deliveryBlockSort(List<Map<String,Object>> deliveryBlockSort) {
        List resultList = new ArrayList();
        int result = 0;
        for (Map<String,Object> map : deliveryBlockSort) {
            log.info("areaNo :: {}", map.get("areaNo"));
            Long areaNo = Long.parseLong(map.get("areaNo").toString());
            Long groupNo = Long.parseLong(map.get("groupNo").toString());
            Integer groupType = Integer.parseInt(map.get("groupType").toString());
            Integer viewOrder = Integer.parseInt(map.get("viewOrder").toString());
            Integer newViewOrder = Integer.parseInt(map.get("newViewOrder").toString());
            resultList.add(tbDlvyAreaRepository.deliveryBlockSort(areaNo,groupNo,groupType,viewOrder,newViewOrder));
        }

        if (resultList.contains(0)) {
            System.err.println("변경된 리스트 ::::::::::::::");
            System.err.println(resultList);
            result = 0;
        } else {
            System.err.println(resultList);
            result = 1;
        }
        return result;
    }


    @Transactional
    public int updateTbSystemGoods(TbSystemGoodsData tbSystemGoodsData,
                                   MultipartFile imgFile1,
                                   MultipartFile imgFile2,
                                   MultipartFile imgFileSmall) {
        int result = 0;
        try {
            /*basContents.setBcThumbnail(imgFile.getBytes());*/
            OutputStream os = null;

            if (imgFile1 != null && !imgFile1.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode());
                PrintWriter pw = null;

                byte[] bytes = imgFile1.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile1.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode() ,fileName + "." + ext);

                Path fileNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode(), fileName + "." + ext);
                tbSystemGoodsData.setImgFile1(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbSystemGoodsData.setImgFile1(tbSystemGoodsData.getImgFile1());
            }

            if (imgFile2 != null && !imgFile2.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode());
                PrintWriter pw = null;

                byte[] bytes = imgFile2.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile2.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile2.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode() ,fileName + "." + ext);

                Path fileNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode(), fileName + "." + ext);
                tbSystemGoodsData.setImgFile2(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbSystemGoodsData.setImgFile2(tbSystemGoodsData.getImgFile2());
            }


            //썸네일 - 첫번쨰 사진을 썸네일로
            if (imgFileSmall != null && !imgFileSmall.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);

                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "sgoods", tbSystemGoodsData.getCatCode());
                byte[] thumbBytes = imgFile1.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                byte[] thumbImg =  ImageUtil.generatelmage(thumbBytes,"W", 200);

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile1.getOriginalFilename().substring( pos + 1 );

                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "sgoods", tbSystemGoodsData.getCatCode(),fileName + "_thumb." + ext);
                Path fileThumbNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode() , fileName + "_thumb." + ext);
                tbSystemGoodsData.setImgFileSmall(fileThumbNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os.write(thumbImg);
                os.close();

                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);

            } else {
                tbSystemGoodsData.setImgFileSmall(tbSystemGoodsData.getImgFileSmall());
            }

            if(tbSystemGoodsData.getGoodsNo() != null) {
                TbSystemGoods tbSystemGoods = tbSystemGoodsRepository.save(tbSystemGoodsData.updateData());

                result = 1;
            } else {
                result = 0;
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return result;
    }

    @Transactional
    public int insertTbSystemGoods(TbSystemGoodsData tbSystemGoodsData,
                                   MultipartFile imgFile1,
                                   MultipartFile imgFile2,
                                   MultipartFile imgFileSmall) {
        int result = 0;
        try {
            /*basContents.setBcThumbnail(imgFile.getBytes());*/
            OutputStream os = null;

            if (imgFile1 != null && !imgFile1.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode());
                PrintWriter pw = null;

                byte[] bytes = imgFile1.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile1.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode() ,fileName + "." + ext);

                Path fileNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode(), fileName + "." + ext);
                tbSystemGoodsData.setImgFile1(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbSystemGoodsData.setImgFile1(null);
            }

            if (imgFile2 != null && !imgFile2.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "sgoods", tbSystemGoodsData.getCatCode());
                PrintWriter pw = null;

                byte[] bytes = imgFile2.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile2.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile2.getOriginalFilename().substring( pos + 1 );

                Path upoladFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),"sgoods", tbSystemGoodsData.getCatCode() ,fileName + "." + ext);

                Path fileNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode(), fileName + "." + ext);
                tbSystemGoodsData.setImgFile2(fileNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladFullPath.toFile().getPath()));
                os.write(bytes);
                os.close();

                log.debug("upoladFullPath={}", upoladFullPath);
            } else {
                tbSystemGoodsData.setImgFile2(null);
            }


            //썸네일 - 첫번쨰 사진을 썸네일로
            if (imgFile1 != null && !imgFile1.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);

                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "sgoods", tbSystemGoodsData.getCatCode());
                byte[] thumbBytes = imgFile1.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                byte[] thumbImg =  ImageUtil.generatelmage(thumbBytes,"W", 200);

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }

                int pos = imgFile1.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFile1.getOriginalFilename().substring( pos + 1 );

                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "sgoods", tbSystemGoodsData.getCatCode(),fileName + "_thumb." + ext);
                Path fileThumbNamePath = Paths.get("/sgoods", tbSystemGoodsData.getCatCode() , fileName + "_thumb." + ext);
                tbSystemGoodsData.setImgFileSmall(fileThumbNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os.write(thumbImg);
                os.close();

                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);

            } else {
                tbSystemGoodsData.setImgFileSmall(null);
            }

            if(tbSystemGoodsData.getGoodsNo() != null) {
                /*TbSystemGoods tbSystemGoods = tbSystemGoodsRepository.save(tbSystemGoodsData.updateData());*/

                result = 0;
            } else {
                TbSystemGoods tbSystemGoods = tbSystemGoodsRepository.save(tbSystemGoodsData.updateData());
                result = 1;
            }

        } catch (IOException ex) {
            ex.printStackTrace();
        }

        return result;
    }


    @Transactional(readOnly = true)
    public List<TbDlvyPrice> tbDlvyPriceList(Long groupNo,Integer groupType) {
        List<TbDlvyPrice> result = null;
        result =  tbDlvyPriceRepository.findByGroupNoAndGroupTypeAndDataStatusOrderByDayAscStartTimeAscRadiusAsc(groupNo,groupType, 1);
        return result;
    }

    @Transactional
    public int insertTbDlvyPrice(TbDlvyPrice tbDlvyPrice) {

        int result = 0;
        if(tbDlvyPrice.getPriceNo() != null) {
            result = 0;
        } else {
            LocalDateTime now = LocalDateTime.now();
            tbDlvyPrice.setInsertDate(now);
            TbDlvyPrice tbDlvyPrice1 = tbDlvyPriceRepository.save(tbDlvyPrice);
            result = 1;
        }
        return result;
    }



    @Transactional
    public int updateTbDlvyPrice(TbDlvyPrice tbDlvyPrice) {

        int result = 0;
        if(tbDlvyPrice.getPriceNo() != null) {
            LocalDateTime now = LocalDateTime.now();
            tbDlvyPrice.setUpdateDate(now);
            TbDlvyPrice tbDlvyPrice1 = tbDlvyPriceRepository.save(tbDlvyPrice);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int insertTbNoticePlatform(TbNoticePlatform tbNoticePlatform) {

        int result = 0;
        if(tbNoticePlatform.getNoticeNo() != null) {
            result = 0;
        } else {
            TbNoticePlatform tbNoticePlatform1 = tbNoticePlatformRepository.save(tbNoticePlatform);
            result = 1;
        }
        return result;
    }
    @Transactional
    public int insertFaq(TbMannaFaq tbMannaFaq) {
        if (tbMannaFaq == null) {
            throw new IllegalArgumentException("FAQ 정보가 없습니다.");
        }

        if (tbMannaFaq.getFaqNo() != null) {
            return 0;
        }

        validateFaqCategory(tbMannaFaq.getFaqCategoryNo());

        tbMannaFaq.setDataStatus(1);
        tbMannaFaq.setInsertDate(LocalDateTime.now());

        if (tbMannaFaq.getUseYn() == null || tbMannaFaq.getUseYn().trim().isEmpty()) {
            tbMannaFaq.setUseYn("Y");
        }

        if (tbMannaFaq.getDisplayOrder() == null || tbMannaFaq.getDisplayOrder() <= 0) {
            Integer maxDisplayOrder = tbMannaFaqRepository
                    .findMaxDisplayOrderByFaqCategoryNo(tbMannaFaq.getFaqCategoryNo());

            tbMannaFaq.setDisplayOrder(
                    maxDisplayOrder == null ? 1 : maxDisplayOrder + 1
            );
        }

        tbMannaFaqRepository.save(tbMannaFaq);
        return 1;
    }

    @Transactional
    public int updateFaq(TbMannaFaq tbMannaFaq) {
        if (tbMannaFaq == null || tbMannaFaq.getFaqNo() == null) {
            return 0;
        }

        validateFaqCategory(tbMannaFaq.getFaqCategoryNo());

        return tbMannaFaqRepository.update(
                tbMannaFaq.getFaqNo(),
                tbMannaFaq.getFaqCategoryNo(),
                tbMannaFaq.getFaqQ(),
                tbMannaFaq.getFaqA(),
                tbMannaFaq.getUseYn(),
                tbMannaFaq.getDisplayOrder(),
                normalizeUserId(tbMannaFaq.getUpdateId())
        );
    }

    @Transactional
    public int updateTbNoticePlatform(TbNoticePlatform tbNoticePlatform) {

        int result = 0;
        if(tbNoticePlatform.getNoticeNo() != null) {
            TbNoticePlatform tbDlvyPrice1 = tbNoticePlatformRepository.save(tbNoticePlatform);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int insertTbNoticeCompany(TbNoticeCompany tbNoticeCompany) {

        int result = 0;
        if(tbNoticeCompany.getNoticeNo() != null) {
            result = 0;
        } else {
            TbNoticeCompany tbNoticeCompany1 = tbNoticeCompanyRepository.save(tbNoticeCompany);
            result = 1;
        }
        return result;
    }

    @Transactional
    public int updateTbNoticeCompany(TbNoticeCompany tbNoticeCompany) {

        int result = 0;
        if(tbNoticeCompany.getNoticeNo() != null) {
            TbNoticeCompany tbNoticeCompany1 = tbNoticeCompanyRepository.save(tbNoticeCompany);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int insertTbNoticeWorker(TbNoticeWorker tbNoticeWorker) {

        int result = 0;
        if(tbNoticeWorker.getNoticeNo() != null) {
            result = 0;
        } else {
            TbNoticeWorker tbNoticeWorker1 = tbNoticeWorkerRepository.save(tbNoticeWorker);
            result = 1;
        }
        return result;
    }


    @Transactional
    public int updateTbNoticeWorker(TbNoticeWorker tbNoticeWorker) {

        int result = 0;
        if(tbNoticeWorker.getNoticeNo() != null) {
            TbNoticeWorker tbNoticeWorker1 = tbNoticeWorkerRepository.save(tbNoticeWorker);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int updateStoreDlvyCharge(TbStoreDlvyChargeData tbStoreDlvyChargeData) {

        int result = 0;
        if(tbStoreDlvyChargeData.getStoreNo() != null) {
            TbStoreDlvyCharge tbStoreDlvyCharge = tbStoreDlvyChargeRepository.save(tbStoreDlvyChargeData.insertData());
            result = 1;
        } else {
            result = 0;
        }


        return result;
    }

    @Transactional
    public int updateStoreMngCharge(TbStoreMngChargeData tbStoreMngChargeData) {

        int result = 0;

        if(tbStoreMngChargeData.getStoreNo() != null) {
            TbStoreMngCharge tbStoreMngCharge = tbStoreMngChargeRepository.save(tbStoreMngChargeData.insertData());
            result = 1;
        } else {
            result = 0;
        }

        return result;
    }

    @Transactional
    public int updateStoreServiceCharge(TbStoreServiceChargeData tbStoreServiceChargeData) {

        int result = 0;
        TbStoreServiceCharge tbServiceCharge = tbStoreServiceChargeRepository.save(tbStoreServiceChargeData.insertData());
        if(tbServiceCharge.getChargeNo() != null) {
            result = 1;
        } else {
            result = 0;
        }

        return result;
    }

    @Transactional(readOnly = true)
    public List<TbUserStaffDTO> getUserStaffList(Integer headNo, Integer branchNo, Integer storeNo, Integer userType) {
        List<TbUserStaffDTO> result = null;
        switch(userType) {
            case 1: result =  tbUserStaffRepository.findByHeadNoAndUserTypeNative(headNo,userType);
                break;
            case 2: result =  tbUserStaffRepository.findByBranchNoNoAndUserTypeNative(branchNo,userType);
                break;
            case 3: result =  tbUserStaffRepository.findByStoreNoAndUserTypeNative(storeNo,userType);
                break;
            default:
                break;
        }

        return result;
    }

    @Transactional
    public TbUser getUser(String bmLoginId) {
        return tbUserRepository.findByUserId(bmLoginId);
    }

    @Transactional
    public TbUserStaff getUserStaff(String bmLoginId) {
        return tbUserStaffRepository.findByUserId(bmLoginId);
    }


    @Transactional
    public int insertEvent(TbEvent tbEvent
            /*MultipartFile imgFileSmall*/) {
        int result = 0;

        if(tbEvent.getEventNo() != null) {
            result = 0;
        } else {
            TbEvent tbEvent1 = tbEventRepository.save(tbEvent);
            result = 1;
        }

        return result;
    }

    @Transactional
    public int updateEvent(TbEvent tbEvent
            /*MultipartFile imgFileSmallFile*/) {
        int result = 0;

          /*  //썸네일 -
            if (imgFileSmallFile != null && !imgFileSmallFile.isEmpty()) {
                String fileName = RandomStringUtils.random(8,33,125,true,true);

                Path fileThumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "event");
                byte[] thumbBytes = imgFileSmallFile.getBytes();
                File uploadThumbFile = new File(fileThumbPath.toFile().getPath());
                byte[] thumbImg =  ImageUtil.generatelmage(thumbBytes,"W", 200);

                if (!uploadThumbFile.exists()) {
                    uploadThumbFile.mkdirs();
                }

                int pos = imgFileSmallFile.getOriginalFilename().lastIndexOf( "." );
                String ext = imgFileSmallFile.getOriginalFilename().substring( pos + 1 );

                Path upoladThumbFullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), "event",fileName + "_thumb." + ext);
                Path fileThumbNamePath = Paths.get("/event", fileName + "_thumb." + ext);
                tbEvent.setImgFileSmall(fileThumbNamePath.toFile().getPath());
                os = new FileOutputStream(new File(upoladThumbFullPath.toFile().getPath()));
                os.write(thumbImg);
                os.close();

                log.debug("upoladThumbFullPath={}", upoladThumbFullPath);

            } else {
                tbEvent.setImgFileSmall(tbEvent.getImgFileSmall());
            }*/

        if(tbEvent.getEventNo() != null) {
            /*TbSystemGoods tbSystemGoods = tbSystemGoodsRepository.save(tbSystemGoodsData.updateData());*/
            TbEvent tbEvent1 = tbEventRepository.save(tbEvent);
            result = 1;
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional
    public int insertTbNoticeRelease(TbNoticeRelease tbNoticeRelease
    ) {
        int result = 0;
        if(tbNoticeRelease.getNoticeNo() != null) {
            result = 0;
        } else {
            LocalDateTime now =  LocalDateTime.now();
            tbNoticeRelease.setInsertDate(now);
            TbNoticeRelease tbNoticeRelease1 = tbNoticeReleaseRepository.save(tbNoticeRelease);
            result = 1;
        }

        return result;
    }

    @Transactional
    public int updateTbNoticeRelease(TbNoticeRelease tbNoticeRelease
    ) {
        int result = 0;
        if(tbNoticeRelease.getNoticeNo() != null) {
            LocalDateTime now =  LocalDateTime.now();
            tbNoticeRelease.setUpdateDate(now);
            TbNoticeRelease tbNoticeRelease1 = tbNoticeReleaseRepository.save(tbNoticeRelease);
            result = 1;
        } else {
            result = 0;
        }

        return result;
    }

    @Transactional
    public int eventDelete(Long eventNo ) {
        int result = 0;
        result  = tbEventRepository.deleteEvent(eventNo);
        return result;
    }

    @Transactional
    public int noticeReleaseDelete(Long noticeNo ) {
        int result = 0;
        result  = tbNoticeReleaseRepository.deleteNotice(noticeNo);
        return result;
    }

    @Transactional
    public int noticePlatFormDelete(Long noticeNo ) {
        int result = 0;
        result  = tbNoticePlatformRepository.deleteNotice(noticeNo);
        return result;
    }
    @Transactional
    public int noticeCompanyDelete(Long noticeNo ) {
        int result = 0;
        result = tbNoticeCompanyRepository.deleteNotice(noticeNo);
        return result;
    }

    @Transactional
    public int noticeWorkerDelete(Long noticeNo ) {
        int result = 0;
        result  = tbNoticeWorkerRepository.deleteNotice(noticeNo);
        return result;
    }


    @Transactional
    public int insertServiceChargeGrp(TbServiceChargeGroupData tbServiceChargeGroupData) {

        int result = 0;
        if(tbServiceChargeGroupData.getChargeNo() != null) {
            result = 0;
        } else {
            TbServiceChargeGroup tbServiceChargeGroup1 = tbServiceChargeGroupRepository.save(tbServiceChargeGroupData.insertData());
            Long chargeNo = tbServiceChargeGroup1.getChargeNo();
            TbServiceChargeData tbServiceCharge = new TbServiceChargeData();
            tbServiceCharge.setChargeNo(chargeNo);
            tbServiceCharge.setPlatformType(0);
            for(int i = 0 ; i < 4 ; i++) {
                tbServiceCharge.setServiceType(i);
                tbServiceCharge.setSvcRate0(0);
                tbServiceCharge.setSvcRate1(0);
                tbServiceCharge.setSvcRate2(0);
                tbServiceCharge.setSvcRate3(0);
                tbServiceChargeRepository.save(tbServiceCharge.insertData());
            }
            tbServiceCharge.setPlatformType(1);
            for(int i = 0 ; i < 4 ; i++) {
                tbServiceCharge.setServiceType(i);
                tbServiceCharge.setSvcRate0(0);
                tbServiceCharge.setSvcRate1(0);
                tbServiceCharge.setSvcRate2(0);
                tbServiceCharge.setSvcRate3(0);
                tbServiceChargeRepository.save(tbServiceCharge.insertData());
            }
            result = 1;
        }
        return result;
    }

    @Transactional
    public int updateServiceChargeGrp(List<TbServiceChargeData> tbServiceChargeDataList) {

        int result = 0;
        try {
            int save = 0;
            for(TbServiceChargeData tbServiceChargeData : tbServiceChargeDataList){
                tbServiceChargeRepository.save(tbServiceChargeData.insertData());
                save ++;
            }

            if (save == 8) {
                result = 1;
            }
            result = 1;
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }
    @Transactional
    public int updateServiceChargeGrpName(String chargeName, Long chargeNo) {

        int result = 0;
        if(chargeNo != null) {
            result = tbServiceChargeGroupRepository.insertGroupName(chargeName,chargeNo);
        } else {
            result = 0;
        }
        return result;
    }

    @Transactional(readOnly = true)
    public List<TbSystemCategoryDTO> searchCateCodeList(Map<String,Object> searchValue) {
        List<TbSystemCategoryDTO> result = null;
        Integer catLevel = Integer.parseInt(searchValue.get("catLevel").toString());
        String parentCatCode = searchValue.get("parentCatCode").toString();

        result = tbSystemCategoryRepository.findByCatLevelAndParentCatCode(parentCatCode ,catLevel);
        return result;
    }

    @Transactional
    public void setPassCount(Long userNo ,Integer cnt) {
        tbUserRepository.insertFailCnt(userNo,cnt);
    }

    @Transactional
    public void setSuccessLoginSet(Long userNo ) {
        tbUserRepository.setSuccessLoginSet(userNo);
    }

   /* @Transactional
    public void setUserStop(Long userNo ) {
        tbUserStaffRepository.setUserStop(userNo);
    }*/



    @Transactional(readOnly = true)
    public List<TbWorkerApplyAttachDTO> tbWorkerApplyAttchList(Integer applyNo) {
        List<TbWorkerApplyAttachDTO> result = null;
        result = tbWorkerApplyAttachRepository.findByApplyNo(applyNo);
        return result;
    }


    @Transactional
    public int attachApproval(Long attachNo ,
                              Integer applyAttachType ,
                              String param1 ,
                              String param2 ,
                              String param3 ,
                              String uploadFile ,
                              Integer authStatus,
                              Integer applyNo,
                              String updateUserId,
                              String rejcectMemo,
                              String pushKey,
                              HttpSession session

    ) {
        int result = 0;
        try {
            Integer resultCode = tbWorkerApplyAttachRepository.attachApproval(attachNo,applyAttachType,authStatus,updateUserId,rejcectMemo);

            //상태가 승인일경우 - 프로필/면허증 승인이 둘다 승인일경우 최종승인
            if(authStatus == 2) {
                Data data= new Data();
                String title = "";
                String contents ="";
                Optional<TbWorkerApply> optional = tbWorkerApplyRepository.findById(applyNo);
                if(optional.isPresent()) {
                    TbWorkerApply tbWorkerApply = optional.get();



                    //현재 클릭한 상태에 대한 승인처리
                    //프로필승인
                    if(applyAttachType == 1) {

                        tbWorkerApply.setProfileAuthStatus(2);
            /*        tbWorkerApply.setName(param1);
                    tbWorkerApply.setResidentNum(param2);
                    tbWorkerApply.setPhone(param3);*/
                        tbWorkerApply.setProfileFile(uploadFile);

                        //날짜경로
                        SimpleDateFormat format = new SimpleDateFormat ( "yyyy");
                        SimpleDateFormat format2 = new SimpleDateFormat ( "MM");
                        Date time = new Date();
                        String yyyy = format.format(time);
                        String mm = format2.format(time);

                        Path fullPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(), URLDecoder.decode(uploadFile,"UTF-8"));
                        Path thumbPath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                                jesicaProperties.getServicePath().getPath(),
                                jesicaProperties.getProfilePath().getThumbPath(),
                                yyyy,
                                mm);
                        try {
                            File file = new File(fullPath.toString());
                            String fileName = file.getName();
                            String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
                            ImageUtil.makeThumbnail(fullPath.toString(),thumbPath.toFile().getPath(),fileName,ext);
                            Path profileFileSmallPath =Paths.get( jesicaProperties.getServicePath().getPath(),
                                    jesicaProperties.getProfilePath().getThumbPath(),
                                    yyyy,
                                    mm,fileName);
                            tbWorkerApply.setProfileFileSmall(profileFileSmallPath.toString());
                            //알림종류
                            data.setType("3");
                            //속성값
                            data.setValue("2");
                            title = "프로필이 승인되었습니다.";
                            contents = "프로필이 승인되었습니다.";
                        } catch (IOException e){
                            System.out.println(e);
                        }
                    }
                    //계정발급은 0: 미발급으로 일괄처리됨. 추후 서버에서 1로 바꿈
                    tbWorkerApply.setSignYn(0);

                    //면허증승인
                    if(applyAttachType == 2) {
                        tbWorkerApply.setLicenseAuthStatus(2);
                        tbWorkerApply.setLicenseNum(param1);
                        tbWorkerApply.setLicenseType(param2);
                        tbWorkerApply.setLicenseExpDate(param3);
                        tbWorkerApply.setLicenseFile(uploadFile);

                        //알림종류
                        data.setType("3");
                        //속성값
                        data.setValue("2");
                        title = "면허증이 승인되었습니다.";
                        contents = "면허증이 승인되었습니다.";
                    }
                    //경력확인서승인
                    if(applyAttachType == 3) {
                        tbWorkerApply.setCareerAuthStatus(2);
                        tbWorkerApply.setCareerFile(uploadFile);
                        //알림종류
                        data.setType("3");
                        //속성값
                        data.setValue("2");
                        title = "경력확인서가 승인되었습니다.";
                        contents = "경력확인서가 승인되었습니다.";

                    }

                    //프로필승인
                    Integer profile = tbWorkerApply.getProfileAuthStatus();
                    //면허증승인
                    Integer license = tbWorkerApply.getLicenseAuthStatus();

                    //최종승인은 프로필과 면허증만 승인되어도 최종승인
                    //최종승인은 서버에서 처리하기로함. 상태는 0번으로 처리
                    // * 경력확인서는 최종승인에 영향없음.
                    if(profile == 2 && license == 2 && applyAttachType != 3){
                        tbWorkerApplyRepository.updateAuthStatus(applyNo, 2);
                        //경력확인서 승인이 아닌경우
                        if(applyAttachType == 1 || applyAttachType == 2){


                            UserType userType = null;
                            TbUserWorkerData tbUserWorkerData = new TbUserWorkerData();
                            tbUserWorkerData.setUserType(userType.UT_DELIVERY);

                            tbUserWorkerData.setName(tbWorkerApply.getName());
                            tbUserWorkerData.setPhone(tbWorkerApply.getPhone());
                            tbUserWorkerData.setDataStatus(DataStatus.OK);
                            tbUserWorkerData.setLicenseFile(tbWorkerApply.getLicenseFile());
                            tbUserWorkerData.setLicenseType(tbWorkerApply.getLicenseType());
                            tbUserWorkerData.setLicenseExpDate(tbWorkerApply.getLicenseExpDate());
                            tbUserWorkerData.setLicenseNum(tbWorkerApply.getLicenseNum());
                            tbUserWorkerData.setProfileFile(tbWorkerApply.getProfileFile());
                            tbUserWorkerData.setProfileFileSmall(tbWorkerApply.getProfileFileSmall());
                            tbUserWorkerData.setJoinDate(DateUtil.now_yyyymmdd());
                            tbUserWorkerData.setHeadNo(1000);
                            tbUserWorkerData.setBranchNo(10001);
                            tbUserWorkerData.setStoreNo(100034);

                            TbUserWorker tbUserWorker =  tbUserWorkerRepository.save(tbUserWorkerData.insertData());


                            //최종승인인시 tb_user 추가
                            //TbUserDto tbUser = new TbUserDto();
                            //TbUserWorkerData tbUserWorker = new TbUserWorkerData();
                            //tbUser.setUserType(userType.UT_DELIVERY);
                            //LocalDateTime localDateTime = null;
                            //tbUser.setInsertDate(localDateTime.now());

                            //TbUser tbUser1 = tbUserRepository.save(tbUser.insertData());
                            tbWorkerApply.setWorkerNo(Integer.parseInt(tbUserWorker.getUserNo().toString()));

                            //최종승인시 tb_worker_charge 추가
                            TbWorkerChargeData tbWorkerCharge = new TbWorkerChargeData();
                            tbWorkerCharge.setWorkerNo(Integer.parseInt(tbUserWorker.getUserNo().toString()));
                            tbWorkerChargeRepository.save(tbWorkerCharge.insertData());


                           /* =tbUserWorkerRepository.saveUserWorker(
                                    Long.parseLong(tbUser1.getUserNo().toString()),
                                    tbWorkerApply.getName(),
                                    tbWorkerApply.getPhone(),
                                    1,
                                    tbWorkerApply.getLicenseFile(),
                                    tbWorkerApply.getLicenseType(),
                                    tbWorkerApply.getLicenseExpDate(),
                                    tbWorkerApply.getLicenseNum(),
                                    tbWorkerApply.getProfileFile(),
                                    tbWorkerApply.getProfileFileSmall(),
                                     DateUtil.now_yyyymmdd(),
                                     1000,
                                    10001, //드라이버관리수주[제주]
                                    100034 //드라이버관리[제주]
                            );*/

                            /*tbWorkerApplyRepository.updateAuthStatus(applyNo, 2);*/
                            tbWorkerApply.setBranchNo(10001);
                            tbWorkerApply.setAuthDate(LocalDateTime.now());
                            tbWorkerApply.setAuthStatus(2);
                        }
                        //1개만 승인인경우도 신청상태 - 12.28일 백대리님 요청
                    } else if(profile != 2 && license == 2 && applyAttachType != 3){
                        tbWorkerApply.setAuthStatus(1);
                        //1개만 승인인경우도 신청상태 - 12.28일 백대리님 요청
                    } else if(profile == 2 && license != 2 && applyAttachType != 3){
                        tbWorkerApply.setAuthStatus(1);
                    }
                    tbWorkerApplyRepository.save(tbWorkerApply);
                    //restTemplateUtil.pushMessage("jsdr",pushKey,title,contents,session,data);

                } else {
                    throw new Exception();
                }
                //상태가 반려일경우 - 최종승인을 신청으로 변경 (경력확인서는 예외)
            } else if(authStatus == 3 && applyAttachType != 3) {
                Data data= new Data();
                String title = "";
                String contents ="";
                Optional<TbWorkerApply> optional = tbWorkerApplyRepository.findById(applyNo);
                if (optional.isPresent()) {

                    TbWorkerApply tbWorkerApply = optional.get();

                    //현재 클릭한 상태에 대한 반려처리
                    //프로필반려
                    if (applyAttachType == 1) {
                        tbWorkerApply.setProfileAuthStatus(3);
                        //알림종류
                        data.setType("3");
                        //속성값
                        data.setValue("3");
                        title = "프로필이 반려되었습니다.";
                        contents = "프로필이 반려되었습니다.";
                    }
                    //면허증반려
                    if (applyAttachType == 2) {
                        tbWorkerApply.setLicenseAuthStatus(3);
                        //알림종류
                        data.setType("3");
                        //속성값
                        data.setValue("3");
                        title = "면허증이 반려되었습니다.";
                        contents = "면허증이 반려되었습니다.";
                    }

                    //반려인 경우 미등록
                    //1개만 승인인경우도 미등록
                    tbWorkerApply.setAuthStatus(0);
                    //경력확인서승인
                  /*  if (applyAttachType == 3) {
                        tbWorkerApply.setCareerAuthStatus(3);
                    }*/
                    tbWorkerApplyRepository.save(tbWorkerApply);
                    //restTemplateUtil.pushMessage("jsdr",pushKey,title,contents,session,data);
                }
                //경력확인서일경우
            } else if (authStatus == 3 && applyAttachType == 3){
                Data data= new Data();
                String title = "";
                String contents ="";
                Optional<TbWorkerApply> optional = tbWorkerApplyRepository.findById(applyNo);
                TbWorkerApply tbWorkerApply = optional.get();
                if (optional.isPresent()) {
                    tbWorkerApply.setCareerAuthStatus(3);
                    tbWorkerApplyRepository.save(tbWorkerApply);
                    //알림종류
                    data.setType("3");
                    //속성값
                    data.setValue("3");
                    title = "경력확인서가 반려되었습니다.";
                    contents = "경력확인서가 반려되었습니다.";

                    //restTemplateUtil.pushMessage("jsdr",pushKey,title,contents,session,data);
                }
            }
            result = 1;
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }


    @Transactional
    public int insertTbStoreRentalCar(TbStoreRentalCarData tbStoreRentalCarData) {
        int result = 0;

        if(tbStoreRentalCarData.getRentalCarNo() != null){
            //아이디가 있으면 update
            result = 0;
        } else {
            //아이디가 없으면 insert
            TbStoreRentalCar resultCar = tbStoreRentalCarRepository.save(tbStoreRentalCarData.insertData());
            //안심번호 매핑
            tbSafenMappingRepository.mappingSafenNum(resultCar.getRentalCarNo(),resultCar.getSafenNum());

            //TbSafenMapping tbSafenMapping = tbSafenMappingRepository.findByRentalCarNo(resultCar.getRentalCarNo());
            //tbStoreRentalCarRepository.updateSafenNum(resultCar.getRentalCarNo(),tbSafenMapping.getSafenNum());

            result = 1;
        }
        return result;
    }

    @Transactional
    public int updateTbStoreRentalCar(TbStoreRentalCarData tbStoreRentalCarData) {
        int result = 0;
        if(tbStoreRentalCarData.getRentalCarNo() != null){
            //아이디가 있으면 update
            TbStoreRentalCar resultCar = tbStoreRentalCarRepository.save(tbStoreRentalCarData.updateData());
            //안심번호체크이면 안심번호 매핑
         /*   if("on".equals(tbStoreRentalCarData.getSafeChk())) {
                tbSafenMappingRepository.mappingSafenNum(tbStoreRentalCarData.getRentalCarNo());
            }*/
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }
        return result;
    }

    @Transactional
    public int insertTbCoupon(TbCouponData tbCouponData) {
        int result = 0;

        if (tbCouponData.getCouponNo() != null) {
            //아이디가 있으면 update
            result = 0;
        } else {
            //아이디가 없으면 insert
            tbCouponRepository.save(tbCouponData.insertData());
            result = 1;
        }

        return result;
    }

    @Transactional
    public int updateTbCoupon(TbCouponData tbCouponData) {
        int result = 0;

        if (tbCouponData.getCouponNo() != null) {
            //아이디가 있으면 update
            TbCoupon tbCoupon = tbCouponRepository.save(tbCouponData.updateData());
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }

        return result;
    }

    @Transactional
    public int deleteTbCoupon(Long couponNo) {
        Optional<TbCoupon> tbCoupon = tbCouponRepository.findById(couponNo);

        if (tbCoupon.isPresent()) {
            TbCoupon coupon = tbCoupon.get();
            coupon.updateDisabledTbCoupon();
            return 1;
        } else {
            return 0;
        }
    }

    @Transactional(readOnly = true)
    public List<TbAppBannerDTO> bannerSortList(Integer serviceType, Integer platformType, Long serviceNo) {

        List<TbAppBannerDTO> listEvent  = tbAppBannerRepository.getSortBannerList(serviceType, platformType, serviceNo);
        return listEvent;
    }

    @Transactional
    public int updateViewOrder(String bannerNos) {
        int result = 0;
        String[] bannerNoArr = bannerNos.split(",");

        for(int i = 0; i < bannerNoArr.length; i++) {
            result = tbAppBannerRepository.updateViewOrder(i + 1, Long.parseLong(bannerNoArr[i]));

            if (result < 1) {
                return 0;
            }
        }
        return 1;
    }

    @Transactional(readOnly = true)
    public List<?> searchBoard(Integer platformType, Integer boardType, Long boardNo, String keyword) {
        Map<String,Object> searchValue = new HashMap<>();
        if (ObjectUtils.isNotEmpty(boardNo)) {
            if (boardType == 1) {
                List<TbEvent> listEvent = new ArrayList<>();
                TbEvent tbEvent = boardService.getTbEventDetail(boardNo, platformType);
                listEvent.add(tbEvent);
                return listEvent;
            } else {
                List<TbNoticePlatform> listNotice = new ArrayList<>();
                TbNoticePlatform tbNoticePlatform = boardService.getTbNoticePlatFormUserDetail(boardNo, platformType);
                listNotice.add(tbNoticePlatform);
                return listNotice;
            }
        } else if (StringUtils.isNotEmpty(keyword)) {
            searchValue.put("title", keyword);
        }
        searchValue.put("platformType", String.valueOf(platformType));
        //검색조건 이벤트일때
        if (boardType == 1) {
            List<TbEvent> result = boardService.tbEventSearch(searchValue);
            return result;
        } else if (boardType == 2) {
            //검색 조건 공지일때(고객 대상 공지만 검색)
            searchValue.put("groupType", 5);
            List<TbNoticePlatform> result = boardService.tbNoticePlatFormSearch(searchValue);
            return result;
        } else {
            return new ArrayList<>();
        }
    }

    @Transactional
    public int insertTbAppBanner(TbAppBannerData tbAppBannerData, MultipartFile imgFile, List<Map<String,String>> areaList) {

        int result = 0;
        tbAppBannerData.setPlatformType(2);
        try {
            OutputStream os = null;

            if (imgFile != null && !imgFile.isEmpty()) {
                String fileName = DateUtil.now_yyyymmdd().substring(6, 8) + "_" + DateUtil.now_hhmmss() + "_" + RandomStringUtils.random(4, 33, 125, true, true);
                Path filePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath());

                byte[] bytes = imgFile.getBytes();

                File uploadFile = new File(filePath.toFile().getPath());
                if (!uploadFile.exists()) {
                    uploadFile.mkdirs();
                }

                int pos = imgFile.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile.getOriginalFilename().substring(pos + 1);
                Path uploadFullPath = Paths.get(
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath(),
                        fileName + "." + ext);

                Path fileNamePath = Paths.get(jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath(),
                        fileName + "." + ext);

                os = new FileOutputStream(new File(fileNamePath.toFile().getPath()));
                os.write(bytes);
                os.close();
                tbAppBannerData.setBannerFile(uploadFullPath.toFile().getPath());
                log.debug("uploadFullPath=''", uploadFullPath);
            } else {
                tbAppBannerData.setBannerFile(tbAppBannerData.getBannerFile());
            }

            List<TbAppBanner> tbAppBannerList =
                    tbAppBannerRepository.findAllByViewYnAndDataStatusAndServiceNo(1, 1, tbAppBannerData.getServiceNo());

            if (tbAppBannerData.getViewYn() == 1) {

                int max = 0;
                if (ObjectUtils.isNotEmpty(tbAppBannerList)) {
                    for (TbAppBanner b : tbAppBannerList) {
                        Integer vo = b.getViewOrder();
                        if (vo != null && vo > max) max = vo;
                    }
                }

                tbAppBannerData.setViewOrder(max + 1);  // ✅ 리스트가 비었으면 max=0 => 1
            } else {
                tbAppBannerData.setViewOrder(null);
            }

            TbAppBanner bannerNo = tbAppBannerRepository.save(tbAppBannerData.insertData());
            if(tbAppBannerData.getBannerType() == 1){
                for (Map<String,String> area : areaList) {
                    tbAppBannerLocationRepository.bannerLocationAreaAdd(bannerNo.getBannerNo(), area.get("code1"), area.get("code2"));
                }
            }
            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    public int updateTbAppBanner(TbAppBannerData tbAppBannerData, MultipartFile imgFile) {
        int result = 0;
        tbAppBannerData.setPlatformType(2);

        try {
            Optional<TbAppBanner> opt = tbAppBannerRepository.findById(tbAppBannerData.getBannerNo());
            if (!opt.isPresent()) {
                return 0;
            }

            // ✅ 기존 엔티티를 영속 상태로 가져와서 필드만 갱신한다.
            // 이렇게 하면 DTO -> Entity 변환 과정에서 연관객체(service)까지 건드려서
            // HHH000502(immutable association modified) 경고가 나는 상황을 피할 수 있다.
            TbAppBanner banner = opt.get();
            int prevViewYn = banner.getViewYn() == null ? 0 : banner.getViewYn();

            // ---- bannerFile 처리 ----
            if (imgFile != null && !imgFile.isEmpty()) {
                String fileName = DateUtil.now_yyyymmdd().substring(6, 8) + "_" + DateUtil.now_hhmmss() + "_" + RandomStringUtils.random(4, 33, 125, true, true);
                Path filePath = Paths.get(
                        jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath()
                );

                byte[] bytes = imgFile.getBytes();
                File uploadDir = new File(filePath.toFile().getPath());
                if (!uploadDir.exists()) {
                    uploadDir.mkdirs();
                }

                int pos = imgFile.getOriginalFilename().lastIndexOf(".");
                String ext = imgFile.getOriginalFilename().substring(pos + 1);

                Path uploadFullPath = Paths.get(
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath(),
                        fileName + "." + ext
                );

                Path fileNamePath = Paths.get(
                        jesicaProperties.getBaseImgPath().getPath(),
                        jesicaProperties.getBoardPath().getPath(),
                        jesicaProperties.getBannerPath().getPath(),
                        fileName + "." + ext
                );

                try (OutputStream os = new FileOutputStream(new File(fileNamePath.toFile().getPath()))) {
                    os.write(bytes);
                }

                banner.setBannerFile(uploadFullPath.toFile().getPath());
                log.debug("uploadFullPath='{}'", uploadFullPath);
            } // 파일이 없으면 기존 bannerFile 유지

            // ---- 기본 필드 갱신 (FK는 serviceNo로만) ----
            banner.setPlatformType(2);
            banner.setServiceType(tbAppBannerData.getServiceType());
            banner.setViewYn(tbAppBannerData.getViewYn());
            banner.setBoardType(tbAppBannerData.getBoardType());
            banner.setBoardNo(tbAppBannerData.getBoardNo());
            banner.setDataStatus(tbAppBannerData.getDataStatus());
            banner.setBannerType(tbAppBannerData.getBannerType());
            banner.setLangCode(tbAppBannerData.getLangCode());
            banner.setAppCode(tbAppBannerData.getAppCode());

            // ✅ 연관객체(service)는 수정하지 않는다. (service는 조회 전용)
            banner.setServiceNo(tbAppBannerData.getServiceNo());

            // boardType != 3 이면 schemeUrl 제거
            if (tbAppBannerData.getBoardType() != 3 && tbAppBannerData.getBoardType() != 4) {
                banner.setSchemeUrl(null);
            } else {
                banner.setSchemeUrl(tbAppBannerData.getSchemeUrl());
            }

            // ---- viewOrder 재정렬 로직 ----
            if (tbAppBannerData.getViewYn() == 0) {
                // 노출 -> 숨김으로 변경: 현재 viewOrder 이후 항목들을 앞으로 당김
                Integer currentViewOrder = banner.getViewOrder();
                int viewOrder = (currentViewOrder != null ? currentViewOrder : 1);

                List<TbAppBanner> tbAppBannerList = tbAppBannerRepository
                        .findAllByViewYnAndDataStatusAndViewOrderIsGreaterThan(1, 1, viewOrder);

                for (int i = 0; i < tbAppBannerList.size(); i++) {
                    int index = viewOrder + i;
                    tbAppBannerRepository.updateViewOrder(index, tbAppBannerList.get(i).getBannerNo());
                }
                banner.setViewOrder(null);
            } else {
                // 숨김(0) -> 노출(1)로 변경할 때 마지막 viewOrder로 붙임
                if (prevViewYn == 0) {
                    List<TbAppBanner> tbAppBannerList = tbAppBannerRepository
                            .findAllByViewYnAndDataStatusAndServiceNo(1, 1, tbAppBannerData.getServiceNo());

                    int max = 0;
                    if (ObjectUtils.isNotEmpty(tbAppBannerList)) {
                        for (TbAppBanner b : tbAppBannerList) {
                            Integer vo = b.getViewOrder();
                            if (vo != null && vo > max) {
                                max = vo;
                            }
                        }
                    }
                    banner.setViewOrder(max + 1);
                }
                // 그 외(이미 노출 상태에서 수정)는 viewOrder 유지
            }

            // ✅ 기존 viewYn을 기반으로 "숨김 -> 노출" 상황에서 viewOrder 계산
            // (위에서 banner.setViewYn(...)를 했기 때문에, 기존 상태는 별도로 저장)
            // 따라서 기존값을 따로 다시 계산한다.
            // -> 안전하게 DB에서 현재 상태를 다시 조회하지 않고, 최초 조회 시점 값으로 판단
            //    (현재 트랜잭션 내에서 banner는 영속 객체)

            // 최종: banner.getViewYn()는 이미 새 값이므로,
            // 최초 조회 직후 값을 사용하도록 코드를 단순하게 다시 구성

            // ---- 저장 ----
            // banner는 영속 상태라 save()가 없어도 flush 시점에 반영되지만,
            // 기존 패턴을 유지하기 위해 save 호출은 남겨둔다.
            tbAppBannerRepository.save(banner);

            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    public int deleteTbAppBanner(Long bannerNo) {
        Optional<TbAppBanner> tbAppBanner = tbAppBannerRepository.findById(bannerNo);

        if (tbAppBanner.isPresent()) {
            TbAppBanner appBanner = tbAppBanner.get();
            appBanner.updateDisabledTbAppBanner();

            if (ObjectUtils.isNotEmpty(appBanner.getViewOrder())) {
                int viewOrder = appBanner.getViewOrder();
                List<TbAppBanner> tbAppBannerList = tbAppBannerRepository.findAllByViewYnAndDataStatusAndViewOrderIsGreaterThan(1, 1, viewOrder);

                for(int i = 0; i < tbAppBannerList.size(); i++) {
                    int index = viewOrder + i;
                    tbAppBannerRepository.updateViewOrder(index, tbAppBannerList.get(i).getBannerNo());
                }
            }

            return 1;
        } else {
            return 0;
        }
    }

    @Transactional
    public int updateCustPassword(TbCustData tbCustData) {

        int result = 0;

        try {
            if (tbCustData.getCustNo() != null) {
                String pass = tbCustData.getLoginPwd();
                if (StringUtils.isNotEmpty(pass)) {
                    String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                    tbCustData.setLoginPwd(encodedPassword);
                    result = tbCustRepository.updateCustPassword(tbCustData.getCustNo(),tbCustData.getLoginPwd());
                } else {
                    result = 0;
                }
            } else {
                result = 0;
            }

        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int updateCust(TbCustData tbCustData) {
        int result = 0;

        if (tbCustData.getCustNo() != null) {
            //아이디가 있으면 update
            tbCustRepository.updateCust(tbCustData.getCustNo(),
                    tbCustData.getCustName(),
                    tbCustData.getCustTel(),
                    tbCustData.getDataStatus(),
                    tbCustData.getGender(),
                    /*tbCustData.getSmsYn(),*/
                    tbCustData.getPushOrderYn(),
                    /* tbCustData.getPushNoticeYn(),*/
                    tbCustData.getPushMarketingYn(),
                    tbCustData.getPlatformType());
            result = 1;
        } else {
            //아이디가 없으면 insert
            result = 0;
        }

        return result;
    }

    @Transactional
    public int confirmOldPass(TbUserStaffData tbUserStaffData) {

        int result = 0;

        try {
            if (tbUserStaffData.getUserNo() != null) {
                String pass = tbUserStaffData.getUserOldPwd();
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                //기존 비밀번호 와 가져온 비밀번호 해쉬한값을 비교
                if (!StringUtils.isEmpty(pass)) {
                    Optional<TbUserStaff> optional = tbUserStaffRepository.findById(tbUserStaffData.getUserNo());
                    if (optional.isPresent()) {
                        TbUserStaff tbUserStaff = optional.get();
                        if(encoder.matches(pass, tbUserStaff.getUserPwd())) {
                            result =1;
                        }
                    }
                } else {
                    result = 0;
                }
            }
        } catch (Exception e){
            e.printStackTrace();
        }
        return result;
    }

    @Transactional
    public int membershipCouponUpdate(Map<String , String> map) {
        int result = 0;
        String cpnCode = "";
        String cpnStatus = "";
        String stCode = "";
        Long registMax = Long.parseLong("0");
        Long totalRegistMax = Long.parseLong("0");
        if(map.get("cpnCode") != null) {
            cpnCode = map.get("cpnCode").toString();
        }
        if(map.get("cpnStatus") != null) {
            cpnStatus = map.get("cpnStatus").toString();
        }
        if(map.get("stCode") != null) {
            stCode = map.get("stCode").toString();
        }
        if(map.get("registMax") != null) {
            registMax = Long.parseLong(map.get("registMax").toString());
        }
        if(map.get("totalRegistMax") != null) {
            totalRegistMax = Long.parseLong(map.get("totalRegistMax").toString());
        }

        try {
            tbMannaCouponPublishRepository.updateInfo(cpnCode,cpnStatus,stCode,registMax,totalRegistMax);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Transactional
    public int membershipCouponDelete(Map<String , String> map) {
        int result = 0;
        String cpnCode = "";
        if(map.get("cpnCode") != null) {
            cpnCode = map.get("cpnCode").toString();
        }

        try {
            tbMannaCouponPublishRepository.deleteInfo(cpnCode);
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    @Transactional
    public int systemMenuInsert(Long menuNo, Long userNo) {
        int result = 0;
        try {
            TbSiteAcl tbSiteAcl = new TbSiteAcl(userNo,menuNo,1,0);
            TbSiteAcl tbSiteAcl1 =  tbSiteAclRepository.save(tbSiteAcl);
            if(tbSiteAcl1.getMenuNo() != null){
                result = 200;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    @Transactional
    public int systemMenuDelete(Long menuNo, Long userNo) {
        int result = 0;
        try {
            tbSiteAclRepository.deleteAcl(userNo,menuNo);
            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    @Transactional
    public int updateAcl(Long menuNo, Long userNo,Long downloadAble) {
        int result = 0;
        try {
            tbSiteAclRepository.updateAcl(userNo,menuNo,downloadAble);
            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }
    @Transactional
    public int updateAclMulTi(List<HashMap<String,Object>> menuPermissionList) {
        int result = 0;
        try {

            for(int i = 0 ; i < menuPermissionList.size() ; i++ ){
                Map<String,Object> map = menuPermissionList.get(i);
                if(i == 0){
                    tbSiteAclRepository.deleteAcl(Long.parseLong(map.get("userNo").toString()));
                }

                TbSiteAcl tbSiteAcl = new TbSiteAcl(
                        Long.parseLong(map.get("userNo").toString()),
                        Long.parseLong(map.get("menuNo").toString()),
                        Integer.parseInt(map.get("permission").toString()),
                        Integer.parseInt(map.get("downloadAble").toString()));
                TbSiteAcl tbSiteAcl1 =  tbSiteAclRepository.save(tbSiteAcl);
              /*  if(tbSiteAcl1.getMenuNo() != null){
                    result = 200;
                }*/


            }
            result = 1;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return result;
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCustChart() {
        return tbCustRepository.getCustChart(1);
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserWorkerChart() { return tbUserWorkerRepository.getUserWorkerChart(); }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getWorkerApplyChart() {
        return tbWorkerApplyRepository.getWorkerApplyChart();
    }

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getStoreRentChart() {
        return tbStoreRepository.getStoreRentChart();
    }

    @Transactional(readOnly = true)
    public List<TbStore> getStoreList() {
        return tbStoreRepository.findByServiceType(ServiceType.RENTCAR);
    }

    /*@Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2040() {
        return tbCallAllRepository.getCallAllListType2040();
    }*/

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2040(String searchDate) {
        return tbCallAllRepository.getCallAllListType2040(searchDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2041(String searchDate) {
        return tbCallAllRepository.getCallAllListType2041(searchDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2140(String searchDate) {
        return tbCallAllRepository.getCallAllListType2140(searchDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2141(String searchDate) {
        return tbCallAllRepository.getCallAllListType2141(searchDate);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getAppCodeCustList(String appCode) {
        return tbCustRepository.getAppCodeCustList(appCode);
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserCount( Integer platformType, String appCode) {
        return tbCallAllRepository.getUserCount(platformType, appCode);
    }
    @Transactional(readOnly = true)
    public TbMannaCouponRegist getMembershipCouponInfo(Long publishNo) {
        Optional<TbMannaCouponRegist> tbMannaCouponRegist = tbMannaCouponRegistRepository.findByPublishNo(publishNo);
        if(tbMannaCouponRegist.isPresent() == false) {
            throw new ServiceException(ErrorCode.BAD_REQUEST);
        }
        return tbMannaCouponRegist.get();
    }


    @Transactional
    public int insertSurcharge(TbMannaLogisticsSurcharge param) {
        TbMannaLogisticsSurcharge entity = new TbMannaLogisticsSurcharge();

        entity.setPostcodeS(param.getPostcodeS());
        entity.setPostcodeE(param.getPostcodeE());
        entity.setAddrName(param.getAddrName());

        tbMannaLogisticsSurchargeRepository.save(entity);

        return 1;
    }

    @Transactional
    public int updateSurcharge(TbMannaLogisticsSurcharge param) {
        if (param.getSurchargeNo() == null) {
            return 0;
        }

        Optional<TbMannaLogisticsSurcharge> optional =
                tbMannaLogisticsSurchargeRepository.findById(param.getSurchargeNo());

        if (!optional.isPresent()) {
            return 0;
        }

        TbMannaLogisticsSurcharge entity = optional.get();

        entity.setPostcodeS(param.getPostcodeS());
        entity.setPostcodeE(param.getPostcodeE());
        entity.setAddrName(param.getAddrName());

        tbMannaLogisticsSurchargeRepository.save(entity);

        return 1;
    }

    @Transactional
    public int deleteSurcharge(Integer surchargeNo) {
        if (surchargeNo == null) {
            return 0;
        }
        if (!tbMannaLogisticsSurchargeRepository.existsById(surchargeNo)) {
            return 0;
        }
        tbMannaLogisticsSurchargeRepository.deleteById(surchargeNo);
        return 1;
    }

    @Transactional(readOnly = true)
    public int checkSurchargePostcode(String postcode) {
        if (postcode == null || postcode.trim().isEmpty()) {
            return 0;
        }

        postcode = postcode.trim();

        if (postcode.length() != 5) {
            return 0;
        }

        boolean exists = tbMannaLogisticsSurchargeRepository
                .existsByPostcodeSLessThanEqualAndPostcodeEGreaterThanEqual(postcode, postcode);

        return exists ? 1 : 0;
    }

    @Transactional(readOnly = true)
    public MannaFaqListResponse getFaqList(
            Long faqCategoryNo,
            String useYn,
            String keyword
    ) {
        useYn = normalize(useYn);
        keyword = normalize(keyword);

        List<TbMannaFaq> faqList = tbMannaFaqRepository.getFaqList(
                faqCategoryNo,
                useYn,
                keyword
        );

        List<TbMannaFaq> allFaqList =
                tbMannaFaqRepository
                        .findByDataStatusOrderByDisplayOrderAscFaqNoAsc(1);

        /*
         * 기존 카테고리명 문자열 집계 대신 카테고리 번호를 key로 사용한다.
         * 화면에서는 category API의 faqCount를 우선 사용하고,
         * FAQ 목록 응답의 categoryCount도 보조적으로 사용할 수 있다.
         */
        Map<String, Long> categoryCount = new LinkedHashMap<>();
        categoryCount.put("total", (long) allFaqList.size());

        Map<String, Long> grouped = allFaqList.stream()
                .filter(item -> item.getFaqCategoryNo() != null)
                .collect(
                        Collectors.groupingBy(
                                item -> String.valueOf(item.getFaqCategoryNo()),
                                LinkedHashMap::new,
                                Collectors.counting()
                        )
                );

        categoryCount.putAll(grouped);

        return MannaFaqListResponse.builder()
                .faqList(faqList)
                .totalCount(faqList.size())
                .categoryCount(categoryCount)
                .build();
    }

    @Transactional
    public TbMannaFaqCategory insertFaqCategory(
            TbMannaFaqCategory param
    ) {
        if (param == null) {
            throw new IllegalArgumentException(
                    "카테고리 정보가 없습니다."
            );
        }

        String faqCategoryName =
                param.getFaqCategoryName() == null
                        ? ""
                        : param.getFaqCategoryName().trim();

        if (faqCategoryName.isEmpty()) {
            throw new IllegalArgumentException(
                    "카테고리명을 입력해주세요."
            );
        }

        if (faqCategoryName.length() > 50) {
            throw new IllegalArgumentException(
                    "카테고리명은 최대 50자까지 입력할 수 있습니다."
            );
        }

        boolean duplicate =
                tbMannaFaqCategoryRepository
                        .existsByFaqCategoryNameAndDataStatus(
                                faqCategoryName,
                                1
                        );

        if (duplicate) {
            throw new IllegalArgumentException(
                    "이미 등록된 카테고리명입니다."
            );
        }


        String useYn =
                param.getUseYn() == null
                        ? "Y"
                        : param.getUseYn().trim().toUpperCase();

        if (
                !"Y".equals(useYn)
                        && !"N".equals(useYn)
        ) {
            useYn = "Y";
        }

        String insertId =
                param.getInsertId() == null
                        ? ""
                        : param.getInsertId().trim();

        TbMannaFaqCategory category =
                new TbMannaFaqCategory();

        category.setFaqCategoryName(faqCategoryName);
        category.setUseYn(useYn);
        category.setDataStatus(1);
        category.setInsertId(insertId);
        category.setInsertDate(LocalDateTime.now());

        return tbMannaFaqCategoryRepository.save(category);
    }
    @Transactional
    public void deleteFaqCategory(
            Long faqCategoryNo,
            String updateId
    ) {
        if (faqCategoryNo == null) {
            throw new IllegalArgumentException(
                    "FAQ 카테고리 번호가 없습니다."
            );
        }

        TbMannaFaqCategory category =
                tbMannaFaqCategoryRepository
                        .findByFaqCategoryNoAndDataStatus(
                                faqCategoryNo,
                                1
                        )
                        .orElseThrow(
                                () -> new IllegalArgumentException(
                                        "존재하지 않거나 이미 삭제된 카테고리입니다."
                                )
                        );

        long faqCount =
                tbMannaFaqRepository
                        .countByFaqCategoryNoAndDataStatus(
                                faqCategoryNo,
                                1
                        );

        if (faqCount > 0) {
            throw new IllegalArgumentException(
                    "해당 카테고리에 등록된 FAQ가 있어 삭제할 수 없습니다."
            );
        }

        String normalizedUpdateId =
                updateId == null
                        ? ""
                        : updateId.trim();

        int updatedCount =
                tbMannaFaqCategoryRepository
                        .softDeleteCategory(
                                category.getFaqCategoryNo(),
                                normalizedUpdateId
                        );

        if (updatedCount < 1) {
            throw new IllegalStateException(
                    "FAQ 카테고리 삭제에 실패했습니다."
            );
        }
    }

    @Transactional
    public void updateFaqCategory(
            TbMannaFaqCategory param
    ) {
        if (param == null) {
            throw new IllegalArgumentException(
                    "카테고리 정보가 없습니다."
            );
        }

        Long faqCategoryNo =
                param.getFaqCategoryNo();

        if (faqCategoryNo == null) {
            throw new IllegalArgumentException(
                    "FAQ 카테고리 번호가 없습니다."
            );
        }

        TbMannaFaqCategory origin =
                tbMannaFaqCategoryRepository
                        .findByFaqCategoryNoAndDataStatus(
                                faqCategoryNo,
                                1
                        )
                        .orElseThrow(
                                () -> new IllegalArgumentException(
                                        "존재하지 않거나 삭제된 카테고리입니다."
                                )
                        );

        String faqCategoryName =
                param.getFaqCategoryName() == null
                        ? ""
                        : param.getFaqCategoryName().trim();

        if (faqCategoryName.isEmpty()) {
            throw new IllegalArgumentException(
                    "카테고리명을 입력해주세요."
            );
        }

        if (faqCategoryName.length() > 50) {
            throw new IllegalArgumentException(
                    "카테고리명은 최대 50자까지 입력할 수 있습니다."
            );
        }

        boolean duplicate =
                tbMannaFaqCategoryRepository
                        .existsByFaqCategoryNameAndDataStatusAndFaqCategoryNoNot(
                                faqCategoryName,
                                1,
                                faqCategoryNo
                        );

        if (duplicate) {
            throw new IllegalArgumentException(
                    "이미 등록된 카테고리명입니다."
            );
        }

        String useYn =
                param.getUseYn() == null
                        ? origin.getUseYn()
                        : param.getUseYn()
                        .trim()
                        .toUpperCase();

        if (
                !"Y".equals(useYn)
                        && !"N".equals(useYn)
        ) {
            useYn = "Y";
        }


        String updateId =
                param.getUpdateId() == null
                        ? ""
                        : param.getUpdateId().trim();

        int updatedCount =
                tbMannaFaqCategoryRepository
                        .updateCategory(
                                faqCategoryNo,
                                faqCategoryName,
                                useYn,
                                updateId
                        );

        if (updatedCount < 1) {
            throw new IllegalStateException(
                    "FAQ 카테고리 수정에 실패했습니다."
            );
        }
    }
    @Transactional
    public int updateCustRecommSt(
            Integer custNo,
            String stCode,
            String recommStName,
            String brCode,
            String masterStCode,
            Integer serviceNo,
            String stAppUseType
    ) {
        return tbCustRepository.updateCustRecommSt(
                custNo,
                stCode,
                recommStName,
                brCode,
                masterStCode,
                serviceNo,
                stAppUseType
        );
    }

    /**
     * FAQ 관리 화면의 왼쪽 카테고리와 등록/수정 셀렉트에서 사용한다.
     *
     * 응답 예시:
     * {
     *   faqCategoryNo: 1,
     *   faqCategoryName: "이용안내",
     *   displayOrder: 1,
     *   useYn: "Y",
     *   faqCount: 3
     * }
     */
    @Transactional(readOnly = true)
    public List<Map<String, Object>> getFaqCategoryList(
            String useYn,
            Integer dataStatus
    ) {
        String normalizedUseYn = normalize(useYn);
        int normalizedDataStatus = dataStatus == null ? 1 : dataStatus;

        List<TbMannaFaqCategory> categoryList;

        if (normalizedUseYn.isEmpty()) {
            categoryList = tbMannaFaqCategoryRepository
                    .findByDataStatusOrderByFaqCategoryNoAsc(
                            normalizedDataStatus
                    );
        } else {
            categoryList = tbMannaFaqCategoryRepository
                    .findByUseYnAndDataStatusOrderByFaqCategoryNoAsc(
                            normalizedUseYn,
                            normalizedDataStatus
                    );
        }

        List<TbMannaFaq> allFaqList = tbMannaFaqRepository
                .findByDataStatusOrderByDisplayOrderAscFaqNoAsc(1);

        Map<Long, Long> countMap = allFaqList.stream()
                .filter(item -> item.getFaqCategoryNo() != null)
                .collect(
                        Collectors.groupingBy(
                                TbMannaFaq::getFaqCategoryNo,
                                Collectors.counting()
                        )
                );

        return categoryList.stream()
                .map(category -> {
                    Map<String, Object> item = new LinkedHashMap<>();

                    item.put(
                            "faqCategoryNo",
                            category.getFaqCategoryNo()
                    );
                    item.put(
                            "faqCategoryName",
                            category.getFaqCategoryName()
                    );
                    item.put("useYn", category.getUseYn());
                    item.put(
                            "faqCount",
                            countMap.getOrDefault(
                                    category.getFaqCategoryNo(),
                                    0L
                            )
                    );

                    return item;
                })
                .collect(Collectors.toList());
    }

    @Transactional(readOnly = true)
    public TbMannaFaq getFaqDetail(Long faqNo) {
        if (faqNo == null) {
            throw new IllegalArgumentException("FAQ 번호가 없습니다.");
        }

        return tbMannaFaqRepository
                .findByFaqNoAndDataStatus(faqNo, 1)
                .orElseThrow(() ->
                        new IllegalArgumentException(
                                "FAQ 정보를 찾을 수 없습니다."
                        )
                );
    }

    @Transactional
    public void updateFaqSort(
            List<MannaFaqSortRequest> sortList,
            String updateId
    ) {
        if (sortList == null || sortList.isEmpty()) {
            throw new IllegalArgumentException(
                    "변경할 FAQ 순서 정보가 없습니다."
            );
        }

        updateId = normalizeUserId(updateId);

        for (int i = 0; i < sortList.size(); i++) {
            MannaFaqSortRequest request = sortList.get(i);

            if (request == null || request.getFaqNo() == null) {
                continue;
            }

            int displayOrder =
                    request.getDisplayOrder() == null ||
                            request.getDisplayOrder() <= 0
                            ? i + 1
                            : request.getDisplayOrder();

            int updated = tbMannaFaqRepository.updateDisplayOrder(
                    request.getFaqNo(),
                    displayOrder,
                    updateId
            );

            if (updated == 0) {
                throw new IllegalArgumentException(
                        "FAQ 순서 변경 대상이 없습니다. faqNo="
                                + request.getFaqNo()
                );
            }
        }
    }

    @Transactional
    public void deleteFaq(Long faqNo, String updateId) {
        if (faqNo == null) {
            throw new IllegalArgumentException("FAQ 번호가 없습니다.");
        }

        int updated = tbMannaFaqRepository.softDeleteFaq(
                faqNo,
                normalizeUserId(updateId)
        );

        if (updated == 0) {
            throw new IllegalArgumentException(
                    "삭제할 FAQ 정보를 찾을 수 없습니다."
            );
        }
    }

    private void validateFaqCategory(Long faqCategoryNo) {
        if (faqCategoryNo == null) {
            throw new IllegalArgumentException(
                    "FAQ 카테고리를 선택해주세요."
            );
        }

        boolean exists = tbMannaFaqCategoryRepository
                .existsByFaqCategoryNoAndDataStatus(
                        faqCategoryNo,
                        1
                );

        if (!exists) {
            throw new IllegalArgumentException(
                    "사용 가능한 FAQ 카테고리가 아닙니다."
            );
        }
    }

    private String normalize(String value) {
        return value == null ? "" : value.trim();
    }

    private String normalizeUserId(String value) {
        String userId = normalize(value);
        return userId.isEmpty() ? "SYSTEM" : userId;
    }
}

