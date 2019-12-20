<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
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

<!-- canvas 쓸때 -->
<script src = "https://www.dukelearntoprogram.com/course1/common/js/image/SimpleImage.js">


<title>Insert title here</title>



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
			
				alert($$(this).parent().parent().hasClass("fc-day-top"));
				
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

<style>

/* ---------선택된 메뉴 색상 변경-------- */
#teamMenu .menu__item-name::after,
#teamMenu .menu__item-name::before{
	background: red;
	color: red;
}

#teamMenu.menu__item::after,
#teamMenu.menu__item::before{
   	color: red;
}

#teamMenu .menu__item-name{
	color: red;
}
/* ----------------------------------- */

#img{
	width:400px;
	height:400px;
	margin-left:10%;
	border:3px solid grey;
}

#teamImgTag{
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
/* 	height: 80px; */
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
.checks{
	padding:20px;
}

label{
	padding-right:10px;
	font-size:0.8em;
}

.checks input[type="checkbox"] {  /* 실제 체크박스는 화면에서 숨김 */
  position: absolute;
  width: 1px;
  height: 1px;
  padding: 0;
  margin: -1px;
  overflow: hidden;
  clip:rect(0,0,0,0);
  border: 0
}
.checks input[type="checkbox"] + label {
  display: inline-block;
  position: relative;
  cursor: pointer;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
}
.checks input[type="checkbox"] + label:before {  /* 가짜 체크박스 */
  content: ' ';
  display: inline-block;
  width: 21px;  /* 체크박스의 너비를 지정 */
  height: 21px;  /* 체크박스의 높이를 지정 */
  line-height: 21px; /* 세로정렬을 위해 높이값과 일치 */
  margin: -2px 8px 0 0;
  text-align: center; 
  vertical-align: middle;
  background: #fafafa;
  border: 1px solid #cacece;
  border-radius : 3px;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05);
}
.checks input[type="checkbox"] + label:active:before,
.checks input[type="checkbox"]:checked + label:active:before {
  box-shadow: 0 1px 2px rgba(0,0,0,0.05), inset 0px 1px 3px rgba(0,0,0,0.1);
}

.checks input[type="checkbox"]:checked + label:before {  /* 체크박스를 체크했을때 */ 
  content: '\2714';  /* 체크표시 유니코드 사용 */
  color: #99a1a7;
  text-shadow: 1px 1px #fff;
  background: #e9ecee;
  border-color: #adb8c0;
  box-shadow: 0px 1px 2px rgba(0,0,0,0.05), inset 0px -15px 10px -12px rgba(0,0,0,0.05), inset 15px 10px -12px rgba(255,255,255,0.1);
}

.checks.etrans input[type="checkbox"] + label {
  padding-left: 30px;
}
.checks.etrans input[type="checkbox"] + label:before {
  position: absolute;
  left: 0;
  top: 0;
  margin-top: 0;
  opacity: .6;
  box-shadow: none;
  border-color: #6cc0e5;
  -webkit-transition: all .12s, border-color .08s;
  transition: all .12s, border-color .08s;
}

.checks.etrans input[type="checkbox"]:checked + label:before {
  position: absolute;
  content: "";
  width: 10px;
  top: -5px;
  left: 5px;
  border-radius: 0;
  opacity:1; 
  background: transparent;
  border-color:transparent #6cc0e5 #6cc0e5 transparent;
  border-top-color:transparent;
  border-left-color:transparent;
  -ms-transform:rotate(45deg);
  -webkit-transform:rotate(45deg);
  transform:rotate(45deg);
}

.no-csstransforms .checks.etrans input[type="checkbox"]:checked + label:before {
  /*content:"\2713";*/
  content: "\2714";
  top: 0;
  left: 0;
  width: 21px;
  line-height: 21px;
  color: #6cc0e5;
  text-align: center;
  border: 1px solid #6cc0e5;
}



