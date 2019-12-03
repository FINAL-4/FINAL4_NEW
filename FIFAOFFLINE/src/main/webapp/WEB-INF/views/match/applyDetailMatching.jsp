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
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<script src="resources/js/jquery.hovercard.min.js"></script>
<title>Insert title here</title>
<style>
/* ---------선택된 메뉴 색상 변경-------- */
#matchMenu .menu__item-name::after,
#matchMenu .menu__item-name::before{
	background: red;
	color: red;
}

#matchMenu.menu__item::after,
#matchMenu.menu__item::before{
   	color: red;
}

#matchMenu .menu__item-name{
	color: red;
}
/* ----------------------------------- */


#title{
	font-size: 40px; 
	margin-top: 120px; 
	border-bottom: 5px solid grey;
}

#teamContent{
	width: 20%;
	margin-left:3%;
	margin-right:2%;
	font-size:2.4em;
	font-weight: bold;
	margin-top : 3%;
	display: inline-block;
}

#detailContentDiv1{

	width: 40%;
	margin-right:2%;
	margin-left:2%;
	display: inline-block;
	margin-top : 3%;
}

#locationDiv{

	width: 25%;
	margin-right:3%;
	margin-left:2%;
	display: inline-block;
	margin-top : 3%;
}


#detailContent1{
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	letter-spacing: 6px;
}
#detailContent2{

	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 60px 30px;
	letter-spacing: 4px;
}
#btn{
	margin-top: 2%;
}
#recruitBtn, #applyBtn, #deleteBtn, #modifyBtn {
	width:150px;
	height: 40px;
	font-size: 1.5em;
	font-weight: bold;
	background: black;
	border: 1px solid black;
	color: white;
}
#applyingBtn{
	width:505px;
	height:50px;
	color:white;
	font-size: 2em;
	font-weight: bold;
	background: black;
	border: 1px solid black;
}
#recruitBtn:hover, #applyBtn:hover, #applyingBtn:hover, #deleteBtn:hover, #modifyBtn:hover{
	color:black;
	background: white;
}
#applyDetail{
	margin-top:50px;
	margin-left:30px;
}
#applyDetailTable{
	width:320px;
	border-collapse: separate;
	border-spacing: 10px 25px;
} 

#applyDetailTable td{
	border-bottom: 1px solid lightgrey;
	border-collapse: collapse;
} 

.agreeBtn, .cancelBtn{
	width:35px;
	height:30px;
	font-weight: bold; 
	font-size:1.5em;
}
#agreeBtn:hover, #cancelBtn:hover, #closeBtn:hover{
	cursor: pointer;
}
#closeBtn{
	background: white;
	border: 1px solid white;
}
#detailContent1 td{
	width:400px;
	margin-left: 15px;
	border-bottom: 1px solid lightgrey;
}
#detailContent2 td{
	text-align:left;
}

#teamContent button{
	font-size: 15px;
	margin :auto;
	width: 100%;
	height: 5%;
	padding-top: 5px;
	padding-bottom: 5px;
}

h6{
	margin-top: 0px;
	margin-bottom: 10px;
	font-size: 20px;

}

