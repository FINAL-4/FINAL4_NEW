<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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
	width : 250px;
	height : 250px;
	margin-top : 50px;
	margin-left: 200px;
}
#pictureContent{
	font-size:2.4em;
	font-weight: bold;
	margin-top : 30px;
	margin-left: 270px;
}
#detailContent1{
	margin-left:150px;
	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	letter-spacing: 6px;
}
#detailContent2{
	margin-left:70px;
	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	letter-spacing: 4px;
}
#btn{
	margin-left : 210px;
}
#recruitBtn, #applyBtn, #deleteBtn, #modifyBtn {
	width:250px;
	height: 50px;
	font-size: 2em;
	font-weight: bold;
	background: white;
	border: 1px solid white;
}
#applyingBtn{
	width:505px;
	height:50px;
	font-size: 2em;
	font-weight: bold;
	background: white;
	border: 1px solid white;
}
#recruitBtn:hover, #applyBtn:hover, #applyingBtn:hover, #deleteBtn:hover, #modifyBtn:hover{
	color:white;
	background: #2AF08E;
	border-radius: 13px;
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
  padding: 20px;
  border: 1px solid #888;
  width: 800px;
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
}

img.avatarM {
  width: 40%;
  border-radius: 50%;
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

.myTeamInfo{
	color:dodgerblue;
}
.myTeamInfo:hover{
	cursor:pointer;
}
</style>
</head>
<body>
<jsp:include page = "../common/header.jsp"/>
<div id="content" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<div id = "title"> 모집글 수정하기 </div>
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 900px; width: 90%; border: black; margin: auto;">
		<form>																									<!-- 730 -->
		<div style = "float:left;"> 
		<table align = center id = pictureContent>
			<tr>
				<img id = "picture" src="resources/images/testimage/${t.teamImage }"> 
				<td> ${t.teamName }</td>
			</tr>
		</table>
		</div>
		
		<div style = "float:left;">
		<div id = "detailContentDiv1">
		<table id = detailContent1> 
			<tr>
				<td>팀 장</td> 
				<td>
					${t.userName }
				</td>
			</tr>
			<tr>
				<td>활동지역</td>
				<td>
					${t.teamArea }
				</td>
			</tr>
			<tr>
				<td>모집인원</td>
				<td>
					<input type="text" value="${t.recruitCount }" class='recruitCount'>
				</td>
			</tr>
			<tr>
				<td align>모집내용 </td>
			</tr>
			<tr>
				<td colspan=2>
					<input type="text" value="${t.teamAdver }" class="teamAdver">
				</td>
			</tr>
			
			<tr>
				<td colspan=2> 나머지 정보는 <label class="myTeamInfo">팀 정보</label> 에서 수정이 가능합니다. </td>
			</tr>
		</table>
		</div>		
			<div id = btn>
				<div id = btnPosition1>
				<input type = button id = recruitBtn value="수정하기" onclick='updateTeamAD()'>
				<input type = button id = applyBtn value="취소하기"> <br> <br>
				</div>
			</div>
		</div>		
	</form>
</div>
</div>
<jsp:include page = "../common/footer.jsp"/>
</body>
<script>
	function updateTeamAD(){
		var teamNo=${t.teamNo};
		var teamAdver=$('.teamAdver').val();
		var recruitCount=$(".recruitCount").val();
		
		location.href="updateTeamAD.tm?teamNo="+teamNo+"&teamAdver="+teamAdver+"&recruitCount="+recruitCount;
		
	}
</script>
</html>