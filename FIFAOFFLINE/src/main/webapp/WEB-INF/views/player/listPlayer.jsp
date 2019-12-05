<%@page import="com.sun.glass.ui.Size"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
* {
	box-sizing: border-box;
}
.teamsearchB:hover {
	background: #0b7dda;
}
.example::after {
  	content: "";
 	clear: both;
 	display: table;
}
table {
 	border-collapse: collapse;
  	width: 100%;
}
td {
	padding: 16px;
	height:170px;
	width:170px;
	font-size:20px;
	text-align:center;
	align:center;
}
th {
	padding:16px;
	height:65px;
	font-weight:bold;
	font-size:22px;
	text-align:center;
	align:center;
}
.timgtag{
	display:inline-block;
	padding-left:10px;
}
thead th {
    background-color: #0d47a1;
    color:white;
}
thead tr {
	background-color: #0d47a1;
	color: #ffffff;
}
tbody tr:nth-child(4n-3) {
	background-color: #e3f2fd;
}
tbody tr:nth-child(4n-1) {
	background-color: #e3f2fd;
}

#playerMenu .menu__item-name::after, #playerMenu .menu__item-name::before{
	background: red;
}
#playerMenu.menu__item::after, #playerMenu.menu__item::before{
   	color: red;
}
.teamselector:hover{
	background-color:#8EA8DB;
	cursor:pointer;
}
.spacetr{
	height:30px;
}
hr.new4 {
	border: 1px solid red;
}
.searchInfo{
	text-align:right;
	margin-bottom:0px;
	padding-right:150px;
	font-size:16px;
	margin-right:60px;
}
.searchBInfo{
	margin-bottom:0px;
	font-size:20px;
	padding-left:375px;
	padding-top:300px;
	padding-bottom:10px;
}
.addressB:hover{
	color:white;
	background: #2AF08E;
}
.addressB{
	background-color:white;
	border:1px solid black;
	border-radius:13px;
}
.clicked{
	color:white;
	background: #2AF08E;
}
/* 위에는 효찬이형 버전 css */
/* 여기서부터 내가 만든 css */
#title{
	font-size: 40px; 
	 
	border-bottom: 5px solid grey;
}
.card-carousel {
	display: flex;
	align-items:center;
	justify-content:center;
	position:relative;
}
.card-carousel .my-card {
	height:400px;
	width:500px;
    position:relative;
    z-index:1;
    -webkit-transform: scale(0.6) translateY(-2rem);
    transform: scale(0.6) translateY(-2rem);
    opacity:0;
    cursor:pointer;
    pointer-events:none;
    background: linear-gradient(totop,#2e5266,#6e8898);
    transition:1s;
}
.card-carousel .my-card:after {
	content:'';
	position:absolute;
	height:5px;
	width:100%;
	border-radius:100%;
	background-color: rgba(0,0,0,1);
	bottom:-3rem;
	-webkit-filter: blur(4px);
	filter: blur(4px);
}
.card-carousel .my-card.active {
	z-index:3;
	-webkit-transform: scale(1) translateY(0) translateX(0);
	transform: scale(1) translateY(0) translateX(0);
	opacity:1;
	pointer-events:auto;
	transition:1s;
}
.card-carousel .my-card.prev, .card-carousel .my-card.next {
	z-index:2;
	-webkit-transform: scale(0.8) translateY(-1rem) translateX(0);
	transform: scale(0.8) translateY(-1rem) translateX(0);
	opacity:0.9;
	pointer-events:auto;
	transition:1s;
}
.card-carousel .my-card:nth-child(1):before {
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	font-size:2em;
	font-weight:300;
	color:#fff;
}
.card-carousel .my-card:nth-child(2):before {
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	font-size:2em;
	font-weight:300;
	color:#fff;
}
.card-carousel .my-card:nth-child(3):before {
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	font-size:2em;
	font-weight:300;
	color:#fff;
}
.card-carousel .my-card:nth-child(4):before {
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	font-size:2em;
	font-weight:300;
	color:#fff;	
}
.card-carousel .my-card:nth-child(5):before {
	position:absolute;
	top:50%;
	left:50%;
	-webkit-transform: translateX(-50%) translateY(-50%);
	transform: translateX(-50%) translateY(-50%);
	font-size:2em;
	font-weight:300;
	color:#fff;
}
div[id^="player"]{ 
	width:100%;
	height:100%;
	transform-style: preserve-3d;
	transform-origin: center right;
	transition: transform 1s;
}  
.front {
	position: absolute;
	width: 100%;
	height: 100%;
	text-align: center;
	backface-visibility: hidden;
	padding: 5px;
}
.back {
	position: absolute;
	width: 100%;
	height: 100%;
	backface-visibility: hidden;
	transform: rotateX(180deg);
	padding: 5px;
}
#btn{
	margin-left:1150px;
}
#playerEnroll, #playerRecruit{
	width:250px;
	height: 70px;
	font-size: 3.5em;
	font-weight: bold;
	background: white;
	border: 1px solid white;
}
#playerEnroll:hover, #playerRecruit:hover{
	color:white;
	background: #2AF08E;
	border-radius: 13px;
}
#cardDetailBtn{
	background:black;
	border : 1px solid black;
	color : white;
	margin-left : 42px;
	width : 250px;
	height : 50px;
	font-size: 30px;
}
#cardDetailBtn:hover{
	cursor: pointer;
	background:white;
	color:black;
}
</style>
</head>
<jsp:include page = "../common/header.jsp"/>

