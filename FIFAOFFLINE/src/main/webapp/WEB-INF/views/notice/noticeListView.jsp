<%@page import="com.kh.FIFAOFFLINE.member.model.vo.Member"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%-- <%@ page session="false" %>  --%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member m = (Member)session.getAttribute("loginUser");

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width" initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
<title>Insert title here</title>
<style type="text/css">
a, a:hover {
	color: #000000;
	text-decoration: none;
}

/* Full-width input fields */
input[type=text], input[type=password] {
	width: 100%;
	padding: 12px 20px;
	margin: 8px 0;
	display: inline-block;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

/* Set a style for all buttons */
button {
	background-color: #4CAF50;
	color: white;
	padding: 14px 20px;
	margin: 8px 0;
	border: none;
	cursor: pointer;
	width: 100%;
}

button:hover {
	opacity: 0.8;
}

/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

/* Center the image and position the close button */
.imgcontainer {
	text-align: center;
	margin: 24px 0 12px 0;
	position: relative;
}

img.avatar {
	width: 40%;
	border-radius: 50%;
}

.container {
	padding: 16px;
}

span.psw {
	float: right;
	padding-top: 16px;
}

/* The Modal (background) */
.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.4); /* Black w/ opacity */
	padding-top: 60px;
}

/* Modal Content/Box */
.modal-content {
	background-color: #fefefe;
	margin: 5% auto 15% auto;
	/* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 80%; /* Could be more or less, depending on screen size */
}

/* The Close Button (x) */
.close {
	position: absolute;
	right: 25px;
	top: 0;
	color: #000;
	font-size: 35px;
	font-weight: bold;
}

.close:hover, .close:focus {
	color: red;
	cursor: pointer;
}

/* Add Zoom Animation */
.animate {
	-webkit-animation: animatezoom 0.6s;
	animation: animatezoom 0.6s
}

@
-webkit-keyframes animatezoom {
	from {-webkit-transform: scale(0)
}

to {
	-webkit-transform: scale(1)
}

}
@
keyframes animatezoom {
	from {transform: scale(0)
}

to {
	transform: scale(1)
}

}

/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
}

span.psw {
	display: block;
	float: none;
}

.cancelbtn {
	width: 100%;
}

.listTr:hover {
	background: whitesmoke;
	cursor: pointer;
}

#listTable{
	border-collapse: collapse;
}

#listTable td {
	border-bottom: 1px solid lightgrey;
	
}

#banner {
	border-bottom: 3px solid lightgrey;
}

#btns {
	width: 8%;
	display: inline-block;
}

#title {
	width: 90%;
	font-size: 55px;
	display: inline-block;
}

#cBtn{
	background: black;
	color: white;
	border: 1px solid black;
	font-size: 15px;
}

#cBtn:hover{
	background: white;
	color: black;
}

#searchDiv{
	font-size: 15px;
}

#searchDiv input{
	padding: 0px;
}

#searchDiv button{
	background: black;
	color: white;
	border: 1px solid black;
}

#searchDiv button:hover{
	background: white;
	color: black;
}

</style>

</head>
	<jsp:include page="../common/header.jsp"/>	
