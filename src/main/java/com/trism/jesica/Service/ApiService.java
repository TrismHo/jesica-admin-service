package com.trism.jesica.Service;

import com.trism.jesica.Util.DateUtil;
import com.trism.jesica.Util.ImageUtil;
import com.trism.jesica.Util.RestTemplateUtil;
import com.trism.jesica.Util.Secure.CipherAESUtils;
import com.trism.jesica.config.JesicaProperties;
import com.trism.jesica.config.KeyGeneratorConfig;
import com.trism.jesica.dto.*;
import com.trism.jesica.persistence.Entitiy.block.TbDlvyArea;
import com.trism.jesica.persistence.Entitiy.block.TbDlvyAreaGeo;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeCompany;
import com.trism.jesica.persistence.Entitiy.board.TbNoticePlatform;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeRelease;
import com.trism.jesica.persistence.Entitiy.board.TbNoticeWorker;
import com.trism.jesica.persistence.Entitiy.business.*;
import com.trism.jesica.persistence.Entitiy.car.TbStoreRentalCar;
import com.trism.jesica.persistence.Entitiy.coupon.TbCoupon;
import com.trism.jesica.persistence.Entitiy.event.TbEvent;
import com.trism.jesica.persistence.Entitiy.goods.*;
import com.trism.jesica.persistence.Entitiy.safe.TbSafenMapping;
import com.trism.jesica.persistence.Entitiy.service.TbServiceChargeGroup;
import com.trism.jesica.persistence.Entitiy.service.TbStoreServiceCharge;
import com.trism.jesica.persistence.Entitiy.storedlvy.TbStoreDlvyCharge;
import com.trism.jesica.persistence.Entitiy.storedlvy.TbStoreMngCharge;
import com.trism.jesica.persistence.Entitiy.street.TbDlvyPrice;
import com.trism.jesica.persistence.Entitiy.system.TbSystemCode;
import com.trism.jesica.persistence.Entitiy.worker.TbWorkerApply;
import com.trism.jesica.persistence.Repository.block.TbDlvyAreaGeoRepository;
import com.trism.jesica.persistence.Repository.block.TbDlvyAreaRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticeCompanyRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticePlatformRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticeReleaseRepository;
import com.trism.jesica.persistence.Repository.board.TbNoticeWorkerRepository;
import com.trism.jesica.persistence.Repository.business.*;
import com.trism.jesica.persistence.Repository.call.TbCallAllRepository;
import com.trism.jesica.persistence.Repository.car.TbStoreRentalCarRepository;
import com.trism.jesica.persistence.Repository.coupon.TbCouponRepository;
import com.trism.jesica.persistence.Repository.event.TbEventRepository;
import com.trism.jesica.persistence.Repository.goods.*;
import com.trism.jesica.persistence.Repository.safe.TbSafenMappingRepository;
import com.trism.jesica.persistence.Repository.service.TbServiceChargeGroupRepository;
import com.trism.jesica.persistence.Repository.service.TbServiceChargeRepository;
import com.trism.jesica.persistence.Repository.service.TbStoreServiceChargeRepository;
import com.trism.jesica.persistence.Repository.storedlvy.TbStoreDlvyChargeRepository;
import com.trism.jesica.persistence.Repository.storedlvy.TbStoreMngChargeRepository;
import com.trism.jesica.persistence.Repository.street.TbDlvyPriceChargeRepository;
import com.trism.jesica.persistence.Repository.street.TbDlvyPriceRepository;
import com.trism.jesica.persistence.Repository.system.TbSystemCodeRepository;
import com.trism.jesica.persistence.Repository.worker.TbWorkerApplyAttachRepository;
import com.trism.jesica.persistence.Repository.worker.TbWorkerApplyRepository;
import com.trism.jesica.persistence.Repository.worker.TbWorkerChargeRepository;
import com.trism.jesica.persistence.type.AttendStatusType;
import com.trism.jesica.persistence.type.ServiceType;
import com.trism.jesica.persistence.type.UserType;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.apache.commons.lang3.ObjectUtils;
import org.apache.commons.lang3.RandomStringUtils;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
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
import java.time.LocalDateTime;
import java.util.*;

@RequiredArgsConstructor
@Service
@Slf4j
public class ApiService {

    @Autowired
    private final JesicaProperties jesicaProperties;

    @Autowired
    private final TbHeadRepository tbHeadRepository;

