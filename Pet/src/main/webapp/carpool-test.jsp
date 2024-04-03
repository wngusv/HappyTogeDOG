
<!DOCTYPE html>
<html class="index" lang="ko">
<head>
<meta http-equiv="X-UA-Compatible" content="IE=Edge" />
<meta name="viewport" content="width=1024" />

	<link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202403291400974/app_A.css">
	<link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202403291400974/app_B.css">
    <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202403291400974/app_C.css">
    <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202403291400974/app_D.css">
            <link rel="stylesheet" href="//t1.daumcdn.net/kakaomapweb/map/202403291400974/canvas_roadview.css">
    
            <link rel="stylesheet" href="https://t1.daumcdn.net/kakaomapweb/subway/linemap/canvas/prod/css/subway.css">
    
<link rel="icon" type="image/x-icon" href="/favicon.ico" />

<title>카카오맵</title>
<script type="text/javascript">
if (true === true && true && document.referrer.split('?')[0] === "https://accounts.kakao.com/login?continue=".split('?')[0]) {
	window.location.href = window.location.origin + '/user/signup';
}
</script>




<meta property="og:site_name" content="카카오맵">
<meta property="og:title" content="카카오맵">
<meta property="og:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta property="og:type" content="website">
<meta property="og:image" content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">

<meta name="twitter:card" content="summary_large_image">
<meta name="twitter:title" content="카카오맵">
<meta name="twitter:description" content="당신을 좋은 곳으로 안내 할 지도">
<meta name="twitter:image" content="//t1.daumcdn.net/localimg/localimages/07/common/ogtag.png">

<meta name="description" content="당신을 좋은 곳으로 안내 할 지도">
<link rel="search" type="application/opensearchdescription+xml" href="/OpenSearch.xml" title="카카오맵">
</head>
<body class="MAP">
<div id="daumIndex">
	<a href="#localInfo">본문 바로가기</a>
	<a href="#info">메뉴 바로가기</a>
</div>

<div class="IE6MIN"><div id="header" class="Header" role="banner">
        <h1 class="Title">
            <a id="local" class="local" href="?nil_profile=title&amp;nil_src=local">kakaomap</a>
        </h1>
        <button type="button" class="btn_menu">더보기 메뉴 열기</button>

        <strong class="screen_out">검색</strong>
        <div id="search" class="Search">
            <form id="search.keyword" class="KeywordSearch"
                                      onsubmit="window.QUERY=this.elements[0].value;return false">
                <fieldset class="fld_inside">
                    <legend class="screen_out">검색어 입력폼</legend>
                    <h2 class="screen_out"><label for="search.keyword.query">지도 검색</label></h2>
                    <div class="box_searchbar">
                        <input type="text" id="search.keyword.query" name="q" class="query tf_keyword bg_on" maxlength="100" autocomplete="off" accesskey="s">
                        <button type="button" id="search.keyword.submit" class="go ico_search btn_search">검색</button>
                    </div>
                    <div class="choice_currentmap">
                        <input type="checkbox" id="boundscheck" class="screen_out">
                        <label id="search.keyword.bounds" for="boundscheck" class="lab_currentmap INACTIVE"><span id="search.keyword.currentmap" class="ico_currentmap"></span>현 지도 내 장소검색</label>
                    </div>
                    <blockquote id="search.keyword.querySuggest" class="suggest"></blockquote>
                </fieldset>
            </form>
        </div>
    </div></div>

    <h2 class="tit_login "><a href="#" target="_top" id="btnLogin">시작하기</a></h2>
    <h2 class="tit_profile PROFILE-IMG  HIDDEN" id="btnProfile" >
        <a href="#none">
            <img src="" width="36" height="36" class="img_profile HIDDEN" alt="프로필" id="exifviewer-img-1" exifid="196919547" >
        </a>
    </h2>
        <div class="dimmed_snb">
            <div class="snb_map" role="navigation">
                <h2 class="img_snb tit_snb">kakaomap <span class="screen_out">더보기 메뉴</span></h2>
                <a data-log="notice" href="http://kakaomap.tistory.com" target="_blank" class="link_snb link_notice"><span class="img_snb"></span>공지사항</a>
                <a data-log="event" href="http://kakaomap.tistory.com/category/알립니다/이벤트" target="_blank" class="link_snb link_event"><span class="img_snb"></span>이벤트</a>

                <div class="wrap_get HIDDEN" id="migrationMenus">
                    <ul class="list_get">
                        <li id="unmigrationMenu">
                            <a href="/user/signup" target="_blank" class="link_getdaum">다음지도 즐겨찾기 가져오기</a>
                        </li>
                    </ul>
                </div>
                <ul class="list_service" id="mapMenus">
                    <li><a class="xc item_service" href="#none" data-channel="SIDEBAR_NEWPLACE">신규장소 등록</a></li>
                    <li><a data-log="cs" href="https://cs.kakao.com/helps?locale=ko&service=101" target="_blank">고객센터</a></li>
                    <li class="options">
                        <a href="#none" target="_blank">설정<span class="img_snb ico_arr">열기/닫기</span></a>
                        <ul class="list_option">
                            <li><a href="http://www.kakao.com/ko/terms" target="_blank">서비스 이용약관</a></li>
                            <li><a href="http://www.kakao.com/ko/location" target="_blank">위치기반 서비스 이용약관</a></li>
                            <li><a href="http://www.kakao.com/ko/privacy" target="_blank">개인정보 처리방침</a></li>
                            <li><a href="http://kakaomap.tistory.com/68" target="_blank">법적공지 및 정보 제공처</a></li>
                            <li><a href="http://www.kakao.com/ko/operation" target="_blank">운영정책</a></li>
                            <li><a class="xd" data-log="setting|unregister" href="#none" target="_blank">서비스 탈퇴</a></li>
                        </ul>
                    </li>
                </ul>
                <ul class="list_info">
                    <li><a data-log="openapi" href="https://apis.map.kakao.com" target="_blank">지도 오픈 API</a></li>
                    <li><a data-log="searchregister" href="https://register.search.daum.net/index.daum" target="_blank">지도 검색등록</a></li>
                </ul>
                <button type="button" class="img_snb btn_close">더보기 메뉴 닫기</button>
            </div>
        </div>

<div id="info.other" class="FavoriteOther HIDDEN">
    <div data-id="header" class="header"></div>
        <div data-id="body" class="body">
        <div id="other.favorite" class="favorite_result">
            <h3 class="screen_out">즐겨찾기</h3>
            <div data-id="listNone" class="FavoriteEmptyPage HIDDEN">
                <p class="desc_empty">공개된 그룹이 없습니다.</p>
            </div>
            <ul data-id="list" class="list_body"></ul>

            <div id="info.other.favorite.page" data-id="pagination" class="pages HIDDEN">
                <div class="pageWrap">
                    <button type="button" id="info.other.favorite.page.prev" class="prev disabled">이전</button>
                    <a id="info.other.favorite.page.no1" class="INACTIVE" href="#">1</a>
                    <a id="info.other.favorite.page.no2" class="INACTIVE" href="#">2</a>
                    <a id="info.other.favorite.page.no3" class="INACTIVE" href="#">3</a>
                    <a id="info.other.favorite.page.no4" class="INACTIVE" href="#">4</a>
                    <a id="info.other.favorite.page.no5" class="INACTIVE" href="#">5</a>
                    <button type="button" id="info.other.favorite.page.next" class="next">다음</button>
                </div>
            </div>
        </div>
        <div id="other.review" class="favorite_evaluation HIDDEN">
            <h3 class="screen_out">후기</h3>
            <div>
                <div data-id="reviewEmptyPage" class="FavoriteEmptyPage HIDDEN">
                    <p class="desc_empty">후기가 없습니다.</p>
                </div>
                <div data-id="filteredReviewEmptyPage" class="FavoriteEmptyPage empty_type2 HIDDEN">
                    <p class="desc_empty">후기가 없습니다.</p>
                    <p class="desc_sub"> 적용한 필터에 해당하는 후기가 없습니다.<br>필터 조건을 변경해 주세요. </p>
                </div>
            </div>
            <div data-id="reviewPrivatePage" class="FavoriteEmptyPage empty_type2 HIDDEN">
                <p class="desc_empty2">마이페이지 내 후기를 비공개한 사용자입니다.</p>
            </div>
            <ul data-id="reviewList" class="list_body"></ul>
            <div id="other.review.page" class="pages HIDDEN">
                <div class="pageWrap">
                    <button type="button" id="other.review.page.prev" class="prev disabled">이전</button>
                    <a id="other.review.page.no1" class="ACTIVE" href="#">1</a>
                    <a id="other.review.page.no2" class="INACTIVE" href="#">2</a>
                    <a id="other.review.page.no3" class="INACTIVE" href="#">3</a>
                    <a id="other.review.page.no4" class="INACTIVE" href="#">4</a>
                    <a id="other.review.page.no5" class="INACTIVE" href="#">5</a>
                    <button type="button" id="other.review.page.next" class="next">다음</button>
                </div>
            </div>
        </div>
    </div>
    <div data-id="toolbar" class="FavoriteFunctionToolBar HIDDEN">
        <button type="button" data-id="share" class="btn_share"><span class="ico_function ico_share"></span>공유하기</button>
        <button type="button" data-id="info" class="btn_info">그룹 정보</button>
        <button type="button" data-id="subscribe" class="btn_edit"><span class="ico_function ico_edit"></span>구독하기</button>
    </div>
    <div data-id="footer" class="Footer">
        <a class="xa" target="_blank" href="https://cs.kakao.com/helps?locale=ko&service=101">고객센터</a>
        <a class="xc" href="#none" data-pos="footer" data-channel="SEARCH_BOTTOM_NEWPLACE">신규 장소 등록</a>
        <a target="_blank" href="https://www.kakao.com/policy/privacy?type=p&lang=ko"><strong>개인정보처리방침</strong></a>
    </div>
