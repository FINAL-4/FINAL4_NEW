<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  var $$ = jQuery.noConflict();
</script>
<script src='resources/js/moment.min.js'></script>
<script src='resources/js/fullcalendar.min.js'></script>
<script src='resources/js/gcal.min.js'></script>
<!-- locale = ko ==> 한글로 -->
<script src='https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/locale/ko.js'></script>
<!-- CSS 파일 -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.9.0/fullcalendar.min.css" type='text/css' rel='stylesheet'/>
<title>Insert title here</title>
<script type="text/javascript">
	$$(function(){
		$$("#calendar").fullCalendar({
			navLinkDayClick: function(){
				return false;
			},
			selectable: true,
			header : {
				left : 'prev, next',
				center : 'title',
				right : 'today,addScheduleBtn' 
			},
			select: function(startDate ,endDate){
			
				var dateNow = new Date();
				var year = String(dateNow.getFullYear());
				var month = String(dateNow.getMonth() + 1);
				if(dateNow.getDate()<10){
					var date = "0"+String(dateNow.getDate());
				}else{
					var date = String(dateNow.getDate());
				}
					
				dateNow = year+month+date;
				
				
				
				var dateSelect = startDate.format().split("-");
				
				var dateCompare = dateSelect[0]+dateSelect[1]+dateSelect[2];
				
			
				
				 if(Number(dateNow)>Number(dateCompare)){
					alert("지난 날짜를 선택할 수 없습니다.");
					return false;
				}  
				
				if(confirm("날짜를 선택하시겠습니까?") == false){
					return false;
				}
				
				console.log(startDate.format(), endDate.format());
				sDate = startDate.format();
				eDate = endDate.format();
				$$("#dayInfo").html(sDate);
				$$("#mDayInfo").val(sDate);
				$$("#calendar").fullCalendar("refetchEvents");
				
 			}
		});
	});
</script>
<script type="text/javascript">
	$$(function(){
		$$("#calendar").fullCalendar({
			navLinkDayClick: function(){
				return false;
			},
			selectable: true,
			header : {
				left : 'prev,next',
				center : 'title',
				right : 'today,addScheduleBtn' 
			},
			select: function(startDate ,endDate){
				
				if(confirm("날짜를 선택하시겠습니까?") == false){
					return false;
				}
				
				console.log(startDate.format(), endDate.format());
				sDate = startDate.format();
				eDate = endDate.format();
				$$("#dayInfo").html(sDate);
				$$("#mDayInfo").val(sDate);
				$("#calendar").fullCalendar("refetchEvents");
				
 			}
		});
	});