</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
	<div id = "title" style = "font-size: 40px; margin-top: 80px; margin-left: 5%;">매치 생성</div>
	<div id="outer" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%; ">
		<div class="ha-waypoint" data-animate-down="ha-header-show"
			data-animate-up="ha-header-subshow"
			style="height: 730px; width: 90%; border: black; margin: auto;">

			<section id="employer-post-new-job">
				<div class="row">
					<div class="container">
						<div class="row">
							<form id = "updateForm" action="updateTeam.tm" enctype="multipart/form-data" method="post">
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
											<div class="res-progress-title" id = "logoLabel"
												style="width: 170px; margin: auto;">팀 로고</div>
										</div>
										<div class="res-steps res-step-three"
											data-class=".res-form-three">
											<div class="res-step-bar">3</div>
											<div class="res-progress-bar"></div>
											<div class="res-progress-title" id = "introLabel"
												style="width: 170px; margin: auto;">팀 소개</div>
										</div>
										<div class="res-steps res-step-four"
											data-class=".res-form-four">
											<div class="res-step-bar">4</div>
											<div class="res-progress-bar"></div>
											<div class="res-progress-title" id = "submitLabel"
												style="width: 170px; margin: auto;">제출(미리보기)</div>
										</div>
									</div>
									
									<div class="clearfix">&nbsp;</div>
	
									<div class="res-step-form col-md-8 col-md-offset-2 res-form-one" style = "/* border: 3px solid red; */ width: 80%; height: 570px;">
										<div class = "contents">
											<h2 id = "subTitle"  align="center" style = "margin-top: 0px">기본 정보</h2>
											<div id = "infoTable" style = "width: 50%; margin-left: 30%; margin-right: 20%; ">
												<table>
													<tr>
														<td style = "width: 40%; font-size: 20px; text-align: center">팀 이름</td>
														<td style = "width: 60%;">
															<input id="teamName" name="teamName" type = "text" style = "width: 400px;" value="${t.teamName }" readonly>
															<div id="checkId" class="checkInfo" style="font-size: 0.7em"></div>
														</td>
													</tr>
													<tr>
														<td style = "width: 40%; font-size: 20px; text-align: center">활동지역 선택</td>
														<td class="checks">
														
														<c:if test="${t.teamArea == '역삼/개포/청담' }">
					 										<c:set var="ex_chk1" value="CHECKED"/>
					 									</c:if>
					 									
					 									<c:if test="${t.teamArea == '삼성/대치/신사' }">
					 										<c:set var="ex_chk2" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '논현/압구정/세곡' }">
					 										<c:set var="ex_chk3" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '자곡/율현/일원' }">
					 										<c:set var="ex_chk4" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '수서/도곡/대치1' }">
					 										<c:set var="ex_chk5" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '대치2/대치4/역삼1' }">
					 										<c:set var="ex_chk6" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '역삼1/역삼2/도곡1' }">
					 										<c:set var="ex_chk7" value="CHECKED"/>
					 									</c:if>
					 									<c:if test="${t.teamArea == '도곡2/개포1/일원본' }">
					 										<c:set var="ex_chk8" value="CHECKED"/>
					 									</c:if>
												 		
															<div class="checks etrans">
  																<input type="checkbox" id="ex_chk1" ${ex_chk1 } name="teamArea" value="역삼/개포/청담" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk1">역삼/개포/청담</label> 
  																<input type="hidden" name="teamNo" value="${t.teamNo }">
  																<input type="hidden" name="ImgStr" value="${t.teamImage }">
  																<input type="checkbox" id="ex_chk2" ${ex_chk2 } name="teamArea" value="삼성/대치/신사" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk2">삼성/대치/신사</label>
															</div>
															<div class="checks etrans">
  																<input type="checkbox" id="ex_chk3" ${ex_chk3 } name="teamArea" value="논현/압구정/세곡" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk3">논현/압구정/세곡</label>
  																
  																<input type="checkbox" id="ex_chk4" ${ex_chk4 } name="teamArea" value="자곡/율현/일원" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk4">자곡/율현/일원</label> 
															</div>	
															<div class="checks etrans">
  																<input type="checkbox" id="ex_chk5" ${ex_chk5 } name="teamArea" value="수서/도곡/대치1" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk5">수서/도곡/대치1</label>
  																
  																<input type="checkbox" id="ex_chk6" ${ex_chk6 } name="teamArea" value="대치2/대치4/역삼1" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk6">대치2/대치4/역삼1</label> 
															</div>	
															<div class="checks etrans">
  																<input type="checkbox" id="ex_chk7" ${ex_chk7 } name="teamArea" value="역삼1/역삼2/도곡" onclick="oneCheckbox(this)"> 
  																<label for="ex_chk7">역삼1/역삼2/도곡</label>
  																
  																<input type="checkbox" id="ex_chk8" ${ex_chk8 } name="teamArea" value="도곡2/개포/일원본" onclick="oneCheckbox(this)">
  																<label for="ex_chk8">도곡2/개포/일원본</label> 
  																<input type="hidden" id="chkvalue" value="1">
  																<input type="hidden" id="prevealVal" value="${t.teamArea }">
															</div>	
														</td>
													</tr>
												</table>
											</div>
										</div>
										<div class = "btns" align="center">
											<button type="button"
												class="btn" onclick = "goMatch();"
												data-class="">이전</button>
											<button type="button"
												class="btn btn-default btn res-btn-gray"
												data-class=".res-form-one">다음</button>
										</div>
									</div>
	
									<div class="res-step-form col-md-8 col-md-offset-2 res-form-two" style = "/* border: 3px solid green; */ width: 80%; height: 570px;">
										<div class = "contents" style="display:inline">
											<h2  id = "subTitle" align="center" style = "margin-top: 0px">팀 로고</h2>
											<h4 id = "subsubTitle" align="center" >이미지를 선택해주세요.</h4>
											<div id ="img">
												<img id="teamImg" style="display:inline-block; width:100%; height:100%" src="resources/images/team/${t.teamImage }">
											</div>
											
											<canvas id = "teamImgTag"  style="display:none">
											
											</canvas>
											<input type="file" name="uploadFile" id ="uploadFile" onchange = "upload()" value="${t.teamImage }">
										</div>
										
										
										<div class = "btns" align="center">
											<button type="button" style = "float : none;"
												class="btn btn-default col-xs-offset-1 btn res-btn-orange"
												data-class=".res-form-two">이전</button>
											<button type="button"
												class="btn btn-default btn res-btn-gray"
												data-class=".res-form-two">다음</button>
										</div>
									</div>
									
									<div class="res-step-form col-md-8 col-md-offset-2 res-form-three" style = "/* border: 3px solid yellow; */ width: 80%; height: 570px;">
											<div class = "contents" style = "margin-left: 25%; margin-right: 25%; margin-top: 0px;">
												<h2 style = "padding-top: 50px; margin-top: 0px; margin-bottom: 0px;">팀 소개</h2>
												<textarea id = "teamIntro" name = "teamIntro" rows="10" cols="80" style = "resize: none;">${t.teamIntro }</textarea>
											</div>
											<div class = "btns" align="center">
												<button type="button"
													class="btn btn-default btn res-btn-orange"
													data-class=".res-form-three">이전</button>
												<button type="button"
														class="btn btn-default btn res-btn-gray"
														data-class=".res-form-three" onclick="preveal()">다음</button>
											</div>
									</div>
	
									
	
									<div class="res-step-form col-md-8 col-md-offset-2 res-form-four" style = "/* border: 3px solid yellow; */ width: 80%; height: 570px;">
											<h2 id = "subTitle"  align="center" style = "margin-top: 0px">미리보기</h2>
											<div id = "infoTable" style = "width: 50%; margin-left: 30%; margin-right: 20%; ">
												<table>
													<tr>
														<td style = "width: 40%; font-size: 20px; text-align: center">팀 명</td>
														<td style = "width: 60%;">
															<input id ="copyTeamName" type = "text" style = "width: 400px;" readonly>
														</td>
													</tr>
													<tr>
														<td style = "width: 40%; font-size: 20px; text-align: center">활동 지역</td>
														<td style = "width: 60%;">
															<input id = "copyTeamArea" type = "text" style = "width: 400px;" readonly>
														</td>
													</tr>
													<tr>
														<td style = "width: 40%; font-size: 20px; text-align: center">팀 소개</td>
														<td style = "width:60%;">
															<textarea id = "copyTeamIntro" rows="10" cols="50" readonly></textarea>
														</td>		
													</tr>
												</table>
											</div>
										
											<div class = "btns" align="center">
												<button type="button"
													class="btn btn-default btn res-btn-orange"
													data-class=".res-form-four">이전</button>
												<button type="button" onclick="submitCreate();"
													class="btn"
													data-class=".res-form-four">제출</button>
											</div>
									</div>
								</div>
							</form>
						</div>
					</div>
				</div>
			</section>
		</div>
	</div>