    @Autowired
    private final TbBranchRepository tbBranchRepository;

    @Autowired
    private final TbStoreRepository tbStoreRepository;

    @Autowired
    private final TbStoreCategoryFoRepository tbStoreCategoryFoRepository;

    @Autowired
    private final TbStoreGoodsRepository tbStoreGoodsRepository;

    @Autowired
    private final TbStoreGoodsItemRepository tbStoreGoodsItemRepository;

    @Autowired
    private final TbStoreCategoryRepository tbStoreCategoryRepository;

    @Autowired
    private final TbStoreOptionRepository tbStoreOptionRepository;

    @Autowired
    private final TbStoreOptionItemRepository tbStoreOptionItemRepository;

    @Autowired
    private final TbStoreCategoryGoodsRepository tbStoreCategoryGoodsRepository;

    @Autowired
    private final TbStoreGoodsOptionRepository tbStoreGoodsOptionRepository;

    @Autowired
    private final TbHeadBusinessInfoRepository tbHeadBusinessInfoRepository;

    @Autowired
    private final TbBranchBusinessInfoRepository tbBranchBusinessInfoRepository;

    @Autowired
    private final TbStoreBusinessInfoRepository tbStoreBusinessInfoRepository;

    @Autowired
    private final TbDeliveryRepository tbDeliveryRepository;

    @Autowired
    private final TbBrandRepository tbBrandRepository;

    @Autowired
    private final TbSystemCodeRepository tbSystemCodeRepository;

    @Autowired
    private final TbUserRepository tbUserRepository;

    @Autowired
    private final TbUserWorkerRepository tbUserWorkerRepository;

    @Autowired
    private final TbDeliveryShareRepository tbDeliveryShareRepository;


    @Autowired
    private final TbDlvyAreaRepository tbDlvyAreaRepository;

    @Autowired
    private final TbDlvyAreaGeoRepository tbDlvyAreaGeoRepository;

    @Autowired
    private final TbSystemGoodsRepository tbSystemGoodsRepository;

    @Autowired
    private final TbDlvyPriceChargeRepository tbDlvyPriceChargeRepository;

    @Autowired
    private final TbDlvyPriceRepository tbDlvyPriceRepository;

    @Autowired
    private final TbStoreDlvyChargeRepository tbStoreDlvyChargeRepository;

    @Autowired
    private final TbStoreMngChargeRepository tbStoreMngChargeRepository;

    @Autowired
    private final TbUserStaffRepository tbUserStaffRepository;

    @Autowired
    private final TbNoticePlatformRepository tbNoticePlatformRepository;

    @Autowired
    private final TbNoticeCompanyRepository tbNoticeCompanyRepository;

    @Autowired
    private final TbNoticeWorkerRepository tbNoticeWorkerRepository;

    @Autowired
    private final TbEventRepository tbEventRepository;

    @Autowired
    private final TbServiceChargeGroupRepository tbServiceChargeGroupRepository;

    @Autowired
    private final TbServiceChargeRepository tbServiceChargeRepository;

    @Autowired
    private final TbStoreServiceChargeRepository tbStoreServiceChargeRepository;

    @Autowired
    private final TbSystemCategoryRepository tbSystemCategoryRepository;

    @Autowired
    private final KeyGeneratorConfig keyGeneratorConfig;

    @Autowired
    private final TbWorkerApplyAttachRepository tbWorkerApplyAttachRepository;

    @Autowired
    private final TbWorkerApplyRepository tbWorkerApplyRepository;

    @Autowired
    private final TbStoreRentalCarRepository tbStoreRentalCarRepository;

    @Autowired
    private final TbSafenMappingRepository tbSafenMappingRepository;

    @Autowired
    private final TbNoticeReleaseRepository tbNoticeReleaseRepository;

    @Autowired
    private final TbCallAllRepository tbCallAllRepository;

    @Autowired
    private final TbWorkerChargeRepository tbWorkerChargeRepository;

    @Autowired
    private final TbStoreChargeRepository tbStoreChargeRepository;

    @Autowired
    private final TbStorePriceRepository tbStorePriceRepository;

    @Autowired
    private final TbBranchPriceRepository tbBranchPriceRepository;

    @Autowired
    private RestTemplateUtil restTemplateUtil;