</div>

<div id="info" class="Info">
    <div id="info.header" class="header">
        <div id="info.header.main" class="main">
            <div role="navigation">
                <h2 class="screen_out">검색 메뉴</h2>
                <ul class="menu">
                    <li id="search.tab1" class="keyword keyword-ACTIVE">
                        <a href="#" class="mainmenutab" title="검색">검색</a>
                    </li>
                    <li id="search.tab2" class="carRoute carRoute-INACTIVE">
                        <a href="#" class="mainmenutab" title="길찾기">길찾기</a>
                    </li>
                    <li id="search.tab3" class="transitRoute transitRoute-INACTIVE">
                        <a href="#" class="mainmenutab" title="버스">버스</a>
                    </li>
                    <li id="search.tab4" class="subwayRoute subwayRoute-INACTIVE">
                        <a href="#" class="mainmenutab" title="지하철">지하철</a>
                    </li>
                    <li id="search.tab5" class="favorite favorite-INACTIVE">
                        <a href="#" class="mainmenutab" title="즐겨찾기">MY</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>

	<div id="info.body" class="body">
		<div id="info.main" class="Main INFOLEFT">
    <div id="info.main.home" class="home">
        <div id="info.location" class="theme">
            <div class="reportError">
                <h3 class="screen_out">현재위치</h3>
                <span id="info.location.approxAddr" class="approxAddr">&nbsp;</span>
                <div id="info.location.weather" class="infoAir HIDDEN">
                    <strong class="screen_out">날씨정보</strong>
                    <span class="txt_air"></span>
                    <span class="temper"></span>
                    <span class="txt_change"></span>
                    <span class="txt_bar"></span>
                    <span class="txt_dust">미세<span data-id="dust_state" class="txt_state"></span></span>
                    <span class="txt_dust">초미세<span data-id="micro_dust_state" class="txt_state"></span></span>
                </div>
                <a id="info.location.reportError" href="iptargeting/form" class="reportbug">오류신고</a>
            </div>
        </div>
        <div id="info.main.famous" class="famous"></div>
        <div id="info.main.around" class="infoAround">
            <h3 class="tit_around">주변 탐색</h3>
            <ul class="list_around"></ul>
        </div>
        <div id="info.main.myplace" class="regfav myplace"></div>
        <div id="info.main.favorite" class="regfav"></div>
        <div id="info.main.newplace" class="newplace">
            <div class="newPlace">
                <h6 class="tit_newplace">새로운 장소</h6>
                <p class="desc_place">새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.</p>
                <a href="#none" class="xc link_newplace link_suggest" data-pos="left" data-channel="SEARCH_MIDDLE_NEWPLACE">신규 장소 등록</a>
            </div>
        </div>
    </div>

    <div id="info.main.header" class="mainHeader HIDDEN">
        <ul id="info.main.options" class="sub"></ul>
        <a href="#none" id="info.main.header.clear" class="clear" title="모두 지우기">모두 지우기</a>
        <div id="info.main.header.activeOption" class="screen_out"></div>
    </div>

        <div id="info.related.keyword" class="relatedKeyword HIDDEN">
        <span class="ico">관련검색어</span>
        <div class="frameKeywords">
            <p class="wrapKeywords">
            </p>
        </div>
        <div class="more closed HIDDEN">
            <a href="#">더보기</a><span class="ico"></span>
        </div>
        <div class="more opened HIDDEN">
            <a href="#">접기</a><span class="ico"></span>
        </div>
    </div>
        <div id="info.searchHeader" class="searchHeader HIDDEN">
        <div id="info.search.boundsTitle" class="HIDDEN">
            <p class="desc_search">현재 지도 내 <em id="info.search.boundsTitle.text"></em> 검색결과</p>
        </div>
        <div id="info.search.correction" class="correction HIDDEN">
            <div class="correctionTop">
                <p class="desc_search">
                <em id="info.search.correction.orig"></em>에서
                <em id="info.search.correction.new"></em>으로 검색한 결과
                </p>
            </div>
            <p class="correctionBottom">
            <a href="#" id="info.search.correction.goorig" class="link_search">입력한 '<span id="info.search.correction.orig2"></span>'(으)로 재검색 <span class="ico_arr"></span></a>
            <p id="info.search.correction.error" class="desc_error HIDDEN"></p>
            </p>
        </div>
        <div id="info.searchHeader.message" class="message HIDDEN"></div>
        <div id="info.searchHeader.banner" class="keywordBanner HIDDEN">
            <a href="#" class="banner"></a>
        </div>
        <div id="info.searchHeader.postCodeMessage" class="postCodeMessage HIDDEN">
            <a href="#none" class="link_search">우편번호 검색<span class="ico_arr"></span></a>
        </div>
        <div id="info.searchHeader.spellcheck" class="spellcheck HIDDEN">
            <div id="info.searchHeader.spellcheck.titleresult" class="desc_search HIDDEN">
                <em id="info.searchHeader.spellcheck.title"></em> 검색결과
            </div>
            <p><a href="#" class="link_search" id="info.searchHeader.spellcheck.candidate">'<span id="info.searchHeader.spellcheck.text"></span>'(으)로 재검색 <span class="ico_arr"></span></a></p>
        </div>
    </div>
    <div id="info.noPlace" class="noPlace HIDDEN">
        <div class="inner_noPlace">
            <h3 class="noKeyword">
                <em id="info.noPlace.keyword" class="txt_keyword"></em> 검색 결과가 없어요.
            </h3>
            <p class="noResultDesc">검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.</p>
            <a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlace.daum.link" target="_blank">Daum 검색 결과 보기</a>
            <div id="info.noPlace.register" class="register">
                새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.
                <a id="info.noPlace.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
            </div>        </div>    </div>
    <div id="info.search.noW3w" class="noPlace noPlace_type2 HIDDEN">
        <div class="inner_noPlace">
            <h3 class="noKeyword">검색 결과가 없어요.</h3>
        </div>
    </div>



        <div id="info.search" class="keywordSearch HIDDEN">
        <div id="info.search.buses" class="section buses">
            <div class="sectiontitle sectionBus">
                <h5 class="busestit">버스번호</h5>
                <span class="cntwrap"><em id="info.search.buses.cnt" class="cnt"></em></span>
                <span id="info.search.buses.busstop" class="busstop HIDDEN">
                    버스 정류장<em id="info.search.buses.busstop.cnt" class="cnt"></em>
                </span>
                <div id="info.search.buses.regions" class="regionsbox"></div>
            </div>
            <ul id="info.search.buses.list"></ul>
            <a id="info.search.buses.more" class="more" href="#">버스 더보기</a>
                    </div>

        <div id="info.search.busstops" class="section busstops">
            <div class="sectiontitle sectionBus">
                <h3 class="busstoptitle">버스 정류장</h3>
                <span class="cntwrap"><em id="info.search.busstops.cnt" class="cnt"></em></span>
                <div id="info.search.busstops.regions" class="regionsbox"></div>
            </div>
            <ul id="info.search.busstops.list"></ul>
            <a id="info.search.busstops.more" class="more" href="#">버스 정류장 더보기<span class="ico_road_arrow"></span></a>
                    </div>

        <div id="info.search.address" class="section addresses">


            <div class="sectiontitle">
                <h3 class="addrtitle">주소</h3>
                <span class="cntwrap"><em id="info.search.address.cnt" class="cnt"></em></span>
            </div>
            <div id="info.search.address.retry" class="retry HIDDEN">
                <div class="content">
                    <span class="ico"></span>
                    <span class="txt">찾으시는 주소가 없어 유사한 주소를 제공합니다.</span>
                </div>
            </div>
            <ul id="info.search.address.list"></ul>
            <a id="info.search.address.more" class="more" href="#">주소 더보기<span class="ico_road_arrow"></span></a>
        </div>

        <div id="info.search.place" class="section places">
            <div class="sectiontitle">
                <h5 class="placetit">장소</h5>
                <span class="cntwrap"><em id="info.search.place.cnt" class="cnt"></em></span>
                <ol id="info.search.place.sort" class="Sort"></ol>
            </div>
            <div id="info.search.place.breadcrumb" class="breadcrumb"></div>
            <ul id="info.search.place.list" class="placelist"></ul>
            <a id="info.search.place.more" class="more" href="#">장소 더보기</a>
                    </div>
        <div id="info.search.page" class="pages HIDDEN">
            <div class="pageWrap">
                <button type="button" id="info.search.page.prev" class="prev disabled">이전</button>
                <a id="info.search.page.no1" class="INACTIVE" href="#">1</a>
                <a id="info.search.page.no2" class="INACTIVE" href="#">2</a>
                <a id="info.search.page.no3" class="INACTIVE" href="#">3</a>
                <a id="info.search.page.no4" class="INACTIVE" href="#">4</a>
                <a id="info.search.page.no5" class="INACTIVE" href="#">5</a>
                <button type="button" id="info.search.page.next" class="next">다음</button>
            </div>
        </div>

    </div>

    <div id="info.addNewPlace" class="info_addplace HIDDEN">
        <strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.</strong>
        <a id="info.addNewPlace.btn" href="#" class="ico_place link_addplace">신규 장소 등록</a>
    </div>

    <div id="info.noSuchPlace" class="noPlace noSuchPlace HIDDEN">
        <p><strong>'해당위치'</strong>에 대한 검색 결과가 없습니다.</p>
    </div>

    <div id="info.noPlaceInBounds" class="noPlace noInBounds HIDDEN">
        <div class="inner_noPlace">
            <h3 class="noKeyword">
                <em id="info.noPlaceInBounds.keyword" class="txt_keyword"></em> 검색 결과가 없어요.
            </h3>
            <p class="noResultDesc">검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.</p>
            <a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlaceInBounds.daum.link" target="_blank">Daum 검색 결과 보기</a>
            <div id="info.noPlaceInBounds.register" class="register">
                새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.
                <a id="info.noPlaceInBounds.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
            </div>        </div>
    </div>

    <div id="info.noThemePlace" class="noThemePlace HIDDEN">
        <p id="info.noThemePlace.category" class="reviewcategories HIDDEN">
        <a id="info.noThemePlace.category.n1" href="#">전체</a>
        <a id="info.noThemePlace.category.n2" href="#">음식</a>
        <a id="info.noThemePlace.category.n3" href="#">여행</a>
        <a id="info.noThemePlace.category.n4" href="#">기타</a>
        </p>
        <p class="l1"><strong>'주변 <span id="info.noThemePlace.title"></span>'</strong>에 대한 검색 결과가 없습니다.</p>
        <p class="l2">지도를 축소하여 다시 테마 지도를 이용해 주세요.</p>
    </div>

    

