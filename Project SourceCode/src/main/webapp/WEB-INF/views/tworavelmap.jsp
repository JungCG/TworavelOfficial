<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/css/jck_main.css">
<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <meta charset="utf-8">
    <title>Tworavel Map</title>
    
    <style>


* {
   color: #333;
}
    #placesList li {list-style: none;}
* {
	outline:none;
	padding: 0;
	margin: 0;
	border: 0;
	border-collapse:collapse;
	box-sizing:border-box;
	text-decoration:none;
}
#menu_wrap{
margin-left: 20px;
}
html{
	height : 100%;
}

body{
	height : 100%;
}

.jck_wrap{
	min-height:100%;
	position : relative;
	padding-bottom : 200px;
}
header{
z-index: 97;
}
.map_wrap{
z-index: 988;
}
#menu_wrap .option button {
    margin-left: 5px;
    border: 1px solid #2196f3;
    background-color: #ffe4c400;
    border-radius: 10px;
    color: #009688;
    font-weight: bold;
    padding: 3px;
}


    .bg_white {background:#fff;}
.map_wrap, .map_wrap * {margin:0;padding:0;
font-size:12px;}
.map_wrap a, .map_wrap a:hover, .map_wrap a:active{color:#000;text-decoration: none;}
.map_wrap {position:relative;width:80%;height:1000px;}
#menu_wrap {border: 1px solid #009688;position:absolute;top:0;left:0;bottom:0;width:260px;margin:10px 0px 0px 4px;padding:5px;overflow-y:auto;background:rgba(255, 255, 255, 0.85);z-index: 1;font-size:12px;border-radius: 10px;}
.bg_white {background:#fff;}
#menu_wrap hr {display: block; height: 1px;border: 0; border-top: 3px solid #1e1e1e91;margin:3px 0;}
#menu_wrap .option{text-align: center;}
#menu_wrap .option p {margin:10px 0;}  
#menu_wrap .option button {margin-left:5px;}
#placesList li {list-style: none;}
#placesList .item {position:relative;border-bottom:1px solid #888;overflow: hidden;cursor: pointer;min-height: 65px;}
#placesList .item span {display: block;margin-top:4px;}
#placesList .item h5, #placesList .item .info {text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
#placesList .item .info{padding:10px 0 10px 55px;}
#placesList .info .gray {color:#8a8a8a;}
#placesList .info .jibun {padding-left:26px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_jibun.png) no-repeat;}
#placesList .info .tel {color:#009900;}
#placesList .item .markerbg {float:left;position:absolute;width:36px; height:37px;margin:10px 0 0 10px;background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png) no-repeat;}
#placesList .item .marker_1 {background-position: 0 -10px;}
#placesList .item .marker_2 {background-position: 0 -56px;}
#placesList .item .marker_3 {background-position: 0 -102px}
#placesList .item .marker_4 {background-position: 0 -148px;}
#placesList .item .marker_5 {background-position: 0 -194px;}
#placesList .item .marker_6 {background-position: 0 -240px;}
#placesList .item .marker_7 {background-position: 0 -286px;}
#placesList .item .marker_8 {background-position: 0 -332px;}
#placesList .item .marker_9 {background-position: 0 -378px;}
#placesList .item .marker_10 {background-position: 0 -423px;}
#placesList .item .marker_11 {background-position: 0 -470px;}
#placesList .item .marker_12 {background-position: 0 -516px;}
#placesList .item .marker_13 {background-position: 0 -562px;}
#placesList .item .marker_14 {background-position: 0 -608px;}
#placesList .item .marker_15 {background-position: 0 -654px;}
#pagination {margin:10px auto;text-align: center;}
#pagination a {display:inline-block;margin-right:10px;}
#pagination .on {font-weight: bold; cursor: default;color:#777;}#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category{left: 267px;border: 1px solid #009688; color:#009688}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;    width: 80px;}
#category li.own {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px; color:orange;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .bank {background-position: -10px 0;background:url(${pageContext.request.contextPath}/resources/images/2icon_metro.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .mart {background-position: -10px -36px;background:url(${pageContext.request.contextPath}/resources/images/2icon_map.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .pharmacy {background-position: -10px -72px;background:url(${pageContext.request.contextPath}/resources/images/2icon_sleeping.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .oil {background-position: -10px -108px;background:url(${pageContext.request.contextPath}/resources/images/2icon_bistro.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .cafe {background-position: -10px -144px;background:url(${pageContext.request.contextPath}/resources/images/2icon_coffee-cup.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li .store {background-position: -10px -180px;background:url(${pageContext.request.contextPath}/resources/images/2icon_party.png) no-repeat;background-size:27px;background-size: 50px;
    height: 50px;
    width: 50px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}
</style>
</head>
<body>
<div class="jck_wrap">
		<jsp:include page="header.jsp"/>
		<div style="display:flex;justify-content: center;margin-top: 10px;margin-bottom: 10px">
<div class="map_wrap">
    <div id="map" style="width:100%;height:100%;position:relative;overflow:hidden;"></div>

    <div id="menu_wrap" class="bg_white">
        <div class="option">
            <div>
                <form onsubmit="searchPlaces(); return false;">
                  <input type="text" value="" id="keyword" size="15" style="background:none;border-bottom: 1px solid #333" placeholder="검색어를 입력해주세요"> 
                    <button type="submit" id="btnb" style="font-weight:bold;color:#042b27; font-size : 14px;">검색하기</button> 
                </form>
            </div>
        </div>
        <hr>
        <ul id="placesList"></ul>
        <div id="pagination"></div>
    </div>
         <ul id="category">
        <li id="SW8" data-order="0" class="ctbt"> 
            <span class="category_bg bank"></span>
            지하철역
        </li>       
        <li id="AT4" data-order="1"  class="ctbt"> 
            <span class="category_bg mart"></span>
             관광명소
        </li>  
        <li id="AD5" data-order="2"  class="ctbt"> 
            <span class="category_bg pharmacy"></span>
            숙박업소
        </li>  
        <li id="Fd6" data-order="3"  class="ctbt">  
            <span class="category_bg oil"></span>
           음식점
        </li>  
        <li id="CE7" data-order="4"  class="ctbt"> 
            <span class="category_bg cafe"></span>
           카페
        </li>  
        <li id="CT1ff" data-order="51123"> 
            <span class="ca2323tegory_bg store"></span>
            행사
        </li>      
    </ul>
</div>
</div>
		<jsp:include page="footer.jsp"/>

	</div>
</body>
</html>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=bb74b1c432c6717d09c3677341bf1ead&libraries=services"></script>
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var markers = [];
var markers3 = [];
var marker3 =[];
var searchtext = "${searchtext}";
/* var content1 =[];
var title =[];
var position = []; */
/* var mapx =[];
var mapy=[]; */
var placeOverlay = new kakao.maps.CustomOverlay({zIndex:1}), 
contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
marker1s = [], // 마커를 담을 배열입니다
currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
var placeOverlay1 = new kakao.maps.CustomOverlay({zIndex:1}),
contentNode1 = document.createElement('div');
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  
// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 
// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  
var ps1 = new kakao.maps.services.Places(map); 
	


 	

 
// 마커를 생성하고 지도 위에 표시하고, 마커에 mouseover, mouseout, click 이벤트를 등록하는 함수입니다
function addMarker11(position,title,content, makerImage,address,tel) {
    var marker4 = new kakao.maps.Marker({
        map: map,
        position: position,
        title:title,
        content:content,
        image: makerImage,
        address:address,
        tel:tel
    });
    	
    
    	
    kakao.maps.event.addListener(marker4, 'click', function() {
        // 클릭된 마커가 없고, click 마커가 클릭된 마커가 아니면
        // 마커의 이미지를 클릭 이미지로 변경합니다
        			                displayPlaceInfo4(position,title,address,tel);
        // 클릭된 마커를 현재 클릭된 마커 객체로 설정합니다
    });
    

	marker4.setMap(map); 
	  markers3.push(marker4);
	return marker4;
}
	function displayPlaceInfo4 (position,title,address,tel) {
		var content = '<div class="placeinfo">' +
		                '   <p class="title" href="' + '" target="_blank" title="'+ '">' +title+ '</p>';   

		if (address!="0") {
		    content += '    <span title="' + title + '">' + title+ '</span>' +
		                '  <span class="jibun" title="' + title + '">(지번 : ' + address+ ')</span>';
		}  else {
		    content += '    <span title="' +title + '">' + title + '</span>';
		}                

		content += '    <span class="tel">' + tel + '</span>' + 
		            '</div>' + 
		            '<div class="after"></div>';

		contentNode.innerHTML = content;
		placeOverlay.setPosition(position);
		placeOverlay.setMap(map);  
		}
	$("#CT1ff").click(function(){
		$.ajax({
			 async:false,
		    type : "GET",
				url : "categoryList.do",
					dataType:"json",
			success : function(jsonSt) {
		    for(var i = 0; i<jsonSt.length;i++){
		    		content1='<div class="placeinfo">' +
		                '   <a class="title" href="'+'" target="_blank" title="'+'">' + jsonSt[i].title + '</a>';   
						if (jsonSt[i].title) {
							content1[i] += '    <span title="' + jsonSt[i].title + '">' + jsonSt[i].title + '</span>' +
						                '  <span class="jibun" title="' + jsonSt[i].title + '">(지번 : ' + jsonSt[i].address + ')</span>';
						}  else {
							content1[i] += '    <span title="' + jsonSt[i].title + '">' + jsonSt[i].title + '</span>';
						}                

						content1[i] += '    <span class="tel">' + jsonSt[i].tel + '</span>' + 
						            '</div>' + 
						            '<div class="after"></div>';
			 		    
					        //console.log(marker3[i].title);
					       // console.log(marker3[i].content);
		  var title= jsonSt[i].title;
		  var position= new kakao.maps.LatLng(jsonSt[i].mapy,jsonSt[i].mapx) // 마커를 표시할 위치
		   var mapx= jsonSt[i].mapx;
		   var mapy= jsonSt[i].mapy;
		   //console.log(jsonSt[i].address)
		   var address = jsonSt[i].address;
		   var tel = jsonSt[i].tel
	    var imageSize = new kakao.maps.Size(55,60);
		var imageSrc = "${pageContext.request.contextPath}/resources/images/2map_party_01.png"; 
	 var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize); 
	    addMarker11(position, title,content1,markerImage,address,tel);
		    }
				}
			}); 
		})
	/* 	for(var i = 0; i<title.length;i++){
		   var marker3s= new kakao.maps.Marker({
	        map: map, // 마커를 표시할 지도
	       position: new kakao.maps.LatLng(mapy[i],mapx[i]), // 마커를 표시할 위치
	        title: title[i], // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
	        image: markerImage // 마커 이미지 
	    }); 
		    marker3[i] = marker3s;
			marker3s.setMap(map); 
	 		//marker3.push(marker3s);
		//console.log(marker3[i].marker3s.title);
	} */
	    // 마커를 생성하고 지도위에 표시합니다

/* 
						  kakao.maps.event.addListener(marker3, 'click', function(mouseEvent) {
								alert("실행확인");
								console.log(marker3s.getTitle());
								console.log(marker3s.title)
								console.log(marker3s)
				            })
 */
/* 						  var content = '<div class="placeinfo">' +
			                '   <a class="title" href="' + jsonSt[i].title + '" target="_blank" title="' + jsonSt[i].title + '">' +jsonSt[i].title+ '</a>';   

			if (jsonSt[i].title) {
			    content += '    <span title="' + jsonSt[i].title + '">' + jsonSt[i].title + '</span>' +
			                '  <span class="jibun" title="' + jsonSt[i].title+ '">(지번 : ' +jsonSt[i].title + ')</span>';
			}  else {
			    content += '    <span title="' + jsonSt[i].title + '">' + jsonSt[i].title + '</span>';
			}                

			content += '    <span class="tel">' + jsonSt[i].title + '</span>' + 
			            '</div>' + 
			            '<div class="after"></div>';
			 		    
			            contentNode1.innerHTML = content;
						placeOverlay1.setPosition(new kakao.maps.LatLng(jsonSt[i].mapy, jsonSt[i].mapx));
						placeOverlay1.setMap(map);  
							placeOverlay1.setMap(map);   */
				
/* 	function displayPlaceInfo12 (place1) {
				var content = '<div class="placeinfo">' +
				                '   <a class="title" href="' + place1.place_url + '" target="_blank" title="' + place1.place_name + '">' + place1.place_name + '</a>';   

				if (place1.road_address_name) {
				    content += '    <span title="' + place1.road_address_name + '">' + place1.road_address_name + '</span>' +
				                '  <span class="jibun" title="' + place1.address_name + '">(지번 : ' + place1.address_name + ')</span>';
				}  else {
				    content += '    <span title="' + place1.address_name + '">' + place1.address_name + '</span>';
				}                

				content += '    <span class="tel">' + place1.phone + '</span>' + 
				            '</div>' + 
				            '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay.setPosition(new kakao.maps.LatLng(place1.y, place1.x));
				placeOverlay.setMap(map);  
				} */
				$(".ctbt").click(function(){
					for ( var i = 0; i < markers3.length; i++ ) {
					    markers3[i].setMap(null);
					}   					
				}) 
kakao.maps.event.addListener(map, 'idle', searchplaces1);

//커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';
//커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
//지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 kakao.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', kakao.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', kakao.maps.event.preventMap);
placeOverlay.setContent(contentNode);  

//각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();
function addEventHandle(target, type, callback) {
	if (target.addEventListener) {
	    target.addEventListener(type, callback);
	} else {
	    target.attachEvent('on' + type, callback);
	}
	}

	//카테고리 검색을 요청하는 함수입니다
	function searchplaces1() {
if (!currCategory) {
	return;
	}placeOverlay.setMap(null);
	// 지도에 표시되고 있는 마커를 제거합니다
	removemarker1();
	ps1.categorySearch(currCategory, places1SearchCB, {useMapBounds:true}); 
	}
	function places1SearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

		    // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
		    displayplaces1(data);
		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
		    // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

		} else if (status === kakao.maps.services.Status.ERROR) {
		    // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
		    
		}
		}function displayplaces1(places1) {

			// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
			// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
			var order = document.getElementById(currCategory).getAttribute('data-order');
/* 			if(order==4){
				$.ajax({
			 			type : "GET",
						url : "categoryList.do",
	         			dataType:"json",
						error : function(error) {
							console.log("error");
						},
						success : function(jsonSt) {
							for(var i = 0; i<jsonSt.length;i++){
							places1[i] = {};
						     places1[i].x =jsonSt[i].mapx;
						     places1[i].y =jsonSt[i].mapy;
						     places1[i].place_name =jsonSt[i].title;
					/* 		    var marker1 = new kakao.maps.Marker({
							        map: map, // 마커를 표시할 지도
							        position: position1, // 마커를 표시할 위치
							        title : jsonSt[i].title, // 마커의 타이틀, 마커에 마우스를 올리면 타이틀이 표시됩니다
							        image : markerImage // 마커 이미지 
							    }); */
							/*}
						}
					}); 
				
				console.log("ajax끝났을떄"+places1.length);
			}*/
			for ( var i=0; i<places1.length; i++ ) {
			        // 마커를 생성하고 지도에 표시합니다
			        var marker1 = addmarker1(new kakao.maps.LatLng(places1[i].y, places1[i].x), order);

			        // 마커와 검색결과 항목을 클릭 했을 때
			        // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
			        (function(marker1, places1) {
			            kakao.maps.event.addListener(marker1, 'click', function() {
			                displayPlaceInfo(places1);
			            });
			        })(marker1, places1[i]);
			}
			}
		
		
		
		
		
		
		
		function addmarker1(position, order) {
				var imageSize1 = new kakao.maps.Size(100, 100); 
				var imageSrc = "${pageContext.request.contextPath}/resources/images/placeholder.png"; 
				if(order==0){
					imageSrc = "${pageContext.request.contextPath}/resources/images/2map_metro_01.png";
					
				}
				if(order==1){
					imageSrc = "${pageContext.request.contextPath}/resources/images/2map_map_01.png";
					
				}
				if(order==2){
					imageSrc = "${pageContext.request.contextPath}/resources/images/2map_sleeping_01.png";
					
				}
				if(order==3){
					imageSrc = "${pageContext.request.contextPath}/resources/images/2map_bistro_01.png";
					
				}
				if(order==4){
					imageSrc = "${pageContext.request.contextPath}/resources/images/2map_coffee-cup_01.png";
					
				}
				    var markerImage1 = new kakao.maps.MarkerImage(imageSrc, imageSize1); 
				imageSize = new kakao.maps.Size(55, 60),  // 마커 이미지의 크기
		/* 	    imgOptions =  {
			        spriteSize : new kakao.maps.Size(72, 208), // 스프라이트 이미지의 크기
			        spriteOrigin : new kakao.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			        offset: new kakao.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
			    }, */
			    marker1Image = new kakao.maps.MarkerImage(imageSrc, imageSize),
			        marker1 = new kakao.maps.Marker({
			        position: position, // 마커의 위치
			        image: marker1Image 
			    });

			marker1.setMap(map); // 지도 위에 마커를 표출합니다
			marker1s.push(marker1);  // 배열에 생성된 마커를 추가합니다

			return marker1;
			}function removemarker1() {
				for ( var i = 0; i < marker1s.length; i++ ) {
				    marker1s[i].setMap(null);
				}   
				marker1s = [];
				}
			function displayPlaceInfo (place1) {
				var content = '<div class="placeinfo">' +
				                '   <a class="title" href="' + place1.place_url + '" target="_blank" title="' + place1.place_name + '">' + place1.place_name + '</a>';   

				if (place1.road_address_name) {
				    content += '    <span title="' + place1.road_address_name + '">' + place1.road_address_name + '</span>' +
				                '  <span class="jibun" title="' + place1.address_name + '">(지번 : ' + place1.address_name + ')</span>';
				}  else {
				    content += '    <span title="' + place1.address_name + '">' + place1.address_name + '</span>';
				}                

				content += '    <span class="tel">' + place1.phone + '</span>' + 
				            '</div>' + 
				            '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay.setPosition(new kakao.maps.LatLng(place1.y, place1.x));
				placeOverlay.setMap(map);  
				}
			function addCategoryClickEvent() {
				var category = document.getElementById('category'),
				    children = category.children;

				for (var i=0; i<children.length; i++) {
				    children[i].onclick = onClickCategory;
				}
				}function onClickCategory() {
					var id = this.id,
				    className = this.className;

				placeOverlay.setMap(null);

				if (className === 'ond') {
				    currCategory = '';
				    changeCategoryClass();
				    removemarker1();
				} else {
				    currCategory = id;
				    changeCategoryClass(this);
				    searchplaces1();
				}
				}function changeCategoryClass(el) {
					var category = document.getElementById('category'),
				    children = category.children,
				    i;

				for ( i=0; i<children.length; i++ ) {
				    children[i].className = '';
				}

				if (el) {
				    el.className = 'own';
				} 
				}
// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});

// 키워드로 장소를 검색합니다
var keyword = document.getElementById('keyword').value;

if(keyword!=""){
	
	searchPlaces();
}
if("${keyword}"!=null){
	searchPlaces4();
}
// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {

 
  var keyword = document.getElementById('keyword').value;
 	
 	if(searchtext!=""){
    	ps.keywordSearch(searchtext, placesSearchCB);
    	searchtext =""
 	}
 	else{
    ps.keywordSearch( keyword, placesSearchCB); 
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
 	}	


    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
}
function searchPlaces4() {
	  var keyword = document.getElementById('keyword').value;
	 	if(searchtext!=""){
	    	ps.keywordSearch(searchtext, placesSearchCB);
	    	searchtext =""
	 	}
	 	else{
	    ps.keywordSearch( keyword, placesSearchCB); 
	 	}	
	    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
	}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === kakao.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면
        // 검색 목록과 마커를 표출합니다
        displayPlaces(data);

        // 페이지 번호를 표출합니다
        displayPagination(pagination);

    } else if (status === kakao.maps.services.Status.ZERO_RESULT) {

        alert('검색 결과가 존재하지 않습니다.');
        return;

    } else if (status === kakao.maps.services.Status.ERROR) {

        alert('검색 결과 중 오류가 발생했습니다.');
        return;

    }
}
// 검색 결과 목록과 마커를 표출하는 함수입니다
function displayPlaces(places) {

    var listEl = document.getElementById('placesList'), 
    menuEl = document.getElementById('menu_wrap'),
    fragment = document.createDocumentFragment(), 
    bounds = new kakao.maps.LatLngBounds(), 
    listStr = '';
    
    // 검색 결과 목록에 추가된 항목들을 제거합니다
    removeAllChildNods(listEl);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    for ( var i=0; i<places.length; i++ ) {

        // 마커를 생성하고 지도에 표시합니다
        var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x),
            marker = addMarker(placePosition, i), 
            itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

        // 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
        // LatLngBounds 객체에 좌표를 추가합니다
        bounds.extend(placePosition);

        // 마커와 검색결과 항목에 mouseover 했을때
        // 해당 장소에 인포윈도우에 장소명을 표시합니다
        // mouseout 했을 때는 인포윈도우를 닫습니다
        (function(marker, title) {
            kakao.maps.event.addListener(marker, 'mouseover', function() {
                displayInfowindow(marker, title);
            });

            kakao.maps.event.addListener(marker, 'mouseout', function() {
                infowindow.close();
            });

            itemEl.onmouseover =  function () {
                displayInfowindow(marker, title);
            };

            itemEl.onmouseout =  function () {
                infowindow.close();
            };
        })(marker, places[i].place_name);

        fragment.appendChild(itemEl);
    }

    // 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
    listEl.appendChild(fragment);
    menuEl.scrollTop = 0;

    // 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
    map.setBounds(bounds);
}

