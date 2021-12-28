<%@ page language="java" contentType="text/html; charset=UTF-8" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8"/>
    <title>PetView | 가맹점 상품등록</title>
    <%@include file="../../../common/include_head.jsp" %>
    <style>
        h1 {
            padding: 50px 0;
            font-weight: 400;
            text-align: center;}

        p {
            margin: 0 0 20px;
            line-height: 1.5;}

        .main {
            min-width: 320px;
            max-width: 1000px;
            padding: 50px;
            margin: 0 auto;
            background: #ffffff;}

        section {
            display: none;
            padding: 20px 0 0;
            border-top: 1px solid #ddd;}

        /*라디오버튼 숨김*/
        input#tab1,#tab2,#tab3,#tab4 {
            display: none;}

        label.menu {
            display: inline-block;
            margin: 0 0 -1px;
            padding: 15px 25px;
            font-weight: 600;
            text-align: center;
            color: #bbb;
            border: 1px solid transparent;}

        label:hover {
            color: #2e9cdf;
            cursor: pointer;}

        /*input 클릭시, label 스타일*/
        input:checked + label {
            color: #555;
            border: 1px solid #ddd;
            border-top: 2px solid #2e9cdf;
            border-bottom: 1px solid #ffffff;}

        #tab1:checked ~ #content1,
        #tab2:checked ~ #content2,
        #tab3:checked ~ #content3,
        #tab4:checked ~ #content4 {
            display: block;}

        input[type=radio] {display: inline-block; vertical-align: text-top; margin-top: 0 !important; margin-right: 3px;}
        .form-control {width: 150px; height: 30px; font-size: 11px; display: inline; vertical-align: middle;}
        .btn-primary {height: 30px;}
        label {vertical-align: middle;}
        table label {font-size: 8pt; color: #555;}
        .table td {padding-left: 10px; padding-right: 20px; text-align: left; vertical-align: middle; width: 200px;}
        .table td:first-child {min-width: 100px;}
        .breadcrumb-item+.breadcrumb-item::before {
            color: #6c757d;
            content: ">";
        }
        .row {margin-left: 0px; margin-right: 0px;}
        .timeline .timeline-body {
            margin-left: 0%;
            margin-right: 0%;
            background: #fff;
            position: relative;
            padding: 20px 25px;
            -webkit-border-radius: 6px;
            border-radius: 6px;
        }
        .timeline-body {
            min-width :1100px;
        }
        .timeline .timeline-body:before {
            content: '';
            display: block;
            position: absolute;
            border: 0px solid transparent;
            border-right-color: #fff;
            left: 0px;
            top: 0px;
        }
        .dropzone-custom .dz-preview {
            position: relative;
            display: inline-block;
            vertical-align: top;
            margin: 16px;
            min-height: 100px;
        }
        .dropzone-custom .dz-preview .dz-image img {
            display: block;
        }
        .dropzone-custom .dz-preview .dz-success-mark, .dropzone-custom .dz-preview .dz-error-mark {
            pointer-events: none;
            opacity: 0;
            z-index: 500;
            position: absolute;
            display: block;
            top: 50%;
            left: 50%;
            margin-left: -27px;
            margin-top: -27px;
        }
    </style>
</head>
<body>
<!-- begin #page-loader -->
<div id="page-loader" class="fade show"><span class="spinner"></span></div>
<!-- end #page-loader -->

<!-- begin #page-container -->
<div id="page-container" class="fade page-sidebar-fixed page-header-fixed">
    <!-- begin #header -->
    <%@include file="../../../common/include_header.jsp" %>
    <%@include file="../../../common/include_header_test.jsp" %>
    <!-- end #header -->

    <!-- begin #sidebar -->
    <%@include file="../../../common/include_sidebar.jsp" %>
    <!-- end #sidebar -->

    <div class="main">
        <input id="tab1" type="radio" name="tabs" checked> <!--디폴트 메뉴-->
        <label for="tab1" class="menu">tab menu1</label>

        <input id="tab2" type="radio" name="tabs">
        <label for="tab2" class="menu">tab menu2</label>

        <input id="tab3" type="radio" name="tabs">
        <label for="tab3" class="menu">tab menu3</label>

        <input id="tab4" type="radio" name="tabs">
        <label for="tab4" class="menu">tab menu4</label>

        <section id="content1">
            <div class="table-responsive">
                <table id="user" class="table table-condensed table-bordered">
                    <tr>
                        <td class="bg-light text-center">상품명</td>
                        <td><input type="text" class="form-control" value="11"></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status1" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status1">정지
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">온라인 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status2" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">매장 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status3" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">성인인증 구분</td>
                        <td>
                            <label>
                                <input type="radio" name="status4">필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4" checked>불필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4">알수없음
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품 설명</td>
                        <td><textarea class="form-control" style="width: 600px; height: 100px;"></textarea></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">검색 단어</td>
                        <td><input type="text" class="form-control" style="width: 600px;"></td>
                    </tr>
                </table>
                <div class="timeline-body">
                    <div class="timeline-header m-t-10 m-b-10 text-center">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span>
                                    사진정보
                                    <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                        <strong class="font-size-10">드래그로 순서변경 가능</strong>
                                    </i>
                                </span>
                    </div>
                    <div class="" style="width: 50%; float: left; text-align: center;">
                        <b>리스트 이미지</b>
                    </div>
                    <div class="" style="width: 50%; float: right; text-align: center;">
                        <b>상세 이미지</b>
                    </div>
                    <div id="sortable1" class="invoice-note" style="width: 50%; float: left;">
                        <%--<c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>--%>
                    </div>
                    <div id="sortable2" class="invoice-note" style="width: 50%; float: left;">
                        <c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone1">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: left; border: 1px solid #eee;">
                            <h4><strong>리스트 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone2">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: right; border: 1px solid #eee;">
                            <h4><strong>상세 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <%--<button type="submit" id="btnSubmit" class="btn btn-primary btn-sm add_picture_btn">업로드</button>--%>
                </div>
            </div>
        </section>

        <section id="content2">
            <div class="table-responsive">
                <table id="user" class="table table-condensed table-bordered">
                    <tr>
                        <td class="bg-light text-center">상품명</td>
                        <td><input type="text" class="form-control" value="22"></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status1" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status1">정지
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">온라인 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status2" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">매장 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status3" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">성인인증 구분</td>
                        <td>
                            <label>
                                <input type="radio" name="status4">필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4" checked>불필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4">알수없음
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품 설명</td>
                        <td><textarea class="form-control" style="width: 600px; height: 100px;"></textarea></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">검색 단어</td>
                        <td><input type="text" class="form-control" style="width: 600px;"></td>
                    </tr>
                </table>
                <div class="timeline-body">
                    <div class="timeline-header m-t-10 m-b-10 text-center">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span>
                                    사진정보
                                    <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                        <strong class="font-size-10">드래그로 순서변경 가능</strong>
                                    </i>
                                </span>
                    </div>
                    <div class="" style="width: 50%; float: left; text-align: center;">
                        <b>리스트 이미지</b>
                    </div>
                    <div class="" style="width: 50%; float: right; text-align: center;">
                        <b>상세 이미지</b>
                    </div>
                    <div id="sortable1" class="invoice-note" style="width: 50%; float: left;">
                        <%--<c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>--%>
                    </div>
                    <div id="sortable2" class="invoice-note" style="width: 50%; float: left;">
                        <c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone1">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: left; border: 1px solid #eee;">
                            <h4><strong>리스트 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone2">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: right; border: 1px solid #eee;">
                            <h4><strong>상세 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <%--<button type="submit" id="btnSubmit" class="btn btn-primary btn-sm add_picture_btn">업로드</button>--%>
                </div>
            </div>
        </section>

        <section id="content3">
            <div class="table-responsive">
                <table id="user" class="table table-condensed table-bordered">
                    <tr>
                        <td class="bg-light text-center">상품명</td>
                        <td><input type="text" class="form-control" value="33"></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status1" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status1">정지
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">온라인 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status2" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">매장 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status3" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">성인인증 구분</td>
                        <td>
                            <label>
                                <input type="radio" name="status4">필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4" checked>불필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4">알수없음
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품 설명</td>
                        <td><textarea class="form-control" style="width: 600px; height: 100px;"></textarea></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">검색 단어</td>
                        <td><input type="text" class="form-control" style="width: 600px;"></td>
                    </tr>
                </table>
                <div class="timeline-body">
                    <div class="timeline-header m-t-10 m-b-10 text-center">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span>
                                    사진정보
                                    <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                        <strong class="font-size-10">드래그로 순서변경 가능</strong>
                                    </i>
                                </span>
                    </div>
                    <div class="" style="width: 50%; float: left; text-align: center;">
                        <b>리스트 이미지</b>
                    </div>
                    <div class="" style="width: 50%; float: right; text-align: center;">
                        <b>상세 이미지</b>
                    </div>
                    <div id="sortable1" class="invoice-note" style="width: 50%; float: left;">
                        <%--<c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>--%>
                    </div>
                    <div id="sortable2" class="invoice-note" style="width: 50%; float: left;">
                        <c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone1">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: left; border: 1px solid #eee;">
                            <h4><strong>리스트 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone2">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: right; border: 1px solid #eee;">
                            <h4><strong>상세 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <%--<button type="submit" id="btnSubmit" class="btn btn-primary btn-sm add_picture_btn">업로드</button>--%>
                </div>
            </div>
        </section>

        <section id="content4">
            <div class="table-responsive">
                <table id="user" class="table table-condensed table-bordered">
                    <tr>
                        <td class="bg-light text-center">상품명</td>
                        <td><input type="text" class="form-control" value="44"></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status1" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status1">정지
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">온라인 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status2" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status2">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">매장 판매상태</td>
                        <td>
                            <label>
                                <input type="radio" name="status3" checked>정상
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">정지(품절표시)
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status3">판매안함
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">성인인증 구분</td>
                        <td>
                            <label>
                                <input type="radio" name="status4">필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4" checked>불필요
                            </label>
                            <label style="padding-left: 10px;">
                                <input type="radio" name="status4">알수없음
                            </label>
                        </td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">상품 설명</td>
                        <td><textarea class="form-control" style="width: 600px; height: 100px;"></textarea></td>
                    </tr>
                    <tr>
                        <td class="bg-light text-center">검색 단어</td>
                        <td><input type="text" class="form-control" style="width: 600px;"></td>
                    </tr>
                </table>
                <div class="timeline-body">
                    <div class="timeline-header m-t-10 m-b-10 text-center">
                        <i class="fas fa-lg fa-fw m-r-10 fa-info-circle"></i>
                        <span>
                                    사진정보
                                    <i class="fa fa-asterisk rix_asterisk font-size-10" title="필수 입력 항목입니다.">
                                        <strong class="font-size-10">드래그로 순서변경 가능</strong>
                                    </i>
                                </span>
                    </div>
                    <div class="" style="width: 50%; float: left; text-align: center;">
                        <b>리스트 이미지</b>
                    </div>
                    <div class="" style="width: 50%; float: right; text-align: center;">
                        <b>상세 이미지</b>
                    </div>
                    <div id="sortable1" class="invoice-note" style="width: 50%; float: left;">
                        <%--<c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>--%>
                    </div>
                    <div id="sortable2" class="invoice-note" style="width: 50%; float: left;">
                        <c:forEach var="item" items="${listPhoto}" varStatus="i" >
                            <div class="image" id="${item.bhpId}" >
                                <img src="/api/hospital/fileLoad?fileName=${item.bhpName}&bhpBhId=${item.bhpBhId}"  onerror="this.src='${path}/assets/img/logo/logo-noimg.gif'">
                                <div id="del_${item.bhpId}" class="btn btn-danger btn-sm del_img" style="cursor: pointer;">
                                    <i class="fa fa-pencil-alt" aria-hidden="true" >삭제</i>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone1">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: left; border: 1px solid #eee;">
                            <h4><strong>리스트 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <form action=""  drop-zone="" class="dz-clickable dz-started dropzone-custom" id="file-dropzone2">
                        <div class="fallback">
                        </div>
                        <div class="dz-message alert m-b-10 text-center" style="width: 50%; float: right; border: 1px solid #eee;">
                            <h4><strong>상세 이미지 드래그&드롭 ZONE</strong></h4>
                            <div class="dropzone-previews">
                                <div class="dz-preview dz-processing dz-error dz-complete dz-image-preview">
                                </div>
                            </div>
                        </div>
                    </form>
                    <%--<button type="submit" id="btnSubmit" class="btn btn-primary btn-sm add_picture_btn">업로드</button>--%>
                </div>
            </div>
        </section>
    </div>


    <!-- begin scroll to top btn -->
    <a href="javascript:;" class="btn btn-icon btn-circle btn-success btn-scroll-to-top fade" data-click="scroll-top"><i
            class="fa fa-angle-up"></i></a>
    <!-- end scroll to top btn -->

</div>

<%--modal add start--%>
<%--<div class="modal fade" id="add_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="insert.jsp" %>
</div>--%>
<%--modal add end--%>

<%--modal edit start--%>
<%--<div class="modal fade" id="edit_modal" tabindex="-1" role="dialog" aria-hidden="true">
    <%@include file="update.jsp" %>
</div>--%>
<%--modal edit end--%>
<!-- end page container -->

<!-- ================== BEGIN BASE JS ================== -->
<%@include file="../../../common/include_common_js.jsp" %>
<!-- ================== END BASE JS ================== -->
<%-- Custom JS Start--%>
<%@include file="../../../common/include_custom_js.jsp" %>
<%-- Custom JS End--%>

<script>
    $(() => {
        $(".btn_list").click(function() {
            location.href = "/merchant/merchandise/list";
        })
        /*$("#dataTable").dataTable({
            "paging" : true,
            "ordering" : true,
            "info" : true,
            "filter" : true,
            "lengthChange" : true,
            "order" : [[0, "desc"]]
        });*/
        let date = new Date();
        $("#startDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr",
        });
        $("#startDate").datepicker('setDate', new Date());
        date.setMonth(date.getMonth() + 1, 1);
        $("#endDate").datepicker({
            calendarWeeks: false,
            todayHighlight: true,
            autoclose: true,
            format: "yyyy-mm-dd",
            language: "kr"
        });
        $("#endDate").datepicker('setDate', date);
    });
    /*function initPassword(bhId){
        let initPassword = document.createElement('span');
        initPassword.innerHTML = '비밀번호를 초기화 하시겠습니까?<br>초기화 비밀번호 : 1234';
        swal({
            content: initPassword,
            icon: "warning",
            buttons: [
                '취소',
                '초기화'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "${path}/usermanagement/initPassword?bhId="+bhId,
                    success: function() {
                        swal({
                            title: "초기화가 성공되었습니다.",
                            icon: "success",
                            button: '확인'
                        })
                    }
                });
            }
        });
    }

    /!*----------------------리스트 - 자동완성 검색 기능 시작----------------------*!/
    $(".hospitalName").autocomplete({
        //자동완성의 대상
        source: function (req, res) {
            let term = escapeHtml(req.term).trim().replaceAll("&quot;","").replace("선택된 데이터가 없습니다.","").trim();
            $.ajax({
                type: 'get',
                url: "${path}/hospitalmanagement/autolist",
                dataType: "json",
                data: {"term":term},
                success: function(data) {
                    data = data.autoList;
                    //서버에서 json 데이터 response 후 목록에 추가
                    res(
                        $.map(data, function(item) {
                            let address = new Array();
                            let addressStr = '';
                            if(item.bhAddress != null && item.bhAddress != "") {
                                address = item.bhAddress.split(" ");
                                addressStr = address[0] + " " + address[1];
                            }
                            return {
                                label: item.bhName + "(" + addressStr + ")",
                                item : item.bhId,
                                id : item.bhId,
                            }
                        })
                    );
                }
            });
        },
        minLength: 1,
        delay: 0,
        focus: function (event, ui) {
            return (event.keyCode === 40 || event.keyCode === 38) ? false : ui;
        },
        select: function (event, selected) {
            if(event.keyCode === 13) {
                $(".bmBhId").val(selected.item.id);
            }
            $(".bmBhId").val(selected.item.id);
        }
    });
    /!*----------------------리스트 - 자동완성검색 기능 끝----------------------*!/

    $(".hospital_search_val").on("keydown", function(event) {
        if(event.keyCode != 13)
            $(".bmBhId").val('');
    });

    function deleteRow(bmId) {
        let dataTable = $('#dataTable').DataTable();
        swal({
            title: "삭제하시겠습니까?",
            // text: "데이터가 수정됩니다.!",
            icon: "warning",
            buttons: [
                '취소',
                '삭제'
            ],
            dangerMode: true,
        }).then(function (isConfirm) {
            if (isConfirm) {
                $.ajax({
                    type: "GET",
                    url: "/usermanagement/masterDelete?bmId="+bmId,
                    dataType: "json",
                    success: function() {
                        dataTable.ajax.reload();
                    }
                });
            }
        });
    }
    let _$modalAdd = $('#add_modal');
    let _$modalEdit = $('#edit_modal');

    _$modalAdd.on('show.bs.modal', function () {
        $("#bmBhId").val("");
        $('.save_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalAdd.find($('.add_form'));
            let req = convertFormToObj(_forms);
            if (insertDataCheck(req)) {
                swal_confirm(
                    '등록 하시겠습니까?',
                    '등록',
                    "${path}/usermanagement/masterInsert/",
                    "POST",
                    req,
                    table,
                    _$modalAdd
                );
            }
        });
    });

    _$modalEdit.on('shown.bs.modal', function (event) {
        $('.update_btn').on('click', function () {
            let table = $("#dataTable").DataTable();
            let _forms = _$modalEdit.find($('form.edit_form'));
            let req = convertFormToObj(_forms);
            if (updateDataCheck(req)) {
                swal_confirm(
                    '수정 하시겠습니까?',
                    '수정',
                    "${path}/usermanagement/masterUpdate/",
                    "POST",
                    req,
                    table,
                    _$modalEdit
                );
            }
        });
    });

    _$tbody.on('click', 'a', function (event) {
        column_select($(this).parents('td').parents('tr'));

        let bmId = _params.bmId;
        let bmBhId = _params.bmBhId;
        let bhName = _params.bhName;
        let bmLoginId = _params.bmLoginId;
        let bmName = _params.bmName;
        let bmRole = _params.bmRole;

        $("#edit_bmId").val(bmId);
        $("#edit_bmBhId").val(bmBhId);
        $("#edit_search_val").val(bhName);
        $("#edit_bmLoginId").val(bmLoginId);
        $("#edit_bmName").val(bmName);
        $("#edit_bmRole").val(bmRole);
        $("#hp_edit_bmId").val(bmId);
        $("#hp_edit_bmBhId").val(bmBhId);
        $("#hp_edit_search_val").val(bhName);
        $("#hp_edit_bmLoginId").val(bmLoginId);
        $("#hp_edit_bmName").val(bmName);
        $("#hp_edit_bmRole").val(bmRole);
        _$modalEdit.modal().show();
    });

    function insertDataCheck(args) {
        let pwCheck = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,}$/.test(args.bmLoginPwd);
        if (isNull(args.bmLoginId)) {
            return alert_focus("bmLoginId", "로그인ID를 입력해주세요.");
        } else if (isNull(args.bmLoginPwd)) {
            return alert_focus("bmLoginPwd", "비밀번호를 입력해주세요");
        } <c:if test="${sessionScope.sessionKey.bmRole == 0}"> else if (isNull(args.bmBhId)) {
            return alert_focus("search_val", "병원 검색 후 선택해주세요");
        }</c:if> else if (isNull(args.bmName)) {
            return alert_focus("bmName", "이름을 입력해주세요");
        } else if(!pwCheck) {
            return alert_focus("bmLoginPwd", "비밀번호는 8자리 이상, 영문+숫자+특수문자로 조합하여 설정해주세요.");
        }
        return true;
    }

    function updateDataCheck(args) {
        if (isNull(args.bmLoginId)) {
            return alert_focus("bmLoginId", "로그인ID를 입력해주세요.");
        } else if (isNull(args.bmName)) {
            return alert_focus("bmName", "이름을 입력해주세요");
        } <c:if test="${sessionScope.sessionKey.bmRole == 0}">else if (isNull(args.bmBhId)) {
            return alert_focus("search_val", "병원 검색 후 선택해주세요");
        }</c:if>
        return true;
    }*/
</script>
</body>
</html>