</div>
		<div id="info.route" class="RouteSearch HIDDEN">

    <h2 class="screen_out">길찾기 검색</h2>
    <div id="info.route.searchBox" class="RouteSearchBox HIDDEN WHITEOUT">
        <div id="info.route.searchBox.list" ></div>
        <a href="#none" id="info.route.searchBox.toggleVia" class="btn_roadsearch toggleVia">경유지 추가</a>
                <a href="#none" id="info.route.searchBox.change" class="btn_roadsearch routechange" title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a>
                <a href="#none" id="info.route.searchBox.clearVia" class="btn_roadsearch clearVia" title="모두 지우기">모두 지우기</a>
                </div>

                    <div id="info.flagsearch.method" class="routeMethod"></div>


    <div id="info.route.home" class="routeHistory routedesc"></div>
    <div id="info.route.intro" class="Howto">
        <strong class="tit_intro">오늘은<br>어디로 안내할까요?</strong>
        <p class="desc_intro">매일매일 업데이트되는 최신정보로<br>가장 빠른 경로를 알려드려요.</p>
    </div>

    <div id="info.flagsearch" class="HIDDEN Flagsearch">
        <div class="search">
            <div id="info.flagsearch.divided" class="flagDivided">
                <div id="info.flagsearch.correction" class="correction HIDDEN">
                    <p class="correctionTop">
                    '<strong id="info.flagsearch.correction.orig"></strong>'에서
                    '<strong id="info.flagsearch.correction.new"></strong>'으로 검색한 결과
                    </p>
                    <p class="correctionBottom">
                    <a href="#" id="info.flagsearch.correction.goorig">입력한 '<span id="info.flagsearch.correction.orig2"></span>'(으)로 재검색 ‣</a>
                    </p>
                </div>

                <div id="info.flagsearch.spellcheck" class="spellcheck HIDDEN">
                    <div class="spellcheckTitle HIDDEN" id="info.flagsearch.spellcheck.titleText">
                        '<strong id="info.flagsearch.spellcheck.title"></strong>' 검색결과
                    </div>
                    <p><a href="#" class="candidate" id="info.flagsearch.spellcheck.candidate">'<span id="info.flagsearch.spellcheck.text"></span>'(으)로 검색하시겠습니까?</a></p>
                </div>

                <div id="info.flagsearch.message" class="message"></div>

            </div>
            <div id="info.flagsearch.options" class="filterwrap">
                <div class="filter" data-mypage="true">
                    <a href="#" class="ACTIVE" id="info.flagsearch.filter.all">전체</a>
                    <a href="#" class="INACTIVE" id="info.flagsearch.filter.place">장소</a>
                    <a href="#" class="INACTIVE" id="info.flagsearch.filter.address">주소</a>
                    <a href="#" class="INACTIVE" id="info.flagsearch.filter.busstop">버스</a>
                </div>
            </div>
            <div id="info.flagsearch.address" class="section addresses">
                <div class="sectiontitle">
                    <h3 class="addrtitle">주소</h3>
                    <span class="cntwrap"><em id="info.flagsearch.address.cnt" class="cnt"></em></span>
                </div>
                <ul id="info.flagsearch.address.list"></ul>
                <a id="info.flagsearch.address.more" class="more" href="#">주소 더보기<span class="ico_road_arrow"></span></a>
            </div>

            <div id="info.flagsearch.place" class="section places">
                <h5 class="sectiontitle">
                    <span class="placetitle">장소</span>

                    <span class="cntwrap"><em id="info.flagsearch.place.cnt" class="cnt"></em></span>
                </h5>
                <ul id="info.flagsearch.place.list"></ul>
                <a id="info.flagsearch.place.more" class="more" href="#">장소 더보기</a>
            </div>

            <div id="info.flagsearch.busstop" class="section busstopList HIDDEN">
                <div class="sectiontitle">
                    <h3 class="busstoptitle">버스정류장</h3>
                    <span class="cntwrap"><em id="info.flagsearch.busstop.cnt" class="cnt"></em></span>
                </div>
                <ul id="info.flagsearch.busstop.list" ></ul>
                <a id="info.flagsearch.busstop.more" class="more" href="#">버스정류장 더보기<span class="ico_road_arrow"></span></a>
            </div>

            <div id="info.flagsearch.page" class="pages HIDDEN">
                <div class="pageWrap">
                    <button type="button" id="info.flagsearch.page.prev" class="prev disabled">이전</button>
                    <a id="info.flagsearch.page.no1" class="INACTIVE" href="#">1</a>
                    <a id="info.flagsearch.page.no2" class="INACTIVE" href="#">2</a>
                    <a id="info.flagsearch.page.no3" class="INACTIVE" href="#">3</a>
                    <a id="info.flagsearch.page.no4" class="INACTIVE" href="#">4</a>
                    <a id="info.flagsearch.page.no5" class="INACTIVE" href="#">5</a>
                    <button type="button" id="info.flagsearch.page.next" class="next">다음</button>
                </div>
            </div>

            <div id="info.noFlagPlace" class="noPlace HIDDEN">
                <div class="inner_noPlace">
                    <h3 class="noKeyword">
                        <em id="info.noFlagPlace.keyword" class="txt_keyword"></em> 검색 결과가 없어요.
                    </h3>
                    <p class="noResultDesc">검색어의 철자가 정확한지 다시 한번 확인해 주세요.<br>장소를 찾을 때 전화번호, 주소도 활용해 보세요.</p>
                    <a href="http://search.daum.net/search?w=tot&amp;DA=54X&amp;q=" class="noKeywordLink" id="info.noPlace.daum.link" target="_blank">Daum 검색 결과 보기</a>
                    <div id="info.noFlagPlace.register" class="register">
                        새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.
                        <a id="info.noFlagPlace.register.btn" class="registerBtn" href="#" target="_blank">신규 장소 등록</a>
                    </div>                </div>            </div>
            <div id="info.noW3w" class="noPlace noPlace_type2 ">                <div class="inner_noPlace">
                    <h3 class="noKeyword"> w3w를 지원하지 않는 기능이에요.  </h3>
                </div>
            </div>

            <div id="info.flagsearch.addNewPlace" class="info_addplace HIDDEN">
                <strong class="tit_addplace">새로운 수정된 장소를 알고 계세요?<br>장소 제안은 지도 품질 향상에 큰 도움이 됩니다.</strong>
                <a id="info.flagsearch.addNewPlace.btn" href="#" class="ico_place link_addplace">신규 장소 등록</a>
            </div>
        </div>

        <div id="info.carRoute" class="HIDDEN"></div>
        <div id="info.walkRoute" class="walkroute HIDDEN"></div>
        <div id="info.bikeRoute" class="bikeroute HIDDEN"></div>
    </div>
