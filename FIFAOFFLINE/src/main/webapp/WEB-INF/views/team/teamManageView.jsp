<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.member.model.vo.Member, com.kh.FIFAOFFLINE.team.model.vo.Team, java.util.ArrayList"%>
    
<%
	ArrayList<Member> mList =(ArrayList)request.getAttribute("mList");
	ArrayList<Team> teamLeader = (ArrayList)request.getAttribute("teamLeader");
%>   
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<!DOCTYPE html>
<html>
<head>
<script src="https://unpkg.com/flickity@2/dist/flickity.pkgd.min.js"></script>
<link rel="stylesheet" href="https://unpkg.com/flickity@2/dist/flickity.min.css">
<!-- <link rel="stylesheet" type="text/css" href="resources/css/style.css" /> -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://kit.fontawesome.com/076ff59e02.js" crossorigin="anonymous"></script>
<link async href="https://fonts.googleapis.com/css?family=Antic" data-generated="http://enjoycss.com" rel="stylesheet" type="text/css"/>       


<style>
* { box-sizing: border-box; }

body { font-family: sans-serif; }

.carousel{
	padding-bottom:25px;
}

.carousel-cell {
  width:360px;
  height:450px;
  margin-right:10px;
  border-radius:5px;
}

.carousel-cell1 {
  width:360px;
  height:450px;
  margin-right:10px;
  border-radius:5px;
  margin-top:5%;
  width:25%;
  height:65%;
  margin-left:72px;
  margin-right:70px;
  float:left;
}



/* cell number */
.carousel-cell:before {
  display: block;
  line-height: 200px;
  font-size: 80px;

}

/*the container must be positioned relative:*/
  .autocomplete {
  position: relative;
  display: inline-block;
  width:30%;
  float:left;
}

#myInput {
  border: 1px solid transparent;
  background-color: #f1f1f1;
  padding: 10px;
  font-size: 24px;
  width:100%;
  border:1px solid black;
}

 .autocomplete-items {
  position: absolute;
  border: 1px solid #d4d4d4;
  border-bottom: none;
  border-top: none;
  z-index: 99;
  top: 100%;
  left: 0;
  right: 0;
}

.autocomplete-items div {
  padding: 10px;
  cursor: pointer;
  background-color: #fff; 
  border-bottom: 1px solid #d4d4d4;
  font-size:24px;
} */

/*when hovering an item:*/
.autocomplete-items div:hover {
  background:black;
  color:white; 
}

/*when navigating through the items using the arrow keys:*/
.autocomplete-active {
  background-color: DodgerBlue !important; 
  color: #ffffff; 
}
.searchMember:hover{
	background-color: DodgerBlue !important; 
  	color: #ffffff; 
}

#myUL {
  margin: 0;
  padding: 0;
}


#myUL li {
  cursor: pointer;
  position: relative;
  padding: 12px 8px 12px 40px;
  background: #eee;
  font-size: 24px;
  transition: 0.2s;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
}


#myUL li:nth-child(odd) {
  background: #f9f9f9;
}


#myUL li:hover {
  background: #ddd;
}


#myUL li.checked {
  background: #888;
  color: #fff;
  text-decoration: line-through;
}


#myUL li.checked::before {
  content: '';
  position: absolute;
  border-color: #fff;
  border-style: solid;
  border-width: 0 2px 2px 0;
  top: 10px;
  left: 16px;
  transform: rotate(45deg);
  height: 15px;
  width: 7px;
}

/* Style the close button */
.close {
  position: absolute;
  right: 0;
  top: 0;
  padding: 12px 16px 12px 16px;
}

.close:hover {
  background-color: #f44336;
  color: white;
}

/* /* Style the header */
.header {
  background-color: #f44336;
  padding: 30px 40px;
  color: white;
  text-align: center;
}

/* Clear floats after the header */
.header:after {
  content: "";
  display: table;
  clear: both;
} */

/* Style the input */
#myInput {
  margin: 0;
  border: none;
  border-radius: 0;
  width: 75%;
  padding: 10px;
  font-size: 24px;
}