</script>
<style>
#map{
	width: 400px;
	height: 400px;
	margin-left: 10%;
	border: 3px solid grey;
}
#calendar{
	width: 30%;
	height: 100%;
	margin-left: 10%;
}
.fc-basic-view .fc-body .fc-row {
    min-height: 1em;
}
.fc-today-button{
	width: 50px;
	height: 20px;
}
.fc-button-group{
	width: 30px;
	height: 5px;
}
.fc button, .fc table, body .fc {
    font-size: 12px;
}
body{
	overflow-x: hidden;
}
#employer-post-new-job .res-steps-container .res-steps {
    width: 25%;
    text-align: center;
    float: left;
    cursor: pointer
}
#employer-post-new-job .res-steps-container .res-steps .res-step-bar {
	-webkit-border-radius: 50% !important;
	-moz-border-radius: 50% !important;
	-ms-border-radius: 50% !important;
	border-radius: 50% !important;
	background: black;	/* 선택안된 원 배경색*/
	display: inline-block;
	height: 40px;
	width: 40px;
	margin-top: 10px;
	text-align: center;
	color: white;	/* 선택안된 원 글자색*/
	padding-top: 7px;
	font-size: 20px
}
#employer-post-new-job .res-steps-container .res-steps .res-progress-title {
    text-align: center;
    font-size: 15px;
    padding-top: 10px;
    display: block
}
#employer-post-new-job .res-steps-container .res-steps .res-progress-bar {
    height: 5px;
    background: black;	/* 막대기 색 */
    width: 50%;
    margin: -22px 0 0 50%;
    float: left
}
#employer-post-new-job .res-steps-container .res-step-two .res-progress-bar, #employer-post-new-job .res-steps-container .res-step-three .res-progress-bar, #employer-post-new-job .res-steps-container .res-step-four .res-progress-bar {
    width: 100%;
    margin-left: 0%
}
#employer-post-new-job .res-steps-container .res-step-four .res-progress-bar {
    width: 50%;
    margin-right: 50%
}
#employer-post-new-job .res-step-form {
    box-shadow: 0px 6px 4px -2px silver;
    position: absolute
}
#employer-post-new-job .res-step-form h3 {
    margin: 10px 0;
    color: black;
    font-size: 18px
}
#employer-post-new-job .res-step-form .form-horizontal label {
    font-weight: normal
}
#employer-post-new-job .res-form-two, #employer-post-new-job .res-form-three, #employer-post-new-job .res-form-four {
    left: 150%
}
#employer-post-new-job .active .res-step-bar {
    background: lightgrey !important;	/* 선택된 원 색 */
}
#employer-post-new-job .active .res-progress-title {
    color: lightgrey;	/* 선택된 글자색 */
}
.contents{
	width : 100%;
	height: 470px;
}
button,
button::after {
	-webkit-transition: all 0.3s;
	-moz-transition: all 0.3s;
	-o-transition: all 0.3s;
	transition: all 0.3s;
}
button {
	background: none;
	border: 3px solid #fff;
	border-radius: 5px;
	color: lightgrey;
	display: block;
	font-size: 1.6em;
	font-weight: bold;
	margin: 1em auto;
	padding: 0px 18px;
	position: relative;
	text-transform: uppercase;
}
button::before,
button::after {
	background: #fff;
	content: '';
	position: absolute;
	z-index: -1;
}

button:hover {
	color: white;
	background: black;
}
.btns{
	width: 100%;
	height: 100px;
	position: absolute;
}
.btn{
	border:1px solid black;
	background:white;
	width: 100px;
	height: 50px;
  	overflow: hidden;
  	display: inline-block;
  	margin-left: 5px;
  	margin-right: 5px;
  	color: black;
}
.btn::after {
	height: 100%;
	left: -35%;
	top: 0;
	transform: skew(50deg);
	transition-duration: 0.6s;
	transform-origin: top left;
	width: 0;
}
.btn:hover:after {
	height: 100%;
	width: 135%;
}
#timeInfoTable{
	width: 500px;
	height: 100%;
}
#timeInfoTable td{
	border-bottom: 3px solid lightgrey;
}
li{
   list-style:none;
   border-bottom: 0.3px soild lightgrey;
}
.item{
	width: 100%;
	height: 10px;
	margin: 0px;
	padding: 0px;
}
.info h5{
	margin: 0px;
	padding: 0px;
}
.info {
    text-align: left;
    clear: both;
    padding: 3em 0;
    opacity: 0.7;
    color: #aca89a;
}
#infoTable td{
	border-bottom: 3px solid lightgrey;
	height: 80px;
}
#placesList td{
	height: 10px;
	margin: 0px;
	padding: 0px;
}
#placesList tr:hover{
	background: whitesmoke;
	cursor: pointer;
}
#placeInfoTable{
	width: 700px;
	height: 100%;
}
#placeInfoTable td{
	font-size: 13px;
	border-bottom: 3px solid lightgrey;
}
#searchLocation{
 	width: 80px;
 	height: 28px;
 	border: 1px solid black;
 	background: white;
 	font-size: 15px;
 	color: black;
	padding: 0;
}
input, select{
	height: 35px;
	text-align-last:center;
}
/* 위에는 현모형 css 
밑에부터 나 css */
#title{
	font-size: 40px; 
	margin-top: 120px; 
	border-bottom: 5px solid grey;
}
</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="outer" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%; ">
<div id = "title">${pe.eTitle } 수정</div>
	<div class="ha-waypoint" data-animate-down="ha-header-show"
		data-animate-up="ha-header-subshow"
		style="height: 730px; width: 90%; border: black; margin: auto;">