</div>
		
<div id="info.bus" class="BusSearch WHITEOUT HIDDEN">
    <a href="#none" id="info.bus.removeAll" class="removeAll" title="모두 지우기">모두 지우기</a>
	<ul id="search.busMethodtype" class="BusMethodType">
		<li id="search.busMethodtype.number" class="busNum NUMBER-ACTIVE">
            <a href="#none">번호</a>
        </li>
		<li id="search.busMethodtype.stop" class="busStop BUSSTOP-INACTIVE">
            <a href="#none">정류장</a>
        </li>
		<li id="search.busMethodtype.region" class="busRegion REGION-INACTIVE">
            <a href="#none">지역</a>
        </li>
	</ul>

			<div id="info.bus.searchBox.number" class="number">
			<form id="info.bus.searchBoxNumber" class="BusSearchBox WHITEOUT">
                <div class="box_search">
                                        <h3 class="screen_out"><label for="info.route.searchBox.number.name">버스번호</label></h3>
                    <input id="info.route.searchBox.number.name" class="q" type="text" autocomplete="off" placeholder="버스번호를 입력하세요">
                    <button id="info.bus.searchBox.number.submit" class="go" type="submit"></button>
                    <blockquote id="info.route.searchBox.number.nameSuggest"></blockquote>
                </div>
			</form>
		</div>
		<div id="info.bus.searchBox.stop" class="stop HIDDEN">
			<form id="info.bus.searchBoxStop" class="BusSearchBox WHITEOUT">
                <div class="box_search">
                    <h3 class="screen_out"><label for="info.route.searchBox.stop.name">버스정류장</label></h3>
                    <input id="info.route.searchBox.stop.name" class="q" type="text" autocomplete="off" placeholder="버스정류장을 입력하세요">
                    <button id="info.bus.searchBox.stop.submit" class="go" type="submit"></button>
                    <blockquote id="info.route.searchBox.stop.nameSuggest"></blockquote>
                </div>
			</form>
		</div>

		<div id="info.bus.region" class="region BusSearchBox HIDDEN">
            <div class="hb">
                <div id="info.bus.region.local.button" class="rb">
                    <h3 class="screen_out">지역</h3>
                    <span class="screen_out">선택상자</span>
                    <em class="screen_out">선택내용 :</em>
                    <span id="info.bus.region.local" class="method melt">경기</span>
                    <em class="screen_out">선택옵션</em>
                    <ul id="search.busLocal" class="BusLocal HIDDEN"></ul>
                </div>
            </div>
            <div class="hb sub">
                <div id="info.bus.region.subLocal.button" class="rb">
                    <strong class="screen_out">세부지역 선택상자</strong>
                    <em class="screen_out">선택내용 :</em>
                    <span id="info.bus.region.subLocal" class="method method-INACTIVE">가평군</span>
                    <em class="screen_out">선택옵션</em>
                </div>
            </div>
		</div>

		<div id="info.busIntro" class="Howto">
		<strong class="tit_intro">지금, 딱!<br>내가 탈 버스가 어디있는지</strong>
		<p class="desc_intro">노선 정보는 물론, 실시간으로<br>버스 도착정보와 위치를 확인하세요.</p>
		<a href="http://kakaomap.tistory.com/219" class="link_intro" target="_blank">서비스 제공지역 안내</a>
	</div>

	<div id="info.bus.search" class="BusResult">
		<div id="info.bus.message" class="busMessage">
			<div id="info.bus.guide" class="guide"></div>
		</div>
        <div id="info.bus.title" class="busTitle">
            <h3 class="title">검색결과</h3>
            <span id="info.bus.count" class="cntwrap"></span>
            <div id="info.bus.filter" class="filter"></div>
        </div>
	    <ul id="info.bus.list" class="list"></ul>
	    <div id="info.bus.page" class="pages HIDDEN">
	    	<div class="pageWrap">
                <button type="button" id="info.bus.page.prev" class="prev disabled">이전</button>
		        <a id="info.bus.page.no1" class="INACTIVE" href="#">1</a>
		        <a id="info.bus.page.no2" class="INACTIVE" href="#">2</a>
		        <a id="info.bus.page.no3" class="INACTIVE" href="#">3</a>
		        <a id="info.bus.page.no4" class="INACTIVE" href="#">4</a>
		        <a id="info.bus.page.no5" class="INACTIVE" href="#">5</a>
                <button type="button" id="info.bus.page.next" class="next">다음</button>
		    </div>
	    </div>
		<div id="info.noBus" class="info_nobus HIDDEN"></div>
	</div>

</div>
		<div id="info.subway" class="SubwayRouteSearch HIDDEN WHITEOUT">
		<h2 class="screen_out">지하철 검색</h2>
	<div class="SubwayRegion WHITEOUT">
		<ul id="info.subway.region">
		</ul>
        <a href="#none" id="info.subway.remove" class="remove" title="모두 지우기">모두 지우기</a>
	</div>

	    <div id="info.subway.searchBox" class="SubwayRouteSearchBox HIDDEN WHITEOUT">
    	<div class="origindestBox">
			<div id="info.subway.searchBox.originBox" class="box">
				<form id="info.subway.searchBox.originForm" class="form">
					<input id="info.subway.searchBox.origin" class="q" type="text" value=""/>
					<label for="info.subway.searchBox.origin"><span class="holderText op">출발역</span></label>
					<input class="submit" type="submit" value=""/>
					<a href="#" id="info.subway.searchBox.originDelete" class="delete dl HIDDEN" title="출발역지우기">출발역지우기</a>
				</form>
			<blockquote id="info.subway.searchBox.originSuggest" class="SubwayOriginSuggest"></blockquote>
			</div>
	        <a href="#" class="to" id="info.subway.searchBox.to" title="출발/도착 순서 바꾸기">출발/도착 순서 바꾸기</a>
			<div id="info.subway.searchBox.destBox" class="box dest">
				<form id="info.subway.searchBox.destForm" class="form">
					<input id="info.subway.searchBox.dest" class="q" type="text" value="" />
					<label for="info.subway.searchBox.dest"><span class="holderText dp">도착역</span></label>
					<input class="submit" type="submit" value=""/>
					<a href="#" id="info.subway.searchBox.destDelete" class="delete dr HIDDEN" title="도착역지우기">도착역지우기</a>
				</form>
			<blockquote id="info.subway.searchBox.destSuggest" class="SubwayDestSuggest"></blockquote>
			</div>
		</div>
		<div class="options">
			<a href="#" id="info.subway.searchBox.optionBox" class="optionBox" title="옵션설정">
				<span class="text">출발시간</span>
				<span class="arrow"></span>
			</a>
			<a href="#" id="info.subway.searchBox.dayBox" class="optionBox day" title="요일설정">
				<span class="text">평일</span>
				<span class="arrow"></span>
			</a>
			<a href="#" id="info.subway.searchBox.hourBox" class="optionBox hour" title="시간설정">
				<span class="text">시</span>
				<span class="arrow"></span>
			</a>
			<a href="#" id="info.subway.searchBox.minuteBox" class="optionBox minute" title="시간설정">
				<span class="text">분</span>
				<span class="arrow"></span>
			</a>
			<ul id="info.subway.searchBox.listBox" class="listBox"></ul>
		</div>
		<div class="submitBox">
			<span id="info.subway.searchBox.submit" class="go">검색</span>
		</div>
		<div class="resultBox HIDDEN" id='info.subway.searchBox.resultBox' >
						<strong class="tit_result">총 2건의 검색결과</strong>
						<a href="#none" class="endCheck"><span class="icon"></span>막차보기</a>
		</div>
	</div>
        <div id="info.subway.history" >
    </div>
	    <div id="info.subway.intro" class="Howto">
		<strong class="tit_intro">호선도 중요하지만,<br>시간이 더 중요하니까</strong>
		<p class="desc_intro">언제 출발해야 하는지부터<br>몇분에 도착할지까지, 한 눈에 확인하세요.</p>
    </div>
        <div id="info.subwayInfo" class="subwayInfo HIDDEN">
    	<div class="SubwayRouteResultView">
			<h3 class="screen_out">지하철 경로</h3>
            <p class="firstTrainInfo HIDDEN"></p>
    		<ul class="list"></ul>
    	</div>
	</div>
