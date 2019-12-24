<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.team.model.vo.MyTeam, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
#teamMenu .menu__item-name::after,
#teamMenu .menu__item-name::before{
   background: red;
}
#teamMenu.menu__item::after,
#teamMenu.menu__item::before{
   color: red;
}
#title{
	font-size: 40px; 
	margin-top: 120px; 
	border-bottom: 5px solid grey;
}
#picture{
	width : 300px;
	height : 250px;
	margin-top : 50px;
	margin-left: 200px;
}
#pictureContent{
	font-size:2.4em;
	font-weight: bold;
	margin-top : 30px;
	margin-left: 200px;
}
#detailContent1{
	margin-left:150px;
	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	/* letter-spacing: 6px; */
}
#detailContent2{
	margin-left:70px;
	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	/* letter-spacing: 4px; */
}
#btn{
	margin-left : 210px;
}
#recruitBtn, #applyBtn{
	width:250px;
	height: 50px;
	font-size: 2em;
	font-weight: bold;
	background: black;
	border: 1px solid white;
	color:white;
}
#deleteBtn{
	background:black;
	border:1px solid black;
	color:white;
	width: 45%; 
	height: 40px; 
	padding: 0px; 
	margin-right: 5%; 
	font-size: 15px;
}
#modifyBtn{
	background:black;
	border:1px solid black;
	color:white;
	width: 45%; 
	height: 40px; 
	padding: 0px; 
	font-size: 15px; 
}
#applyingBtn{
	width:505px;
	height:50px;
	font-size: 2em;
	font-weight: bold;
	background: black;
	color:white;
	border: 1px solid white;
}
#recruitBtn:hover, #applyBtn:hover, #applyingBtn:hover, #deleteBtn:hover, #modifyBtn:hover{
	color:black;
	background: white;
	border-radius: 13px;
	border:1px solid black;
}
#applyDetail{
	margin-top:50px;
	margin-left:50px;
}
#applyDetailTable{
	width:320px;
	border-collapse: separate;
	border-spacing: 10px 25px;
} 
.agreeBtn, .cancelBtn{
	width:35px;
	height:30px;
	font-weight: bold; 
}

#agreeBtn:hover, #cancelBtn:hover, #closeBtn:hover, .detailBtn:hover{
	cursor: pointer;
}
#closeBtn{
	background: white;
	border: 1px solid white;
}
#detailContent1 td{
	width:400px;
	text-align:left;
}
#detailContent2 td{
	text-align:left;
}
.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 16px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}
.chip img:hover{
	cursor:pointer;
}

/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 1; /* Sit on top */
  padding-top: 100px; /* Location of the box */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
}

/* Modal Content */
.modal-contentM {
  background-color: #fefefe;
  margin: auto;
  z-index:2;
  padding: 20px;
  border: 1px solid #888;
  width: 600px;
}

/* The Close Button */
.closeM {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.closeM:hover,
.closeM:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.imgcontainerM {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
  height:150px;
  vertical-align:center;
}

img.avatarM {
  width: 50%;
  height:100%;
}

.container {
  padding: 16px;
}
.animateM {
  -webkit-animation: animatezoom 0.6s;
  animation: animatezoom 0.6s
}

@-webkit-keyframes animatezoom {
  from {-webkit-transform: scale(0)} 
  to {-webkit-transform: scale(1)}
}
  
@keyframes animatezoom {
  from {transform: scale(0)} 
  to {transform: scale(1)}
}

.card:hover{
	cursor:pointer;
}

</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<br><br><br><br><div id = "title"> 
	<h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;">모집글 수정</h4>
	
</div>
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 900px; width: 90%; border: black; margin: auto;">																								<!-- 730 -->
		<div style = "float:left;"> 
		<table align = center id = pictureContent>
			<tr>
				<img id = "picture" src="resources/images/team/${t.teamImage }"> 
			</tr>
			<tr>
				<td style="width:100%; text-align:center;">팀 이름 : ${t.teamName }</td>
			</tr>
			<tr>
				<td colspan="2">${scoreStr}</td>
			</tr>
		</table>
		</div>
		
		<div style = "float:left;">
		<div id = "detailContentDiv1">
		<table id = detailContent1> 
			<tr style="">
				<td style="font-weight:bold;">팀 장</td> 
				<td>${t.userName }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">활동지역</td>
				<td>${t.teamArea }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;">모집인원</td>
				<td class="tRecruitCount">
					<input type="text" class="recruitCount" placeholder="${t.recruitCount }">
				</td>
			</tr>
			<tr>
				<td style="font-weight:bold;"> 모집내용 </td>
			</tr>
			<tr>
				<td colspan=2>
					<textarea rows="5" cols="40" wrap="hard" placeholder="${t.teamAdver }" class="teamAdver"></textarea>
				</td>
			</tr>
			
			<tr>
				<td colspan=2>
					나머지 정보는 <a href="managedTeam.tm" style="color:dodgerblue; font-size:20px;">팀 정보</a> 에서 수정 가능합니다.
				</td>
				
			</tr>
		</table>
		</div>
		
			<div id = btn>
				<div id = btnPosition1>
				<input type = button id = recruitBtn value = "수정하기" onclick='updateTeamAD()'>
				<input type = button id = applyBtn value="취소하기" onclick="cancelUpdate()"> <br> <br>
				</div>
			</div>
		</div>		
	</div>
</div>

<jsp:include page = "../common/footer.jsp"/>

<script>
	function updateTeamAD(){
		var teamNo=${t.teamNo};
		var teamAdver=$('.teamAdver').val();
		var recruitCount=$(".recruitCount").val();
		
		swal({
			  title: "수정하시겠습니까?",
			  icon: "info",
			  buttons: true,
			  dangerMode: true,
			})
			.then((willDelete) => {
			  if (willDelete) {
				  location.href="updateTeamAD.tm?teamNo="+teamNo+"&teamAdver="+teamAdver+"&recruitCount="+recruitCount;
			  } else {
			    swal("수정 취소");
			  }
			});
	}
	
	function cancelUpdate(){
		var teamNo = ${t.teamNo};
		
		location.href="tdetail.tm?teamNo="+teamNo;
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
	});
</script>
</body>
</html>