<section id="employer-post-new-job">
	<div class="row">
		<div class="container">
			<div class="row">
				<form id = "modifyForm" action="personPlayListModify.pl" method = "post">
				<input type = hidden name = "eNum" value="${pe.eNum }">
					<div class="col-xs-10 col-xs-offset-1" id="container">
						<div class="res-steps-container">
							<div class="res-steps res-step-one active"
								data-class=".res-form-one">
								<div class="res-step-bar">1</div>
								<div class="res-progress-bar"></div>
								<div class="res-progress-title" id = "basicLabel"
									style="width: 170px; margin: auto;">기본정보</div>
							</div>
					<div class="res-steps res-step-two" data-class=".res-form-two">
						<div class="res-step-bar">2</div>
						<div class="res-progress-bar"></div>
						<div class="res-progress-title" id = "locationLabel"
							style="width: 170px; margin: auto;">장소</div>
					</div>
					<div class="res-steps res-step-three"
						data-class=".res-form-three">
						<div class="res-step-bar">3</div>
						<div class="res-progress-bar"></div>
						<div class="res-progress-title" id = "timeLabel"
							style="width: 170px; margin: auto;">시간</div>
					</div>
					<div class="res-steps res-step-four"
						data-class=".res-form-four">
						<div class="res-step-bar">4</div>
						<div class="res-progress-bar"></div>
						<div class="res-progress-title" id = "submitLabel"
							style="width: 170px; margin: auto;">제출</div>
					</div>
				</div>
			
		<div class="clearfix">&nbsp;</div>

		<div class="res-step-form col-md-8 col-md-offset-2 res-form-one" style = "width: 80%; height: 570px;">
			<div class = "contents">
				<h2 id = "subTitle"  align="center" style = "margin-top: 0px">기본 정보</h2>
				<div id = "infoTable" style = "width: 50%; margin-left: 30%; margin-right: 20%; ">
					<table>
					<tr>
						<td style = "width: 40%; font-size: 20px; text-align: center">용병 등록 제목</td>
						<td style = "width: 60%;">
							<input id = "playerTitle" name = "eTitle" type = "text" value="${pe.eTitle }" style = "width: 400px;">
						</td>
					</tr>
					<tr>
						<td style = "width:40%; font-size : 20px; text-align:center"> 매너 </td>
						<td> 
							<select id = manner name = "eManner" style = "width: 400px; text-align: center;">
								<option value="${pe.eManner }">${pe.eManner }</option>
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하">하</option>
							</select>
						</td>
					</tr>
					<tr>
						<td style = "width:40%; font-size : 20px; text-align:center"> 실력 </td>
						<td>
							<select id = skill name = "eSkill" style = "width: 400px; text-align: center;">
								<option value="${pe.eSkill }">${pe.eSkill }</option>
								<option value="상">상</option>
								<option value="중">중</option>
								<option value="하">하</option>
							</select>
						</td>
					</tr>
					</table>
				</div>
			</div>
			<div class = "btns" align="center">
				<c:url var="playMain" value="playMain.pl">
				</c:url>
				<button type="button" onclick="location.href='${playMain}'" style = "float : none;"
					class="btn btn-default col-xs-offset-1 btn res-btn-orange"
					data-class=".res-form-two">Main</button>
				<button type="button"
					class="btn btn-default btn res-btn-gray"
					data-class=".res-form-one">Next</button>
			</div>
		</div>

		<div class="res-step-form col-md-8 col-md-offset-2 res-form-two" style = "width: 80%; height: 570px;">
			<div class = "contents">
				<h2  id = "subTitle" align="center" style = "margin-top: 0px">장소 선택</h2>
				<div id = "map"  style = "display: inline-block;">
				
				</div>
				<div id = "placeInfo" style = "display: inline-block; margin-left: 10%;">
					<table>
						<tr>
							<td style = "width: 30%">
							<input id = "keyword" type = "text" value = "강남역" style = "margin: 0px; padding: 0px; font-size: 20px;">
							</td>
							<td style = "width: 20%">
							<button id = "searchLocation" onclick = "searchPlaces(); return false;">검색</button>
							</td>
							<td style = "width: 500%">
								<h6 style = "margin: 0px;">선택된 장소</h6>
								<h3 id = "cplace" style = "margin-top: 2px;">${pe.ePlace }</h3>
								<input id = "cplaceName" name = "ePlace" style = "display: none;" value="${pe.ePlace }"></input>
								<input id = "cplaceX" name = "ePlaceX" value="${pe.ePlaceX }" style = "display: none;"></input>
								<input id = "cplaceY" name = "ePlaceY" value="${pe.ePlaceY }" style = "display: none;"></input>
							</td>
						</tr>
					</table>
					<div id = "scroll" style =  "overflow:auto; width: 720px; height: 350px;">
					<table id = "placeInfoTable" style = "border: none;" >
						<tr>
							<td colspan="3">
								<div id= "menu_wrap" style = "font-size: 1px;">
									<table id="placesList" style = "margin: 0px; text-align: left"></table>
									<div id="pagination" style = "font-size: 30px; text-align: center"></div>
								</div>
							</td>
						</tr>
					</table>
					</div>
				</div>

			</div>
			
			<div class = "btns" align="center">
				<button type="button" style = "float : none;"
					class="btn btn-default col-xs-offset-1 btn res-btn-orange"
					data-class=".res-form-two">Back</button>
				<button type="button"
					class="btn btn-default btn res-btn-gray"
					data-class=".res-form-two">Next</button>
			</div>
		</div>

		<div class="res-step-form col-md-8 col-md-offset-2 res-form-three" style = "/* border: 3px solid blue; */ width: 80%; height: 570px;">
			<div class = "contents">
				<h2 id = "subTitle"  align="center" style = "margin-top: 0px">시간 선택</h2>
				<div id = "calendar" style = "display: inline-block;">
					　
				</div>
				
				<div id = "timeInfo" style = "display: inline-block; margin-left: 10%;">
				
					<table id = "timeInfoTable" style = "border: none;">
						<tr>
							<td style = "width: 30%"><h4>날짜</h4></td>
							<td style = "width: 40%"><h6 style = "margin: 0px;">선택된 날짜</h6>
							<h4 id = "dayInfo" style = "font-size: 22px; margin-top: 0px; margin-bottom: 0px;">${pe.eDay }</h4></td>
							<td style = "width: 40%">
							<input type = "text" id = "mDayInfo" name = "eDay" style = "display: none;" value="${pe.eDay }"></input>
							</td>
						</tr>
						<tr>
							<td><h4>참여 가능 시간</h4></td>
							<td>
								<select name = "esHour" style = "width: 100px; text-align: center;">
									<option value = "${pe.esHour }">${pe.esHour }</option>
									<%for(int i = 0 ; i<10 ; i++){ %>
									<option value = "0<%=i%>">0<%=i%></option>
									<%}%>
									<%for(int i = 10 ; i<25 ; i++){ %>
									<option value = "<%=i%>"><%=i%></option>
									<%}%>
								</select>
								시
							</td>
						</tr>
						<tr>
							<td><h4>참여 가능 시간</h4></td>
							<td>
								<select name ="efHour" style = "width: 100px;">
									<option value = "${pe.efHour }">${pe.efHour }</option>
									<%for(int i = 0 ; i<10 ; i++){ %>
									<option value = "0<%=i%>">0<%=i%></option>
									<%}%>
									<%for(int i = 10 ; i<25 ; i++){ %>
									<option value = "<%=i%>"><%=i%></option>
									<%}%>
								</select>
								시
							</td>
						</tr>
					</table>
					<br><br><br><br><br>
				</div>
			</div>
			<div class = "btns" align="center">		
				<button type="button" style = "float : none;"
					class="btn btn-default col-xs-offset-1 btn res-btn-orange"
					data-class=".res-form-three">Back</button>
				<button type="button"
					class="btn btn-default btn res-btn-gray"
					data-class=".res-form-three">Next</button>
			</div>
		</div>

		<div class="res-step-form col-md-8 col-md-offset-2 res-form-four" style = "/* border: 3px solid yellow; */ width: 80%; height: 570px;">
				<div class = "contents" style = "margin-left: 25%; margin-right: 25%; margin-top: 0px;">
					<h2 style = "padding-top: 50px; margin-top: 0px; margin-bottom: 0px;">남기는말</h2>
					<textarea id = "mContent" name = "eContent" rows="10" cols="80" style = "resize: none;">${pe.eContent }</textarea>
				</div>
				<div class = "btns" align="center">
		</form>
					<button type="button"
						class="btn btn-default btn res-btn-orange"
						data-class=".res-form-four">Back</button>
					<button type=button class="btn" onclick = "submitModify();" data-class=".res-form-four">Submit</button>
				</div>
		</div>
		</div>
	</div>
	</div>
