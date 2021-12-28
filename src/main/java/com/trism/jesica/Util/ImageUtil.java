package com.trism.jesica.Util;


import org.apache.commons.io.output.ByteArrayOutputStream;
import org.imgscalr.Scalr;

import javax.imageio.ImageIO;
import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.IOException;
import java.nio.file.Path;
import java.nio.file.Paths;

public class ImageUtil {
    public static byte[] generatelmage(byte[] imageContent, String mainPosition, int maxWH) throws IOException {
        // 원본 이미지 가져오기
        BufferedImage originalImg = ImageIO.read(new ByteArrayInputStream(imageContent));

        String imgFormat = "jpg";  // 새 이미지 포맷. jpg, gif 등
        int imageWidth;
        int imageHeight;
        double ratio;
        int w;
        int h;

        // 원본 이미지 사이즈 가져오기
        imageWidth = originalImg.getWidth(null);
        imageHeight = originalImg.getHeight(null);

        if(mainPosition.equals("W")){    // 넓이기준

            ratio = (double)maxWH/(double)imageWidth;
            w = (int)(imageWidth * ratio);
            h = (int)(imageHeight * ratio);



        }else if(mainPosition.equals("H")){ // 높이기준
            ratio = (double)maxWH/(double)imageHeight;
            w = (int)(imageWidth * ratio);
            h = (int)(imageHeight * ratio);



        }else{ //설정값 (비율무시)
            w = maxWH;
            h = maxWH;
        }

        // 이미지 리사이즈
        // Image.SCALE_DEFAULT : 기본 이미지 스케일링 알고리즘 사용
        // Image.SCALE_FAST    : 이미지 부드러움보다 속도 우선
        // Image.SCALE_REPLICATE : ReplicateScaleFilter 클래스로 구체화 된 이미지 크기 조절 알고리즘
        // Image.SCALE_SMOOTH  : 속도보다 이미지 부드러움을 우선
        // Image.SCALE_AREA_AVERAGING  : 평균 알고리즘 사용
        Image resizeImage = originalImg.getScaledInstance(w, h, Image.SCALE_SMOOTH);


        // 새 이미지  저장하기

        BufferedImage newImage = new BufferedImage(w, h, BufferedImage.TYPE_INT_RGB);
        Graphics g = newImage.getGraphics();
        g.drawImage(resizeImage, 0, 0, null);
        g.dispose();

        ByteArrayOutputStream output = new ByteArrayOutputStream();
        ImageIO.write(newImage, imgFormat, output);
        return output.toByteArray();

    }

    /** * 썸네일을 생성합니다. * 250 x 150 크기의 썸네일을 만듭니다. */
    public static void makeThumbnail(String fullPath, String thumbPath, String fileName, String fileExt) throws Exception {
        // 저장된 원본파일로부터 BufferedImage 객체를 생성합니다.
        BufferedImage srcImg = ImageIO.read(new File(fullPath));
        // 썸네일의 너비와 높이 입니다.
        int dw = 250, dh = 150;
        // 원본 이미지의 너비와 높이 입니다.
        int ow = srcImg.getWidth(); int oh = srcImg.getHeight();
        // 원본 너비를 기준으로 하여 썸네일의 비율로 높이를 계산합니다.
        int nw = ow; int nh = (ow * dh) / dw;
        // 계산된 높이가 원본보다 높다면 crop이 안되므로
        // 원본 높이를 기준으로 썸네일의 비율로 너비를 계산합니다.
        if(nh > oh) { nw = (oh * dw) / dh; nh = oh; }
        // 계산된 크기로 원본이미지를 가운데에서 crop 합니다.
        BufferedImage cropImg = Scalr.crop(srcImg, (ow-nw)/2, (oh-nh)/2, nw, nh);
        // crop된 이미지로 썸네일을 생성합니다.
        BufferedImage destImg = Scalr.resize(cropImg, dw, dh);

        File uploadFile = new File(thumbPath);
        if (!uploadFile.exists()) {
            uploadFile.mkdirs();
        }

        // 썸네일을 저장합니다. 이미지 이름 앞에 "THUMB_" 를 붙여 표시했습니다.
        Path thumbFullPath = Paths.get(uploadFile.toString(), "thumb_"+fileName);
        // Path thumbPath2 = Paths.get( fileName +"_thumb_"+ random+"."+fileExt);
        File thumbFile = new File(thumbFullPath.toString());
        ImageIO.write(destImg, fileExt.toUpperCase(), thumbFile);


    }
}