<body>

<div id = "outer" style = "margin-top:180px; background-image: url('resources/images/ba2.jpg'); background-size:100% 100%;">
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:800px; margin:auto; padding-bottom:50px;">
		<div id = "title"> 오늘의 추천 용병 </div> <br><br><br><br>
		<div class="card-carousel">
		<c:forEach var="pp" items="${person }" varStatus="status">
			<c:url var="ppDetail" value="playPersonDetail.pl">
				<c:param name="eNum" value="${pp.eNum }"/>
			</c:url>
			<div class="my-card">
			  	<div id = "player${status.count }" class = "change">
			  		<div class="front" onclick="toggleTrsf(${status.count})">
			  			<img src="resources/proFiles/${pp.proFile }" style="width:100%; height:85%;">
			  			<div style="font-size:5em; font-weight: bold;">${pp.userName }</div>
			  		</div>
			  		<div class="back"  onclick="toggleTrsf(${status.count})">
			  			<div style="font-size:4em; font-weight:bold; text-align: center; border-bottom: 3px solid gray;">${pp.eTitle }</div> <br>
			  			<div style="font-size:3em; font-weight:bold;">매너 : ${pp.eManner }</div> <br>
			  			<div style="font-size:3em; font-weight:bold;">실력 : ${pp.eSkill }</div> <br>
			  			<div style="font-size:2.5em; font-weight:bold;">가능 장소 : ${pp.ePlace }</div> <br>
			  			<div style="font-size:2.5em; font-weight:bold;">가능 날짜 : ${pp.eDay }</div> <br>
			  			<div style="font-size:2.5em; font-weight:bold;">가능 시간 : ${pp.esHour } 시  ~ ${pp.efHour } 시</div> <br><br><br>
			  			<input type = button value = "상세보기" id = cardDetailBtn onclick="location.href='${ppDetail }'">
			  		</div>
				</div>
			</div>
			<%-- <% } %> --%>
			<!-- <div class="my-card">
				<div id = "player2" class = "change">
			  		<div class="front" onclick="toggleTrsf(2)">
			  			<img src="resources/images/man.jpg" style="width:100%; height:100%;">
			  		</div>
			  		<div class="back"  onclick="toggleTrsf(2)">
			  			<img src="resources/images/degea.jpg" style="width:100%; height:100%;">
			  		</div>
			  	</div>
			</div>
			<div class="my-card">
			  	<div id = "player3" class = "change">
			  		<div class="front" onclick="toggleTrsf(3)">
			  		용병 프로필 사진 + 이름 등 간단 신상
			  		</div>
			  		<div class="back"  onclick="toggleTrsf(3)">
			  		해당 용병에 대한 포지션 및 가능 시간 등 상세정보 
			  		<input type = button value= "가나다" onclick="test()">
			  		</div>
			  	</div>
			</div>
			<div class="my-card">
			 	<div id = "player4" class = "change">
			  		<div class="front" onclick="toggleTrsf(4)">
			  			<img src="resources/images/juventus.jpg" style="width:100%; height:100%;">
			  		</div>
			  		<div class="back"  onclick="toggleTrsf(4)">
			  			<img src="resources/images/dybala.jpg" style="width:100%; height:100%;">
			  		</div>
			  	</div>
			</div>
			<div class="my-card">
			  	<div id = "player5" class = "change">
			  		<div class="front" onclick="toggleTrsf(5)">
			  			<img src="resources/images/leicester.jpg" style="width:100%; height:100%;">
			  		</div>
			  		<div class="back"  onclick="toggleTrsf(5)">
			  			<img src="resources/images/youri.jpg" style="width:100%; height:100%;">
			  		</div>
			  	</div>
			  </div> --> 
			</c:forEach> 
			</div><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
			<div id = btn> 
				<input type = button id = playerEnroll value = "개인 용병 등록" onclick="playerEnroll()">
				<input type = button id = playerRecruit value = "팀 용병 모집" onclick="playerRecruit()"> 
			</div>
		</div>
		
	<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "width: 90%; margin: auto;">
		<div id=title> 용병 모집 현황 </div> <br><br><br>
		<table>
			<thead>
			<tr>
				<th class="playList">팀 로고</th>
				<th class="playList">팀 명</th>
				<th class="playList">제목</th>
				<th class="playList">경기장</th>
				<th class="playList">경기 날짜</th>
				<th class="playList">경기 시간</th>
				<th class="playList">용병 마감 인원</th>
				<th class="playList">참가비</th>
			</tr>
			</thead>
			<tbody>
			<c:forEach var="tp" items="${team }">
				<c:url var="ptDetail" value="playTeamDetail.pl">
					<c:param name="rNum" value="${tp.rNum }"/>
				</c:url>
  				<tr class="teamselector" onclick="location.href='${ptDetail}'">
			    <td class="playList">
			    	<div style="height:100%; width:80" class="Timgtag">
			    		<%-- <input type="hidden" value="<%=i%>" class="hiddenTno<%=i%>"> --%>
			    		<img src="<%=request.getContextPath()%>/resources/images/logo.png" style="width:100%; height:100%; padding-left:25px;">
			    	</div>
			    </td>
			    <td class="playList">${tp.teamName } </td>
			    <td class="playList">${tp.rTitle }</td>
			    <td class="playList">${tp.rPlace }</td>
			    <td class="playList">${tp.rDay }</td>
			    <td class="playList">${tp.rsHour } : ${tp.rsMin } ~ <br> ${tp.rfHour } : ${tp.rfMin }</td>
			    <td class="playList">${tp.deadline } 명</td>
			    <td class="playList">${tp.rMoney } 원</td>
  			</tr>
  			<tr class="spacetr"></tr>
			</c:forEach>
  			</tbody>
		</table>
	</div>
