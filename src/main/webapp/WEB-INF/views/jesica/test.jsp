<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <%@include file="../../../common/include_head.jsp" %>
    <c:if test="${sessionScope.sessionKey.company == 'jesicar'}">
        <title>Jesicar | 영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%></title>
    </c:if>
    <c:if test="${sessionScope.sessionKey.company == 'yangpa'}">
        <title>Jig-Bae | 영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%></title>
    </c:if>
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="../../../common/include_header.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../../../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <div id="content" class="content p-0">
        <div class="col-xl-12">
            <div class="p-t-20 p-b-0">
                <ol class="breadcrumb float-xl-right p-r-10">
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1" text="default text"/><%--가맹점 설정--%></a></li>
                    <li class="breadcrumb-item"><a href="javascript:;"><spring:message code="side.main1.sub7" text="default text"/><%--상품--%></a></li>
                    <li class="breadcrumb-item active">영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></li>
                </ol>
                <h3 class="rix-title p-b-5">영업가맹점 상세<%--<spring:message code="merchandise.detail.title" text="default text"/>--%><%--상품 상세--%></h3>
            </div>
            <div class="m-t-10">
                <table class="table table-bordered">
                    <tr>
                        <td class="bg-light">업무그룹</td>
                        <td>[H0145] K_제휴본사_테스트</td>
                        <td class="bg-light">총판</td>
                        <td>[BE254] K_제휴본사_총판</td>
                    </tr>
                </table>
            </div>
            <ul class="nav nav-tabs m-t-10">
                <li class="nav-item">
                    <a href="#default-tab-1" data-toggle="tab" class="nav-link active">
                        <span class="d-sm-none">기본정보<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                        <span class="d-sm-block d-none">기본정보<%--<spring:message code="merchandise.detail.tab1" text="default text"/>--%><%--기본 정보--%></span>
                    </a>
                </li>
                <li class="nav-item">
                    <a href="#default-tab-2" data-toggle="tab" class="nav-link">
                        <span class="d-sm-none">사업자정보<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                        <span class="d-sm-block d-none">사업자정보<%--<spring:message code="merchandise.detail.tab2" text="default text"/>--%><%--가격 정보--%></span>
                    </a>
                </li>
            </ul>
            <div class="tab-content">
                <!-- begin tab-pane -->
                <div class="tab-pane fade active show" id="default-tab-1">
                    <div class="main-content" data-scrollbar="true">
                        <div class="table-responsive">
                            <table class="table table-condensed table-bordered">
                                <tr>
                                    <td class="bg-light">총판명</td>
                                    <td>
                                        <label>
                                            <input type="text" class="form-control width-200" value="K_제휴본사_총판">
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">관리센터</td>
                                    <td>
                                        <select class="form-control">
                                            <option>만나(기본값)</option>
                                            <option>공유다</option>
                                            <option>Run</option>
                                            <option>이어드림</option>
                                            <option>날라가</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 직영 구분</td>
                                    <td>
                                        <label>
                                            <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="가맹점을 선택하세요.<%--<spring:message code="merchandise.search1.option1" text="default text"/>--%><%--제휴본사 선택--%>" class="form-control background-white width-170" value="K_제휴본사_가맹점" readonly>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">기본 배송그룹</td>
                                    <td>
                                        <label>
                                            <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="배송그룹을 선택하세요.<%--<spring:message code="merchandise.search1.option1" text="default text"/>--%><%--제휴본사 선택--%>" class="form-control background-white width-170" value="K_제휴본사_테스트" readonly>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 상태</td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="radio" name="status1" class="align-bottom" checked>정상<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">정지<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">삭제<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="radio" name="status1" class="align-bottom">페이부족<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">로그인ID</td>
                                    <td>test1</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">로그인PW</td>
                                    <td>1234</td>
                                </tr>
                                <tr>
                                    <td class="bg-light">인증용 휴대전화</td>
                                    <td><input type="text" class="form-control width-200" value="01011112222"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">예치금</td>
                                    <td><input type="text" class="form-control width-200" value="0"></td>
                                </tr>
                                <tr>
                                    <td class="bg-light">총판 구분</td>
                                    <td>
                                        <label class="font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2" checked>일반
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2">간선총판
                                        </label>
                                        <label class="m-l-10 font-size-10">
                                            <input type="checkbox" class="align-bottom" name="status2">지선총판
                                        </label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">계약자/담당자 정보</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">계약자</td>
                                                <td class="border-top-0"><input type="text" class="form-control width-200" value="A타입"></td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">담당자</td>
                                                <td><input type="text" class="form-control width-200"></td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">충전 계좌</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">은행</td>
                                                <td class="border-top-0">우리은행</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">계좌번호</td>
                                                <td>1234567890</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="bg-light">출금 계좌</td>
                                    <td class="p-0 border-none">
                                        <table class="width-full border-none">
                                            <tr>
                                                <td class="border-left-0 border-top-0 width-100">은행</td>
                                                <td class="border-top-0">우리은행</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">계좌번호</td>
                                                <td>1234567890</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">예금주</td>
                                                <td>테스트</td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">페이 잔액</td>
                                                <td>
                                                    <div class="width-150 d-inline-block">1000000원</div>
                                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#listPay_modal">내역</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">미차감 잔액</td>
                                                <td>
                                                    <span class="width-150 d-inline-block">0원</span>
                                                    <button type="button" class="btn btn-gray" data-toggle="modal" data-target="#listDeducted_modal" >내역</button>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td class="border-left-0">PIN번호</td>
                                                <td>****</td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!-- end tab-pane -->
                <!-- begin tab-pane -->
                <div class="tab-pane fade" id="default-tab-2">
                    <div class="table-responsive">
                        <table class="table table-condensed table-bordered">
                            <tr>
                                <td class="bg-light">상호</td>
                                <td>
                                    <label>
                                        <strong>K_제휴본사_총판</strong>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom" checked>일반<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status3" class="align-bottom">간이<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status3" class="align-bottom">법인<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status3" class="align-bottom">알수없음<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 등록번호</td>
                                <td><input type="text" class="form-control" value="1228522830"></td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 인증</td>
                                <td>
                                    <button type="button" class="btn btn-gray">한신평 인증</button>
                                    <button type="button" class="btn btn-gray">인증 요청</button>
                                    <button type="button" class="btn btn-gray d-none">인증완료</button>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업자 등록증</td>
                                <td>
                                    <label for="saupja" class="width-100 height-30 text-center line-height-30 background-gray">파일업로드</label>
                                    <input type="file" class="d-none" id="saupja">
                                    <div class="width-200 height-30 border overflow-hidden m-t-10 line-height-25 white-space-nowrap text-overflow-ellipsis">
                                        <span class="fileName"></span>
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">대표자 명</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">이메일</td>
                                <td><input type="email" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">연락처</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">사업장 주소</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">업종/업태</td>
                                <td><input type="text" class="form-control m-r-10" value=""><input type="text" class="form-control" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">주요지역</td>
                                <td>
                                    <select class="form-control m-r-10">
                                        <option>서울</option>
                                        <option>대전</option>
                                        <option>대구</option>
                                        <option>부산</option>
                                    </select>
                                    <select class="form-control">
                                        <option>전체</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 주소</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 운영자 명</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">실제 연락처</td>
                                <td><input type="text" class="form-control width-200" value=""></td>
                            </tr>
                            <tr>
                                <td class="bg-light">세금계산서 역발행 구분</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status4" class="align-bottom" checked>일반<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="m-l-10 font-size-10">
                                        <input type="radio" name="status4" class="align-bottom">간이<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div class="m-t-10">
                    <button type="button" class="btn btn-primary btn_add float-right"><i class="fa fa-check m-r-3"></i> 수정<%--<spring:message code="merchandise.insert.insertbutton" text="default text"/>--%><%--등록--%></button>
                    <button type="button" class="btn btn-primary btn_list"><i class="fa fa-list m-r-3"></i> 목록<%--<spring:message code="merchandise.insert.listbutton" text="default text"/>--%><%--목록--%></button>
                </div>
            </div>
        </div>
    </div>

    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal search start--%>