</div>
</section>
</div>
</div>

<script type="text/javascript">
	function submitModify(){		
		if($$("#playerTitle").val() == ""){
			alert("용병 등록 제목을 입력하세요.");
			$$("#basicLabel").click();
			return false;
		}else if($$("#cplace").html() == "장소를 선택하세요."){
			alert("장소를 선택하세요.");
			$$("#locationLabel").click();
			return false;
		}else if($$("#dayInfo").html() == "날짜를 선택하세요."){
			alert("날짜를 선택하세요.");
			$$("#timeLabel").click();
			return false;
		}else if($$("#mContent").val() == ""){
			alert("남기실 말을 입력하세요.");
			return false;
		}else if($$("#skill").val() == ""){
			alert("실력을 선택하세요.");
			$$("#basicLabel").click();
			return false;
		}else if($$("#manner").val() == "") {
			alert("매너를 선택하세요.");
			$$("#basicLabel").click();
			return false;
		}
		$$("#modifyForm").submit();
	}
</script>
	<!-- 카카오 맵 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f9f6250199748b3a23d7b3d7d88dde&libraries=services"></script>
<script>
// 마커를 담을 배열입니다
var markers = [];

var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new kakao.maps.Map(mapContainer, mapOption); 

//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
var mapTypeControl = new kakao.maps.MapTypeControl();

// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
var zoomControl = new kakao.maps.ZoomControl();
map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

// 장소 검색 객체를 생성합니다
var ps = new kakao.maps.services.Places();  

// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
var infowindow = new kakao.maps.InfoWindow({zIndex:1});


// 키워드로 장소를 검색합니다
searchPlaces();

// 키워드 검색을 요청하는 함수입니다
function searchPlaces() {
    var keyword = document.getElementById('keyword').value;
    if (!keyword.replace(/^\s+|\s+$/g, '')) {
        alert('키워드를 입력해주세요!');
        return false;
    }
    // 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
    ps.keywordSearch( keyword, placesSearchCB); 
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
    var el = document.createElement('tr'),
    itemStr = '<span class="markerbg marker_' + (index+1) + '"></span>' +
                '<td class="info" style ="width:400px;">' +
                '   <h4>' + places.place_name + '</h4></td>';
    if (places.road_address_name) {
        itemStr += '    <td><span>' + places.road_address_name + '</span>' +
                    '   <span class="jibun gray">' +  places.address_name  + '</span>';
    } else {
        itemStr += '    <td><span>' +  places.address_name  + '</span>'; 
    }       
    	itemStr += '  <span class="tel"> ' + places.phone  + '</span>' +
                '</td>';           
    el.innerHTML = itemStr;
    el.className = 'item';
	el.onclick = function (){
		if(confirm("장소를 선택하시겠습니까?") == false){
			return false;
		}
		$$("#cplace").html(places.place_name);
		$$("#cplaceName").val(places.place_name);
		$$("#cplaceX").val(places.x);
		$$("#cplaceY").val(places.y);
	}
    return el;
}
// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, idx, title) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
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
<script type="text/javascript">
	function checkNumber(num) { 
		num.value = comma(uncomma(num.value)); 
	}
	function comma(str) { 
		str = String(str); 
		return str.replace(/(\d)(?=(?:\d{3})+(?!\d))/g, '$1,'); 
	} 
	function uncomma(str) { 
		str = String(str); 
		return str.replace(/[^\d]+/g, ''); 
	}