    @Autowired
    private final TbCouponRepository tbCouponRepository;

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
             /*   BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbBranchData.insertData().getPinNum());*/
                String pinEncrpt = null;
                bankEncrpt = null;
                ownerEncrpt = null;
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
               /* BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbStoreData.insertData().getPinNum());*/
                String pinEncrpt = null;
                bankEncrpt = null;
                ownerEncrpt = null;
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
        return tbSystemCodeRepository.findBySysType(sysType);
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

                //PIN번호 암호화
                BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
                String pinEncrpt = encoder.encode(tbUserWorkerData.insertData().getPinNum());
                //TbHead tbHead =  tbHeadRepository.save(tbHeadData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));
                //tbUserWorkerRepository.save(tbUserWorkerData.insertData());
                tbUserWorker =  tbUserWorkerRepository.save(tbUserWorkerData.insertDataEncrypt(pinEncrpt, bankEncrpt, ownerEncrpt));

                //tb_wokrer_charge 세팅
                TbWorkerChargeData tbWorkerCharge = new TbWorkerChargeData();
                tbWorkerCharge.setWorkerNo(Integer.parseInt(tbUserWorker.getUserNo().toString()));
                tbWorkerChargeRepository.save(tbWorkerCharge.insertData());
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
    public int insertTbUserStaff(TbUserStaffData tbUserStaffData) {

        int result = 0;

        try {
            OutputStream os = null;

            if (tbUserStaffData.getUserNo() != null){
            } else {
                String pass = tbUserStaffData.getUserPwd();

                //암호화
                String encodedPassword = new BCryptPasswordEncoder().encode(pass);
                tbUserStaffData.setUserPwd(encodedPassword);

                TbUserStaff tbUserStaff = tbUserStaffRepository.findByUserId(tbUserStaffData.getUserId());


                if(ObjectUtils.isNotEmpty(tbUserStaff)) {
                    if (!StringUtils.isEmpty(tbUserStaff.getName())) {
                        //중복
                        result = 500;
                    } else {
                        tbUserStaffRepository.save(tbUserStaffData.insertData());
                        result = 1;
                    }
                } else {
                    tbUserStaffRepository.save(tbUserStaffData.insertData());
                    result = 1;
                }

            }
        } catch (DataIntegrityViolationException e){
            throw new DataIntegrityViolationException("중복에러");
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

            if(tbUserWorkerData.getDataStatus().ordinal() == 1){
                tbUserWorkerData.setBlockTypeCode(null);
            }
            if(tbUserWorkerData.getDataStatus().ordinal() == 2){
                tbUserWorkerData.setAttendStatus(AttendStatusType.OFF_WORK);
            }
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
                        tbUserWorkerData.getDlvyLimit()
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
                        } catch (IOException e){
                            System.out.println(e);
                        }
                    }
                    //계정발급은 0: 미발급으로 일괄처리됨. 추후 서버에서 1로 바꿈
                    tbWorkerApply.setSignYn(0);

