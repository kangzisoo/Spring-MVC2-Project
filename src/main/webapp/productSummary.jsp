<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
.content {
	float: left;
	width: 100%;
	height: 100%;
}
.top {
	float: left;
	width: 100%;
	height: 20%;
}
.empty {
	display: inline-block; /* div 수평정렬 width, height로 설정한 부분 이외 블록처리 */
}
.category {
	display: inline-block; /* div 수평정렬 */
	float: right;
	width: 70%;
	height: 20%;
}
#productSummary {
	float: left;
	width: 30%;
	height: 80%;
}
/* 카테고리 div영역내에 있는 div를 수평으로 나열하기 위한 설정 */
.category_common {
	display: inline-block; /* div 수평정렬 */
	width: 200px;
	height: 50px;
}
.product_img {
	display: inline-block; /* div 수평정렬 */
	width: 30%;
}
.explain {
	display: inline-block; /* div 수평정렬 */
	width: 50%;
	margin-left: 40px;
	margin-bottom: 30px;
}
.product{
display: inline-block;
}
.pp{
display: inline-block;
}
</style>

<!-- Bootstrap core CSS -->
<link href="resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css">

<!-- Custom fonts for this template -->
<link href="resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
<link href="resources/vendor/bootstrap/css/bootstrap.css" rel="stylesheet" type="text/css">
<link href="resources/vendor/fontawesome-free/css/all.min.css/vendor/simple-line-icons/css/simple-line-icons.css" rel="stylesheet" type="text/css">
<link href="https://fonts.googleapis.com/css?family=Lato:300,400,700,300italic,400italic,700italic" rel="stylesheet" type="text/css">

<!-- Custom styles for this template -->
<link href="resources/css/landing-page.min.css" rel="stylesheet" type="text/css">
<link href="resources/css/landing-page.css" rel="stylesheet" type="text/css">
	
<!-- 제이쿼리 -->
<script type="text/javascript" src = "resources/js/jquery-3.6.0.js"></script>

