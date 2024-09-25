<%--
  Created by IntelliJ IDEA.
  User: HongJungho
  Date: 2021-06-01
  Time: 오전 11:43
  To change this template use File | Settings | File Templates.
--%>
<script src="https://code.jquery.com/jquery-2.2.1.js"></script>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html lang="ko"><head>
    <meta charset="utf-8">
    <title>잇수다</title>
    <meta name="viewport" content="width=320, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, target-densitydpi=medium-dpi">
    <!-- 	<link rel="icon" href="http://test.bursim.co.kr/assets/img/favicon.ico" type="image/x-icon" /> -->
    <meta name="description" content="잇수다">

    <meta property="og:image" content="">
    <meta property="og:description" content="잇수다">

    <meta name="twitter:card" content="summary">
    <meta name="twitter:title" content="잇수다">
    <meta name="twitter:url" content="">
    <meta name="twitter:image" content="">
    <meta name="twitter:description" content="잇수다">

    <!-- css -->
    <link rel="stylesheet" type="text/css" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css">
    <!-- 아이콘 css -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <!-- 웹폰트 -->
    <link rel="stylesheet" type="text/css" href="https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css">
    <!-- js -->
    <!-- 	<script src="/common/js/jquery-ui.min.js"></script> -->
    <!-- 	<script src="/common/js/jquery.bgswitcher.js"></script> -->
    <style>
        @charset "UTF-8";
        /*@import url(http://fonts.googleapis.com/earlyaccess/nanumgothic.css);*/

        :root {
            --goods-img-width: 100px;
            --goods-img-height: 100px;
        }


        @font-face {
            font-family: 'Nanum Square R';
            font-style: normal;
            font-weight: 400;
            font-display: auto;
            src: local('Nanum Square R'),
            url(/common/fonts/NanumSquareR.woff) format('woff'),
            url(/common/fonts/NanumSquareR.otf) format('opentype');
        }
        .nanumsquare { font-family: 'NanumSquare', sans-serif !important; }
        html {
            font-family: 'Nanum Square R';
            touch-action: none; /* 브라우저가 모든 터치 이벤트를 무시하도록 설정 */
        }

        html, body, div, span, iframe, h1, h2, h3, h4, h5, h6, p, a, address, em, img, strong, tt, dl, dt, dd, ol, ul, li, form, label, table, tr, th, td, article, aside, canvas, embed, figure, footer, header, menu, nav, section, map, fieldset, audio, video {margin: 0; padding: 0;}
        a:link,a:visited,a:hover,a:active{text-decoration:none;}
        ol, ul, dl {list-style: none;}
        img{ border:0;}
        body{font-size:12px;background-color:#E8F3EC; -ms-user-select: none; -moz-user-select: -moz-none; -webkit-user-select: none; -khtml-user-select: none; user-select:none;}
        table{ border-spacing:0px; }

        /*인풋*/
        input[type=text],[type=password],[type=number],[type=tel] {
            font-family: 'Noto Sans KR';
            font-size: 9pt;
            /*	border: 1px solid #ABAEB3;*/
            /*	color: #555;*/
            height: 20px;
            text-align: left;
            padding-left: 5px;
            padding-right: 5px;
            border: 1px solid #E0D9DF;
            color : #969696;

        }
        input[type="checkbox"],
        input[type="radio"]{ margin:-4px 0 0 0; padding:0; border:0; border-radius:0; cursor:pointer; outline: 0; }
        input[type="checkbox"]:checked,
        input[type="radio"]:checked{ background-position: left bottom !important; }
        input[type=checkbox] {width: 15px; height: 15px; background: url(/assets/img/bul_chk.png) no-repeat; background-size:100% 200%;}
        input[type=radio] {width: 15px; height: 15px; background: url(/assets/img/bul_radio.png) no-repeat; background-size:100% 200%;}
        input {-moz-appearance:none; -webkit-appearance:none; appearance:none; box-sizing:border-box; -moz-box-sizing:border-box; -webkit-box-sizing:border-box;}
        select::-ms-expand {
            display: none;
        }
        .input-sel {
            width:100%;
            height: 36px;
            padding: 6px 15px 6px 7px;
            border: 1px solid #ABAEB3;
            font-size: 12px;
            border-radius:0;
            color: #333;
            background-size:30px;
            -webkit-appearance: none;
            background: url(/assets/img/bul_sel.png) right center no-repeat #fff;
            background-size: 13px 6px;
        }
        .input-sel:focus { border: 1px solid #ABAEB3; outline: none; }
        .input-txt { width: 100%; height: 32px; padding: 8px 7px; font-size: 12px; border: 1px solid #ABAEB3; border-radius: 0; color: #333; background: #fff; }
        .input-txt:focus { border: 1px solid #ABAEB3; outline: none; }

        select{
            height: 36px;
            overflow: hidden;
            vertical-align:middle;
            font-family: 'Nanum Square R';
            font-size: 9pt;
        }
        textarea{
            font-family: 'Nanum Square R';
            font-size: 9pt;
        }

        /*공통*/
        .floatLeft{float:left}
        .floatRight{float:right}
        .overflowH{overflow:hidden}
        .textCenter{text-align:center!important;}
        .textLeft{text-align:left!important;}
        .textRight{text-align:right!important;}
        .fontB{font-weight:bold!important;}
        .nonLeftBorder{border-left: 0px!important;}
        .nonRightBorder{border-right: 0px!important;}
        .nonTopBorder{border-top: 0px!important;}
        .nonBottomBorder{border-Bottom: 0px!important;}
        .nonBorder{border: 0px!important;}
        .nonPadding{padding: 0px!important;}
        .nonMargin{margin: 0px!important;}
        .nonPAndM{padding: 0px!important; margin: 0px!important;}
        /*색상*/
        .theBlack{color:#1A1A1C!important;}
        .theRed{color:red!important;}
        .theBlue{color:#3a168b!important;}
        .theOrange{color: #F58026!important;}
        .theGreen{color:#15B029!important;}
        .thePink{color: #EA0480!important;}
        .theGray{color:#717171!important;}
        .theWhite{color:#ffffff!important;}
        .theBrsMain{color:#2dc84d !important;}
        .theBrsSub{color:#333333 !important;}
        /*백그라운드*/
        .bgGray{background:  #a0a0a0;}
        .bgGrayBlur{background: #fafafa;}
        .bgPurple{background: #be32be;}
        .bgPink{background: #EA0480;}
        .bgBlack{background:  #1A1A1C;}
        .bgWhite{background:  #fff;}
        .bgBlue{background: #3a168b;}
        .bgBrsMain{background:  #2dc84d;}
        .bgBrsSub{background: #555555;}
        /*길이*/
        .w100p{width:100%!important;}
        .h100p{height:100%!important;}
        .w30{width:30px!important;}
        .w40{width:40px!important;}
        .w50{width:50px!important;}
        .w60{width:60px!important;}
        .w70{width:70px!important;}
        .w80{width:80px!important;}
        .w90{width:90px!important;}
        .w100{width:100px!important;}
        .w120{width:120px!important;}
        .w125{width:125px!important;}
        .w130{width:130px!important;}
        .w150{width:150px!important;}
        .w170{width:170px!important;}
        .w200{width:200px!important;}
        .w220{width:220px!important;}
        .w240{width:240px!important;}
        .w250{width:250px!important;}
        .w260{width:260px!important;}
        .w270{width:270px!important;}
        .w280{width:280px!important;}
        .w290{width:290px!important;}
        .w300{width:300px!important;}
        .w350{width:350px!important;}
        .w400{width:400px!important;}
        .w500{width:500px!important;}

        .bottom-line { border-bottom : 2px solid #E0D9E0; }

        /* margin */
        .mar0 { margin: 0 !important; }
        .mb0 { margin-bottom: 0 !important; }
        .mb5 { margin-bottom: 5px !important; }
        .mb10 { margin-bottom: 10px !important; }
        .mt0 { margin-top: 0 !important; }
        .mt3 { margin-top: 3px !important; }
        .mt5 { margin-top: 5px !important; }
        .mt8 { margin-top: 8px !important; }
        .mt10 { margin-top: 10px !important; }
        .mt13 { margin-top: 13px !important; }
        .mt15 { margin-top: 15px !important; }
        .mt30 { margin-top: 30px !important; }
        .ml5 { margin-left: 5px !important; }
        .ml10 { margin-left: 10px !important; }
        .mr5 { margin-right: 5px !important; }

        /* padding */
        .pt0 { padding-top: 0 !important; }
        .pt5 { padding-top: 5px !important; }
        .pt10 { padding-top: 10px !important; }
        .pt15 { padding-top: 15px !important; }
        .pt30 { padding-top: 30px !important; }
        .pb5 { padding-bottom: 5px !important; }
        .pb30 { padding-bottom: 30px !important; }
        .pl5 { padding-left: 5px !important; }
        .pl10 { padding-left: 10px !important; }
        .pl15 { padding-left: 15px !important; }
        .pr5 { padding-right: 5px !important; }
        .pr10 { padding-right: 10px !important; }
        .pr15 { padding-right: 15px !important; }

        /*버튼*/
        .btn-box{
            color:#717171;
            display: inline-block; /*display: inline;*/
            zoom: 0;
            text-decoration: none;
            padding: 0px 10px 0px 10px;
            line-height: 40px;
            height:40px;
            min-width: 60px;
            text-align: center;
            font-size: 12px;
            border: 0px solid #e7e7e7;
            cursor: pointer;
        }
        .btn-box-r{
            color:#717171;
            display: inline-block;/*display: inline;*/
            zoom: 0;
            text-decoration: none;
            padding: 0px 10px 0px 10px;
            line-height: 40px;
            height:40px;
            min-width: 60px;
            text-align: center;
            font-size: 12px;
            border-radius: 5px;
            border: 0px solid #e7e7e7;
            cursor: pointer;
        }
        .btn-box-addr{
            color:#5B2B55;
            display: inline-block; /*display: inline;*/
            zoom: 0;
            height:40px;
            text-decoration: none;
            margin: 0px 10px 0px 10px;
            line-height: 40px;
            width: 40px;
            text-align: center;
            font-size: 12px;
            border: 2px solid #E0D9E0;
            cursor: pointer;
            font-weight:bold;
        }

        /*wrap*/
        .wrap{width:100%;height:100%;position:relative;}

        /*header*/
        #header {
            position: fixed;
            left: 0;
            width: 100%;
            height: 50px;
            text-align: center;
            border-bottom: 0;
            z-index: 100;
        }
        #header h1 { font-size: 18px;line-height:50px;height:50px;}

        .btn-back { display: block; position: absolute; top: 0; left: 0; width: 40px; height: 40px; line-height: 40px; color:#ffffff; font-size: 12pt;}
        .btn-call { display: block; position: absolute; top: 0; left: calc(100% - 50px); width: 40px; height: 40px; line-height: 40px; color:#ffffff; font-size: 12pt;}
        .home-logo{ display: block;  margin-top:17.5px;; float:left; margin-left:10px;}

        /* BUTTON */
        .btn-white { padding: 5px; color: #000; background-color: #fff; }
        .btn-black { padding: 5px; color: #fff; background-color: #000; }
        .btn-black.on { opacity: 0.8; }
        .btn-pink { padding: 5px; color: #fff; background-color: #EA0480; }
        .btn-pink.on { opacity: 0.8; }
        .btn-gray { padding: 5px; color: #fff; background-color: #B1B2B4; }
        .btn-gray.on { opacity: 0.8; }
        .btn-blue { padding: 5px; color: #fff; background: #2C175A; }
        .btn-blue.on { opacity: 0.8; }
        .btn-brs-main { padding: 5px; color: #fff; background-color: #FA3295; }
        .btn-brs-sub { padding: 5px; color: #fff; background-color: #5B2B55; }
        /*content*/
        .content{width:100%;margin-top: 51px;margin-bottom: 52px;height: auto;overflow-y:auto;}
        .innerContent{min-height:100%;width:100%;}

        .innerContent .tabmenu{width:100%;height:40px;background: #fff;}
        .innerContent .tabmenu ul li{color:#B1B2B4;float:left; width:50%; height:100%; text-align:center; display:block; cursor: pointer; line-height: 40px; border-bottom: 1px solid #EBE4EB;}
        .innerContent .tabmenu ul li:first-child{margin-left:-1px;}
        .innerContent .tabmenu ul li.on{color:#2dc84d;border-bottom: 3px solid #2dc84d;font-weight:bold;}



        /* 탭메뉴 영역
        .footer .tabmenu{width:100%;height:45px;}
        .footer .tabmenu ul{height:100%; overflow:hidden;border-top: 1px solid #A7A8AD; color:#fff;}
        .footer .tabmenu ul li{float:left; background:#212026; width:25%; height:100%; text-align:center; line-height: 45px;}
        .footer .tabmenu ul li .top-line{height:1px; background: #2D2E32; }
        .footer .tabmenu ul li .left-line{width:1px; background: #35343A; }
        .footer .tabmenu ul li .right-line{width:1px; background: #170C14; }
        .footer .tabmenu ul li.on{background:#EA0480; }
        .footer .tabmenu ul li.on .top-line{height:1px; background: #EC128A; }
        .footer .tabmenu ul li.on .left-line{width:1px; background: #ED1B89; }
        .footer .tabmenu ul li.on .right-line{width:1px; background: #EA0480; }
        */

        .footer-tabmenu{position:fixed;bottom:0;width:100%;}
        .footer-tabmenu ul li{overflow:hidden;}
        .footer-tabmenu ul li{
            float:left;
            width:25%;
            height:50px;
            background: #f5f5f5;
            border-top:2px solid #2dc84d;
        }
        .footer-tabmenu .on{color:#2dc84d}
        .footer-tabmenu ul li a{display:block;text-align:center; height:100%; color:#333333;}
        .footer-tabmenu ul li a p { margin-top:3px; }

        .basket-count{ transform: translate(-2px, -4px);position: absolute; background: #e00010;padding: 3px 5px 1px 5px;border-radius: 15px;color: #fff;font-weight: 800;width:14px;}

        /* img 크기 50% 적용 */
        .scale_img {
            -webkit-transform: scale(1); /* Saf3.1+, Chrome */
            -moz-transform: scale(1); /* FF3.5+ */
            -ms-transform: scale(1); /* IE9 */
            -o-transform: scale(1); /* Opera 10.5+ */
            transform: scale(1);
        }
    </style>
</head>
<body oncontextmenu="return false" ondragstart="return false" onselectstart="return false">
<!-- wrap -->
<div class="wrap">
    <!-- header -->
    <header id="header" style="background-color:#fff;border-bottom:1px solid #120C3E;">
        <h1 id="mainlog" style="color:#111111;">개인정보처리방침</h1>


    </header>

    <!-- !header -->
    <!-- content -->
    <div class="content floatLeft">
        <!-- process php-->

        <!-- process js -->

        <!-- innerContent -->
        <div class="innerContent">
<textarea style="width:100vw; height:100vh;" readonly="">
제 1 조 (개인정보의 수집 항목 및 수집 방법)
 1. 주식회사 트라이즘(이하 “회사”라 한다.)는 회원가입, 서비스 제공에 관한 계약 이행 및 서비스 제공에 따른 요금정산, 기타 서비스 제공을 위해 회원가입 당시 아래와 같은 개인정보를 수집하고 있습니다.
 가. 회원 가입 및 관리
  - 필수항목 : 이메일주소, 비밀번호, 휴대전화 번호
 나. 재화 또는 서비스 제공
  - 필수항목 : 성명, 주소, 휴대폰 번호, 신용카드번호, 은행계좌정보 등 결제정보
 (단, 결제방법에 따라 결제창에 입력하는 개인정보는 결제대행사(PG)에 기록되며, 회사에 기록되지 않습니다. 인터넷 서비스 이용과정에서 아래 개인정보 항목이 자동으로 생성되어 수집될 수 있습니다.)
  - IP주소, 기기고유번호, 서비스 이용기록, 방문 기록, 불량 이용 기록 등
 2. 개인정보의 수집 방법
  ① 웹 페이지 또는 모바일 웹 페이지, 모바일 어플리케이션의 회원가입 및 서비스 이용 과정에서 이용자가 개인정보 수집에 대해 동의하고 정보를 입력하는 경우 해당 개인정보를 수집합니다.
  ② 웹 페이지, 이메일, 팩스, 전화, 카카오톡 플러스친구 상담 등을 통해 이용자의 개인정보가 수집될 수 있습니다.
  ③ 회사와 제휴계약을 맺은 외부 기업이나 단체로부터 개인정보를 제공받을 수 있으며, 이러한 경우에는 제휴사에서 이용자에게 개인정보 제공 동의를 받은 후 수집합니다.

제 2 조 (개인정보의 수집 및 이용목적)
 1. 회사는 다음과 같이 회원님의 개인정보를 수집합니다. 처리하고 있는 개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법 제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다.
 -개인정보의 수집∙이용 목적 :
  1) 회원 가입 및 관리
  2) 재화 또는 서비스 제공
  3) 회사가 제공하는 서비스의 이용실적 정보 통계/분석 및 서비스 추천
 -수집하는 개인정보의 항목 :
  1) 이메일 주소, 비밀번호, 휴대전화 번호, IP주소, 기기고유번호, 서비스 이용 기록, 방문 기록, 불량 이용 기록 등
  2) 성명, 주소, 휴대폰 번호, 신용카드번호, 은행계좌정보 등 결제정보
  3) 수집된 전체 개인정보 항목
 2. 개인정보의 보유∙이용 기간 :
  1) 사업자/단체 서비스 탈퇴 시까지
  2) 재화∙서비스 공급 완료 및 요금 결제∙정산 완료시까지 다만, 법령에서 정한 기간이 있는 경우에는 해당 기간 종료시까지
   ① 전자상거래 등에서의 소비자 보호에 관한 법률- 표시∙광고에 관한 기록 : 6개월
      - 계약 또는 청약철회, 대금결제, 재화 등의 공급에 관한 기록 : 5년
      - 소비자 불만 또는 분쟁처리에 관한 기록 : 3년
   ② 통신비밀보호법- 인터넷 로그기록자료 : 3개월
   ③ 전자금융거래법
      - 전자금융 거래에 관한 기록 : 5년

제 3 조 (회원의 권리와 그 행사 방법)
 1. 회원님은 언제든지 회원님의 개인정보를 조회하거나 수정할 수 있으며 회원 탈퇴 절차를 통하여 개인정보 이용에 대한 동의 등을 철회할 수 있습니다.
 2. 회원 탈퇴(동의 철회)는 [더보기] 내의 “회원탈퇴”를 통하여 할 수 있습니다. 이 외에도 회사의 고객센터 및 개인정보 보호책임자에게 카카오톡 상담하기, 서면, 전화, 모사전송(FAX) 또는 이메일로 연락하여 열람/수정을 요청하실 수 있습니다.
 3. 회원님의 개인정보 오류에 대한 정정을 요청하신 경우에는 정정을 완료하기 전까지 개인정보를 이용 또는 제공하지 않습니다. 그리고 회원님의 요청에 의해 해지 또는 삭제된 개인정보는 『2. 개인정보의 수집 및 이용목적』에 명시된 바에 따라 취급하고 그 외의 용도로 열람 또는 이용할 수 없도록 조치하고 있습니다.
 4. 회원님은 본 개인정보처리방침에 동의하지 않으실 수 있습니다. 다만, 동의 거부 시 서비스 이용에 제한이 있을 수 있습니다.

제 4 조 (회원의 의무)
 1. 회원님은 자신의 개인정보를 보호할 의무가 있으며, 회원님 본인의 부주의 등으로 개인정보가 유출되어 발생한 문제에 대해서는 회사는 일체의 책임을 지지 않습니다.
 2. 회원님의 개인정보를 최신의 상태로 정확하게 입력하시기 바랍니다. 회원님의 부정확한 정보입력으로 발생하는 문제의 책임은 회원님 본인에게 있으며, 타인의 개인정보를 도용하여 회원가입 또는 서비스 이용 시 회원자격 상실과 함께 개인정보에 관한 법률에 의거하여 처벌될 수 있습니다.
 3. 회원님은 개인정보를 보호받을 권리와 함께 스스로를 보호하고 타인의 정보를 침해하지 않을 의무도 가지고 있습니다. 아이디, 비밀번호를 포함한 회원님의 개인정보가 유출되지 않도록 조심하시고 게시물을 포함한 타인의 개인정보를 훼손하지 않도록 유의해 주십시오.
 4. 회원님은 『정보통신망 이용촉진 및 정보보호 등에 관한 법률』, 『개인정보보호법』 등 기타 개인정보에 관한 법률을 준수하여야 합니다.

제 5 조 (링크사이트)
 회사는 회원님에게 외부 웹사이트 또는 자료에 대한 링크를 제공할 수 있습니다. 이 경우 회사는 외부 웹사이트 및 자료에 대한 통제권이 없으므로 그로부터 제공받는 서비스나 자료의 유용성에 대해 책임질 수 없으며 보증할 수 없습니다. 회사의 사이트가 포함하고 있는 링크를 통하여 외부 웹사이트의 페이지로 옮겨갈 경우 해당 웹사이트의 개인정보취급방침은 회사와 무관하므로 새로 방문한 웹사이트의 정책을 검토하시기 바랍니다.

제 6 조 (개인정보 자동수집 장치(쿠키 등)의 설치, 운영 및 그 거부에 관한 사항)
 1. 회사는 회원님에게 보다 적절하고 유용한 서비스를 제공하기 위하여 회원님의 정보를 수시로 저장하고 불러오는 ‘쿠키(cookie)’를 사용합니다. 쿠키란 회사의 웹사이트를 운영하는데 이용되는 서버가 회원님의 컴퓨터로 전송하는 아주 작은 텍스트 파일로서 회원님의 컴퓨터 하드디스크에 저장됩니다. 회원님은 쿠키의 사용여부에 대하여 선택하실 수 있습니다.
 2. 쿠키 설정 거부 방법
  - 회원님이 사용하시는 웹 브라우저의 옵션을 설정함으로써 모든 쿠키를 허용하거나 쿠키를 저장할 때마다 확인을 거치거나, 모든 쿠키의 저장을 거부할 수 있습니다. 단, 쿠키의 저장을 거부할 경우 로그인이 필요한 일부 서비스의 이용에 제한이 생길 수 있습니다.
  - 쿠키 설치 허용 여부를 지정하는 방법(Internet Explorer의 경우)
    1) [도구] 메뉴에서[인터넷 옵션]을 선택
    2) [개인정보]를 클릭
    3) [고급]을 클릭
    4) 쿠키 허용여부를 선택
 3. 쿠키의 사용 목적
  1) 접속 빈도 또는 머문 시간 등을 분석하여 이용자의 취향과 관심분야를 파악하여 마케팅에 활용
  2) 이용자의 습관을 분석하여 서비스 개편 등의 척도

제 7 조 (개인정보 제공)
 회사는 원활한 업무처리를 위하여 다음과 같이 개인정보를 제3자에게 제공하고 있습니다. 회사는 정보주체의 별도 동의, 법률의 특별한 규정 등 개인정보 보호법 제17조에 해당하는 경우와 아래의 경우 외에는 개인정보를 제3자에게 제공하지 않습니다.
-개인정보를 제공받는 자

 ① 제휴 배달 대행 업체

-개인정보를 제공받는 자의 개인정보 이용 목적: 주문 내역 확인, 제품 포장(Packing), 제품 확인, 용역 제공, 제휴 서비스 제공
-제공하는 개인정보의 항목: 주문 내역, 주소, 휴대전화번호(안심번호 적용 시 제외)

제 8 조 (개인정보의 파기)
 1. 회사는 개인정보 보유기간의 경과, 처리목적 달성 등 개인정보가 불필요하게 되었을 때에는 지체 없이 해당 개인정보를 파기합니다.
 2. 회원님으로부터 동의 받은 개인정보 보유기간이 경과하거나 처리목적이 달성되었음에도 불구하고 다른 법령에 따라 개인정보를 계속 보존하여야 하는 경우에는, 해당 개인정보를 별도의 데이터베이스(DB)로 옮기거나 보관장소를 달리하여 보존합니다.
 3. 개인정보 파기의 절차 및 방법은 다음과 같습니다.
  1) 파기절차
   회사는 파기 사유가 발생한 개인정보를 선정하고, 회사의 개인정보 보호책임자의 승인을 받아 개인정보를 파기합니다.
  2) 파기방법
 회사는 전자적 파일 형태로 기록∙저장된 개인정보는 기록을 재생할 수 없도록 로우레밸포멧(Low Level Format) 등의 방법을 이용하여 파기하며, 종이 문서에 기록∙저장된 개인정보는 분쇄기로 분쇄하거나 소각하여 파기합니다.

제 9 조 (개인정보의 안전성 확보조치)
 회사는 개인정보의 안전성 확보를 위해 다음과 같은 조치를 취하고 있습니다.
  1. 관리적 조치 : 내부관리계획 수립∙시행, 정기적 직원 교육, 전 직원의 보안서약서 작성, 개인정보보호배상책임보험 가입 등
  2. 기술적 조치 : 개인정보처리시스템 등의 접근권한 관리, 접근통제시스템 설치, 고유식별정보 등의 암호화, 보안프로그램 설치
  3. 물리적 조치 : 전산실, 자료보관실 등의 접근통제

제 10 조 (개인정보 보호책임자)
 1. 회사는 개인정보 처리에 관한 업무를 총괄해서 책임지고, 개인정보 처리와 관련한 고객님의 불만처리 및 피해구제 등을 위하여 아래와 같이 개인정보 보호책임자를 지정하고 있습니다.
▶ 개인정보 보호책임자
성명 : 송현국
부서 : 개발부서
연락처 : Tel) 070-8822-3999  , Fax) 070-8822-3999
E-mail : devsong@trism.kr
 2. 회원님께서는 회사의 서비스(또는 사업)을 이용하시면서 발생한 모든 개인정보 보호 관련 문의, 불만처리, 피해구제 등에 관한 사항을 개인정보 보호책임자 및 담당부서로 문의하실 수 있습니다. 회사는 회원님의 문의에 대해 지체 없이 답변 및 처리해드릴 것입니다.
 3. 회사는 이용자의 개인정보를 보호하는데 있어 안전하게 보호될 수 있도록 최선을 다하고 있습니다. 개인정보를 보호하는데 있어 이용자께 고지한 사항들에 반하는 사고가 발생할 시에 개인정보보호책임자가 모든 책임을 집니다. 그러나 기술적인 보완조치를 했음에도 불구하고, 해킹 등 기본적인 네트워크상의 위험성에 의해 발생하는 예기치 못한 사고로 인한 정보의 훼손 및 방문자가 작성한 게시물에 의한 각종 분쟁에 관해서는 책임이 없습니다.

제 11 조 (고지의 의무)
 본 개인정보 처리방침은 정부의 정책 또는 보안기술의 변경에 따라 내용의 추가, 삭제 및 수정이 있을 시에는 개정 최소 7일 전(단, 중요한 내용 변경의 경우 30일 전)부터 회사가 프로그램을 제공하는 사이트의 ‘공지’란 또는 해당 사이트의 첫 화면이나 이메일을 통해 고지합니다.

제 12 조 (권익침해 구제방법)
 회원님은 아래의 기관에 대해 개인정보 침해에 대한 피해구제, 상담 등을 문의하실 수 있습니다.
< 아래의 기관은 회사와는 별개의 기관으로서, 회사의 자체적인 개인정보 불만처리, 피해구제 결과에 만족하지 못하시거나 보다 자세한 도움이 필요하시면 문의하여 주시기 바랍니다. >

▶ 개인정보 침해신고센터 : 118 (privacy.kisa.or.kr)
▶ 대검찰청 사이버범죄수사단 : 02-3480-3571 (cybercid.spo.go.kr)
▶ 경찰청 사이버안전국 : 182 (cyberbureau.police.go.kr)

-적용 일자: 2021.06.01


</textarea>
        </div>
        <!-- !innerContent -->
        <!-- footer -->

    </div>
    <!-- !content -->

    <script>
        //최초 로드시 숨김



    </script>
</div>
<!-- !wrap -->


</body></html>
