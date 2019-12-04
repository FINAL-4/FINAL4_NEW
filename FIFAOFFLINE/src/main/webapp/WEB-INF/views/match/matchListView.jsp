<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	margin-top:2%;
	border: none;
	background: white;
	width: 30%;
	height: 30px;
	text-align-last:center;
}

#matchingSystem select{
	margin-top:2%;
	border: none;
	background: white;
	width: 60%;
	height: 30px;
	text-align-last:center;
}

#matchingDay button{
	font-size: 15px;
	width: 10%;
	margin-left:1%;
	margin-right:1%;
	height: 8%;
	text-align: center;
	border: none;
}

#matchingTime button{
	font-size: 15px;
	width: 13%;
	margin-left:1%;
	margin-right:1%;
	height: 8%;
	text-align: center;
	border: none;
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


</style>
</head>
<jsp:include page = "../common/header.jsp"/>

<body>








<div id = "outer" style = "margin-top:180px;">
	
	
	
<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:780px; margin:auto; padding-bottom:0px;">
		<div id = "searchContent" style="height:100%; width:100%; border-bottom:3px solid grey;">
			<div style = "height: 10%; border-bottom: 2px solid grey;">
				<h1 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 80%; display: inline-block;">팀원 모집</h1>
				<div id = "btns" style = "width: 19%;">
					<button type = "button" style = "width: 45%; height: 100%; padding: 15px; margin-right: 5%; font-size: 15px;" class="addressB">나의 매치</button>
					<button type = "button" style = "width: 45%; height: 100%; padding: 15px; font-size: 15px;" class="createBtn" onclick = "goCreateMatch(${loginUser})">매치 생성</button>
				</div>			
			</div>

			<div id = "searchTbDiv">
				<table id = "searchTable" >
					<tr>
						<td>
							<div id = "matchingDate" class = "search">
 								<input type = "date" id = "sDate" value = "">${loginUser }
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
									<option value = "">==선택==</option>
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
		<div id = "matchingList">
			<c:forEach var="match" items="${mList }" varStatus="status">
				<table id = "matchingTable"  style  = "height: 150px;" onclick = "goMatchDetail(${match.mId});">
					<tr style = "height: 33%;">
						<td rowspan="2" style = "width: 20%; height: 80%; text-align: center;">
							<div id = "teamLogo" style = "width: 60%; margin-left:20%; margin-right: 20%; border: 1px solid red;">
								<img alt="" src="">
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
								<h5>팀이름</h5>
								<h6>팀장이름</h6>
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
			</c:forEach>
		</div>
	</div>
</div>


<script type="text/javascript">
	function goMatchDetail(mId){
		
		location.href="goMatchDetail.ma?mId="+mId;
	}
	
	
	function goCreateMatch(m){

		if(m == null){
			alert("로그인이 필요한 기능입니다.");
		}else{
			location.href="goCreateMatch.ma"; 		
		}
		
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
		
	/* 	console.log("sDate : "+sDate);
		console.log("eDate : "+eDate);
		console.log("mon : "+mon);
		console.log("tue : "+tue);
		console.log("wed : "+wed);
		console.log("thu : "+thu);
		console.log("fri : "+fri);
		console.log("sat : "+sat);
		console.log("sun : "+sun);
		console.log("mSystem : "+mSystem);
		console.log("time1 : "+time1);
		console.log("time2 : "+time2);
		console.log("time3 : "+time3);
		console.log("time4 : "+time4);
		console.log("time5 : "+time5);
		console.log("time6 : "+time6);
		console.log("============================="); */
		
		$.ajax({
			url:"showNewList.ma",
			data:{startDate:sDate, endDate:eDate, mon:mon, tue:tue, wed:wed, thu:thu,
				fri:fri, sat:sat, sun:sun, mSystem:mSystem, time1:time1,
				time2:time2, time3:time3, time4:time4, time5:time5, time6:time6 
			},
			success:function(data){
					alert("실행은 됐음!");
					$("#matchingList").html("");
				for(var i in data){
					$("#matchingList").html("<table id = 'matchingTable'  style  = 'height: 150px;' onclick = 'goMatchDetail("+data[i].mId+");'>"+
							"<tr style = 'height: 33%;'>"+
								"<td rowspan='2' style = 'width: 20%; height: 80%; text-align: center;'>"+
									"<div id = 'teamLogo' style = 'width: 60%; margin-left:20%; margin-right: 20%; border: 1px solid red;'>"+
										"<img alt='' src=''>"+
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
										"<h5>팀이름</h5>"+
										"<h6>팀장이름</h6>"+
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
					
				}
					
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