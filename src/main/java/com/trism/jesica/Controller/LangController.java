package com.trism.jesica.Controller;

/*import com.trism.manna.Service.BasManagerService;
import com.trism.manna.persistence.Entitiy.BasManager;
import com.trism.manna.persistence.Entitiy.Common.LoginSession;*/
/*import com.trism.manna.Service.LangService;
import com.trism.manna.persistence.Entitiy.TblSiteLang;*/

import com.trism.jesica.Service.LangService;
import com.trism.jesica.persistence.Entitiy.system.TbSiteLang;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

@RequestMapping("/language")
@RestController
@RequiredArgsConstructor
@Slf4j
public class LangController {



    private final LangService langService;


    /**
     * 언어팩 관리 페이지
     */
    @GetMapping("/list")
    public ModelAndView login(HttpSession session, Model model){

        List<TbSiteLang> tblSiteLang = langService.tblSiteLang();
        List<HashMap<String,Object>> list = new ArrayList();

        for( TbSiteLang user : tblSiteLang  ) {
            String tslKeyOne = "";
            String tslKeyTwo = "";
            String tslKeyThree = "";
            String tslKeyFour = "";
            String value = "";

            HashMap<String,Object> map = new HashMap();


            String key = user.getTslKeyGroup();
            if(user.getTslKeyOne() != null && !"".equals(user.getTslKeyOne())){
                tslKeyOne = "."+user.getTslKeyOne();
            }
            if(user.getTslKeyTwo() != null && !"".equals(user.getTslKeyTwo())){
                tslKeyTwo = "."+user.getTslKeyTwo();
            }
            if(user.getTslKeyThree() != null && !"".equals(user.getTslKeyThree())){
                tslKeyThree = "."+user.getTslKeyThree();
            }
            if(user.getTslKeyFour() != null && !"".equals(user.getTslKeyFour())){
                tslKeyFour = "."+user.getTslKeyFour();
            }

            //가져온 뎁스별 값을 하나로 합쳐줌
            value = key+tslKeyOne+tslKeyTwo+tslKeyThree+tslKeyFour;

            map.put("tslId",user.getTslId());
            map.put("name",user.getTslName());
            map.put("key",value);
            map.put("ko",user.getTslValueKo());
            map.put("en",user.getTslValueEn());
            map.put("kh",user.getTslValueKh());

            list.add(map);
        }

        model.addAttribute("tblSiteLang", list);

        return new ModelAndView("jesica/system/language/list");
    }

}