<div class="modal fade" id="search_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="search.jsp" %>
</div>
<%--modal search end--%>

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>
<%--<link href="${path}/assets/plugins/blueimp-gallery/css/blueimp-gallery.min.css" rel="stylesheet" />--%>
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload.css" rel="stylesheet" />
<link href="${path}/assets/plugins/blueimp-file-upload/css/jquery.fileupload-ui.css" rel="stylesheet" />
<!-- ================== END PAGE LEVEL CSS STYLE ================== -->
<!-- ================== BEGIN PAGE LEVEL JS ================== -->
<script src="${path}/assets/plugins/blueimp-file-upload/js/vendor/jquery.ui.widget.js"></script>
<%--<script src="${path}/assets/plugins/blueimp-tmpl/js/tmpl.js"></script>--%>
<script src="${path}/assets/plugins/blueimp-load-image/js/load-image.all.min.js"></script>
<script src="${path}/assets/plugins/blueimp-canvas-to-blob/js/canvas-to-blob.js"></script>
<script src="${path}/assets/plugins/blueimp-gallery/js/jquery.blueimp-gallery.min.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.iframe-transport.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-process.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-image.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-audio.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-video.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-validate.js"></script>
<script src="${path}/assets/plugins/blueimp-file-upload/js/jquery.fileupload-ui.js"></script>
<script src="${path}/assets/plugins/dropzone/dist/min/dropzone.min.js"></script>
<script src="${path}/assets/plugins/highlight.js/highlight.min.js"></script>
<script src="${path}/assets/js/demo/render.highlight.js"></script>
<!--[if (gte IE 8)&(lt IE 10)]>
<script src="${path}/assets/plugins/jquery-file-upload/js/cors/jquery.xdr-transport.js"></script>
<![endif]-->
<script src="${path}/assets/js/demo/form-multiple-upload.demo.js"></script>
<link href="${path}/assets/plugins/dropzone/dist/min/dropzone.min.css" rel="stylesheet" />