                    //푸시메시지 발송 추가
                    restTemplateUtil.pushMessage("jsdr",pushKey,"프로필이 승인되었습니다.","프로필이 승인되었습니다.",session);
                    //면허증승인
                    if(applyAttachType == 2) {
                        tbWorkerApply.setLicenseAuthStatus(2);
                        tbWorkerApply.setLicenseNum(param1);
                        tbWorkerApply.setLicenseType(param2);
                        tbWorkerApply.setLicenseExpDate(param3);
                        tbWorkerApply.setLicenseFile(uploadFile);
                    //푸시메시지 발송 추가
                    restTemplateUtil.pushMessage("jsdr",pushKey,"면허증이 승인되었습니다.","면허증이 승인되었습니다.",session);
                    }
                    //경력확인서승인
                    if(applyAttachType == 3) {
                        tbWorkerApply.setCareerAuthStatus(2);
                        tbWorkerApply.setCareerFile(uploadFile);
                    restTemplateUtil.pushMessage("jsdr",pushKey,"경력확인서가 승인되었습니다.","경력확인서가 승인되었습니다.",session);
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
                            //최종승인인시 tb_user 추가
                            TbUserDto tbUser = new TbUserDto();
                            UserType userType = null;
                            TbUserWorkerData tbUserWorker = new TbUserWorkerData();
                            tbUser.setUserType(userType.UT_DELIVERY);
                            LocalDateTime localDateTime = null;
                            tbUser.setInsertDate(localDateTime.now());

                            TbUser tbUser1 = tbUserRepository.save(tbUser.insertData());
                            tbWorkerApply.setWorkerNo(Integer.parseInt(tbUser1.getUserNo().toString()));

                            //최종승인시 tb_worker_charge 추가
                            TbWorkerChargeData tbWorkerCharge = new TbWorkerChargeData();
                            tbWorkerCharge.setWorkerNo(Integer.parseInt(tbUser1.getUserNo().toString()));
                            tbWorkerChargeRepository.save(tbWorkerCharge.insertData());


                            tbUserWorkerRepository.saveUserWorker(
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
                            );

                            /*tbWorkerApplyRepository.updateAuthStatus(applyNo, 2);*/
                            tbWorkerApply.setAuthStatus(2);
                            restTemplateUtil.pushMessage("jsdr",pushKey,"최종승인되었습니다.","최종승인되었습니다.",session);
                        }
                        //1개만 승인인경우도 신청상태 - 12.28일 백대리님 요청
                    } else if(profile != 2 && license == 2 && applyAttachType != 3){
                        tbWorkerApply.setAuthStatus(1);
                        //1개만 승인인경우도 신청상태 - 12.28일 백대리님 요청
                    } else if(profile == 2 && license != 2 && applyAttachType != 3){
                        tbWorkerApply.setAuthStatus(1);
                    }
                    tbWorkerApplyRepository.save(tbWorkerApply);

                } else {
                    throw new Exception();
                }
                //상태가 반려일경우 - 최종승인을 신청으로 변경 (경력확인서는 예외)
            } else if(authStatus == 3 && applyAttachType != 3) {
                Optional<TbWorkerApply> optional = tbWorkerApplyRepository.findById(applyNo);
                if (optional.isPresent()) {

                    TbWorkerApply tbWorkerApply = optional.get();

                    //현재 클릭한 상태에 대한 반려처리
                    //프로필반려
                    if (applyAttachType == 1) {
                        tbWorkerApply.setProfileAuthStatus(3);
                        restTemplateUtil.pushMessage("jsdr",pushKey,"프로필이 반려되었습니다.","프로필이 반려되었습니다.",session);
                    }
                    //면허증반려
                    if (applyAttachType == 2) {
                        tbWorkerApply.setLicenseAuthStatus(3);
                        restTemplateUtil.pushMessage("jsdr",pushKey,"면허증이 반려되었습니다.","면허증이 반려되었습니다.",session);
                    }

                    //반려인 경우 미등록
                    //1개만 승인인경우도 미등록
                    tbWorkerApply.setAuthStatus(0);
                    //경력확인서승인
                  /*  if (applyAttachType == 3) {
                        tbWorkerApply.setCareerAuthStatus(3);
                    }*/
                    tbWorkerApplyRepository.save(tbWorkerApply);
                }
                //경력확인서일경우
            } else if (authStatus == 3 && applyAttachType == 3){
                Optional<TbWorkerApply> optional = tbWorkerApplyRepository.findById(applyNo);
                TbWorkerApply tbWorkerApply = optional.get();
                if (optional.isPresent()) {
                    tbWorkerApply.setCareerAuthStatus(3);
                    tbWorkerApplyRepository.save(tbWorkerApply);
                    restTemplateUtil.pushMessage("jsdr",pushKey,"경력확인서가 반려되었습니다.","경력확인서가 반려되었습니다.",session);
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
            tbSafenMappingRepository.mappingSafenNum(resultCar.getRentalCarNo());

            TbSafenMapping tbSafenMapping = tbSafenMappingRepository.findByRentalCarNo(resultCar.getRentalCarNo());
            tbStoreRentalCarRepository.updateSafenNum(resultCar.getRentalCarNo(),tbSafenMapping.getSafenNum());

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
            TbCoupon tbCoupon = tbCouponRepository.save(tbCouponData.insertData());
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

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getUserChart() {
        return tbUserRepository.getUserChart();
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

    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2040() {
        return tbCallAllRepository.getCallAllListType2040();
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2041() {
        return tbCallAllRepository.getCallAllListType2041();
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2140() {
        return tbCallAllRepository.getCallAllListType2140();
    }
    @Transactional(readOnly = true)
    public List<Map<String,Object>> getCallAllListType2141() {
        return tbCallAllRepository.getCallAllListType2141();
    }
}