</script>
<script type="text/javascript">
$(document).ready(function(){
	var steps = ['.res-step-one','.res-step-two','.res-step-three','.res-step-four'];
	var i = 1;
		
	$(".res-form-one").css("left","10%");
	$(".res-step-form .res-btn-orange").click(function(){
		var getClass = $(this).attr('data-class');
		$(".res-steps").removeClass('active');
		i--;
		$(steps[i-1]).addClass('active');
		$(getClass).prev().css('left','-150%')
		$(getClass).animate({
			left: '150%'
		}, 500);
		$(getClass).prev().animate({
			left: '10%'
		}, 500)
	});	
	$(".res-step-form .res-btn-gray").click(function(){
		var getClass = $(this).attr('data-class');
		$(".res-steps").removeClass('active');
		$(steps[i]).addClass('active');
		i++;
		if(getClass != ".res-form-four"){
			$(getClass).animate({
				left: '-150%'
			}, 500, function(){
				$(getClass).css('left', '150%');
			});
			$(getClass).next().animate({
				left: '10%'
			}, 500, function(){
				$(this).css('display','block');
			});
		}
	});
	/* click from top bar steps */
	$('.res-step-one').click(function(){
		if(!$(this).hasClass('active')){
			$(".res-steps").removeClass('active');
			i = 0;
			$(steps[i]).addClass('active');
			i++;
			$('.res-form-one').css('left','-150%');
			$('.res-form-two, .res-form-three, .res-form-four').animate({
				left: '150%'
			}, 500);
			$('.res-form-one').animate({
				left: '10%'
			}, 500);
		}
	});
	$('.res-step-two').click(function(){
		if(!$(this).hasClass('active')){
			$(".res-steps").removeClass('active');
			i = 1;
			$(steps[i]).addClass('active');
			i++;
			$('.res-form-two').css('left','-150%');
			$('.res-form-one, .res-form-three, .res-form-four').animate({
				left: '150%'
			}, 500);
			$('.res-form-two').animate({
				left: '10%'
			}, 500);
		}
	});
	$('.res-step-three').click(function(){
		if(!$(this).hasClass('active')){
			$(".res-steps").removeClass('active');
			i = 2;
			$(steps[i]).addClass('active');
			i++;
			$('.res-form-three').css('left','-150%');
			$('.res-form-one, .res-form-two, .res-form-four').animate({
				left: '150%'
			}, 500);
			$('.res-form-three').animate({
				left: '10%'
			}, 500);
		}
	});
	$('.res-step-four').click(function(){
		if(!$(this).hasClass('active')){
			$(".res-steps").removeClass('active');
			i = 3;
			$(steps[i]).addClass('active');
			i++;
			$('.res-form-four').css('left','-150%');
			$('.res-form-one, .res-form-two, .res-form-three').animate({
				left: '150%'
			}, 500);
			$('.res-form-four').animate({
				left: '10%'
			}, 500);
		}
	});
});
</script>
<script>
	var $head = $( '#ha-header' );
	$( '.ha-waypoint' ).each( function(i) {
		var $el = $( this ),
			animClassDown = $el.data( 'animateDown' ),
			animClassUp = $el.data( 'animateUp' );
	
		$el.waypoint( function( direction ) {
			if( direction === 'down' && animClassDown ) {
				$head.attr('class', 'ha-header ' + animClassDown);
			}
			else if( direction === 'up' && animClassUp ){
				$head.attr('class', 'ha-header ' + animClassUp);
			}
		}, { offset: '100%' } );
	} );
</script>
<jsp:include page = "../common/footer.jsp"/>
</body>
</html>