</div>
		<div id="info.my" class="FavoriteListView HIDDEN">
    <h2 class="screen_out">MY</h2>
    <div data-id="tab" class="FavoriteMethodType HIDDEN">
        <ul>
            <li id="my.subtab.favorite" class="ACTIVE"><a href="#none">즐겨찾기</a></li>
            <li id="my.subtab.static" class="INACTIVE"><a href="#none">내 장소</a></li>
            <li id="my.subtab.review" class="INACTIVE"><a href="#none">후기</a></li>
        </ul>
    </div>

    <div class="favorite_interlock HIDDEN">
        <div id="my.favorite" class="favorite_result">
            <h3 class="screen_out">즐겨찾기</h3>
            <div class="favorite_directory">
                <div data-id="header"></div>
                <div data-id="list" class="FavoriteBodyList">
                    <div data-id="banner" class="FavoriteBookmarkLink HIDDEN">
                        <a href="#none" class="link_bookmark" data-id="bannerContent"></a>
                        <button data-id="bannerClose" type="button" class="ico_mypage bt_close">닫기</button>
                    </div>
                    <div class="box_notice HIDDEN" data-id="boxNotice"><span class="ico_mypage ico_noti"></span>즐겨찾기는 500개까지 추가할 수 있습니다.</div>
                    <ul class="list_detail"></ul>
                    <div id="info.my.favorite.page" data-id="pagination" class="pages HIDDEN">
                        <div class="pageWrap">
                            <button type="button" id="info.my.favorite.page.prev" class="prev disabled">이전</button>
                            <a id="info.my.favorite.page.no1" class="INACTIVE" href="#">1</a>
                            <a id="info.my.favorite.page.no2" class="INACTIVE" href="#">2</a>
                            <a id="info.my.favorite.page.no3" class="INACTIVE" href="#">3</a>
                            <a id="info.my.favorite.page.no4" class="INACTIVE" href="#">4</a>
                            <a id="info.my.favorite.page.no5" class="INACTIVE" href="#">5</a>
                            <button type="button" id="info.my.favorite.page.next" class="next">다음</button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div id="my.static" class="favorite_homecorp HIDDEN">
            <h3 class="screen_out">집회사</h3>
            <ul data-id="staticList"></ul>
            <div class="group_tit">
                <h3 class="tit_myplace">자주 가는 장소</h3><span class="info_count"> ( <span class="num_count" data-id="spotTotalCount"></span> / <span class="num_total">5</span> ) </span>
            </div>
            <ul data-id="spotList"></ul>
        </div>

        <div id="my.review" class="favorite_evaluation">
            <h3 class="screen_out">후기</h3>
            <div data-id="reviewHeader">
                <div data-id="reviewEmptyPage" class="FavoriteEmptyPage HIDDEN">
                    <p class="desc_empty">후기가 없습니다.</p>
                </div>
                <div data-id="filteredReviewEmptyPage" class="FavoriteEmptyPage empty_type2 HIDDEN">
                    <p class="desc_empty">후기가 없습니다.</p>
                    <p class="desc_sub"> 적용한 필터에 해당하는 후기가 없습니다.<br>필터 조건을 변경해 주세요. </p>
                </div>
                <div data-id="reviewFilters" class="info_result">
                                    </div>
            </div>
            <div data-id="reviewList" class="FavoriteBodyList">
                <ul></ul>
            </div>
            <div id="my.review.page" class="pages HIDDEN">
                <div class="pageWrap">
                    <button type="button" id="my.review.page.prev" class="prev disabled">이전</button>
                    <a id="my.review.page.no1" class="ACTIVE" href="#">1</a>
                    <a id="my.review.page.no2" class="INACTIVE" href="#">2</a>
                    <a id="my.review.page.no3" class="INACTIVE" href="#">3</a>
                    <a id="my.review.page.no4" class="INACTIVE" href="#">4</a>
                    <a id="my.review.page.no5" class="INACTIVE" href="#">5</a>
                    <button type="button" id="my.review.page.next" class="next">다음</button>
                </div>
            </div>
        </div>
    </div>
    <div id="info.my.intro" class="Howto HIDDEN">
        <strong class="tit_intro">자주 가는 장소는<br>등록해서 사용해요</strong>
        <p class="desc_intro">집이나 회사 등 자주 가는 장소는 즐겨찾기로 등록하여<br>언제 어디서나 쉽고 빠르게 확인하세요.</p>
        <a href="#none" class="link_my"> 시작하기</a>
    </div>
</div>

		<div id="info.issue" class="section" style="display:none">
			<div id="info.issue.place">
				<h5>폭우 피해지도 <span id="info.issue.place.issueCnt"></span>건</h5>
				<ul id="info.issue.place.list"></ul>
				<a id="info.issue.place.more" class="more" href="#">장소 더보기(<strong id="info.issue.place.more.count">0</strong>)</a>
			</div>
		</div>
	</div>
                <div id="info.ads" class="bnr_ad HIDDEN">
            <span class="bar_top"></span>
                            <a id="info.ad1" href="http://m.map.kakao.com/scheme/search?q=사전투표소" target="_blank"  class="link_bnr HIDDEN" tag="ad109">
                    <img width="390" src="https://t1.daumcdn.net/localimg/appbanner/투표독려캠페인_PC배너_240326.png" class="img_bnr" alt=""/>
                </a>
                        <div id="info.adButtons" class="localadSelect HIDDEN">
                                    <a id="info.adButton1" class="ad-INACTIVE" href="#"></a>
                            </div>
            <span class="bar_bottom"></span>
        </div>
    
    <div id="info.notice" class="notice">
        <h2 class="screen_out">공지사항</h2>
        <div class="noticeList">
            <ul>
                                    <li id="info.main.notice.text1">
                        <span class="ico_notice">공지</span>
                        <a href="https://mystore.kakao.com/" target="_blank">매장관리 PC 버전 오픈 안내</a>
                    </li>
                                    <li id="info.main.notice.text2">
                        <span class="ico_notice ico_guide">안내</span>
                        <a href=" https://kakaomap.tistory.com/372" target="_blank">스카이뷰 영상 업데이트</a>
                    </li>
                                    <li id="info.main.notice.text3">
                        <span class="ico_notice">공지</span>
                        <a href="https://kakaomap.tistory.com/371" target="_blank">WEB지도의 스타일이 개선됩니다.</a>
                    </li>
                            </ul>
            <a id="info.main.notice.more" href="http://kakaomap.tistory.com" target="_blank" class="link_more">더보기</a>
        </div>
    </div>
        <div id="info.my.footer" class="FavoriteFunctionToolBar HIDDEN"></div>

	<div id="info.footer" class="footer"></div>
	<div id="footer" class="Footer">
    <a class="xa" target="_blank" href="https://cs.kakao.com/helps?locale=ko&service=101">고객센터</a>
    <a class="xc" href="#none" data-pos="footer" data-channel="SEARCH_BOTTOM_NEWPLACE">신규 장소 등록</a>
    <a target="_blank" href="https://www.kakao.com/policy/privacy?type=p&lang=ko"><strong>개인정보처리방침</strong></a>
</div>
</div>

<script type="text/javascript">try {
document.getElementById('info.body').style.height =
	document.documentElement.clientHeight - 121 + 'px';
} catch(e) {}
</script>