<script>
    let map;
    let marker;
    $(() => {
        initTipMap();

        $(".list_btn").click(function () {
            location.href = "${path}/workgroup/businessfranch/list";
        });

        //온라인플랫폼이미지
        $(document).on("change", "#onlinePlatFormImgFile", function (e) {
            /*var state = document.getElementById('status'),
                sort_body = document.getElementById('sort_body');

            if (typeof window.FileReader === 'undefined') {
                state.className = 'fail';
            } else {
                state.className = 'success';
                state.innerHTML = '';
            }*/
            e.preventDefault();

            var file = $("#onlinePlatFormImgFile")[0].files[0],
                reader = new FileReader();
            /*파일 읽기를 시작*/
            reader.onload = function (event) {
                var img = new Image();
                img.src = event.target.result;
                /*읽기가 끝나고 난후에*/
                reader.onloadend = function (e) {
                    if (img.width > 200) {
                        // note: no onload required since we've got the dataurl...I think! :)
                        img.width = 200;
                    }
                    sort_body.innerHTML = '';
                    sort_body.appendChild(img);
                }
            };
            reader.readAsDataURL(file);
            //파일명 삽입
            if (window.FileReader) {
                // modern browser
                var filename = file.name;
            } else {
                // old IE
                var filename = $("#onlinePlatFormImgFile").val().split('/').pop().split('\\').pop();
            } // 추출한 파일명 삽입
            $('.onlinePlatFormFileName').text("변경할 이미지 :" + filename);
            $('.onlinePlatFormFileSize').text("용량 :" + file.size + " Byte");

            return false;
        });
    });

    function initTipMap() {
        let uluru = {lat: 17.98168965202384,lng: 102.56941764786893};
        map = new google.maps.Map(document.getElementById("tipmap"), {
            center: uluru,
            zoom: 14,
        });

        const squareCoords = [
            { lat: 17.98278685393457, lng: 102.56079072668399 },
            { lat: 17.99030228316645, lng: 102.56907432512804 },
            { lat: 17.984179602794764, lng: 102.57976024543845 },
            { lat: 17.970259919261057, lng: 102.57233589116656 },
            { lat: 17.98278685393457, lng: 102.56079072668399 },
        ];

        const bermudaSquare = new google.maps.Polygon({
            paths: squareCoords,
            strokeColor: "#FF0000",
            strokeOpacity: 0.8,
            strokeWeight: 2,
            fillColor: "#FF0000",
            fillOpacity: 0.35,
        });
        bermudaSquare.setMap(map);
    }

    function postCodeBtn() {
        let address = $("#address").val();

        let geocoder = new google.maps.Geocoder();

        /**
         * 입력받은 주소로 좌표에 맵 마커를 찍는다.
         * 1번째 파라미터 : 주소 등 여러가지.
         *      ㄴ 참고 : https://developers.google.com/maps/documentation/javascript/geocoding#GeocodingRequests
         *
         * 2번째 파라미터의 함수
         *      ㄴ result : 결과값
         *      ㄴ status : 상태. OK가 나오면 정상.
         */
        geocoder.geocode({'address': address}, function(result, status) {
            if (status === 'OK') {
                // 맵의 중심 좌표를 설정한다.
                map.setCenter(result[0].geometry.location);
                // 맵의 확대 정도를 설정한다.
                map.setZoom(18);
                // 맵 마커
                marker.setMap(null);
                marker = new google.maps.Marker({
                    map: map,
                    position: result[0].geometry.location
                });
            } else {
                alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
            }
        });
    }