<script type="text/javascript">
	function goMatch(){
		location.href='goMatch.ma';
	}
</script>


<script type="text/javascript">
	
	var isImg = true;
	var teamNameCheck = true;
	var checkValue = document.getElementById("chkvalue").value;
	
	function submitCreate(){
		var teamName = document.getElementById("teamName").value;
		var teamIntro = document.getElementById("teamIntro").value;
		var basicLabel = document.getElementById("basicLabel");
		var logoLabel = document.getElementById("logoLabel");
		var introLabel = document.getElementById("introLabel");
		
		if(teamName == ""){
			alert("팀명을 입력하세요");
			basicLabel.click();
			return false;
		}else if(checkValue == "0"){
			alert("팀 활동지역을 입력하세요");
			basicLabel.click();
			return false;
		}else if(!isImg){
			alert("이미지를 입력하세요");
			logoLabel.click();
			return false;
		}else if(teamIntro == ""){
			alert("팀 소개를 입력하세요");
			introLabel.click();
			return false;
		}else if(!teamNameCheck){
			alert("팀 이름을 확인하세요.");
			basicLabel.click();
			return false;
		}
		
		
		
		$$("#updateForm").submit();
	}

	
	function upload(){
	$("#img").css("display","none");
	$("#teamImgTag").css("display","inline-block");	
		
	var Ican = document.getElementById ("teamImgTag");
	var proup = document.getElementById ("uploadFile");
	var ima1 = new SimpleImage (proup);
	ima1.drawTo (Ican);
	
	isImg = true;
	}
	
	$("#teamName").keyup(function() {
		var teamName = document.getElementById("teamName").value;
		var idRe = /^[a-z,A-Z,0-9,가-힣]{2,12}$/;

		$.ajax({
			url : "Du.tm",
			data : {
				teamName : teamName
			},
			success : function(data) {
				if (teamName == "") {
					$("#checkId").css("color", "#f53f29");
					$("#teamName").css("border", "2px solid #f53f29");
					$("#checkId").text("팀 이름을 입력하세요.");
					teamNameCheck = false;
				} else if (!idRe.test(teamName)) {
					$("#checkId").css("color", "#f53f29");
					$("#teamName").css("border", "2px solid #f53f29");
					$("#checkId").text("2-12의 영문자,숫자,한글만 입력가능합니다.");
					teamNameCheck = false;
				} else if (data.Usable ==false) {
					$("#checkId").css("color", "#f53f29");
					$("#teamName").css("border", "2px solid #f53f29");
					$("#checkId").text("중복된 팀 이름입니다.");
					teamNameCheck = false;
				} else {
					$("#checkId").text("사용가능한 팀 이름입니다.");
					$("#checkId").css("color", "green");
					$("#teamName").css("border", "2px solid blue");
					teamNameCheck = true;
				}
			}
			
		});
	});
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
			preveal();
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
<script type="text/javascript">

function oneCheckbox(a){
    var obj = document.getElementsByName("teamArea");
    
    checkValue = "1";

    for(var i=0; i<obj.length; i++){

        if(obj[i] != a){
            obj[i].checked = false;
        }
    }
    
    $('#prevealVal').val(a.value);
    
    
}

function preveal(){
	$('#copyTeamName').val($('#teamName').val());
	$('#copyTeamArea').val($('#prevealVal').val());
	$('#copyTeamIntro').val($('#teamIntro').val());
}

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