/* Style the "Add" button */
.addBtn {
  padding: 10px;
  width: 10%;
  text-align: center;
  font-size: 16px;
  cursor: pointer;
  transition: 0.3s;
  border-radius: 0;
  float:left;
  background:black;
  color:white;
  border:1px solid black;
  height:52px;
}

.addBtn:hover {
  background:white;
  color:black;
}

/* flip the pane when clicked */
 .flip-container .flipper.flip {
  transform: rotateY(180deg);
}

/* flip speed */
.flipper {
  transition: 0.8s;
  transform-style: preserve-3d;
  position: relative;
}

/* hide back of pane during swap */
.front, .back {
  backface-visibility: hidden;
  position: absolute;
  top: 0;
  left: 0;
  border:1px solid black;
  perspective:1200px;
  width: 100%;
  height: 100%;
  text-align: center;
  padding: 5px;
}

/* front pane, placed above back */
.front {
  z-index: 2;
  transform: rotateY(0deg);
}

/* back, initially hidden pane */
.back {
  transform: rotateY(180deg);
  background-color: #fff;
  overflow:auto;
}

div[id^="test"]{ 
  position:relative;
  width:100%;
  height:100%;
  transform-style: preserve-3d;
  perspective:1200px;
}

.selectedMember{
	border:1px solid black;
}

.chip {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 18px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
  margin-top:20px;
  margin-bottom:20px;
}

.chip img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}

.closebtn {
  padding-left: 10px;
  color: #888;
  font-weight: bold;
  float: right;
  font-size: 20px;
  cursor: pointer;
}

.closebtn:hover {
  color: #000;
}

.chipM {
  display: inline-block;
  padding: 0 25px;
  height: 50px;
  font-size: 18px;
  line-height: 50px;
  border-radius: 25px;
  background-color: #f1f1f1;
  margin-bottom:20px;
}

.chipM img {
  float: left;
  margin: 0 10px 0 -25px;
  height: 50px;
  width: 50px;
  border-radius: 50%;
}

.closebtnM {
  padding-left: 10px;
  color: #888;
  font-weight: bold;
  float: right;
  font-size: 20px;
  cursor: pointer;
}

.closebtnM:hover {
  color: #000;
}

.card {
  display: flex;
  max-width: 100%;
  flex-direction: column;
}

.card-header {
  background-color: #fff;
  position: relative;
}

.card-header .card-header-btn {
  position: absolute;
  left: 0;
  bottom: 0;
  margin: 20px;
  color: #fff;
  background-color: #2b436d;
  padding: 6px;
  letter-spacing: .5px;
  font-size: 11px;
  font-weight: 800;
}

.card-body {
  background-color: #fff;
  padding: 0 20px 20px 20px;
  overflow:auto;
}

.category {
  margin: 0;
  color: #888;
  font-size: 15px;
  margin-top: 12px;
}

.description {
  color: #444;
  font-size: 15px;
  text-align: left;
}

.card-body h1 {
  font-size: 30px;
  color: #444;
  margin: 8px 0;
}

.card-footer {
  padding: 0 20px;
  border-top: 1px solid #eee;
  background-color: #fff;
  font-weight: 600;
  color: #888;
}

 .card .card-header img {
  width: 100%;
} 

.modalUp:hover{
	color:red;
}