// 검색결과 항목을 Element로 반환하는 함수입니다
function getListItem(index, places) {

    var el = document.createElement('li'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<div class="info">' +
                '   <h5>' + places.place_name + '</h5>';

    if (places.road_address_name) {
        itemStr += '    <span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <span>' +  places.address_name  + '</span>'; 
    }
                 
      itemStr += '  <span class="tel">' + places.phone  + '</span>' +
                '</div>';           

    el.innerHTML = itemStr;
    el.className = 'item';

    return el;
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new kakao.maps.Size(36, 37),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
            spriteOrigin : new kakao.maps.Point(0, (idx*46)+10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new kakao.maps.Point(13, 37) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new kakao.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
function displayPagination(pagination) {
    var paginationEl = document.getElementById('pagination'),
        fragment = document.createDocumentFragment(),
        i; 

    // 기존에 추가된 페이지번호를 삭제합니다
    while (paginationEl.hasChildNodes()) {
        paginationEl.removeChild (paginationEl.lastChild);
    }

    for (i=1; i<=pagination.last; i++) {
        var el = document.createElement('a');
        el.href = "#";
        el.innerHTML = i;

        if (i===pagination.current) {
            el.className = 'on';
        } else {
            el.onclick = (function(i) {
                return function() {
                    pagination.gotoPage(i);
                }
            })(i);
        }

        fragment.appendChild(el);
    }
    paginationEl.appendChild(fragment);
}
// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
// 인포윈도우에 장소명을 표시합니다
function displayInfowindow(marker, title) {
    var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

    infowindow.setContent(content);
    infowindow.open(map, marker);
}
 // 검색결과 목록의 자식 Element를 제거하는 함수입니다
function removeAllChildNods(el) {   
    while (el.hasChildNodes()) {
        el.removeChild (el.lastChild);
    }
}

</script>
</body>
</html>