</div>
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

function playerRecruit(){  
	location.href="playTeamCreate.pl";
}
function playerEnroll(){
	location.href="playPersonCreate.pl";
}

$(document).ready( function() {
	$(".addressB").click(function(){
		$(this).toggleClass('clicked');
	});
});

// 여기서부터 카드 뒤집기
	$num = $('.my-card').length;
	$even = $num / 2;
	$odd = ($num + 1) / 2;

	if ($num % 2 == 0) {
		$('.my-card:nth-child(' + $even +')').addClass('active');
  		$('.my-card:nth-child(' + $even +')').prev().addClass('prev');
  		$('.my-card:nth-child(' + $even +')').next().addClass('next');
	}else {
  		$('.my-card:nth-child(' + $odd +')').addClass('active');
  		$('.my-card:nth-child(' + $odd +')').prev().addClass('prev');
  		$('.my-card:nth-child(' + $odd +')').next().addClass('next');
	}
	$('.my-card').click(function() {
		$slide = $('.active').width();
		console.log($('.active').position().left);
  	if ($(this).hasClass('next')) {
		$('.card-carousel').stop(false,true).animate({left:'-=' + $slide});
  	} else if ($(this).hasClass('prev')) {
    	$('.card-carousel').stop(false,true).animate({left:'+=' + $slide});
  	}
	$(this).removeClass('prev next');
	$(this).siblings().removeClass('prev active next');
	$(this).addClass('active');
 	$(this).prev().addClass('prev');
  	$(this).next().addClass('next');
});

function toggleTrsf(id) {
    var card = $("#player"+id);
    
    if(card.parent().hasClass("prev") == true || card.parent().hasClass("next") == true){
		return false;
    }
    if (card.hasClass("change") == true) {
    	card.css("transform", "rotateX(-180deg)");
		card.removeClass("change");
    } else {
		card.css("transform", "");
		card.addClass("change");
	}   
}  // 여기까지 카드 뒤집기



</script>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>