<div id="shadow" class="Shadow">
	<div class="bar"></div>
	<span id="shadow.toggle" class="toggle"></span>
</div>

<div id="view" class="View">
    <h2 class="screen_out">지도 영역</h2>
    <a href="#info.main" class="screen_out">이번 영역은 지도부분입니다. 스크린 리더 사용자분께서는 현재 링크를 눌러주시면 본문 영역으로 넘어가실 수 있습니다</a>
    <div id="minimapEdge" class="HIDDEN guide_map" style="border-radius: 0px 2px 0px 0px;"></div>
    <div id="view.map" class="map map-skyview">
        <div id="localInfo" class="LocalInfo HIDDEN">
            <div id="localInfo.map" class="localinfomap">
                <h3 class="screen_out">접속지역</h3>
                <div class="province">
                    <a id="localInfo.map.province" href="#" class="selectBox"></a>
                </div>
                <div class="county">
                    <a id="localInfo.map.county" href="#" class="selectBox"></a>
                </div>
                <div class="town">
                    <a id="localInfo.map.town" href="#" class="selectBox"></a>
                </div>
                <span class="txt_bar"></span>
                <div id="localInfo.map.weather" class="tempInfo">
                    <div class="center">
                                                <img id="localInfo.map.weatherIcon" class="weatherImg HIDDEN" alt=""
                             src="//t1.daumcdn.net/mapjsapi/images/transparent.gif"/>
                        <div class="temper"></div>
                    </div>
                </div>
            </div>
        </div>
        <div id="localInfoList" class="LocalInfoList">
            <div id="localInfoList.province" class="box HIDDEN">
                <ul id="localInfoList.province.list" class="province"></ul>
            </div>
            <div id="localInfoList.county" class="box HIDDEN">
                <ul id="localInfoList.county.list" class="county"></ul>
            </div>
            <div id="localInfoList.town" class="box HIDDEN">
                <ul id="localInfoList.town.list" class="town"></ul>
            </div>
        </div>

        <div id="mapTypeControlHolder" class="MapTypeControlHolder"></div>
        <div class="viewbuttons">
            <a data-id="roadview" class="rv" href="#"><span class="coach_rv">로드뷰</span></a>
            <div data-id="layer" class="lv">
                <a href="#" class="lv-accessibility"><span class="coach_tv">지도설정</span></a>
                <div data-id="layerMenu" class="layerMenu">
                    <strong>지도설정</strong>
                    <ul class="list_map_setting">
                        <li data-index="0"><a href="#" class="traffic"><i></i>교통정보</a></li>
                        <li data-index="1"><a href="#" class="cctv"><i></i>CCTV</a></li>
                        <li data-index="2"><a href="#" class="accident"><i></i>사고·공사</a></li>
                        <li><a href="#" class="bike"><i></i>자전거</a></li>
                        <li><a href="#" class="terrain"><i></i>지형도</a></li>
                        <li><a href="#" class="usedistrict"><i></i>지적편집도</a></li>
                        <li><a href="#" class="bboundary"><i></i>법정경계</a></li>
                        <li><a href="#" class="hboundary"><i></i>행정경계</a></li>
                    </ul>
                    <strong>대기설정</strong>
                                        <ul class="list_weather">
                        <li data-type="wea"><a href="#">기온</a></li>
                        <li data-type="khai"><a href="#">통합대기</a></li>
                        <li data-type="pm10"><a href="#">미세먼지</a></li>
                        <li data-type="pm25"><a href="#">초미세먼지</a></li>
                        <li data-type="ysand"><a href="#">황사</a></li>
                        <li data-type="o3"><a href="#">오존</a></li>
                        <li data-type="no2"><a href="#">이산화질소</a></li>
                        <li data-type="co"><a href="#">일산화탄소</a></li>
                        <li data-type="so2"><a href="#">아황산가스</a></li>
                    </ul>
                </div>
            </div>
        </div>


        <div id="tool" class="Tool">
    <h3 id="tool.map.btn" class="tit_tool"><a href="#none" class="btn_tool">내보내기</a></h3>
    <div id="toolList" class="layer_tool">
        <a href="#" id="tool.map.print" class="print">인쇄하기</a>
        <a href="#" id="tool.map.save" class="save">이미지 저장하기</a>
        <a href="#" id="tool.map.copyurl" class="link">URL 복사</a>
        <a href="#" id="tool.map.copymap" class="html">HTML 태그 복사</a>
        <a href="#" id="tool.map.email" class="mail">메일로 공유</a>
    </div>
</div>

<form name="subway_scrap_form" method="post" action="./subway/subwayLinemapLink" target="_self">
	<input type="hidden" name="cityCode" value="" />
	<input type="hidden" name="STARTNAME" value="" />
	<input type="hidden" name="ENDNAME" value=""/>
	<input type="hidden" name="STARTID" value=""/>
	<input type="hidden" name="ENDID" value=""/>
</form>

<form name="subway_print_form" method="post" action=".subway/subwayLinemapPrint" target="_self">
	<input type="hidden" name="cityCode" value="" />
	<input type="hidden" name="STARTID" value=""/>
	<input type="hidden" name="ENDID" value="" />
	<input type="hidden" name="jsonData" value="" />
    <input type="hidden" name="routeMapImageData" value="">
</form>

<form id="scrap_form" name="scrap_form" method="post" action="./etc/scrap.jsp" target="_self">
	<input type="hidden" name="x" value="" />
	<input type="hidden" name="y" value="" />
	<input type="hidden" name="scale" value="" />
	<input type="hidden" name="baseUrl" value="" />
</form>

                <div id="miniZoomControl" class="MiniZoomControl MiniZoomControl_type2 HIDDEN">
            <div class="wrap_zoom">
                <a href="#none" id="miniZoomControl.zoomin" class="zoomin"><span class="ico_roadview2 ico_zoom">확대</span></a>                 <a href="#none" id="miniZoomControl.zoomout" class="zoomout"><span class="ico_roadview2 ico_zoom">축소</span></a>             </div>
        </div>
                        <div id='view.mapContainer' class="cont_map" >
            <div id="view.deco.frame" class="frame">                <div id="view.deco.drag" class="drag HIDDEN"><span class="ico_roadview2 ico_drag"></span></div>            </div>
        </div>
        <div id="view.deco" class="FrameDecorator FrameDecorator_type2 HIDDEN">            <button type="button" id="view.deco.toggle" class="toggle"><span class="ico_toggle">미니맵 노출</span></button>
        </div>
            </div>

    <div id="view.roadview" class="roadview">
    </div>
    <div id="view.subway" class="subway">

		<div id="localInfo.subway.searchBox" class="localinfosubway">
						<div class="subwayRegion">
				<strong class="screen_out">지역 지하철 선택상자</strong>
				<em class="screen_out">선택내용 :</em>
				<span class="box_selected"><a href="#none" class="btn_selected" id='localInfo.subway.searchBox.regionBtn' >수도권</a></span>
				<em class="screen_out">선택옵션</em>
				<ul id="localInfo.subway.searchBox.region" class="list_opt HIDDEN">
				</ul>
			</div>
			<div class="subwayExpress"><a href="#">급행</a></div>
					</div>


		<div id="subway.tool" class="Tool">
			<h3 class="tit_tool"><a href="#none" class="btn_tool" id="subwayExportBtn" >내보내기</a></h3>
			<div class="layer_tool" id='subwayExportMenu' >
				<a href="#" id="subway.tool.map.print" class="print">인쇄하기</a>
				<a href="#" id="subway.tool.map.save" class="save">이미지 저장하기</a>
				<a href="#" id="subway.tool.map.copyurl" class="copyUrl"><span class="screen_out">노선</span> URL 복사</a>
				<a href="#" id="subway.tool.map.copymap" class="copyMap"><span class="screen_out">노선도</span><span class="map">지도 </span>HTML 태그 복사</a>
							</div>
		</div>



        <div id="view.subway.route" class="subwayRouteView">
                        <div class="subway-container">
                <div class="subway-canvas-container"></div>
                <div class="subway-info-container">
                                        <div class="subway-info-pin subway-info-pin-departure hide" id="subwayDeparturePin">
                        <span class="screen_out">출발역 포인터</span>
                        <span class="subway-info-pin-controller">
                            <a href="javascript:;" class="subway-info-pin-close">
                                <span class="screen_out">경로 지우기</span>
                            </a>
                            <span class="subway-info-pin-tooltip">끌어서 출발지 변경</span>
                        </span>
                    </div>
                                        <div class="subway-info-pin subway-info-pin-arrival hide" id="subwayArrivalPin">
                        <span class="screen_out">도착역 포인터</span>
                        <span class="subway-info-pin-controller">
                            <a href="javascript:;" class="subway-info-pin-close">
                                <span class="screen_out">경로 지우기</span>
                            </a>
                            <span class="subway-info-pin-tooltip">끌어서 도착지 변경</span>
                        </span>
                    </div>
                </div>
            </div>
                    </div>


        <div id="subwayLegend" class="SubwayLegend">
			<div class='slide'>
				<div class='list' id='subwayLegend.slide.list' >
				</div>
				<button type="button" class="btn_slide prev">이전</button>
				<button type="button" class="btn_slide next">다음</button>
			</div>
        </div>

        <div id="subwayLegend.zoom" class="subwayLegendZoom zoom_1">
            <a href="#" id="subwayLegend.zoom.in" class="zoomin">노선도확대</a>
            <a href="#" id="subwayLegend.zoom.out" class="zoomout">노선도축소</a>
        </div>
    </div>


    
    <img id="failflash" alt="일시적 장애로 인해 로드뷰를 확인할 수 없습니다." class="failflash HIDDEN" usemap="#failFlashMap" src="//t1.daumcdn.net/mapjsapi/images/transparent.gif" />

    <map name="failFlashMap">
        <area id="failFlashMap.close" alt="닫기" shape="rect" coords="270, 5, 292, 20" href="#" >
        <area id="failFlashMap.mapview" alt="지도보기" shape="rect" coords="108, 130, 190, 158" href="#" >
    </map>