<body>

	<!-- 각페이지 고정 start -->
	<div id="outer" style="margin-top: 200px;">
		<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="width: 80%; height: 800px; margin: auto;">
			<div id = "banner">
				<h1 id = "title" style = "margin: 0px 0px 10px 5px;">게시판</h1>
				<div id = "btns">
					<input id = "cBtn" type="button" name="name" value="글쓰기" style= "height:40px; width:100%; " onclick="createBoard()">
				</div>
			</div>
			
			<div id = "searchDiv" style = "width: 80%; margin-left: 10%; margin-right: 10%; margin-top: 5px; margin-bottom: 10px;">
				<div id = "info" style = "text-align: center; height: 100px; vertical-align: center;"><h3 id = "searchInfo" style = "padding-top: 50px; margin: 0px; padding-bottom: 0px;">${info }</h3></div>
				<span style = "width: 50%; float: left;">
					<b style = "font-size: 17px;">분류</b>
					<select id = "catagorySearch" style = "width: 15%; height: 30px;">
						<option value = "0">전체</option>
						<c:forEach var="c" items="${cList }" begin="1">
						<option value="${c.cId }" <c:if test="${sc.catagory == c.cId}">selected</c:if>>${c.cName }</option>
						</c:forEach>
					</select>
				</span>
				
				<span style = "width: 50%; float: right; margin-bottom: 10px;">
					<select id = "contentSearch" style = "width: 15%; height: 30px; margin-left: 29%;">
						<option value = "nTitle" <c:if test="${sc.sCondition == 'nTitle'}">selected</c:if>>제목</option>
						<option value = "nContent" <c:if test="${sc.sCondition == 'nContent'}">selected</c:if>>내용</option>
						<option value = "nWriter" <c:if test="${sc.sCondition == 'nWriter'}">selected</c:if>>작성자</option>
						<option value = "plus" <c:if test="${sc.sCondition == 'plus'}">selected</c:if>>제목+내용</option>
					</select>
					<input id = "sContent" type = "text" style = "width: 45%; height: 30px; margin: 0px;">
					<button style = "width: 10%; height: 30px; padding: 0px;" onclick = "search();">검색</button>
				</span>
			</div>
			
			
			
			<div align="center">
					<!-- 각페이지 고정 end -->
					<!-- <table align="center" width="600" border="1" cellspacing="0" style="clear:right;" id="td"> -->
					<table id = "listTable" class="table table-bordered" style="text-align: center; border: 1px; width: 80%; font-size: 17px;">
							<tr style = "border-bottom: 1px solid black">
								<th style="background-color: #eeeeee; text-align: center;"
									width="10%" height="33px;">번 호</th>
								<th style="background-color: #eeeeee; text-align: center;"
									width="10%" height="33px;">분 류</th>
								<th style="background-color: #eeeeee; text-align: center;"
									width="40%">제 목</th>
								<th style="background-color: #eeeeee; text-align: center;"
									width="12%">작성자</th>
								<th style="background-color: #eeeeee; text-align: center;"
									width="10%">조회수</th>
								<th style="background-color: #eeeeee; text-align: center;"
									width="18%">작성일</th>
							</tr>
							<c:forEach var="n" items="${list }">
								<c:url var="ndetail" value="ndetail.do">
									<c:param name="nId" value="${n.nId }" />
									<c:param name="page" value="${pi.currentPage }" />
								</c:url>
								<tr id = "nId${n.nId }" class = "listTr" onclick = "location.href='${ndetail}'">
									<td align= "center" style = "height: 28px;">${n.nId }</td>
									<td class = "catagory" align= "center" style = "height: 28px;">${n.cName }</td>
									<td align ="left">${n.nTitle }&nbsp;&nbsp; <p style = "color:red; font-size: 8px; display: inline-block; border-bottom: 0.2px solid red;">+${n.likeCount }</p></td>
									<td align="left"><img src ="resources/proFiles/${n.profile }" width= "25px" height= "25px" style = "float: left; margin-left: 30px; margin-right: 5px;">${n.nWriter }</td>
									<td align="center">${n.nCount }</td>
									<td align="center">${n.nCreateDate }</td>
								</tr>
							</c:forEach>
					</table>
					
					
					<table id = "paginTable">
						<!-- 페이징 부분 -->
						<tr align="center" height="20">
							<td colspan="6">
							
							<!-- [이전] --> 
							<c:if test="${pi.currentPage == 1 }">
	 							[이전]&nbsp;
			 				</c:if> 
			 				<c:if test="${pi.currentPage > 1 }">
									<c:url var="nlistBack" value="nlist.do">
										<c:param name="page" value="${pi.currentPage - 1 }" />
										<c:param name="catagory" value="${sc.catagory }" />
										<c:param name="sCondition" value="${sc.sCondition }" />
										<c:param name="sContent" value="${sc.sContent }" />
									</c:url>
									<a href="${nlistBack }">[이전]</a>
							</c:if>
							 
							<!-- [번호들] --> 
							<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
							<c:if test="${p eq pi.currentPage }">
								<font color="red" size="4"><b>[${p}]</b></font>&nbsp;&nbsp;&nbsp;
	 						</c:if>
	
							<c:if test="${p ne pi.currentPage }">
								<c:url var="nlistCheck" value="nlist.do">
									<c:param name="page" value="${p }" />
									<c:param name="catagory" value="${sc.catagory }" />
									<c:param name="sCondition" value="${sc.sCondition }" />
									<c:param name="sContent" value="${sc.sContent }" />
	 							</c:url>
								<a href="${nlistCheck }">${p }</a>&nbsp;&nbsp;&nbsp;
	 						</c:if>
							</c:forEach> 
							
							<!-- [다음] --> 
							<c:if test="${pi.currentPage == pi.maxPage }">
	 							&nbsp;[다음]
	 						</c:if> 
	 						<c:if test="${pi.currentPage < pi.maxPage }">
								<c:url var="nlistEnd" value="nlist.do">
									<c:param name="page" value="${pi.currentPage + 1 }" />
									<c:param name="catagory" value="${sc.catagory }" />
									<c:param name="sCondition" value="${sc.sCondition }" />
									<c:param name="sContent" value="${sc.sContent }" />
								</c:url>
								<a href="${nlistEnd }">&nbsp;[다음]</a>
							</c:if>
							</td>
						</tr>
					</table>
				</div>
			</div>
		
		<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style="height: 10px; width: 90%; margin: auto;">
		</div>
	</div>

<script type="text/javascript">

	function search(){
		var catagory = $("#catagorySearch").val();
		var sCondition = $("#contentSearch").val();
		var sContent = $("#sContent").val();
		
		location.href = "nlist.do?catagory="+catagory+"&sCondition="+sCondition+"&sContent="+sContent;
		
	}


	$("#catagorySearch").change(function(){
		var catagory = $("#catagorySearch").val();
	
		location.href = "nlist.do?catagory="+catagory;
		
	});
</script>






<script type="text/javascript">
	$(function(){
		$(".catagory").filter(":contains('공지')").parent().css("background","#eeeeee");
		$("#sContent").val('${sc.sContent}');
	});

</script>


<script type="text/javascript">
	function createBoard(){
		<%if(m == null){%> 
			alert("로그인이 필요한 기능입니다.");
		<%}else{%>
			location.href='nWriterView.do'
		<%}%>
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

<script>
	function tdetail(id){
		alert($(".hiddenTno"+id).val());
	}
</script>

<script>
	$(document).ready( function() {
		$(".addressB").click(function(){
			$(this).toggleClass('clicked');
		});
	});
</script>
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>


    <jsp:include page="../common/footer.jsp"/>
</body>
</html>