
package com.trism.jesica.Util;

import com.trism.jesica.dto.LangUpdateProperty;
import lombok.extern.slf4j.Slf4j;

import java.io.*;
import java.nio.charset.Charset;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Properties;
@Slf4j
public class PropertiesGenerateUtil {

    public static String updateProperty(List<LangUpdateProperty> langUpdatePropertyList, String propPath, String language) {
        Properties props = new Properties();
        String propFullPathname = propPath+"_"+language+".properties";

        //등록시간을 남기기 위한 Date
        SimpleDateFormat format = new SimpleDateFormat ( "yyyy-MM-dd HH:mm:ss");
        Date time = new Date();
        String sysDate = format.format(time);

        String result = "fail";

        try {
            Path propFile = Paths.get(propFullPathname);
            if (Files.notExists(propFile)) {
                Files.createFile(propFile);
            }
            props.load(new FileReader(propFullPathname));

            for( LangUpdateProperty list : langUpdatePropertyList  ) {

                String tslKeyOne = "";
                String tslKeyTwo = "";
                String tslKeyThree = "";
                String tslKeyFour = "";
                String value = "";
                String group = list.getTslKeyGroup();

                //2뎁스에 값이 존재한다면
                if(list.getTslKeyOne() != null && !"".equals(list.getTslKeyOne()) ){
                    tslKeyOne = "."+ list.getTslKeyOne();
                }
                //3뎁스에 값이 존재한다면
                if(list.getTslKeyTwo() != null && !"".equals(list.getTslKeyTwo()) ){
                    tslKeyTwo = "."+ list.getTslKeyTwo();
                }
                //4뎁스에 값이 존재한다면
                if(list.getTslKeyThree() != null && !"".equals(list.getTslKeyThree()) ){
                    tslKeyThree = "."+ list.getTslKeyThree();
                }
                //5뎁스에 값이 존재한다면
                if(list.getTslKeyFour() != null && !"".equals(list.getTslKeyFour()) ){
                    tslKeyFour = "."+ list.getTslKeyFour();
                }

                //현재 생성하고 있는 언어 국가 구분
                if(list.getTslValueKh() != null && "kh".equals(language)) {
                    value = list.getTslValueKh();
                }
                if(list.getTslValueKo() != null && "ko".equals(language)) {
                    value = list.getTslValueKo();
                }
                if(list.getTslValueEn() != null && "en".equals(language)) {
                    value = list.getTslValueEn();
                }

                final String key = group + tslKeyOne + tslKeyTwo + tslKeyThree + tslKeyFour;

                //*파일설정값 읽기 (기존)
                String propertyOld = props.getProperty(key);

                //*파일설정값 쓰기
                props.setProperty(key, value);
                log.info("@@@ Updated property : key={}, old={}, new={} ", key, propertyOld, value);
            }

            //최종결과 파일에 저장하기
            //한글의 경우 깨져서 등록되기 때문에 따로 utf-8세팅을 해준뒤 쓰도록 수정
            try (
                    FileOutputStream fo = new FileOutputStream(propFullPathname);
                    Writer writer = new OutputStreamWriter( fo, Charset.forName("utf-8"));
            ) {
                props.store(writer, "Updated Date : " + sysDate);
            }

            //성공일경우
            result = "success";
        } catch (Exception e){
            e.printStackTrace();

            //실패일경우
            result = "fail";
        }

        return result;
    }

    // 유니코드에서 String으로 변환
    public static String convertString(String val) {
        // 변환할 문자를 저장할 버퍼 선언
        StringBuffer sb = new StringBuffer();
        // 글자를 하나하나 탐색한다.
        for (int i = 0; i < val.length(); i++) {
            if ('\\' == val.charAt(i) && 'u' == val.charAt(i + 1)) {
        // 그 뒤 네글자는 유니코드의 16진수 코드이다. int형으로 바꾸어서 다시 char 타입으로 강제 변환한다.
                Character r = (char) Integer.parseInt(val.substring(i + 2, i + 6), 16);
        // 변환된 글자를 버퍼에 넣는다.
                sb.append(r);
        // for의 증가 값 1과 5를 합해 6글자를 점프
                i += 5;
            } else {
        // ascii코드면 그대로 버퍼에 넣는다.
                sb.append(val.charAt(i));
            }
        }
        // 결과 리턴
        return sb.toString();
    }
}