</script>
</body>
</html>




<table class="table table-bordered">
    <tr>
        <td class="bg-light-darker border-right-0"><strong>기본 설정 / 검색</strong></td>
        <td class="p-0" style="border: none;">
            <table>
                <tr>
                    <td>상태</td>
                    <td>
                        <label class="font-size-10">
                            <input type="radio" name="status1" class="align-bottom" checked>정상<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                        </label>
                        <label class="font-size-10 m-l-10">
                            <input type="radio" name="status1" class="align-bottom">정지<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                        </label>
                        <label class="font-size-10 m-l-10">
                            <input type="radio" name="status1" class="align-bottom">삭제<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                        </label>
                    </td>
                </tr>
                <tr>
                    <td>제목</td>
                    <td><input type="text" class="form-control"></td>
                </tr>
                <tr>
                    <td>출금대상</td>
                    <td class="p-0" style="border: none;">
                        <table>
                            <tr>
                                <td>대상타입</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status2" class="align-bottom" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">총판<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status2" class="align-bottom">배송원<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr style="border: none;">
                                <td>대상선택</td>
                                <td>
                                    <label id="a">
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="b">
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="c">
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="d">
                                        <input type="text" placeholder="배송원 선택<%--<spring:message code="merchandise.search1.option3" text="default text"/>--%><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>입금대상</td>
                    <td class="p-0" style="border: none;">
                        <table>
                            <tr>
                                <td>대상타입</td>
                                <td>
                                    <label class="font-size-10">
                                        <input type="radio" name="status3" class="align-bottom" checked>제휴본사<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">총판<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">가맹점<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                    <label class="font-size-10 m-l-10">
                                        <input type="radio" name="status3" class="align-bottom">배송원<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>대상선택</td>
                                <td>
                                    <label id="e">
                                        <input type="text" data-toggle="modal" data-target="#search_modal" placeholder="<spring:message code="merchandise.search1.option1" text="default text"/><%--제휴본사 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="f">
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option2" text="default text"/><%--총판선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="g">
                                        <input type="text" placeholder="<spring:message code="merchandise.search1.option3" text="default text"/><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                    <label id="h">
                                        <input type="text" placeholder="배송원 선택<%--<spring:message code="merchandise.search1.option3" text="default text"/>--%><%--가맹점 선택--%>" class="form-control" style="background-color: white;" readonly>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
                <tr>
                    <td>출금조건</td>
                    <td class="p-0" style="border: none;">
                        <table>
                            <tr>
                                <td>일일 정산 시</td>
                                <td>
                                    <label>
                                        <label class="m-r-10" for="ii" style="font-size: 10px;">
                                            <input type="checkbox" id="ii" name="ii" class="align-middle" checked>주문플랫폼월정액<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-r-10" for="jj" style="font-size: 10px;">
                                            <input type="checkbox" id="jj" name="ii" class="align-middle">MCS월정액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10" for="kk" style="font-size: 10px;">
                                            <input type="checkbox" id="kk" name="ii" class="align-middle">일비차감<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10" for="ll" style="font-size: 10px;">
                                            <input type="checkbox" id="ll" name="ii" class="align-middle">배송관리비 월정액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>오더 정산 시</td>
                                <td>
                                    <label>
                                        <label class="m-r-10" for="ii" style="font-size: 10px;">
                                            <input type="checkbox" id="ii" name="ii" class="align-middle" checked>배달대행료 수수료<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-r-10" for="jj" style="font-size: 10px;">
                                            <input type="checkbox" id="jj" name="ii" class="align-middle">주문배달/테이크아웃 수수료<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10" for="kk" style="font-size: 10px;">
                                            <input type="checkbox" id="kk" name="ii" class="align-middle">배달플랫폼 수수료<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>일차감</td>
                                <td>
                                    <label>
                                        <label class="m-r-10" for="ii" style="font-size: 10px;">
                                            <input type="checkbox" id="ii" name="ii" class="align-middle" checked>대여금<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-r-10" for="jj" style="font-size: 10px;">
                                            <input type="checkbox" id="jj" name="ii" class="align-middle">대여금(완료건당)<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10" for="kk" style="font-size: 10px;">
                                            <input type="checkbox" id="kk" name="ii" class="align-middle">차감항목 직접입력<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10">
                                            <input type="text" class="form-control">
                                        </label>
                                    </label>
                                </td>
                            </tr>
                            <tr>
                                <td>월차감</td>
                                <td>
                                    <label>
                                        <label class="m-r-10" for="ii" style="font-size: 10px;">
                                            <input type="checkbox" id="ii" name="ii" class="align-middle" checked>대여금<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                                        </label>
                                        <label class="m-r-10" for="jj" style="font-size: 10px;">
                                            <input type="checkbox" id="jj" name="ii" class="align-middle">차감항목 직접입력<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                                        </label>
                                        <label class="m-r-10" for="kk" style="font-size: 10px;">
                                            <input type="text" class="form-control">
                                        </label>
                                        <label class="m-r-10" for="ll" style="font-size: 10px;">
                                            <select class="form-control width-70">
                                                <c:forEach begin="1" end="28" varStatus="idx">
                                                    <option>${idx.index}</option>
                                                </c:forEach>
                                                <option>말일</option>
                                            </select>
                                        </label>
                                    </label>
                                </td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="border-right-0"><strong>추가 설정</strong></td>
        <td style="padding: 0; border: none;">
            <table>
                <tr>
                    <td>출금 시작일</td>
                    <td>
                        <input type="text" class="form-control startDate date" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                    </td>
                </tr>
                <tr>
                    <td>출금 종료일</td>
                    <td>
                        <input type="text" class="form-control startDate date" style="background-color: white; /*width: 95px;*/" readonly> <i class="fas fa-lg fa-fw m-r-5 fa-calendar-alt date"></i>
                    </td>
                </tr>
                <tr>
                    <td>출금내용</td>
                    <td>
                        <label class="m-r-10" for="" style="font-size: 10px;">
                            <input type="radio" id="" name="" class="align-middle" checked>정액<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                        </label>
                        <label class="m-r-10" for="" style="font-size: 10px;">
                            <input type="radio" id="" name="" class="align-middle">정률<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                        </label>
                        <input type="text" class="form-control"> (원 or %)
                    </td>
                </tr>
                <tr>
                    <td>출금제한</td>
                    <td>
                        <label class="m-r-10" for="" style="font-size: 10px;">
                            <input type="radio" id="" name="" class="align-middle" checked>사용안함<%--<spring:message code="merchandise.search1.option4" text="default text"/>--%><%--소속--%>
                        </label>
                        <label class="m-r-10" for="" style="font-size: 10px;">
                            <input type="radio" id="" name="" class="align-middle">최대회수<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                        </label>
                        <label class="m-r-10" for="" style="font-size: 10px;">
                            <input type="radio" id="" name="" class="align-middle">최대금액<%--<spring:message code="merchandise.search1.option5" text="default text"/>--%><%--영업--%>
                        </label>
                        <input type="text" class="form-control"> (원 or %)
                    </td>
                </tr>
                <tr>
                    <td>출금메모</td>
                    <td>
                        <input type="text" class="form-control width-400">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>







































