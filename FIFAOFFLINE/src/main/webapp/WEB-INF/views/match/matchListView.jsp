<%@page import="com.kh.FIFAOFFLINE.member.model.vo.Member"%>
<%@page import="com.kh.FIFAOFFLINE.team.model.vo.MyTeam"%>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	ArrayList<MyTeam> mt = (ArrayList)session.getAttribute("myTeam");
	Member m = (Member)session.getAttribute("loginUser");

	int[] tIdArr = null;
	
	boolean flag = false;
	
	if(mt != null){
		tIdArr = new int[mt.size()];
	
		for(int i = 0 ; i < mt.size() ; i++){
			tIdArr[i] = mt.get(i).getTeamNo();
		}
	}

%>

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

/* Style the search field */

.teamsearchB:hover {
  background: #0b7dda;
}

/* Clear floats */
.example::after {
  content: "";
  clear: both;
  display: table;
}
/* .example{
	float:right;
} */
table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
  /* border: 1px solid #ddd; */
  /* border-top: 1px solid #444444; */

}


/* td {
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
} */

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



.teamselector:hover{
	background-color:#8EA8DB;
	cursor:pointer;
}
.spacetr{
	height:80px;
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
/* .searchButtons{
	padding-top:300px;
} */
.searchBInfo{
	/* text-align:left; */
	margin-bottom:0px;
	font-size:20px;
	padding-left:375px;
	padding-top:300px;
	padding-bottom:10px;
}
.addressB:hover{
   color:white;
   background: black;

}
.addressB{
	color: black;
	background-color:white;
	border:2px solid black;
}

.addressA:hover{
   color:white;
   background: black;

}
.addressA{
	color: black;
	background-color:white;
	border:2px solid black;
}

.createBtn{
	color: black;
	background-color:white;
	border:2px solid black;
}

.createBtn:hover{
   color:white;
   background: black;

}


.clicked{
   color:white;
   background: black;
}

#btns{
	width: 20%;
	display: inline-block;
}

#searchTbDiv{
	width: 100%;
	height: 80%;
	margin: auto;
	
	margin-top: 120px;
}

#searchTable{
	width: 90%;
	height: 70%;
	margin: auto;
	
}

/* ============ 상단 검색/필터 ============= */

#searchTable, #searchTable tr{
	
}

#searchTable td{
	font-size: 20px;
	background: lightgrey;
	padding-left: 5%;
}


.search{
	padding: 0%;
	margin-left: 5%; 
	margin-right: 5%;
}

.search h3{
	margin-top: 0px;
	margin-bottom: 30px;
	font-size: 25px;
}



#matchingDate{
	padding-top: 0%;
	padding-bottom: 2%;
	width: 90%;
}

#matchingDate input{
	border: none;
	background: white;
	width: 30%;
	height: 30px;
	text-align-last:center;
}

#matchingSystem select{
	border: none;
	background: white;
	width: 60%;
	height: 30px;
	text-align-last:center;
}

#matchingDay button{
	font-size: 20px;
	width: 10%;
	margin-left:1%;
	margin-right:1%;
	height: 8%;
	text-align: center;
	border: none;
	padding-bottom: 5px;
	padding-top: 5px;
}

#matchingTime button{
	font-size: 20px;
	width: 13%;
	margin-left:1%;
	margin-right:1%;
	height: 8%;
	text-align: center;
	border: none;
	padding-bottom: 5px;
	padding-top: 5px;
}

#matchingSystem{
	padding-top: 0%;
	padding-bottom: 2%;
}


#mSystem{
	margin-top:2%;
	width: 30%;
	border: none;
	text-align-last:center;
}

/* ===================================================== */


#matchingList{
	
}


#matchingList td{
	padding-left: 15px;
}

#matchingList h4{
	font-size: 20px;
	margin: 0px;
}

#matchingList h5{
	font-size: 18px;
	margin: 0px;
}

#matchingList h6{
	font-size: 11px;
	margin: 0px;
}

#matchingTable {
	border-bottom: 2px solid lightgrey;
	border-top: 2px solid lightgrey;
	margin-bottom: 2%;
}

#matchingTable:hover{
	border-bottom: 2px solid lightgrey;
	border-top: 2px solid lightgrey;
	background: lightgrey;
	cursor: pointer;
}

.ingStatus{
	padding-top:80px;
/* 	margin-top:20px;    */ 
	-webkit-transform: rotate(10deg);
    -moz-transform: rotate(10deg);
}