/* The Modal (background) */
.modal,.teammodal {
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
.modal-contentM{
  background-color: #fefefe;
  z-index:2;
  margin: auto;
  padding: 20px;
  border: 1px solid #888;
  width: 600px;
}

.modal-contentT{
  background-color: #fefefe;
  z-index:2;
  margin: auto;
  margin-top:10%;
  padding: 20px;
  border: 1px solid #888;
  width: 600px;
}

/* The Close Button */
.closeM,.closeT {
  color: #aaaaaa;
  float: right;
  font-size: 28px;
  font-weight: bold;
}

.closeM:hover,.closeT:hover,
.closeM:focus,.closeT:focus {
  color: #000;
  text-decoration: none;
  cursor: pointer;
}
.imgcontainerM,.imgcontainerT {
  text-align: center;
  margin: 24px 0 12px 0;
  position: relative;
  height:150px;
  vertical-align: center;
}

img.avatarM, img.avatarT {
  width: 50%;
  height:100%;
}

.container {
  padding: 16px;
}
.animateM,.animateT {
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

.createTeam{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-right:20px;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.createTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}
.updateTeam,.disTeam{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-right:20px;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.updateTeam:hover,.disTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}

.spaceDiv{
	height:18%;
}

div[id^="test"]:hover{
	cursor:pointer;
}

.clickChip{
	background:#5cf268;
}
.clickChip:hover{
	cursor:pointer;
}
.chipM:hover{
	cursor:pointer;
}
.InviteMyTeam{
	float:left;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
	margin-left:25%;
}
.InviteMyTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}

table.type08 {
	width:100%;
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-left: 1px solid #ccc;
}

table.type08 thead th {
    padding: 10px;
    text-align:center;
    font-size:12px;
    font-weight: bold;
    border-top: 1px solid #ccc;
    border-right: 1px solid #ccc;
    border-bottom: 2px solid #c00;
    background: #dcdcd1;
}
table.type08 tbody th {
    padding: 10px;
    font-weight: bold;
    text-align:center;
    font-size:16px;
    vertical-align: center;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    background: #ececec;
}
table.type08 td {
    text-align:center;
    font-size:13px;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
}
.teamTR:hover{
	background:#ececec;
	font-weight:bold;
	cursor:pointer;
}
.agree:hover,.deny:hover,.more:hover{
	background:skyblue;
	color:white;
	cursor:pointer;
}



</style>
</head>
<body>
<jsp:include page = "../common/header.jsp"/>
<div id = "outer" style = "margin-top: 180px;">
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 1000px; width: 90%; margin: auto;">
		<div class="spaceDiv"></div>
			<h1 style="font-size:48px;">나의 팀</h1>
			<hr style="border:1px solid black">
			<button class="createTeam" onclick="beforeCreateTeam()">팀 생성</button>
			<button class="updateTeam" onclick="updateTeam()">팀 정보 수정</button>
			<button class="disTeam" onclick="disTeam()">팀 탈퇴 & 팀 해체</button>
			<select style="float:left; font-size:18px; margin-top:10px; margin-right:10px;" class="teamSelector">
				<option selected value="0">-- 팀을 선택하세요 --</option>
				<c:forEach var="myTeam" items="${myTeam}" varStatus="status">
				<option value="${myTeam.teamNo}">${myTeam.teamName}</option>
				</c:forEach>
			</select>
			<div class="myTeam" style="display:inline-block; height:800px; width:100%;">
			<c:if test="${!empty myTeam }">
			<c:forEach var="myTeam" items="${myTeam}" varStatus="status">
				<div class="carousel-cell1 flip-container">
  					<div id = "test${status.index}" class= "flipper" style="width:100%; height:100%;">
  						<input type="hidden" value="${myTeam.teamNo }" class="hTeamNo">
  						<input type="hidden" value="${myTeam.leaderNo }" class="hLeaderNo">
  							<div class="front card" style="width:100%; height:100%">
  								<div class="card-header"  style="height:210px;">
                					<!-- <div class="card-header-btn">12전 11승 0무 1패</div> -->
                						<img src="resources/images/team/${myTeam.teamImage }" style="width:100%; height:100%;"/>
            						</div>
            						<div class="card-body">
               			 				<p class="category" style="font-size:1.8em;">팀장 : ${myTeam.userName }</p>
                						<h1 style="font-size:38px;">${myTeam.teamName }</h1>
                						<p class="description" style="text-align:center;">${myTeam.teamIntro }${myTeam.teamIntro }${myTeam.teamIntro }</p>
            						</div>
            						<div class="card-footer" style="padding-top:10px; padding-bottom:0px;">
                						<p style="font-size:16px;">활동 지역 : ${myTeam.teamArea }</p>
           							</div>
  								</div>
  								<div class="back" style="width:100%; height:100%">
  									
  								</div>
							</div>
  						</div>
				</c:forEach>
				</c:if>
				<c:if test="${empty myTeam }">
					<h1 style="font-size:48px;">가입하거나 생성한 팀이 없습니다.</h1>
				</c:if>
				</div>
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "width: 90%; margin:auto;">
				<div class="contents" style="width:100%; padding-top:75px; margin-bottom:300px;" >
					<h1 style="font-size:48px;">팀원 초대</h1>
					<hr style="border:1px solid black;">
					<form autocomplete="off" action="/action_page.php" style="padding-bottom:20px; padding-top:20px;">
						<select style="float:left; font-size:18px;" class="teamSelect" onchange="choiceTeamMember()">
							<option selected value="0">-- 팀을 선택하세요 --</option>
							<c:forEach var="leader" items="${teamLeader}" varStatus="status">
							<option value="${leader.teamNo}">${leader.teamName}</option>
							</c:forEach>
						</select>
						<br><br><br>
						<div class="autocomplete">
    						<input id="myInput" type="text" name="myCountry" placeholder="회원 이름을 검색하세요.">
  						</div>
  						<button onclick="newElement()" class="addBtn" type="button"><i class="fas fa-search"></i>Search</button>
  						<br>
					</form>
					<br><br><br>
					<div style="width:100%; display:inline">
						<div class="selectedMember" style="width:40%; height:500px; text-align:center; float:left;">
							<h1 style="font-size:24px;">초대 할 유저</h1>
  						</div>
  						<div style="width:20%; float:left; height:500px;"></div>
  						<div class="inviteTeam" style="width:40%; height:500px; float:left; overflow:auto; align:center; text-align:center">
	  						<h1 style="font-size:24px;">초대한 팀</h1>
	  						<table class="type08">
	    						<thead>
	    							<tr>
								        <th scope="cols">팀 이름</th>
								        <th scope="cols">팀장 이름</th>
								        <th scope="cols">활동 지역</th>
								        <th scope="cols">승인</th>
								        <th scope="cols">거부</th>
								        <th scope="cols">자세히</th>
								    </tr>
	    						</thead>
	    						<tbody>
							    <c:if test="${!empty inviteMeTeam }">
								<c:forEach var="invite" items="${inviteMeTeam}" varStatus="status">
							    <tr class="teamTR" style="height:70px;">
							        <td>${invite.teamName }</td>
							        <td>${invite.userName }</td>
							        <td>${invite.teamArea }</td>
							        <td class="agree">
							        	<i class="fas fa-check" style="color:green"></i>
							        	<input type="hidden" class="hTeamNo" value="${invite.teamNo }">
							        </td>
							        <td class="deny">
							        	<i class="fas fa-check" style="color:red"></i>
							        	<input type="hidden" class="hTeamNo" value="${invite.teamNo }">
							        </td>
							        <td class="more">
							        	<i class="fas fa-search" style="color:black;"></i>
							        </td>
							    </tr>
							    </c:forEach>
							    </c:if>
							    <c:if test="${empty inviteMeTeam }">
							    <tr>
							    	<td colspan="6" style="background: #ececec; font-size:18px; text-align:center; font-weight: bold">${loginUser.userName }님을 초대한 팀이 없습니다.</td>
							    </tr>
							    </c:if>
							    </tbody>
							</table>
	  					</div>
  						<button type="button" class="InviteMyTeam">추가</button>
  					</div>	
				</div>
				<br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br><br>
				<div class="contents2" style="width:100%; padding-bottom:75px; margin-top:150px;">
					
				<h1 style="font-size:48px;">전체팀 조회</h1>
				<hr style="border:1px solid black">
				<div class="carousel" data-flickity='{ "groupCells": true }'>
					<c:forEach var="tList" items="${tList}" varStatus="status">
  						<div class="carousel-cell flip-container">
  							<div id="test${status.index }" class="flipper">
  								<input type="hidden" value="${tList.teamNo }" class="hTeamNo">
  								<div class="front card">
  									<div class="card-header"  style="width:100%; height:210px;">
                						<!-- <div class="card-header-btn">전적</div> -->
                						<img src="resources/images/team/${tList.teamImage }" style="width:100%; height:100%;"/>
            						</div>
            							<div class="card-body">
               			 				<p class="category">팀장 : ${tList.userName }</p>
                						<h1>${tList.teamName }</h1>
                						<p class="description">${tList.teamIntro }</p>
            							</div>
            							<div class="card-footer" style="padding-top:10px; padding-bottom:0px;">
                							<p>활동 지역 : ${tList.teamArea }</p>
           								</div>
  								</div>
  								<div class="back">
  									
  								</div>
							</div>
  						</div>
					</c:forEach>
					</div>
					</div>
				</div>
			</div>
			<div id="myModal" class="modal">
  				<div class="modal-contentM animateM">
  					<span class="closeM" onclick="closeM()">&times;</span>
	  					<div class="imgcontainerM">
	     					<img alt="Avatar" class="avatarM">
    					</div>
   			 			<div class="container" align="center">
      						<label><b>유저 이름</b></label>
     				 		<p class="mUserName"></p>
      						<label><b>성별</b></label>
      						<p class="mGender"></p>
      		
     						<label><b>이메일</b></label>
      						<p class="mEmail"></p>
      
      						<label><b>주소</b></label>
      						<p class="mAddress"></p>
    					</div>
  					</div>
				</div>
				<div id="teamModal" class="teammodal">
  				<div class="modal-contentT animateT">
  					<span class="closeT" onclick="closeT()">&times;</span>
	  					<div class="imgcontainerT">
	     					<img alt="Avatar" class="avatarT">
    					</div>
   			 			<div class="container" align="center">
      						<label><b>팀 이름</b></label>
     				 		<p class="tTeamName"></p>
      						<label><b>팀장 이름</b></label>
      						<p class="tUserName"></p>
      		
     						<label><b>활동 지역</b></label>
      						<p class="tTeamArea"></p>
      
      						<label><b>전적</b></label>
      						<p class="tScore"></p>
    					</div>
  					</div>
				</div>  
		
  
  

<jsp:include page = "../common/footer.jsp"/>
<script>

	var selectedNo = 0;
	var selectedArr = new Array();
	var sendArr = new Array();
	var teamMember = new Array();
	

	$('.flipper').click(function(){
		var teamNo = $(this).children('.hTeamNo').val();
		var leaderNo = $(this).children('.hLeaderNo').val();
		
		$div = $(this).children('.back')
		
		$.ajax({
			url:"moreTeamMember.tm",
			data:{teamNo:teamNo},
			success:function(data){
				
				var appendStr = "<h1 style='font-size:24px;'>팀 원</h1>";
				appendStr += "<h1 style='font-size:16px;'>전적 : "+data.scoreStr[0].scoreStr+"</h1>";
				
				if(leaderNo == ${loginUser.userNo}){
					for(var i=0; i<data.tMember.length; i++){
						appendStr += "<div class='chip'>";
						appendStr += "<img src='resources/proFiles/"+data.tMember[i].profile+"' width='96' height='96'>";
						appendStr += "<input type='hidden' class='hUserNo' value='"+data.tMember[i].userNo+"'>";
						appendStr += "<input type='hidden' class='hhTeamNo' value='"+data.tMember[i].teamNo+"'>";
						appendStr += data.tMember[i].userName+"&emsp;&emsp;"+data.tMember[i].position;
						appendStr += "<span class='closebtn'>&times</span>";
						appendStr += "</div>";
						appendStr += "<br>";
					}
				}else{
					for(var i=0; i<data.tMember.length; i++){
						appendStr += "<div class='chip'>";
						appendStr += "<img src='resources/proFiles/"+data.tMember[i].profile+"' width='96' height='96'>";
						appendStr += "<input type='hidden' class='hUserNo' value='"+data.tMember[i].userNo+"'>";
						appendStr += "<input type='hidden' class='hhTeamNo' value='"+data.tMember[i].teamNo+"'>";
						appendStr += data.tMember[i].userName+"&emsp;&emsp;"+data.tMember[i].position;
						appendStr += "</div>";
						appendStr += "<br>";
					}
				}
				
				$div.html("");
				$div.append(appendStr);
				
				
				console.log(data.tMember.length);
			}
		});
		
		$(this).toggleClass("flip");
	});


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
	
	

function autocomplete(inp, arr) {
  var currentFocus;
  inp.addEventListener("input", function(e) {
      var a, b, i, val = this.value;
      closeAllLists();
      if (!val) { return false;}
      currentFocus = -1;
      a = document.createElement("DIV");
      a.setAttribute("id", this.id + "autocomplete-list");
      a.setAttribute("class", "autocomplete-items");
      this.parentNode.appendChild(a);
      for (i = 0; i < arr.length; i++) {
        if (arr[i].userName.substr(0, val.length).toUpperCase() == val.toUpperCase()) {
          b = document.createElement("DIV");
          b.className = "searchMember";
          
          b.innerHTML = "<strong>" + arr[i].userName.substr(0, val.length) + "</strong>";
          b.innerHTML += arr[i].userName.substr(val.length) + "<span class='modalUp'><i class='fas fa-search' style='float:right; padding-top:8px;'></span>";
          b.innerHTML += "<input type='hidden' class='hUserNo' value='" + arr[i].userNo + "'>";
          b.innerHTML += "<input type='hidden' class='hUserName' value='" + arr[i].userName + "'>";

          b.addEventListener("click", function(e) {
              inp.value = this.getElementsByClassName("hUserName")[0].value;
              
              closeAllLists();
          });
          a.appendChild(b);
        }
      }
  });
  inp.addEventListener("keydown", function(e) {
      var x = document.getElementById(this.id + "autocomplete-list");
      if (x) x = x.getElementsByTagName("div");
      if (e.keyCode == 40) {
        currentFocus++;
        addActive(x);
      } else if (e.keyCode == 38) { //up
        currentFocus--;
        addActive(x);
      } else if (e.keyCode == 13) {
        e.preventDefault();
        if (currentFocus > -1) {
          if (x) x[currentFocus].click();
        }
      }
  });
  function addActive(x) {
    if (!x) return false;
    removeActive(x);
    if (currentFocus >= x.length) currentFocus = 0;
    if (currentFocus < 0) currentFocus = (x.length - 1);
    x[currentFocus].classList.add("autocomplete-active");
  }
  function removeActive(x) {
    for (var i = 0; i < x.length; i++) {
      x[i].classList.remove("autocomplete-active");
    }
  }
  function closeAllLists(elmnt) {
    var x = document.getElementsByClassName("autocomplete-items");
    for (var i = 0; i < x.length; i++) {
      if (elmnt != x[i] && elmnt != inp) {
        x[i].parentNode.removeChild(x[i]);
      }
    }
  }
  document.addEventListener("click", function (e) {
      closeAllLists(e.target);
  });
}

var userInfo = new Array();

var userName = [];
var userNo = [];
var position = [];

<%for(int i=0; i<mList.size(); i++){%>
	userName[<%=i%>] = "<%=mList.get(i).getUserName()%>";
	userNo[<%=i%>] = <%=mList.get(i).getUserNo()%>;
	position[<%=i%>] = "<%=mList.get(i).getPosition()%>";
<%}%>

for(var i=0; i<${mList.size()}; i++){
	var data = new Object();
	
	data.userName = userName[i];
	data.userNo = userNo[i];
	data.position = position[i];
	
	userInfo.push(data);
}

/* var jsonData = JSON.stringify(userName) ; */


autocomplete(document.getElementById("myInput"), userInfo);

$(document).on("click",".searchMember",function(){
	var selUserNo = $(this).children('.hUserNo').val();
	selectedNo = selUserNo;
});

$(document).on("click",".closebtn",function(){
	/* var userNo = $(this).parent('.chip').children('.hUserNo').val();
	var teamNo = $(this).parent('.chip').children('.hhTeamNo').val(); */
	
	
	alert("야호");
	
	event.stopPropagation();
});

$(".InviteMyTeam").click(function(){
	var dupFlag = true; //	이미 팀에 있는 인원인지 아닌지 검사함.
	
	var userNo = [];
	userNo.push(sendArr);
	
	var teamNo = $('.teamSelect').val();
	
	console.log("teamNo : " + teamNo);
	console.log("userNo : " + userNo);
	console.log("teamMember : " + teamMember);
	console.log("sendArr :" + sendArr );
	
	console.log("teamMemberLength2 : " + teamMember.length);
	console.log("sendArrLength : " + sendArr.length);
	
	if(teamNo != '0'){
		if(sendArr.length>0){
			for(var i=0; i<teamMember.length; i++){
				for(var j=0; j<sendArr.length; j++){
					if(teamMember[i] == sendArr[j]){
						dupFlag = false;
					}else{
						console.log("들어간다잇");
					}
				}
			}
		}else{
			alert('추가할 유저를 먼저 선택하세요');
		}
	}else{
		alert('팀을 먼저 선택하세요');
	}
	
	if(dupFlag){
		jQuery.ajaxSettings.traditional = true;
		
		$.ajax({
			url:'inviteTeam.tm',
			data:{sendArr:sendArr,
				  teamNo:teamNo},
			success:function(data){
				if(data > 0){
					alert("추가되었습니다.");
					
					$('.chipM').remove();
				}else{
					alert("실패");
				}
			}
		});
	}else{
		alert('이미 팀원인 멤버가 있습니다.');
	}
});

function newElement(){
	//	input 칸이 빈칸이라면,
	if(selectedNo != 0){
		//	한번에 5명이상을 div에 추가하려고 한다면,
		if(selectedArr.length != 5){
			//	div 배열에 selectedNo가 포함되어 있지 않다면
			if(!(selectedArr.includes(selectedNo))){
				selectedArr.push(selectedNo);
				console.log(selectedArr);
				$div = $('.selectedMember');
				appendStr = "";
				$.ajax({
					url:"drawMember.tm",
					data:{userNo:selectedNo},
					success:function(data){
						if(data!=null){

						appendStr += "<div class='chipM'>";
						appendStr += "<img src='resources/proFiles/"+data.profile+"' width='96' height='96'>";
						appendStr += "<input type='hidden' class='hUserNo' value='"+data.userNo+"'>";
						appendStr += data.userName+"&emsp;&emsp;"+data.position;
						appendStr += "<span class='closebtnM'>&times</span>";
						appendStr += "</div>";
						appendStr += "<br>";
						
						$div.append(appendStr);
						
						
						}else{
							alert("해당하는 회원이 없습니다.");
						}
					}
						
				});
			}else{
				alert("이미 추가시킨 인원입니다.");
			}
		}else{
			alert("한번에 5명 이상을 추가할 수 없습니다.");
		}
	}else{
		alert("추가할 회원을 먼저 검색하세요");
	}
	selectedNo = 0;
}

$(document).on("click",".closebtnM",function(){
	var userNo = $(this).parent('.chip').children('.hUserNo').val();
	
	selectedArr.splice(selectedArr.indexOf(userNo),1);
	sendArr.splice(sendArr.indexOf(userNo),1);
	console.log(selectedArr);

	this.parentElement.style.display='none';
});

$(document).on("click",".chipM",function(){
	
	var userNo = $(this).children('.hUserNo').val();
	
	if($(this).hasClass('clickChip')){
		$(this).toggleClass('clickChip');
		
		sendArr.splice(sendArr.indexOf(userNo),1);
		console.log(sendArr);
	}else{
		sendArr.push(userNo);
		
		$(this).toggleClass('clickChip');
		console.log(sendArr);
	}
});

$(document).on("mouseover",".modalUp",function(){
	var userNo = $(this).parent().children('.hUserNo').val();
	
	$.ajax({
		url:"modal.tm",
		data:{userNo:userNo},
		dataType:"json",
		success:function(data){
			
			$(".mUserName").text(data.userName);
			$(".mGender").text(data.gender);
			$(".mEmail").text(data.userEmail);
			$(".mAddress").text(data.address);
			$(".avatarM").attr('src',"resources/proFiles/"+data.profile)
			
			var modal = document.getElementById("myModal");
			
			modal.style.display="block";
		}
	});
});

$(document).on("click",".more",function(){
	var teamNo = $(this).parent('.teamTR').children('.agree').children('.hTeamNo').val();
	$.ajax({
		url:"modalTeam.tm",
		data:{teamNo:teamNo},
		success:function(data){
			$(".tTeamName").text(data.teamName);
			$(".tUserName").text(data.userName);
			$(".tTeamArea").text(data.teamArea);
			$(".tScore").text(data.scoreStr);
			$(".avatarT").attr('src',"resources/images/team/"+data.teamImage);
			
			var modal2 = document.getElementById("teamModal");
			
			modal2.style.display="block";
			
			
		}
		
		
	});
});
var modal = document.getElementById("myModal");
var modal2 = document.getElementById("teamModal");

function closeM(){
	modal.style.display="none";
}

function closeT(){
	modal2.style.display="none";
}

window.onclick = function(event) {
	  if (event.target == modal || event.target == modal2) {
	    modal.style.display = "none";
	    modal2.style.display="none";
	    
	  }
	}

function beforeCreateTeam(){

	if(${myTeam.size()}==3){
		alert("3개 이상의 팀을 가입하거나 생성할 수 없습니다.");
	}else{
		location.href='createTeamView.tm';
	}
	
}

function choiceTeamMember(){
	var teamNo = $('.teamSelect').val();

	
	if(teamNo != '0'){
		$.ajax({
			url:'choiceTeamMember.tm',
			data:{teamNo:teamNo},
			success:function(data){
				for(var i = 0; i<data.length; i++){
					teamMember.push(data[i]);
				}
				console.log("teamMember.length1 : " + teamMember.length);
			}
		});
	}
}

$('.agree').click(function(){
	var teamNo = $(this).children('.hTeamNo').val();
	
	var confirmFlag = confirm("승인 하시겠습니까?");
	
	if(confirmFlag){
		$.ajax({
			url:'inviteAgree.tm',
			data:{teamNo:teamNo},
			success:function(data){
				if(${myTeam.size()} == 3){
					alert("3개 이상의 팀을 가입 할 수 없습니다.");
				}else{
					if(data > 0){
						alert("가입되었습니다.");
						$(this).parent('.teamTR').remove();
					}else{
						alert("이미 가입된 팀입니다.");
					}
				}
			}
		});
	}else
		alert("취소");
	
	
	
});




$('.deny').click(function(){
	var teamNo = $(this).children('.hTeamNo').val();
	
	alert(teamNo);
});

function updateTeam(){
	var teamNo = $('.teamSelector').val();
	
	if(teamNo == '0'){
		alert("팀을 먼저 선택해주세요");
	}else{
		location.href="updateTeamInfo.tm?teamNo="+teamNo;
	}
}

function disTeam(){
	var teamNo = $('.teamSelector').val();
	var leaderNo = [];
	var disFlag = false; //	팀원인지 팀장인지 구분하기 위해 ( 탈퇴 / 해체 구분 ) 
	
	
	if(teamNo == '0'){
		alert("먼저 팀을 선택 해주세요");
	}else{
		<%for(int i=0; i<teamLeader.size(); i++){%>
			leaderNo[<%=i%>] = <%=teamLeader.get(i).getTeamNo()%>;
		<%}%>
	
		for(var i=0; i<leaderNo.length; i++){
			if(leaderNo[i] == teamNo){
				disFlag = true;
			}
		}
	
		if(disFlag){
			var confirmFlag = confirm("정말로 해체 하시겠습니까?");
			if(confirmFlag){
				$.ajax({
					url:'breakUpTeam.tm',
					data:{teamNo:teamNo},
					success:function(data){
						if(data > 0){
							alert("해체 되었습니다.. ㅜㅜ");
							location.href="managedTeam.tm";
						}else{
							alert('해체 실패');
						}
					}
				});
			}else{
				alert('취소 되었습니다.');
			}
		}else{
			var confirmFlag = confirm("정말로 탈퇴 하시겠습니까?");
			
			if(confirmFlag){
				$.ajax({
					url:'withdrawal.tm',
					data:{teamNo:teamNo},
					success:function(data){
						if(data > 0){
							alert("탈퇴 되었습니다 .. ㅠㅠ");
							location.href="managedTeam.tm";
						}else{
							alert("탈퇴 실패");
						}
					}
				});
			}else{
				alert("취소 되었습니다.");
			}
		}
	}
	
	
}



</script>
</body>
</html>