</div>

<ul id="regionList" class="RegionList"></ul>

<div id="shareUrl" class="ShareUrl HIDDEN"></div>

<div id="dimmedLayer" class="DimmedLayer HIDDEN"></div>

<div id="homeRegInfo" class="HomeRegInfo HIDDEN"></div>

<div id="validPlaceInfo" class="ValidPlaceInfo HIDDEN">
	<a id="ValidPlaceInfo.closeNDelete" class="closeNDelete"></a>
</div>

<div class="moreGroupview HIDDEN" id="moreGroupview">자세히 보기</div>

<div id="roadviewInfoBoxQuickhelp" class="RoadviewInfoBox-quickhelp HIDDEN"></div>

<div id="titleSystemTooltip" class="titleSystemTooltip HIDDEN"></div>

<script type="text/javascript" src="//t1.daumcdn.net/kakaomapweb/cssjs/sentry.min.5.27.4.js" crossorigin="anonymous"></script>
<script type="text/javascript" src="//t1.daumcdn.net/cssjs/JSON-js/fc535e9cc8/json2.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/tiara/js/v1/tiara.min.js"></script>

<!--[if gt IE 8]><!-->
<script type="text/javascript" src="//t1.daumcdn.net/cssjs/mapweb/1500538479259/Chart.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/kakaomapweb/cssjs/hls-0.12.4.min.js"></script>
<!--<![endif]-->

<script type="text/javascript" src="//mk.kakaocdn.net/dn/platformfe/agent/v2_2_0/agent.js"></script>

<script type="text/javascript" src="//t1.daumcdn.net/daumtop_deco/socialshare/socialshare_pc-2.5.1.js"></script>

<script type="text/javascript" src="//t1.daumcdn.net/kakaomapweb/resource/require-2.1.0.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/cssjs/jquery/jquery-1.8.1.min.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/cssjs/jquery/plugin/jquery.cookie-1.0.0.min.js"></script>
<script type="text/javascript" src="https://ssl.daumcdn.net/dmaps/map_js_init/v3.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/js/libs/congnamul.js"></script>
<script type="text/javascript" src="./iptargeting/location"></script>

<script>
var envDsn = 'https://' + '9f8781b9c86f4e7bbfae4bce5e29cfcc' + '@aem-kakao-collector.onkakao.net/' + '5640';

try {
    Sentry.init({
        dsn: envDsn,
        environment: 'PROD'
    });

    Sentry.setTag("ua.platform", window._platform);
} catch (e) {}
</script>
<script type="text/javascript">
    // 기본값: 서울시청
    window.t_mapx = window.t_mapx || '';
    window.t_mapy = window.t_mapy || '';
    window.t_address = window.t_address || '';
    window.t_regionid = window.t_regionid;
    window.ENV = 'PROD';
    window.isFlashEnv = false;

    try{
        // 뉴티아라 초기화
        window.TiaraTracker && TiaraTracker.getInstance().init({
            svcDomain: window.location.host.indexOf('map.kakao.com') == 0 ? 'map.kakao.com' : 'map.devel.kakao.com',
            deployment: window.ENV === 'PROD' ? 'production' : 'dev'
        });
    } catch(e) {}
</script>




    <script>
        // 캔버스 지하철 노선도 초기화
        window.kakaosubway = { activeArea: null };
    </script>
            <script type="text/javascript" src="https://t1.daumcdn.net/mapjsapi/bundle/prod/panorama.js"></script>
    
            <script type="text/javascript" src="https://t1.daumcdn.net/kakaomapweb/subway/linemap/canvas/prod/subway.bundle.js"></script>
    

    <script type="text/javascript" charset="UTF-8" src="https://t1.daumcdn.net/kas/static/na.min.js"></script>

    <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/kakaomapweb/map/202403291400974/app.js"></script>

<script type="text/javascript">
		