.ingDiv:hover{
	cursor: pointer;
	background: white;
}

</style>
</head>
<jsp:include page = "../common/header.jsp"/>

<body>

<div id = "outer" style = "margin-top:180px;">
	

<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:800px; margin:auto; padding-bottom:0px;">
		<div id = "searchContent" style="height:100%; width:100%; border-bottom:3px solid grey; margin-top: 100px;">

			<div style = "height: 10%; border-bottom: 2px solid grey;">
				<h1 style="font-size:45px; margin-bottom: 10px; margin-top: 00px; width: 80%; display: inline-block;">매칭</h1>
				<div id = "btns" style = "width: 19%;">
					<%if(m != null){ %>
					<button type = "button" id = "myBtn" class = "addressA" style = "width: 45%; height: 100%; padding: 15px; margin-right: 5%; font-size: 15px;" onclick = "showMyMatch()">나의 매치</button>
					<button type = "button" class = "addressA" style = "align:right; width: 45%; height: 100%; padding: 15px; font-size: 15px;" onclick = "goCreateMatch('${loginUser}')">매치 생성</button>
					<%}else{ %>
					<button type = "button" style = "margin-left:35%; align:right; width: 45%; height: 100%; padding: 15px; font-size: 15px;" class="addressA" onclick = "goCreateMatch('${loginUser}')">매치 생성</button>
					<%} %>
				</div>			
			</div>

			<div id = "searchTbDiv">
				<table id = "searchTable" >
					<tr>
						<td>
							<div id = "matchingDate" class = "search">
								<h3>시합 날짜</h3>
								<input type = "date" id = "sDate" value = "">부터
								<input type = "date" id = "eDate" value = "">까지
							</div>
						</td>
						<td>
							<div id = "matchingDay" class = "search">
								<h3>요일</h3>
								<button type = "button" id = "mon" class = "addressB">월</button>
								<button type = "button" id = "tue" class = "addressB">화</button>
								<button type = "button" id = "wed" class = "addressB">수</button>
								<button type = "button" id = "thu" class = "addressB">목</button>
								<button type = "button" id = "fri" class = "addressB">금</button>
								<button type = "button" id = "sat" class = "addressB">토</button>
								<button type = "button" id = "sun" class = "addressB">일</button>
							</div>
						</td>
					</tr>
					<tr>
						<td>
							<div id = "matchingSystem" class = "search">
								<h3>시합 유형</h3>
								<select id = "mSystem" name = "mSystem">
									<option id = "resetSystem" value = "">==선택==</option>
									<option value = "5 VS 5">5 VS 5</option>
									<option value = "6 VS 6">6 VS 6</option>
									<option value = "7 VS 7">7 VS 7</option>
									<option value = "8 VS 8">8 VS 8</option>
									<option value = "9 VS 9">9 VS 9</option>
									<option value = "10 VS 10">10 VS 10</option>
									<option value = "11 VS 11">11 VS 11</option>
								</select>
							</div>
						</td>
						<td>
							<div id = "matchingTime" class = "search">
								<h3>시간</h3>
								<button type = "button" id = "time1" class = "addressB">00~04</button>
								<button type = "button" id = "time2" class = "addressB">04~08</button>
								<button type = "button" id = "time3" class = "addressB">08~12</button>
								<button type = "button" id = "time4" class = "addressB">12~16</button>
								<button type = "button" id = "time5" class = "addressB">16~20</button>
								<button type = "button" id = "time6" class = "addressB">20~24</button>
							</div>
						</td>
					</tr>					
				</table>
			</div>
		</div>
	</div>
	
	
	<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "width: 90%; margin: auto;">

		<c:choose>
		<c:when test = "${fn:length(mList) != 0 }">
		<div id = "matchingList">
			<c:forEach var="match" items="${mList }" varStatus="status">
				<div style = "position: relative; z-index: 1;">
				<table id = "matchingTable"  style  = "height: 150px;" onclick = "goMatchDetail(${match.mId});">
					<tr style = "height: 33%;">
						<td rowspan="2" style = "width: 20%; height: 80%; text-align: center;">
							<div id = "teamLogo" style = "width: 60%; margin-left:20%; margin-right: 20%;">
								<img id = "logo" src="resources/images/team/${match.teamImg }" style = "border: 1px solid lightgrey; width: 80%; height: 100px;">
							</div>
						</td>
						<td colspan="3" style = "width: 80%;"><h4>${match.mTitle }</h4></td>
					</tr>
					<tr style = "height: 33%;">
						<td style = "width: 30%;">
							<h6>장소</h6>
							<h5>${match.mLocationName }</h5>
						</td>
						<td style = "width: 30%;">
							<h6>일시</h6>
							<h5>${match.mDay }</h5>
						</td>
						<td style = "width: 20%;">
							<h6>회비</h6>
							<h5>${match.dues }원</h5>
						</td>
					</tr>
					<tr style = "height: 33%;">
						<td style = "width: 20%; text-align: center;">
							<div id = "teamInfo">
								<h5>${match.teamName }</h5>
								<h6>${match.userName} </h6>
							</div>
						</td>
						<td>
							<h6>유형</h6>
							<h5>${match.mSystem }</h5>
						</td>
						<td>
							<h6>시간</h6>
							<h5>${match.sHour }:${match.sMinute } ~ ${match.eHour }:${match.eMinute }</h5>
						</td>	
						<td>
							<h6>등록일</h6>
							<h5>${match.createDate }</h5>
						</td>	
						<td>
							<input type="hidden" name = "mId" value = "">
						</td>
					</tr>
				</table>
				</div>
				<c:if test="${match.mStatus == 'ING' }">
					<div class = "ingDiv" style = "position: relative; z-index: 2; background: black; height: 150px; top: -185px; margin-bottom: -150px; opacity: 0.3;" onclick="goMatchDetail(${match.mId});">
						<div style = "margin-left: 45%;">
							<h1 class = "ingStatus"style  = "color: white; font-size: 80px; margin-top: 0px; margin-bottom: 0px;">진행 중</h1>
						</div>
					</div>
				</c:if>
			</c:forEach>
		</div>
		</c:when>
		<c:otherwise>
			<div id = "matchingList">
				<h1 style = "text-align: center; font-size: 30px;">등록된 매치가 존재하지 않습니다.</h1>
			</div>
		</c:otherwise>
		</c:choose>

		
	</div>