</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 50px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
	<div id = "title" >
		<h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;">${match.mTitle }</h4>
		<div style = "width: 14%; display: inline-block;">
			<input type = button id = deleteBtn value = "글 삭제하기" onclick="location.href='${tplDelter}'" style = "width: 45%; height: 40px; padding: 0px; margin-right: 5%; font-size: 15px;">
			<input type = button id = modifyBtn value = "글 수정하기" onclick = "location.href='playTeamModify.pl'" style = "width: 45%; height: 40px; padding: 0px; font-size: 15px;" class="addressB">
		</div>
	</div>

	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 780px; width: 100%; border: black; margin: auto;">																									<!-- 730 -->
		
	
			<div id = teamContent style = "float:left;"> 
				<h6>팀정보</h6>
				<table align = "center" >
					<tr>
						<img id = "logo" src="resources/images/logo.png" width="50%;" height="300px;" style = "margin-left: 25%; margin-right: 25%;">
					</tr>
					<tr>
						<td colspan="2" style = "width: 100%; text-align: center;">팀 이름 어떻게 받지</td>
					</tr>
					<tr>
						<td style = "width: 50%; margin-left: 25%; margin-right: 25%;"><button>팀정보 보기</button></td>
					</tr>
				</table>
			</div>
			
			
			<div id = "detailContentDiv1">
				<h6>매치정보</h6>
				<table id = detailContent1> 
					<tr>
						<td style = "width: 30%;">경기 유형</td> 
						<td style = "width: 70%;">${match.mSystem }</td>
					</tr>
					<tr>
						<td>경기 날짜 </td>
						<td>${match.mDay }</td>
					</tr>
					<tr>
						<td>경기 시간</td>
						<td>
							${match.sHour }:${match.sMinute } ~  ${match.eHour }:${match.eMinute }
						</td>
					</tr>
					<tr>
						<td>경기 장소</td>
						<td>
							${match.mLocationName }
					</tr>
					<tr>
						<td>참가비 </td>
						<td>${match.dues } 원</td>
					</tr>
					<tr>
						<td colspan=2>${match.mContent }</td>
					</tr>
				</table>
			</div>
			
			<div id = "locationDiv">
				<h6 style = "margin-bottom: 5px;">상세위치 </h6>
				<div id = "map" style = "width: 420px; height: 400px; float: left; border: 2px solid grey;"></div>
			</div>
			
			
			<div id = btn style = "margin-left: 30%;">
					<input type = button id = applyingBtn value = "신  청  현  황" style = "margin-right: 26%;" onclick = "showAppMatch();">
					<input type = button id = recruitBtn value = "돌아가기" onclick = "location.href='goMatch.ma'" style = "margin-right: 1%;">
					<input type = button id = applyBtn value = "신청하기" onclick = "appMatch()">
			</div>	
			
			
			
			
				
		<div id = "applyDetail" style="display:none; background: white; width: 50%; margin: auto;"> 
			<table id = "applyDetailTable" style = "width: 50%; margin-left: 25%; margin-right: 25%;">
				<tr>
					<td colspan="3" style="border-bottom:3px solid gray; font-size: 2.3em;">
						신청현황
					</td>
				</tr>
				<c:forEach var="appMatch" items="${amList }" varStatus="status">
				<tr>
					<td style = "font-size:1.7em; width: 50%;">
						${appMatch.teamNo }
					</td>
					<td style = "width: 25%;"> 
						<input type = button id = "detailTeamBtn" name = "O" value="팀상세보기" style="background: black; color:white; font-size: 15px;">
					</td>
					<td style = "width: 25%;"> 
						<input type = button id = "matchingBtn" name = "O" value="매칭하기" style="background: black; color:white; font-size: 15px;" onclick = "">
					</td>
				</tr>
				</c:forEach>
				<tr>
					<td colspan=3 align = right style = "border-bottom: none;">
						<input type = button id = closeBtn value="닫기" style="font-weight: bold; font-size:2em;">
					</td>
				</tr>
			</table>
		</div>

	</div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f9f6250199748b3a23d7b3d7d88dde&libraries=services"></script>
<script type="text/javascript">
	var X = Number("${match.mLocationX }");
	var Y = Number("${match.mLocationY }");
	var N = "${match.mLocationName}";
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(Y, X), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	//지도에 컨트롤을 추가해야 지도위에 표시됩니다
	//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(Y, X); 

	var imageSrc = 'resources/images/marker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(80, 80), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(38, 80)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    image: markerImage
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:0px; font-size: 13px;">'+N+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(Y, X); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 
	
	
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
	});
	

</script>


<script	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script type="text/javascript">
	function showAppMatch(){
			$$("#applyDetail").bPopup();
	}


</script>


<script type="text/javascript">
	function appMatch(){
		location.href="appMatch.ma?mId="+${match.mId}+"&tId=4";
		
	}

</script>


           

<script type="text/javascript">
	$$(document).ready(function () {
                            var hoverHTMLDemoOpenLeft = "zzzzzzzzzzzzzz";
                        
    $$("#applyBtn").hovercard({
        detailsHTML: hoverHTMLDemoOpenLeft,
        width: 350,
        openOnRight: true
    });
});
</script>




<jsp:include page = "../common/footer.jsp"/>
</body>
</html>