jQuery.noConflict();
require.config({baseUrl:'js/app',deps:['main'],config:{main:{
params:{"nil_profile":"title","nil_src":"local"}||{},
options:{
    isLogin:1,
    isMapUser: 0 , // isMapUser: 'Y'|'N'|'ERROR'
    needAgreements: 0,
    unifiedAgreements: [{"type":"SERVICE_TERM","yn":"Y"},{"type":"LOCATION","yn":"Y"}],
    loginUrl:"https://accounts.kakao.com/login?continue=",
    logoutUrl:"https://accounts.kakao.com/logout?continue=",
	notices:[ ],
	hcodeList:[{id:"11",name:"서울"},{id:"26",name:"부산"},{id:"27",name:"대구"},{id:"28",name:"인천"},{id:"29",name:"광주"},{id:"30",name:"대전"},{id:"31",name:"울산"},{id:"36",name:"세종"},{id:"41",name:"경기"},{id:"43",name:"충북"},{id:"44",name:"충남"},{id:"46",name:"전남"},{id:"47",name:"경북"},{id:"48",name:"경남"},{id:"50",name:"제주"},{id:"51",name:"강원"},{id:"52",name:"전북"},{id:"11680",name:"강남구"},{id:"11740",name:"강동구"},{id:"11305",name:"강북구"},{id:"11500",name:"강서구"},{id:"11620",name:"관악구"},{id:"11215",name:"광진구"},{id:"11530",name:"구로구"},{id:"11545",name:"금천구"},{id:"11350",name:"노원구"},{id:"11320",name:"도봉구"},{id:"11230",name:"동대문구"},{id:"11590",name:"동작구"},{id:"11440",name:"마포구"},{id:"11410",name:"서대문구"},{id:"11650",name:"서초구"},{id:"11200",name:"성동구"},{id:"11290",name:"성북구"},{id:"11710",name:"송파구"},{id:"11470",name:"양천구"},{id:"11560",name:"영등포구"},{id:"11170",name:"용산구"},{id:"11380",name:"은평구"},{id:"11110",name:"종로구"},{id:"11140",name:"중구"},{id:"11260",name:"중랑구"},{id:"26440",name:"강서구"},{id:"26410",name:"금정구"},{id:"26710",name:"기장군"},{id:"26290",name:"남구"},{id:"26170",name:"동구"},{id:"26260",name:"동래구"},{id:"26230",name:"부산진구"},{id:"26320",name:"북구"},{id:"26530",name:"사상구"},{id:"26380",name:"사하구"},{id:"26140",name:"서구"},{id:"26500",name:"수영구"},{id:"26470",name:"연제구"},{id:"26200",name:"영도구"},{id:"26110",name:"중구"},{id:"26350",name:"해운대구"},{id:"27720",name:"군위군"},{id:"27200",name:"남구"},{id:"27290",name:"달서구"},{id:"27710",name:"달성군"},{id:"27140",name:"동구"},{id:"27230",name:"북구"},{id:"27170",name:"서구"},{id:"27260",name:"수성구"},{id:"27110",name:"중구"},{id:"28710",name:"강화군"},{id:"28245",name:"계양구"},{id:"28200",name:"남동구"},{id:"28140",name:"동구"},{id:"28177",name:"미추홀구"},{id:"28237",name:"부평구"},{id:"28260",name:"서구"},{id:"28185",name:"연수구"},{id:"28720",name:"옹진군"},{id:"28110",name:"중구"},{id:"29200",name:"광산구"},{id:"29155",name:"남구"},{id:"29110",name:"동구"},{id:"29170",name:"북구"},{id:"29140",name:"서구"},{id:"30230",name:"대덕구"},{id:"30110",name:"동구"},{id:"30170",name:"서구"},{id:"30200",name:"유성구"},{id:"30140",name:"중구"},{id:"31140",name:"남구"},{id:"31170",name:"동구"},{id:"31200",name:"북구"},{id:"31710",name:"울주군"},{id:"31110",name:"중구"},{id:"36110",name:""},{id:"41820",name:"가평군"},{id:"41280",name:"고양시"},{id:"41281",name:"고양시 덕양구"},{id:"41285",name:"고양시 일산동구"},{id:"41287",name:"고양시 일산서구"},{id:"41290",name:"과천시"},{id:"41210",name:"광명시"},{id:"41610",name:"광주시"},{id:"41310",name:"구리시"},{id:"41410",name:"군포시"},{id:"41570",name:"김포시"},{id:"41360",name:"남양주시"},{id:"41250",name:"동두천시"},{id:"41190",name:"부천시"},{id:"41194",name:"부천시 소사구"},{id:"41196",name:"부천시 오정구"},{id:"41192",name:"부천시 원미구"},{id:"41130",name:"성남시"},{id:"41135",name:"성남시 분당구"},{id:"41131",name:"성남시 수정구"},{id:"41133",name:"성남시 중원구"},{id:"41110",name:"수원시"},{id:"41113",name:"수원시 권선구"},{id:"41117",name:"수원시 영통구"},{id:"41111",name:"수원시 장안구"},{id:"41115",name:"수원시 팔달구"},{id:"41390",name:"시흥시"},{id:"41270",name:"안산시"},{id:"41273",name:"안산시 단원구"},{id:"41271",name:"안산시 상록구"},{id:"41550",name:"안성시"},{id:"41170",name:"안양시"},{id:"41173",name:"안양시 동안구"},{id:"41171",name:"안양시 만안구"},{id:"41630",name:"양주시"},{id:"41830",name:"양평군"},{id:"41670",name:"여주시"},{id:"41800",name:"연천군"},{id:"41370",name:"오산시"},{id:"41460",name:"용인시"},{id:"41463",name:"용인시 기흥구"},{id:"41465",name:"용인시 수지구"},{id:"41461",name:"용인시 처인구"},{id:"41430",name:"의왕시"},{id:"41150",name:"의정부시"},{id:"41500",name:"이천시"},{id:"41480",name:"파주시"},{id:"41220",name:"평택시"},{id:"41650",name:"포천시"},{id:"41450",name:"하남시"},{id:"41590",name:"화성시"},{id:"43760",name:"괴산군"},{id:"43800",name:"단양군"},{id:"43720",name:"보은군"},{id:"43740",name:"영동군"},{id:"43730",name:"옥천군"},{id:"43770",name:"음성군"},{id:"43150",name:"제천시"},{id:"43745",name:"증평군"},{id:"43750",name:"진천군"},{id:"43110",name:"청주시"},{id:"43111",name:"청주시 상당구"},{id:"43112",name:"청주시 서원구"},{id:"43114",name:"청주시 청원구"},{id:"43113",name:"청주시 흥덕구"},{id:"43130",name:"충주시"},{id:"44250",name:"계룡시"},{id:"44150",name:"공주시"},{id:"44710",name:"금산군"},{id:"44230",name:"논산시"},{id:"44270",name:"당진시"},{id:"44180",name:"보령시"},{id:"44760",name:"부여군"},{id:"44210",name:"서산시"},{id:"44770",name:"서천군"},{id:"44200",name:"아산시"},{id:"44810",name:"예산군"},{id:"44130",name:"천안시"},{id:"44131",name:"천안시 동남구"},{id:"44133",name:"천안시 서북구"},{id:"44790",name:"청양군"},{id:"44825",name:"태안군"},{id:"44800",name:"홍성군"},{id:"46810",name:"강진군"},{id:"46770",name:"고흥군"},{id:"46720",name:"곡성군"},{id:"46230",name:"광양시"},{id:"46730",name:"구례군"},{id:"46170",name:"나주시"},{id:"46710",name:"담양군"},{id:"46110",name:"목포시"},{id:"46840",name:"무안군"},{id:"46780",name:"보성군"},{id:"46150",name:"순천시"},{id:"46910",name:"신안군"},{id:"46130",name:"여수시"},{id:"46870",name:"영광군"},{id:"46830",name:"영암군"},{id:"46890",name:"완도군"},{id:"46880",name:"장성군"},{id:"46800",name:"장흥군"},{id:"46900",name:"진도군"},{id:"46860",name:"함평군"},{id:"46820",name:"해남군"},{id:"46790",name:"화순군"},{id:"47290",name:"경산시"},{id:"47130",name:"경주시"},{id:"47830",name:"고령군"},{id:"47190",name:"구미시"},{id:"47150",name:"김천시"},{id:"47280",name:"문경시"},{id:"47920",name:"봉화군"},{id:"47250",name:"상주시"},{id:"47840",name:"성주군"},{id:"47170",name:"안동시"},{id:"47770",name:"영덕군"},{id:"47760",name:"영양군"},{id:"47210",name:"영주시"},{id:"47230",name:"영천시"},{id:"47900",name:"예천군"},{id:"47940",name:"울릉군"},{id:"47930",name:"울진군"},{id:"47730",name:"의성군"},{id:"47820",name:"청도군"},{id:"47750",name:"청송군"},{id:"47850",name:"칠곡군"},{id:"47110",name:"포항시"},{id:"47111",name:"포항시 남구"},{id:"47113",name:"포항시 북구"},{id:"48310",name:"거제시"},{id:"48880",name:"거창군"},{id:"48820",name:"고성군"},{id:"48250",name:"김해시"},{id:"48840",name:"남해군"},{id:"48270",name:"밀양시"},{id:"48240",name:"사천시"},{id:"48860",name:"산청군"},{id:"48330",name:"양산시"},{id:"48720",name:"의령군"},{id:"48170",name:"진주시"},{id:"48740",name:"창녕군"},{id:"48120",name:"창원시"},{id:"48125",name:"창원시 마산합포구"},{id:"48127",name:"창원시 마산회원구"},{id:"48123",name:"창원시 성산구"},{id:"48121",name:"창원시 의창구"},{id:"48129",name:"창원시 진해구"},{id:"48220",name:"통영시"},{id:"48850",name:"하동군"},{id:"48730",name:"함안군"},{id:"48870",name:"함양군"},{id:"48890",name:"합천군"},{id:"50130",name:"서귀포시"},{id:"50110",name:"제주시"},{id:"51150",name:"강릉시"},{id:"51820",name:"고성군"},{id:"51170",name:"동해시"},{id:"51230",name:"삼척시"},{id:"51210",name:"속초시"},{id:"51800",name:"양구군"},{id:"51830",name:"양양군"},{id:"51750",name:"영월군"},{id:"51130",name:"원주시"},{id:"51810",name:"인제군"},{id:"51770",name:"정선군"},{id:"51780",name:"철원군"},{id:"51110",name:"춘천시"},{id:"51190",name:"태백시"},{id:"51760",name:"평창군"},{id:"51720",name:"홍천군"},{id:"51790",name:"화천군"},{id:"51730",name:"횡성군"},{id:"52790",name:"고창군"},{id:"52130",name:"군산시"},{id:"52210",name:"김제시"},{id:"52190",name:"남원시"},{id:"52730",name:"무주군"},{id:"52800",name:"부안군"},{id:"52770",name:"순창군"},{id:"52710",name:"완주군"},{id:"52140",name:"익산시"},{id:"52750",name:"임실군"},{id:"52740",name:"장수군"},{id:"52110",name:"전주시"},{id:"52113",name:"전주시 덕진구"},{id:"52111",name:"전주시 완산구"},{id:"52180",name:"정읍시"},{id:"52720",name:"진안군"}],
	gasPrice: {avgGasPrice: 1648.7737, avgDieselPrice: 1540.858, avgLpgPrice: 969.9806,
			gasDate: "2024-04-03", dieselDate: "2024-04-03", lpgDate: "2024-04-03"},
	notice_popup : "N",  	event_notice : "N",  	event_notice2 : "N",  	rojaju_button : "Y"
}
}}});
</script>


</body>
</html>