</div>


<script type="text/javascript">
	function goMatchDetail(mId){
		location.href="goMatchDetail.ma?mId="+mId;
	}


</script>


<script type="text/javascript">

	function showMyMatch(){
		if($("#myBtn").hasClass('clicked')){
			showNewList();
			$("#myBtn").toggleClass('clicked');
			
			return false;
			
		}
		
		$("#myBtn").toggleClass('clicked');
		
		var tidArr = new Array();
		
		<%if(tIdArr != null && tIdArr.length != 0){%>
			<%for(int i = 0; i < tIdArr.length ; i++){%>
				tidArr[<%=i%>] = <%=tIdArr[i]%>;
			<%}%>
			
			$.ajax({
				url:"showMyList.ma",
				data:{tidArr:String(tidArr)
				},
				success:function(data){
					
					$("#matchingList").html("");
					
					if(data.length != 0){
					for(var i in data){
						$("#matchingList").append("<table id = 'matchingTable'  style  = 'height: 150px;' onclick = 'goMatchDetail("+data[i].mId+");'>"+
								"<tr style = 'height: 33%;'>"+
									"<td rowspan='2' style = 'width: 20%; height: 80%; text-align: center;'>"+
										"<div id = 'teamLogo' style = 'width: 60%; margin-left:20%; margin-right: 20%; '>"+
										"<img id = 'logo' src='resources/images/team/"+data[i].teamImg+"' style = 'border: 1px solid lightgrey; width: 80%; height: 100px;'>"+
										"</div>"+
									"</td>"+
									"<td colspan='3' style = 'width: 80%;'><h4>"+data[i].mTitle+"</h4></td>"+
								"</tr>"+
								"<tr style = 'height: 33%;'>"+
									"<td style = 'width: 30%;'>"+
										"<h6>장소</h6>"+
										"<h5>"+data[i].mLocationName+"</h5>"+
									"</td>"+
									"<td style = 'width: 30%;'>"+
										"<h6>일시</h6>"+
										"<h5>"+data[i].mDay+"</h5>"+
									"</td>"+
									"<td style = 'width: 20%;'>"+
										"<h6>회비</h6>"+
										"<h5>"+data[i].dues+"원</h5>"+
									"</td>"+
								"</tr>"+
								"<tr style = 'height: 33%;'>"+
									"<td style = 'width: 20%; text-align: center;'>"+
										"<div id = 'teamInfo'>"+
											"<h5>"+data[i].teamName+"</h5>"+
											"<h6>"+data[i].userName+"</h6>"+
										"</div>"+
									"</td>"+
									"<td>"+
										"<h6>유형</h6>"+
										"<h5>"+data[i].mSystem+"</h5>"+
									"</td>"+
									"<td>"+
										"<h6>시간</h6>"+
										"<h5>"+data[i].sHour+":"+data[i].sMinute+" ~ "+data[i].eHour+":"+data[i].eMinute+"</h5>"+
									"</td>"+
									"<td>"+
										"<h6>등록일</h6>"+
										"<h5>"+data[i].createDate+"</h5>"+
									"</td>"+
									"<td>"+
										"<input type='hidden' name = 'mId' value = ''>"+
									"</td>"+
								"</tr>"+
							"</table>");	
							if(data[i].mStatus == 'ING'){
								$("#matchingList").append("<div class = 'ingDiv' style = 'position: relative; z-index: 2; background: black; height: 150px; top: -185px; margin-bottom: -150px; opacity: 0.3;' onclick='goMatchDetail("+data[i].mId+");'>"+
								"<div style = 'margin-left: 45%;'>"+
									"<h1 class = 'ingStatus' style  = 'color: white; font-size: 80px; margin-top: 0px; margin-bottom: 0px;'>진행 중</h1>"+
								"</div>"+
							"</div>");
							}
					}
					}else{
						$("#matchingList").html("<h1 style = 'text-align: center; font-size: 30px;'>검색 결과가 없습니다.</h1>");
						
					}
					$("#mSystem").val("").prop("selected", true);
					$("#sDate").val("");
					$("#eDate").val("");
					$(".addressB").removeClass("clicked");

				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			})
		<%}else{%>
			alert("소속된 팀이 없습니다.");
			$("#myBtn").toggleClass('clicked');
		<%}%>
		
	}

</script>



<script type="text/javascript">
	function goCreateMatch(loginUser){
		
		if(loginUser == ""){
			alert("로그인이 필요합니다.");
			return false;
		}else{
			<%if(mt == null){%>
			alert("소속된 팀이 없어 매칭생성이 불가합니다.");
			<%}else{%>
				<%for(int i = 0 ; i < mt.size() ; i++){
					if(mt.get(i).getT_Grade()==1){
						flag = true;
					}
				}%>
			<%}%>
		}
		<%if(flag){%>
			location.href="goCreateMatch.ma";
		<%}else{%>
			alert("주장만이 매칭을 생성할 수 있습니다.");
		<%}%>
	}


</script>


<!-- 검색/필터  -->
<script type="text/javascript">

	
	
	/* 버튼들 클릭되었을 시 */
	$(".addressB").click(function(){
		$(this).toggleClass('clicked');
		if($("#sDate").val() != "" && $("#eDate").val() == ""){
			alert("종료날짜를 먼저 입력하세요.");
			$("#eDate").focus();
			$(this).toggleClass('clicked');
			
			return false;
		}else{
			showNewList();
		}
		
	});
	
	/* 유형이 선택되었을 시 */
	$("#mSystem").change(function(){
		if($("#sDate").val() != "" && $("#eDate").val() == ""){
			alert("종료날짜를 먼저 입력하세요.");
			$("#eDate").focus();
			$(this).val("");
			
			return false;
		}else{
			showNewList();
		}
		
	});

	/* 날짜가 선택되었을 시 */
	$(function(){
		
		$("#eDate").change(function(){
			if($("#sDate").val() == ""){
				alert("시작날짜를 입력하세요.");
				$("#eDate").val("");
				$("#sDate").focus();
				
				return false;
			}else if($("#eDate").val() < $("#sDate").val()){
				alert("종료날짜는 시작날짜보다 빠를 수 없습니다.");
				$("#eDate").val("");
				$("#eDate").focus();
				
				return false;
			}else{
				showNewList();
			}
		});
	});

	
	function showNewList(){
		var eDate = $("#eDate").val(), sDate = $("#sDate").val();
		var mSystem = $("#mSystem").val();
		var mon, tue, wed, thu, fri, sat, sun;
		var time1, time2, time3, time4, time5, time6;
		

		if($("#mon").hasClass("clicked")){	mon="Y"	}else{	mon="";	}
		if($("#tue").hasClass("clicked")){	tue="Y"	}else{	tue="";	}
		if($("#wed").hasClass("clicked")){	wed="Y"	}else{	wed="";	}
		if($("#thu").hasClass("clicked")){	thu="Y"	}else{	thu="";	}
		if($("#fri").hasClass("clicked")){	fri="Y"	}else{	fri="";	}
		if($("#sat").hasClass("clicked")){	sat="Y"	}else{	sat="";	}
		if($("#sun").hasClass("clicked")){	sun="Y"	}else{	sun="";	}
		if($("#time1").hasClass("clicked")){	time1="Y"	}else{	time1="";	}
		if($("#time2").hasClass("clicked")){	time2="Y"	}else{	time2="";	}
		if($("#time3").hasClass("clicked")){	time3="Y"	}else{	time3="";	}
		if($("#time4").hasClass("clicked")){	time4="Y"	}else{	time4="";	}
		if($("#time5").hasClass("clicked")){	time5="Y"	}else{	time5="";	}
		if($("#time6").hasClass("clicked")){	time6="Y"	}else{	time6="";	}

		$.ajax({
			url:"showNewList.ma",
			data:{startDate:sDate, endDate:eDate, mon:mon, tue:tue, wed:wed, thu:thu,
				fri:fri, sat:sat, sun:sun, mSystem:mSystem, time1:time1,
				time2:time2, time3:time3, time4:time4, time5:time5, time6:time6 
			},
			success:function(data){
				
				$("#matchingList").html("");
				
				if(data.length != 0){
				for(var i in data){
					$("#matchingList").append("<table id = 'matchingTable'  style  = 'height: 150px;' onclick = 'goMatchDetail("+data[i].mId+");'>"+
							"<tr style = 'height: 33%;'>"+
								"<td rowspan='2' style = 'width: 20%; height: 80%; text-align: center;'>"+
									"<div id = 'teamLogo' style = 'width: 60%; margin-left:20%; margin-right: 20%;'>"+
										"<img id = 'logo' src='resources/images/team/"+data[i].teamImg+"' style = 'border: 1px solid lightgrey; width: 80%; height: 100px;'>"+
									"</div>"+
								"</td>"+
								"<td colspan='3' style = 'width: 80%;'><h4>"+data[i].mTitle+"</h4></td>"+
							"</tr>"+
							"<tr style = 'height: 33%;'>"+
								"<td style = 'width: 30%;'>"+
									"<h6>장소</h6>"+
									"<h5>"+data[i].mLocationName+"</h5>"+
								"</td>"+
								"<td style = 'width: 30%;'>"+
									"<h6>일시</h6>"+
									"<h5>"+data[i].mDay+"</h5>"+
								"</td>"+
								"<td style = 'width: 20%;'>"+
									"<h6>회비</h6>"+
									"<h5>"+data[i].dues+"원</h5>"+
								"</td>"+
							"</tr>"+
							"<tr style = 'height: 33%;'>"+
								"<td style = 'width: 20%; text-align: center;'>"+
									"<div id = 'teamInfo'>"+
										"<h5>"+data[i].teamName+"</h5>"+
										"<h6>"+data[i].userName+"</h6>"+
									"</div>"+
								"</td>"+
								"<td>"+
									"<h6>유형</h6>"+
									"<h5>"+data[i].mSystem+"</h5>"+
								"</td>"+
								"<td>"+
									"<h6>시간</h6>"+
									"<h5>"+data[i].sHour+":"+data[i].sMinute+" ~ "+data[i].eHour+":"+data[i].eMinute+"</h5>"+
								"</td>"+
								"<td>"+
									"<h6>등록일</h6>"+
									"<h5>"+data[i].createDate+"</h5>"+
								"</td>"+
								"<td>"+
									"<input type='hidden' name = 'mId' value = ''>"+
								"</td>"+
							"</tr>"+
						"</table>");	
						if(data[i].mStatus == 'ING'){
							$("#matchingList").append("<div class = 'ingDiv' style = 'position: relative; z-index: 2; background: black; height: 150px; top: -185px; margin-bottom: -150px; opacity: 0.3;' onclick='goMatchDetail("+data[i].mId+");'>"+
							"<div style = 'margin-left: 45%;'>"+
								"<h1 class = 'ingStatus' style  = 'color: white; font-size: 80px; margin-top: 0px; margin-bottom: 0px;'>진행 중</h1>"+
							"</div>"+
						"</div>");
						}
					
				}
				}else{
					$("#matchingList").html("<h1 style = 'text-align: center; font-size: 30px;'>검색 결과가 없습니다.</h1>");
				}
				$("#myBtn").removeClass('clicked');
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		})
		
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


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>