<!-- Include the plugin's CSS and JS: -->
<script type="text/javascript" src="resources/js/bootstrap-multiselect.js"></script>
<link rel="stylesheet" href="resources/css/bootstrap-multiselect.css" type="text/css"/>
<!-- Initialize the plugin: -->

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=a928be6ed8a88c1ba98215dcf28ec6f0&libraries=services,clusterer,drawing"></script>
<script type="text/javascript">

	$(function() {
		
		/*
		AJAX 활용
		1. 등록된 상품목록들을 지도에 찍어주는 KaKao API
		2. 등록된 상품목록들을 가져와 화면에 찍어주기
		3. 상품목록들의 페이징 처리
		4. 셀렉트 태그를 이용해 카테고리별로 구분된 상품목록 가져오기 + 지도에 찍어주기
		
		상품컨트롤러에 접근하여 전체상품 정보 가져오기
		*/
		
		//배열 초기화(자바스크립트에서 배열 = List = ArrayList) ~> 상품목록을 보여줄때 기본화면 , 셀렉트 눌렀을때 화면에 해당하는 정보를 담을 배열
		var arr1 = [ "none", "none", "none"]; 
		
		//디폴트 화면(기본 시작화면 모든 상품정보를 보여주도록 설정)
		if(arr1[0] == "none" & arr1[0] == "none" & arr1[0] == "none"){ //셀렉트를 통해 상품을 결정하지 않은 경우 ~> 기본화면
		$.ajax({
			url : "getProduct",
			type : "POST",
			data : {
				"arr" : arr1	//카테고리 내역이 담긴 배열
			},
			success: function(result) {
			console.log("디폴트 화면: ",result)
			console.log("자자확인용입니다!!!:",result) //데이터 넘어온거 확인
			console.log("데이터 길이: ",result.length)
			var address = [] //DB에서 받아온 주소 목록들을 담아둘 배열
			
			var roomimg = []
			var roomimg2 = []
			var roomimg3 = []
			//상품의 특징을 담을 배열 생성
			var feature1 = []
			var feature2 = []
			var feature3 = []
			//상품번호를 받아올 배열 생성
			var pn = []

			
			//DB에서 리턴한 리스트를 JSON으로 변경해주고 주소, 상품의 특징을 담아준다
			//JSON은 현재 배열상태
			//받아온 모든 정보를 for문을 통해 하나씩 담아준다.
			for (var i = 0; i < result.length; i++) {
				address[i] = result[i].address
				feature1[i] = result[i].ctype
				feature2[i] = result[i].price
				feature3[i] = result[i].placetype
				roomimg[i] = result[i].roomimg
				roomimg2[i] = result[i].roomimg2
				roomimg3[i] = result[i].roomimg3
				pn[i] = result[i].pnum
			}
			console.log("사진: ",roomimg)
			console.log("주소만 추출:", address)
			console.log("특징1: ", feature1)
			console.log("특징2: ", feature2)
			console.log("특징3: ", feature3)
			console.log("상품번호: ", pn)
			
			/* 
			KAKAO 지도 API 활용
			위에서 얻어온 주소값(도로명/지명)들을 위도/경도로 바꿔준 후 -> 위도/경도를 Kakao서버로 넘겨 지도에 찍어준다. 
			*/
			
			var geocoder = new kakao.maps.services.Geocoder(); //geocoder : 주소를 입력하면 위도와 경도로 바꿔주는 객체
			var mapContainer = document.getElementById('map'); //Body부분에서 'map'이라는 아이디를 갖는 태그를 가리킴
			var mapOption = {
				center : new kakao.maps.LatLng(37.56203952196803, 126.93773526913148), //지도의 기준점을 설정
				level : 7
			};
			var map = new kakao.maps.Map(mapContainer, mapOption);//지도의 요소들을 담은 map이라는 변수 생성
			//배열로 받아온 주소개수 만큼 반복문 실행 => 그 개수만큼 지도에 표시해야하기 때문에
			for (let i = 0; i < address.length; i++) {
				//addressSearch : 입력한 주소를 위도/경도로 변경해주는 메서드
				geocoder.addressSearch(address[i], function(result, status) { 
					//정상적으로 검색이 완료됐으면
					if (status === kakao.maps.services.Status.OK) {
						//coords라는 변수에 위도와 경도를 찍어준다 ~> y좌표가 위도/x좌표가 경도  
						//(https://developers.kakao.com/docs/latest/ko/local/dev-guide#address-coord  : RoadAaddress부분확인하기 )
						var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
						console.log("위도경도찍기",coords)
						console.log("위도",result[0].y)
						
						 // 결과값으로 받은 위치를 마커로 표시합니다
						var marker = new kakao.maps.Marker({
							map : map,
							position : coords,
							clickable: true
							});
						
						// 마커를 클릭했을 때 마커 위에 표시할 인포윈도우를 생성합니다
						// 지도에서 표시된 상품의 마커를 클릭시 -> 상세 정보를 보여주도록 설정
						// 태그와 string 사이는 +로 연결
						var iwContent = '<div style="width:100px; height:150px">'+feature1[i]+"<br>"+feature2[i]+"<br>"+feature3[i]+"<br><a href =productdetail.jsp?pnum="+pn[i]+">바로가기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
						    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다

						// 인포윈도우를 생성합니다(https://apis.map.kakao.com/web/sample/removableCustomOverlay/)
						var infowindow = new kakao.maps.InfoWindow({
						    content : iwContent,
						    removable : iwRemoveable
						});
						// 마커에 클릭이벤트를 등록합니다
						// 클릭시 인포윈도우를 띄어줌
						kakao.maps.event.addListener(marker, 'click', function() {
						      // 마커 위에 인포윈도우를 표시합니다
						      infowindow.open(map, marker);  
						});
					}//if문 끝
				})//geocoder.addressSearch메서드 끝
			}//for문 끝
			
			
			/*
			상품의 목록생성 + 페이징처리
			*/
			var totalData = result.length; //전체 데이터
			var dataPerPage = 8; //한 페이지에 표현할 데이터
			var pageCount = 4; // 한 화면에 나타낼 페이지 수
			console.log("기본페이지 데이터 개수: " ,result.length)

			paging(totalData, dataPerPage, pageCount, 1); // 맨 처음 초기화면 생성(페이징 초기화)
			function paging(totalData, dataPerPage, pageCount, currentPage) {
				console.log("currentPage : " + currentPage);
				console.log()
				var totalPage = Math.ceil(totalData / dataPerPage);
				console.log("totalPage: ", totalPage)
				var pageGroup = Math.ceil(currentPage / pageCount);
				console.log("pageGroup : " + pageGroup);
				
				var last = pageGroup * pageCount;
				if (last > totalPage)
					last = totalPage;
				var next = last + 1;
				var first = last - (pageCount - 1);
				var prev = first - 1;
				console.log("last : " + last);
				console.log("first : " + first);
				console.log("next : " + next);
				console.log("prev : " + prev);

				var html = ""; //페이징 표시하기 위한 변수
				var list = ""; //상품목록들을 표시하기 위한 변수
				
				if (prev > 0)
					html += "<a href='#' id= 'prev' style='font-size: 28px; font-weight: bold'> < </a>";
					
				if(first < 0 | first == 0){
					for (var i = 1; i <= last; i++) {
						html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
					}
				}else{
					for (var i = first; i <= last; i++) {
						html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
					}
				}
				
				if (last < totalPage)
					html += "<a href='#' id= 'next' style='font-size: 20px;font-weight: bold'> > </a>";
					
				//초기 화면을 위해 넣는 부분 ~> 이 부분 없으면 초기 페이지는 상품이 안나오게됨
				//list에 상품들을 가져와 넣어줘야함=> 안그러면 그냥 페이징만 표시됨
							if(totalData % 2 == 0){
							for (var i = 0; i < 8; i++) { //페이지당 8개의 데이터를 출력해줘야 하기 떄문에 0~8까지로 설정
								if(result[i] != null){ //데이터가 있을 때만 페이지에 출력
								//***********************************************************************************************//
								list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
								list += "<div class = 'pp'>"
								//a태그를 통해서 사진을 누르게되면 상품 상세페이지인 productdetail.jsp로 pnum에 pn[i]의 값을 넣어서 보내주게된다
								//productdetail.jsp 에서는 pnum을 받아서 사용할 수 있다.
								list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
								list += "<div>" + result[i].ctype+ "</div>"
								list += "<div>" + result[i].price+ "(만원)</div>"
								list += "<div>" + result[i].placetype+ "</div>"
								list += "</div>"
								list += "</div>"
								}
								else{
									list +="<div style = 'height : 86px'></div>"
								}
							}}else{
								for (var i = 0; i < 8; i++) { //24 ~ 28
									if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
									list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
									list += "<div class = 'pp'>"
									list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
									list += "<div>" + result[i].ctype+ "</div>"
									list += "<div>" + result[i].price+ "(만원)</div>"
									list += "<div>" + result[i].placetype+ "</div>"
									list += "</div>"
									list += "</div>"
									}
									else{
										list +="<div style = 'height : 50px'></div>"
									}
							}
				}//초기화면을 위해 넣는 부분 끝
				
				//.html()을 사용해서 body부분에 있는 div에 출력해줌
				$('#list').html(list)// body부분에 id가 list인 div태그에 상품정보 표시한 걸 찍어주기
				$("#paging").html(html);//body부분에 id가 paging인 div태그에 페이징부분 표시해주기
				
				//패이징 css부분
				$("#paging a").css("color", "black");
				$("#paging a#" + currentPage).css({
					"font-size" : "33px",
					"text-decoration" : "none",
					"color" : "blue",
					"font-weight" : "bold"});
				
				//페이징 번호클릭시 수행 => 상품목록들을 출력해줄 부분
				$("#paging a").click(function() {
							var list = ""; // 상품목록 초기화해주기 : 주석 처리시 맨 처음 화면의 상품리스트에 쌓이게됨(중복됨) 
										   // 초기화를 해줘야지 클릭할 떄마다 상품초기화 되고 다시 쌓아주는 식
										   
							var $item = $(this); //$(this) : 이벤트(현재 클릭이벤트)가 발생한 요소들의 정보들  
											 	 // 현재 페이징을 눌렀을때 <a href='#' id=" + i + ">" + i + "</a> 이러한 태그의 요소들의 정보인 a(태그) #(주소) i(id정보) 가 출력됨
							 					 // 2번쨰 페이지를 누를 경우 결과로 a#2가 나온다.
							 					 
							var $id = $item.attr("id"); //.attr : 요소 및 속성 가져오기 ~> 위에서 말한 a태그 #주소 i(id정보)중 id에 해당하는 것만 출력
							var selectedPage = $item.text(); 
							
							if ($id == 'next')
								selectedPage = next; //만약 next를 아이디로하는 a태그를 클릭(다음 페이지로 넘기기) selectedPage에 next번호가 들어간다
							if ($id == 'prev')
								selectedPage = prev;

							paging(totalData, dataPerPage, pageCount, selectedPage);
							//범위에 해당하는 데이터가 없는 경우 출력이 안됨!! ~> 조건을 통해서 수정하자!!
							for (var i = (selectedPage - 1) * dataPerPage; i < selectedPage * dataPerPage; i++) { //24 ~ 28
								if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
								list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
								list += "<div class = 'pp'>"
								list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
								list += "<div>" + result[i].ctype+ "</div>"
								list += "<div>" + result[i].price+ "(만원)</div>"
								list += "<div>" + result[i].placetype+ "</div>"
								list += "</div>"
								list += "</div>"
								}
								else{
									list +="<div style = 'height : 86px'></div>"
								}
							}
							$('#list').html(list)
						})//클릭함수닫기
			}//paging함수닫기
		}//success끝
	})
}
		
		var roomType1;
		var saleType1;
		var sectionType1;
		//방종류 셀렉트 태그에서 선택된 값 받아오기
		//$(this).val() ~> 타입 종류
		
		$('#roomType').change(function() {
			roomType1 = $(this).val() //roomType변수에 방종류 넣어줌(oneroom, apt, opst)
			arr1[0] = roomType1
			console.log(arr1)
			//서버로 데이터 넘겨주기
			$.ajax({
				type : "POST",
				url : "getProduct",
				data : {
					"arr" : arr1,
				},
				success : function(result) {
					console.log("연결성공")
					//받아온 상품정보를 상품목록에 보여주기
					console.log("arr1: ",arr1)
					
					var address = [] //DB에서 받아온 주소 목록들을 담아둘 배열
					var roomimg = []
					var roomimg2 = []
					var roomimg3 = []
					//상품의 특징을 담을 배열 생성
					var feature1 = []
					var feature2 = []
					var feature3 = []
					
					var pn = []
					//DB에서 가져온 JSON에서 주소, 상품의 특징을 담아준다
					for (var i = 0; i < result.length; i++) {
						address[i] = result[i].address
						feature1[i] = result[i].ctype
						feature2[i] = result[i].price
						feature3[i] = result[i].placetype
						roomimg[i] = result[i].roomimg
						roomimg2[i] = result[i].roomimg2
						roomimg3[i] = result[i].roomimg3
						pn[i] = result[i].pnum
					}
					
					console.log("주소만 추출:", address)
					console.log("특징1: ", feature1)
					console.log("특징2: ", feature2)
					console.log("특징3: ", feature3)
					console.log("상품번호: ", pn)
					
					
					var geocoder = new kakao.maps.services.Geocoder(); //geocoder : 주소를 입력하면 위도와 경도로 바꿔주는 객체
					let feature = ['상품관련 내용 넣기','상품관련 내용 넣기','상품정보관련 내용 넣기']
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center : new kakao.maps.LatLng(37.56203952196803, 126.93773526913148),
						level : 7
					};
					var map = new kakao.maps.Map(mapContainer, mapOption);
					for (let i = 0; i < address.length; i++) {
						geocoder.addressSearch(address[i], function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								console.log("위도경도찍기",coords)
								console.log("위도",result[0].y)
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									clickable: true
									});
								
								var iwContent = '<div style="width:100px; height:150px">'+feature1[i]+"<br>"+feature2[i]+"<br>"+feature3[i]+"<br><a href =productdetail.jsp?pnum="+pn[i]+">바로가기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});
								kakao.maps.event.addListener(marker, 'click', function() {
								      infowindow.open(map, marker);  
								});
								}//if문 끝
							})//geocoder.addressSearch메서드 끝
						}//for문 끝
						/*
						상품의 목록 + 페이징처리
						*/
						var totalData = result.length; //전체 데이터
						var dataPerPage = 8; //한 페이지에 표현할 데이터
						var pageCount = 4; // 한 화면에 나타낼 페이지 수
						console.log("방타입데이터 개수: " ,result.length)

						paging(totalData, dataPerPage, pageCount, 1); // 맨 처음 초기화면 생성
						function paging(totalData, dataPerPage, pageCount, currentPage) {
							console.log("currentPage : " + currentPage);

							var totalPage = Math.ceil(totalData / dataPerPage);
							var pageGroup = Math.ceil(currentPage / pageCount);

							console.log("pageGroup : " + pageGroup);
							var last = pageGroup * pageCount;
							if (last > totalPage)
								last = totalPage;
							var next = last + 1;
							var first = last - (pageCount - 1);
							var prev = first - 1;
							console.log("last : " + last);
							console.log("first : " + first);
							console.log("next : " + next);
							console.log("prev : " + prev);

							var html = "";
							var list = "";
							
							if (prev > 0)
								html += "<a href='#' id= 'prev' style='font-size: 28px; font-weight: bold'> < </a>";
								
							if(first < 0 | first == 0){
								for (var i = 1; i <= last; i++) {
									html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
								}
							}else{
								for (var i = first; i <= last; i++) {
									html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
								}
							}
							
							if (last < totalPage)
								html += "<a href='#' id= 'next' style='font-size: 20px;font-weight: bold'> > </a>";
								
							if(totalData % 2 == 0){
							for (var i = 0; i < 8; i++) { //24 ~ 28
								if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
								list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
								list += "<div class = 'pp'>"
								list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
								list += "<div>" + result[i].ctype+ "</div>"
								list += "<div>" + result[i].price+ "(만원)</div>"
								list += "<div>" + result[i].placetype+ "</div>"
								list += "</div>"
								list += "</div>"
								}
								else{
									list +="<div style = 'height : 86px'></div>"
								}
							}}else{
								for (var i = 0; i < 8; i++) { //24 ~ 28
									if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
									list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
									list += "<div class = 'pp'>"
									list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
									list += "<div>" + result[i].ctype+ "</div>"
									list += "<div>" + result[i].price+ "(만원)</div>"
									list += "<div>" + result[i].placetype+ "</div>"
									list += "</div>"
									list += "</div>"
									}
									else{
										list +="<div style = 'height : 50px'></div>"
									}
							}
							}//초기화면을 위해 넣는 부분 끝
							
							$('#list').html(list)
							$("#paging").html(html);
							$("#paging a").css("color", "black");
							$("#paging a#" + currentPage).css({
								"font-size" : "33px",
								"text-decoration" : "none",
								"color" : "blue",
								"font-weight" : "bold"});
							$("#paging a").click(function() {
										var list = ""; //주석 처리시 맨 처음 화면의 상품리스트에 쌓이게됨 ==> 클릭할 떄마다 상품초기화 되고 다시 쌓아주는 식
										var $item = $(this); //$(this) : 이벤트(현재 클릭이벤트)에 
										var $id = $item.attr("id"); //.attr : 요소 및 속성 가져오기
										var selectedPage = $item.text(); //
										
										if ($id == 'next')
											selectedPage = next; //만약 next를 아이디로하는 a태그를 클릭(다음 페이지로 넘기기) selectedPage에 next번호가 들어간다
										if ($id == 'prev')
											selectedPage = prev;

										paging(totalData, dataPerPage, pageCount, selectedPage);
										for (var i = (selectedPage - 1) * dataPerPage; i < selectedPage * dataPerPage; i++) { //24 ~ 28
											if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
											list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
											list += "<div class = 'pp'>"
											list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
											list += "<div>" + result[i].ctype+ "</div>"
											list += "<div>" + result[i].price+ "(만원)</div>"
											list += "<div>" + result[i].placetype+ "</div>"
											list += "</div>"
											list += "</div>"
											}
											else{
												list +="<div style = 'height : 50px'></div>"
											}
										}
										$('#list').html(list)
									})//클릭함수닫기
						}//paging함수닫기
					}//success끝
				})//AJAX끝
			})//Select끝
			
		//거래유형 셀렉트 태그에서 선택된 값 받아오기
		$('#saleType').change(function() {
			var saleType1 = $(this).val() //saleType변수에 거래유형 넣어줌(charter, monthly, trading)
			arr1[1] = saleType1
			console.log(arr1)

			$.ajax({
				type : "POST",
				url : "getProduct",
				data : {
					"arr" : arr1,
				},
				success : function(result) {
					console.log("연결성공")
					console.log("arr1: ",arr1)
					//받아온 상품정보를 상품목록에 보여주기
					var address = [] //DB에서 받아온 주소 목록들을 담아둘 배열
					
					var roomimg = []
					var roomimg2 = []
					var roomimg3 = []
					//상품의 특징을 담을 배열 생성
					var feature1 = []
					var feature2 = []
					var feature3 = []
					
					var pn = []
					//DB에서 가져온 JSON에서 주소, 상품의 특징을 담아준다
					for (var i = 0; i < result.length; i++) {
						address[i] = result[i].address
						feature1[i] = result[i].ctype
						feature2[i] = result[i].price
						feature3[i] = result[i].placetype
						roomimg[i] = result[i].roomimg
						roomimg2[i] = result[i].roomimg2
						roomimg3[i] = result[i].roomimg3
						pn[i] = result[i].pnum
					}
					
					console.log("주소만 추출:", address)
					console.log("특징1: ", feature1)
					console.log("특징2: ", feature2)
					console.log("특징3: ", feature3)
					console.log("상품번호: ", pn)
					
					
					var geocoder = new kakao.maps.services.Geocoder(); //geocoder : 주소를 입력하면 위도와 경도로 바꿔주는 객체
					let feature = ['상품관련 내용 넣기','상품관련 내용 넣기','상품정보관련 내용 넣기']
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center : new kakao.maps.LatLng(37.56203952196803, 126.93773526913148),
						level : 7
					};
					var map = new kakao.maps.Map(mapContainer, mapOption);
					for (let i = 0; i < address.length; i++) {
						geocoder.addressSearch(address[i], function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								console.log("위도경도찍기",coords)
								console.log("위도",result[0].y)
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									clickable: true
									});
								
								var iwContent = '<div style="width:100px; height:150px">'+feature1[i]+"<br>"+feature2[i]+"<br>"+feature3[i]+"<br><a href =productdetail.jsp?pnum="+pn[i]+">바로가기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});
								kakao.maps.event.addListener(marker, 'click', function() {
								      infowindow.open(map, marker);  
								});
								}//if문끝
						})//geocoder.addressSearch메서드 끝
					}//for문 끝
					/*
					상품의 목록 + 페이징처리
					*/
					var totalData = result.length; //전체 데이터
					var dataPerPage = 8; //한 페이지에 표현할 데이터
					var pageCount = 4; // 한 화면에 나타낼 페이지 수
					console.log("거래타입 데이터 개수: " ,result.length)
					paging(totalData, dataPerPage, pageCount, 1); // 맨 처음 초기화면 생성
					function paging(totalData, dataPerPage, pageCount, currentPage) {
						console.log("currentPage : " + currentPage);

						var totalPage = Math.ceil(totalData / dataPerPage);
						var pageGroup = Math.ceil(currentPage / pageCount);

						console.log("pageGroup : " + pageGroup);
						var last = pageGroup * pageCount;
						if (last > totalPage)
							last = totalPage;
						var next = last + 1;
						var first = last - (pageCount - 1);
						var prev = first - 1;
						console.log("last : " + last);
						console.log("first : " + first);
						console.log("next : " + next);
						console.log("prev : " + prev);

						var html = "";
						var list = "";
						
						if (prev > 0)
							html += "<a href='#' id= 'prev' style='font-size: 28px; font-weight: bold'> < </a>";
							
						if(first < 0 | first == 0){
							for (var i = 1; i <= last; i++) {
								html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
							}
						}else{
							for (var i = first; i <= last; i++) {
								html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
							}
						}
						
						if (last < totalPage)
							html += "<a href='#' id= 'next' style='font-size: 20px;font-weight: bold'> > </a>";
							
							if(totalData % 2 == 0){
							for (var i = 0; i < 8; i++) { 
								if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
								list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
								list += "<div class = 'pp'>"
								list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
								list += "<div>" + result[i].ctype+ "</div>"
								list += "<div>" + result[i].price+ "(만원)</div>"
								list += "<div>" + result[i].placetype+ "</div>"
								list += "</div>"
								list += "</div>"
								}
								else{
									list +="<div style = 'height : 86px'></div>"
								}
							}}else{
								for (var i = 0; i < 8; i++) { 
									if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
									list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
									list += "<div class = 'pp'>"
									list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
									list += "<div>" + result[i].ctype+ "</div>"
									list += "<div>" + result[i].price+ "(만원)</div>"
									list += "<div>" + result[i].placetype+ "</div>"
									list += "</div>"
									list += "</div>"
									}
									else{
										list +="<div style = 'height : 40px'></div>"
									}
							}
						}//초기화면을 위해 넣는 부분 끝
						
						$('#list').html(list)
						$("#paging").html(html);
						$("#paging a").css("color", "black");
						$("#paging a#" + currentPage).css({
							"font-size" : "33px",
							"text-decoration" : "none",
							"color" : "blue",
							"font-weight" : "bold"});
						
						$("#paging a").click(function() {
									//여기에 상품리스트 넣어주기
									var list = ""; //주석 처리시 맨 처음 화면의 상품리스트에 쌓이게됨 ==> 클릭할 떄마다 상품초기화 되고 다시 쌓아주는 식
									var $item = $(this); //$(this) : 이벤트(현재 클릭이벤트)에 
									var $id = $item.attr("id"); //.attr : 요소 및 속성 가져오기
									var selectedPage = $item.text(); //
									
									if ($id == 'next')
										selectedPage = next; //만약 next를 아이디로하는 a태그를 클릭(다음 페이지로 넘기기) selectedPage에 next번호가 들어간다
									if ($id == 'prev')
										selectedPage = prev;

									paging(totalData, dataPerPage, pageCount, selectedPage);
									for (var i = (selectedPage - 1) * dataPerPage; i < selectedPage * dataPerPage; i++) { //24 ~ 28
										if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
										list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
										list += "<div class = 'pp'>"
										list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
										list += "<div>" + result[i].ctype+ "</div>"
										list += "<div>" + result[i].price+ "(만원)</div>"
										list += "<div>" + result[i].placetype+ "</div>"
										list += "</div>"
										list += "</div>"
										}
										else{
											list +="<div style = 'height : 70px'></div>"
										}
									}
									$('#list').html(list)
								})//클릭함수닫기
					}//paging함수닫기
				}//success끝
			})//AJAX끝
		})//Select끝
		
		//땡세권 셀렉트 태그에서 선택된 값 받아오기
		$('#sectionType').change(function() {
			var sectionType1 = $(this).val() //sectionType변수에 땡세권 넣어줌(station, cs, school)
			arr1[2] = sectionType1
			console.log(arr1)
			$.ajax({
				type : "POST",
				url : "getProduct",
				data : {
					"arr" : arr1
				},
				success : function(result) {
					console.log("연결성공")
					console.log("arr1: ",arr1)
					//받아온 상품정보를 상품목록에 보여주기
					var address = [] //DB에서 받아온 주소 목록들을 담아둘 배열
			
					var roomimg = []
					var roomimg2 = []
					var roomimg3 = []
					//상품의 특징을 담을 배열 생성
					var feature1 = []
					var feature2 = []
					var feature3 = []
					
					var pn = []
					//DB에서 가져온 JSON에서 주소, 상품의 특징을 담아준다
					for (var i = 0; i < result.length; i++) {
						address[i] = result[i].address
						feature1[i] = result[i].ctype
						feature2[i] = result[i].price
						feature3[i] = result[i].placetype
						roomimg[i] = result[i].roomimg
						roomimg2[i] = result[i].roomimg2
						roomimg3[i] = result[i].roomimg3
						pn[i] = result[i].pnum
					}
					
					console.log("주소만 추출:", address)
					console.log("특징1: ", feature1)
					console.log("특징2: ", feature2)
					console.log("특징3: ", feature3)
					console.log("상품번호: ", pn)
					
					
					var geocoder = new kakao.maps.services.Geocoder(); //geocoder : 주소를 입력하면 위도와 경도로 바꿔주는 객체
					let feature = ['상품관련 내용 넣기','상품관련 내용 넣기','상품정보관련 내용 넣기']
					var mapContainer = document.getElementById('map');
					var mapOption = {
						center : new kakao.maps.LatLng(37.56203952196803, 126.93773526913148),
						level : 7
					};
					var map = new kakao.maps.Map(mapContainer, mapOption);
					for (let i = 0; i < address.length; i++) {
						geocoder.addressSearch(address[i], function(result, status) {
							if (status === kakao.maps.services.Status.OK) {
								var coords = new kakao.maps.LatLng(result[0].y, result[0].x);
								console.log("위도경도찍기",coords)
								console.log("위도",result[0].y)
								var marker = new kakao.maps.Marker({
									map : map,
									position : coords,
									clickable: true
									});
								
								var iwContent = '<div style="width:100px; height:150px">'+feature1[i]+"<br>"+feature2[i]+"<br>"+feature3[i]+"<br><a href =productdetail.jsp?pnum="+pn[i]+">바로가기</a></div>", // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
								    iwRemoveable = true; // removeable 속성을 ture 로 설정하면 인포윈도우를 닫을 수 있는 x버튼이 표시됩니다
		
								var infowindow = new kakao.maps.InfoWindow({
								    content : iwContent,
								    removable : iwRemoveable
								});
								kakao.maps.event.addListener(marker, 'click', function() {
								      infowindow.open(map, marker);  
								});
							}//if문 끝
						})//geocoder.addressSearch메서드 끝
					}//for문 끝
					
					/*
					상품의 목록
					페이징 처리
					*/
					var totalData = result.length; //전체 데이터
					var dataPerPage = 8; //한 페이지에 표현할 데이터
					var pageCount = 4; // 한 화면에 나타낼 페이지 수
					console.log("세권 데이터 개수: " ,result.length)

					paging(totalData, dataPerPage, pageCount, 1); // 맨 처음 초기화면 생성(디폴트)
					
					function paging(totalData, dataPerPage, pageCount, currentPage) {
						console.log("currentPage : " + currentPage);

						var totalPage = Math.ceil(totalData / dataPerPage); //0
						var pageGroup = Math.ceil(currentPage / pageCount); //0

						console.log("pageGroup : " + pageGroup);
						var last = pageGroup * pageCount;
						if (last > totalPage)
							last = totalPage;
						var next = last + 1;
						var first = last - (pageCount - 1);
						var prev = first - 1;
						console.log("last : " + last);
						console.log("first : " + first);
						console.log("next : " + next);
						console.log("prev : " + prev);

						var html = "";
						var list = "";
						
						if (prev > 0)
							html += "<a href='#' id= 'prev' style='font-size: 28px; font-weight: bold'> < </a>";
							
						if(first < 0 | first == 0){
							for (var i = 1; i <= last; i++) {
								html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
							}
						}else{
							for (var i = first; i <= last; i++) {
								html += "<a style='font-size: 28px;font-weight: bold' href='#' id=" + i + ">" + i + "</a>";
							}
						}
						
						if (last < totalPage)
							html += "<a href='#' id= 'next' style='font-size: 20px;font-weight: bold'> > </a>";
							
							if(totalData % 2 == 0){
							for (var i = 0; i < 8; i++) { //24 ~ 28
								if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
								list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
								list += "<div class = 'pp'>"
								list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
								list += "<div>" + result[i].ctype+ "</div>"
								list += "<div>" + result[i].price+ "(만원)</div>"
								list += "<div>" + result[i].placetype+ "</div>"
								list += "</div>"
								list += "</div>"
								}
								else{
									list +="<div style = 'height : 86px'></div>"
								}
							}}else{
								for (var i = 0; i < 8; i++) { //24 ~ 28
									if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
									list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
									list += "<div class = 'pp'>"
									list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
									list += "<div>" + result[i].ctype+ "</div>"
									list += "<div>" + result[i].price+ "(만원)</div>"
									list += "<div>" + result[i].placetype+ "</div>"
									list += "</div>"
									list += "</div>"
									}
									else{
										list +="<div style = 'height : 50px'></div>"
									}
							}
						}//초기화면을 위해 넣는 부분 끝
						
						$('#list').html(list)
						$("#paging").html(html);
						$("#paging a").css("color", "black");
						$("#paging a#" + currentPage).css({
							"font-size" : "33px",
							"text-decoration" : "none",
							"color" : "blue",
							"font-weight" : "bold"});
						
						$("#paging a").click(function() {
									//여기에 상품리스트 넣어주기
									var list = ""; //주석 처리시 맨 처음 화면의 상품리스트에 쌓이게됨 ==> 클릭할 떄마다 상품초기화 되고 다시 쌓아주는 식
									var $item = $(this); //$(this) : 이벤트(현재 클릭이벤트)에 
									var $id = $item.attr("id"); //.attr : 요소 및 속성 가져오기
									var selectedPage = $item.text(); //
									
									if ($id == 'next')
										selectedPage = next; //만약 next를 아이디로하는 a태그를 클릭(다음 페이지로 넘기기) selectedPage에 next번호가 들어간다
									if ($id == 'prev')
										selectedPage = prev;

									paging(totalData, dataPerPage, pageCount, selectedPage);
									//범위에 해당하는 데이터가 없는 경우 출력이 안됨!! ~> 조건을 통해서 수정하자!!
									for (var i = (selectedPage - 1) * dataPerPage; i < selectedPage * dataPerPage; i++) { //24 ~ 28
										if(result[i] != null){ //데이터가 있을 때만 해당 페이지에 출력해주기
										list += "<div class = 'product' style = 'margin: 0px 0px 0px 60px'>"
										list += "<div class = 'pp'>"
										list += "<a href = 'productdetail.jsp?pnum="+pn[i]+"'><img src = 'resources/rimg/"+roomimg[i]+"' style = 'width: 200px; height: 100px'></a>"
										list += "<div>" + result[i].ctype+ "</div>"
										list += "<div>" + result[i].price+ "(만원)</div>"
										list += "<div>" + result[i].placetype+ "</div>"
										list += "</div>"
										list += "</div>"
										}
										else{
											list +="<div style = 'height : 86px'></div>"
										}
									}
									$('#list').html(list)
								})//클릭함수닫기
					}//paging함수닫기
				}//success끝
			})//AJAX끝
		})//Select끝
		
}) //$(func) 끝

</script>
</head>
<body>
	<!-- Navigation : 위에 부분-->
	<nav class="navbar navbar-light bg-light static-top">
		<div class="logo">
			<a class="navbar-brand" href="main.jsp">내 집은 신촌에 있나방</a>
		</div>
		<div id="menu">
		 <!-- 세션처리 -->
		<% if(session.getAttribute("userid") == null){ %>
		 <a class="btn btn-primary btn-lg" href="productSummary.jsp">방찾기</a>
		 <a class="btn btn-primary btn-lg" href="ruser_login.jsp">마이페이지</a> <!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_select.jsp">회원정보검색</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<a class="btn btn-primary btn-lg" href="ruser_login.jsp">로그인</a>
		<a class="btn btn-primary btn-lg" href="signup.jsp">회원가입</a>
		<% }else{ %>
		 <a class="btn btn-primary btn-lg" href="productSummary.jsp">방찾기</a>
		 <a class="btn btn-primary btn-lg" href="mypage_main.jsp">마이페이지</a> <!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="PMain.jsp">방내놓기</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="qnamain.jsp">고객센터</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_update.jsp">회원정보수정</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		 <a class="btn btn-primary btn-lg" href="ruser_delete.jsp">회원탈퇴</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<a class="btn btn-primary btn-lg" href="ruser_logout.jsp">로그아웃</a><!-- href에 각자 만든 페이지 주소 넣어주기 -->
		<div class="btn btn-primary btn-lg">${userid}님 환영합니다.</div>
		<%} %>
		</div>
	</nav>

	<!-- 카테고리 별로 상품을 고를 수 있도록 설정한 부분  -->
	<section class="content">
		<div class="top">
			<div class="empty"
				style="width: 30%; height: 50px; background-color: #007bff"></div>
			<div class="category">
				<div class="category_common">
					<form><!-- 방종류 부분 -->
						<select name="roomType" id = "roomType" style="width: 200px; height: 50px; text-align-last: center; font-size: 25px;font-weight: bold; background-color: #87CEFA ">
							<option value="none" selected>방종류</option>
							<option value="단독/다가구">단독/다가구</option>
							<option value="아파트">아파트</option>
							<option value="오피스텔">오피스텔</option>
						</select>
					</form>
				</div>
				<div class="category_common">
					<form>
						<select name="saleType" id = "saleType" style="width: 200px; height: 50px; text-align-last: center; font-size: 25px;font-weight: bold; background-color: #87CEFA">
							<option value="none" selected>거래유형</option>
							<option value="전세">전세</option>
							<option value="월세">월세</option>
							<option value="매매">매매</option>
						</select>
					</form>
				</div>
				<div class="category_common">
					<form>
						<select name="sectionType" id = "sectionType" style="width: 200px; height: 50px; text-align-last: center; font-size: 25px;font-weight: bold; background-color: #87CEFA ">
							<option value="none" selected>땡세권</option>
							<option value="역세권">역세권</option>
							<option value="편세권">편세권</option>
							<option value="학세권">학세권</option>
							<option value="숲세권">숲세권</option>
							<option value="스세권">스세권</option>
						</select>
					</form>
				</div>
			</div>	
		</div>
		<!-- 페이징처리하기 -->
		<div id="productSummary">
			<div id = "list"></div>
			<div id="paging" style='margin-left: 250px; margin-top: 30px'></div>
		</div>
		<div id="map" style="width: 68%; height: 680px;"></div>
		<div style="height: 100px"></div>
	</section>

	<!-- Footer -->
	<footer class="footer bg-light">
		<div class="container">
			<div class="row">
				<div class="col-lg-6 h-100 text-center text-lg-left my-auto">
					<ul class="list-inline mb-2">
						<li class="list-inline-item"><a href="#">About</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Contact</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Terms of Use</a></li>
						<li class="list-inline-item">&sdot;</li>
						<li class="list-inline-item"><a href="#">Privacy Policy</a></li>
					</ul>
					<p class="text-muted small mb-4 mb-lg-0">&copy; Your Website
						2020. All Rights Reserved.</p>
				</div>
				<div class="col-lg-6 h-100 text-center text-lg-right my-auto">
					<ul class="list-inline mb-0">
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-facebook fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item mr-3"><a href="#"> <i
								class="fab fa-twitter-square fa-2x fa-fw"></i>
						</a></li>
						<li class="list-inline-item"><a href="#"> <i
								class="fab fa-instagram fa-2x fa-fw"></i>
						</a></li>
					</ul>
				</div>
			</div>
		</div>
	</footer>

</body>
</html>