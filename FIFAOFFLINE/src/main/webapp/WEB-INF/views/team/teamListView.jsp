<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<style>
* {
  box-sizing: border-box;
}

/* Style the search field */
.teamsearchB{
	background:black;
	color:white;
}

/* Clear floats */
.example::after {
  content: "";
  clear: both;
  display: table;
}

table {
  border-collapse: collapse;
  border-spacing: 0;
  width: 100%;
}
td {
  padding: 16px;
  height:170px;
  width:170px;
  /* border-bottom: 1px solid #444444; */
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
	/* border-bottom: 1px solid #444444; */
}


.timgtag{
	display:inline-block;
	padding-left:10px;
}

thead th {
    background-color: black;
    color:white;
    font-size:23px;
    font-weight:bold;
}

thead tr {
  background-color: #0d47a1;
  color: #ffffff;
}
tbody tr:nth-child(4n-3) {
  border-top:1px solid #4F5F4C;
  border-bottom:1px solid #4F5F4C;
  background-color: #E2E4EC;
}
tbody tr:nth-child(4n-1) {
  border-top:1px solid #4F5F4C;
  border-bottom:1px solid #4F5F4C;
  background-color: #E2E4EC;
}

#teamMenu .menu__item-name::after,
#teamMenu .menu__item-name::before{
	background: red;
}

#teamMenu.menu__item::after,
#teamMenu.menu__item::before{
   	color: red;
}

#teamMenu .menu__item-name{
	color: red;
}

.teamselector:hover{
	background-color:#5C685F;
	cursor:pointer;
	color:white;
}
.spacetr{
	height:10px;
}
.searchInfo{
	text-align:right;
	margin-bottom:0px;
	padding-right:150px;
	font-size:16px;
	margin-right:60px;
	margin-top:120px;
}

.searchBInfo{
	margin-bottom:0px;
	font-size:40px;
	padding-left:500px;
	padding-bottom:10px;
	padding-top:150px;
	font-weight:bold;
}
.clicked{
   color:white !important;
   background:red !important;
   border:1px solid red !important;
}
.address:hover{
   	background:red;
	color:white;
	border:1px solid red;

}
.address{
	background:black;
	color:white;
	border:1px solid black;
	height:80px;
	margin-top:10px;
	margin-bottom:20px;
	margin-left:20px;
	margin-right:20px;
	font-size:2.7em;
	width:270px !important;
	border-radius:13px;
	transition: all 0.5s;
}

/* The Modal (background) */
/* Full-width input fields */
input[type=text], input[type=password] {
  width: 100%;
  padding: 15px;
  margin: 8px 0 22px 0;
  display: inline-block;
  border: 1px solid black;
  background: #f1f1f1;
}


/* Extra styles for the cancel button */
.cancelbtnM {
  padding: 14px 20px;
  background-color: black;
  font-weight:bold;
  color:white;
}

.signupbtnM {
	padding:14px 20px;
	background-color:black;
	font-weight:bold;
	color:white;
}

.cancelbtnM:hover,.signupbtnM:hover{
	cursor:pointer;
	background:red;
}

/* Float cancel and signup buttons and add an equal width */
.cancelbtnM, .signupbtnM {
  float: left;
  width: 50%;
}

/* Add padding to container elements */
.containerM {
  padding: 16px;
}

/* The Modal (background) */
.modalM {
  display: none; /* Hidden by default */
  position: fixed; /* Stay in place */
  z-index: 150; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); 
  padding-top: 100px;
}

/* Modal Content/Box */
.modal-contentM {
  background-color: #fefefe;
  margin: auto; /* 5% from the top, 15% from the bottom and centered */
  margin-bottom:250px;
  padding:20px;
  border: 1px solid #888;
  width: 1000px; /* Could be more or less, depending on screen size */
  z-index:150;

}

/* Style the horizontal ruler */
.seperate {
  border: 1px solid #f1f1f1;
  margin-bottom: 25px;
}
 
/* The Close Button (x) */
.closeM {
  float:right;
  font-size: 40px;
  font-weight: bold;
  color: #f1f1f1;
}

.closeM:hover,
.closeM:focus {
  color: #f44336;
  cursor: pointer;
}

/* Clear floats */
.clearfixM::after {
  content: "";
  clear: both;
  display: table;
}

/* Change styles for cancel button and signup button on extra small screens */
@media screen and (max-width: 300px) {
  .cancelbtnM, .signupbtnM {
     width: 100%;
  }
}

.createAD{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
}
.managedTeam{
	float:right;
	background:black;
	color:white;
	width:15%;
	font-size:1.7em;
	border:1px solid black;
	transition: all 0.5s;
	margin-top:5px;
	margin-bottom:5px;
	height:40px;
	margin-right:20px;
}
.createAD:hover,.managedTeam:hover{
	background:red;
	color:white;
	cursor:pointer;
	border:1px solid red;
}

.teamAdver{
  padding: 15px;
  margin: 5px 0 22px 0;
  display: inline-block;
  border: none;
  background: #f1f1f1;
  font-size:2em;
  width:100%;
}

.moreList{
	width:100%;
	height:60px;
	background:white;
	color:black;
	font-size:2em;
	border:1px solid black;
}

.moreList:hover{
	cursor:pointer;
	background:black;
	color:white;
}

#recruitCount{
	font-size:2em;
	
}





</style>
</head>
<jsp:include page = "../common/header.jsp"/>

<body>

<div id = "outer" style = "margin-top:280px;">
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:800px; margin:auto; padding-bottom:50px;">
		<div style="height:100%; width:100%; background:#eaeaea;">
			<div class="example">
				<p class="searchBInfo"></p>
				
				<form action="teamFilter.tm" method="post" class="searchFilter">
				<div class="searchButtons">
					<button type="button" style="width:200px; margin-left:50px;" id="address1" class="address" value="0">역삼/개포/청담</button>
					<input type="hidden" value="0" class="address1" name="tArea1">
					<button type="button" style="width:200px;" id="address2" class="address" value="0">삼성/대치/신사</button>
					<input type="hidden" value="0" class="address2" name="tArea2">
					<button type="button" style="width:200px;" id="address3" class="address" value="0">논현/압구정/세곡</button>
					<input type="hidden" value="0" class="address3" name="tArea3">
					<button type="button" style="width:200px;" id="address4" class="address" value="0">자곡/율현/일원</button>
					<input type="hidden" value="0" class="address4" name="tArea4">
					<br>
					<button type="button" style="width:200px; margin-left:50px;" id="address5" class="address" value="0">수서/도곡/대치1</button>
					<input type="hidden" value="0" class="address5" name="tArea5">
					<button type="button" style="width:200px;" id="address6" class="address" value="0">대치2/대치4/역삼1</button>
					<input type="hidden" value="0" class="address6" name="tArea6">
					<button type="button" style="width:200px;" id="address7" class="address" value="0">역삼1/역삼2/도곡</button>
					<input type="hidden" value="0" class="address7" name="tArea7">
					<button type="button" style="width:200px;" id="address8" class="address" value="0">도곡2/개포1/일원본</button>
					<input type="hidden" value="0" class="address8" name="tArea8">
				</div>	
				</form>
			
				<p class="searchInfo"></p>
				<br>
  				<button class="teamsearchB" style="width:75px; float:right; margin-top:6px; margin-bottom:10px; margin-right:50px; height:64px; border-left:0px;"><i class="fa fa-search"></i></button>
  				<input type="text" placeholder="팀 이름으로 검색하세요." class="searchTeamName" style="width:400px; float:right; margin-top:8px; height:60px; font-size:2em;">
  			</div>
			
		</div>
		<h1 style="font-size:48px;">&nbsp;&nbsp;팀원 모집</h1>
		<hr style="border:1px solid black; margin-bottom:5px;" class="seperate">
		<button class="createAD" onclick="document.getElementById('createAD').style.display='block'">모집글 작성</button>
		<button class="managedTeam" onclick="location.href='managedTeam.tm'">팀 관리</button>
	</div>
	<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "width: 90%; margin:auto">
		<table>
			<thead>
			<tr>
				<th class="teamtest">팀 로고</th>
				<th class="teamtest">팀 명</th>
				<th class="teamtest">팀장이름</th>
				<th class="teamtest">활동지역</th>
				<th class="teamtest">팀 소개</th>
				<th class="teamtest">모집 인원 수</th>
			</tr>
			</thead>
			

			<tbody>
			<c:if test="${!empty list }">
			<c:forEach var="team" items="${list}" varStatus="status">
    		<tr class="teamselector">
			    <td class="teamtest">
			    	<div style="height:200px; width:200px" class="Timgtag">
			    		<input type="hidden" value="${team.teamNo }" class="hiddenTno${status.count}">
			    		<img id="mImg${status.count }" src="resources/images/team/${team.teamImage }" style="width:100%; height:100%; padding-left:25px;">
			    	</div>
			    </td>
			    <td>${team.teamName }</td>
			    <td>${team.userName }</td>
			    <td>${team.teamArea }</td>
			    <td>${team.teamIntro }</td>
			    <td>${team.recruitCount}</td>
  			</tr>
  			<tr class="spacetr"></tr>
			</c:forEach>
			</c:if>
			<c:if test="${empty list }">
				<tr>
					<td colspan='6'>
						<p>모집글이 없습니다</p>
					</td>	
				</tr>
			</c:if>
  			</tbody>
		</table>
		<button class="moreList" onclick="moreList();">더 보 기</button>
	</div>
</div>

<div id="createAD" class="modalM">
  <form class="modal-contentM" action="ADinsert.tm" method="post">
   <span onclick="document.getElementById('createAD').style.display='none'" class="closeM" title="Close Modal">&times;</span>
    <div class="containerM" style="align:center">
      <h1 style="font-size:36px">모집글 작성</h1>
      <p style="font-size:16px; margin-top:0px;" >여러 팀의 팀장일 경우 팀을 선택후 등록하세요.</p>
      <select id="myTeam" name="teamNo" style="font-size:16px;">
      	<option selected value="0">팀을 선택하세요.</option>
      	<c:forEach var="leader" items="${teamLeader}" varStatus="status">
      	<option value="${leader.teamNo}">${leader.teamName }</option>
      	</c:forEach>
      </select>
      <br>
      <hr><br>
      <label for="recruitCount" style="font-size:16px;"><b>모집할 팀원 수</b></label>
      <input type="text" placeholder="모집하실 팀원수를 입력하세요." name="recruitCount" id="recruitCount" required>
      <div id="checkCount" class="checkInfo" style="font-size: 1em; margin-top:0px;"></div>

      <label for="team_Adver" style="font-size:16px;"><b>본인의 팀을 홍보하세요.</b></label><br><br>
      <textarea placeholder="팀 구인 광고를 작성하세요" name="teamAdver" class="teamAdver" cols="175" rows="10" wrap="hard" required></textarea>
     
      

      <p style="font-size:16px;">글을 등록하기 전에 먼저 본인의 팀 정보를 확인하세요. <a href="managedTeam.tm" style="color:dodgerblue; font-size:16px;">팀 정보 보러가기</a></p>

      <div class="clearfixM">
        <button type="button" onclick="document.getElementById('createAD').style.display='none'" class="cancelbtnM" style="font-size:2em;">취소</button>
        <button type="button" class="signupbtnM" onclick="beforeSubmit()" style="font-size:2em;">등록</button>
      </div>
    </div>
  </form>
</div>


<script>
$(document).on("click",".teamselector",function(){
	var teamNo=$(this).children().eq(0).children().children().eq(0).val();
	location.href='tdetail.tm?teamNo='+teamNo;
	
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
	});
</script>
<script>

	var page = 2;
	

	function moreList(){
		
		var address1 = $('#address1').val();
		var address2 = $('#address2').val();
		var address3 = $('#address3').val();
		var address4 = $('#address4').val();
		var address5 = $('#address5').val();
		var address6 = $('#address6').val();
		var address7 = $('#address7').val();
		var address8 = $('#address8').val();
		
		$tbody = $("tbody");
		
		$.ajax({
			url:"moreList.tm",
			data:{page:page,
				tArea1:address1,
				tArea2:address2,
				tArea3:address3,
				tArea4:address4,
				tArea5:address5,
				tArea6:address6,
				tArea7:address7,
				tArea8:address8},
			dataType:"json",
			success:function(data){
				if((${pi.maxPage}+1)!=page){
					if(data.list.length==${pi.boardLimit}){
						var appendStr="";
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/team/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].recruitCount+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
							
							$(".moreList").css("display", "block");
						}

					}else{
						$tbody = $("tbody");
						var appendStr="";
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/team/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].recruitCount+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";

							$(".moreList").css("display", "none");
						}
						
						
					}
					page++;
				}else{
					$(".moreList").css("display", "none");
				}
				
				$tbody.append(appendStr);
				console.log(data.list.length);
				console.log(${pi.boardLimit});
			}
		});
	}
	
$(function(){
		
		var address1 = $('#address1').val();
		var address2 = $('#address2').val();
		var address3 = $('#address3').val();
		var address4 = $('#address4').val();
		var address5 = $('#address5').val();
		var address6 = $('#address6').val();
		var address7 = $('#address7').val();
		var address8 = $('#address8').val();
		
		$(".address").click(function(){
			if($(this).hasClass('clicked')){
				$(this).toggleClass("clicked");
				
				$(this).val("0");
				
				address1 = $('#address1').val();
				address2 = $('#address2').val();
				address3 = $('#address3').val();
				address4 = $('#address4').val();
				address5 = $('#address5').val();
				address6 = $('#address6').val();
				address7 = $('#address7').val();
				address8 = $('#address8').val();
				

				
				$.ajax({
					url:"teamFilter.tm",
					data:{
						tArea1:address1,
						tArea2:address2,
						tArea3:address3,
						tArea4:address4,
						tArea5:address5,
						tArea6:address6,
						tArea7:address7,
						tArea8:address8
					},
					success:function(data){
						page = 2;
						
						console.log("팀 이름 : "+data.list);
						
						$tbody = $("tbody");
						$("tbody").text("");
						var appendStr="";
						if(data.list.length){
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/team/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].recruitCount+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
							
							$(".moreList").css("display", "block");
					
						}
					}else{
						appendStr += "<tr>";
						appendStr += "<td colspan ='6'>";
						appendStr += "<p>모집글이 없습니다.</p>";
						appendStr += "</td>";
						appendStr += "</tr>";
						$(".moreList").css("display", "none");
					}
						console.log(appendStr);
						$tbody.append(appendStr);
						
					} 
						
				});
				
			}else{
				page = 2;
				
				$('.clicked').removeClass("clicked");
				$(this).toggleClass("clicked");
				
				
				$('#address1').val("0");
				$('#address2').val("0");
				$('#address3').val("0");
				$('#address4').val("0");
				$('#address5').val("0");
				$('#address6').val("0");
				$('#address7').val("0");
				$('#address8').val("0");
				
				
				$(this).val("1");
				
				
				address1 = $('#address1').val();
				address2 = $('#address2').val();
				address3 = $('#address3').val();
				address4 = $('#address4').val();
				address5 = $('#address5').val();
				address6 = $('#address6').val();
				address7 = $('#address7').val();
				address8 = $('#address8').val();
				
				$.ajax({
					url:"teamFilter.tm",
					data:{
						tArea1:address1,
						tArea2:address2,
						tArea3:address3,
						tArea4:address4,
						tArea5:address5,
						tArea6:address6,
						tArea7:address7,
						tArea8:address8
					},
					success:function(data){
						
						console.log("팀 이름 : "+data.list);
						
						$tbody = $("tbody");
						$("tbody").text("");
						var appendStr="";
						if(data.list.length){
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/team/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].recruitCount+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
						}
						$(".moreList").css("display", "block");
					}else{
						appendStr += "<tr>";
						appendStr += "<td colspan ='6'>";
						appendStr += "<p>모집글이 없습니다.</p>";
						appendStr += "</td>";
						appendStr += "</tr>";
						$(".moreList").css("display", "none");
						
					}	
						console.log(appendStr);
						$tbody.append(appendStr);
						
					}
				});

				/* console.log("address1 : " + address1);
				console.log("address2 : " + address2);
				console.log("address3 : " + address3);
				console.log("address4 : " + address4);
				console.log("address5 : " + address5);
				console.log("address6 : " + address6);
				console.log("address7 : " + address7);
				console.log("address8 : " + address8); */
			}
		});
	});
</script>
<script>
//Get the modal
var modal = document.getElementById('createAD');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
  if (event.target == modal) {
    modal.style.display = "none";
  }
}
</script>
<script>
	var countCheck = false;
	
	/* function beforeTeamADCreate(){
		if(${myTeam.size()}==3){
			alert("3개 이상의 팀을 가입하거나 생성할 수 없습니다.");
		}else{
			document.getElementById('createAD').style.display='block';
		}
	} */
	
	function beforeSubmit(){
		var teamNo = $("#myTeam").val();
		
		if(teamNo == "0"){
			swal("팀을 선택하세요",'',"error");
		}else{
		
		$.ajax({
			url:"DupAD.tm",
			data:{teamNo:teamNo},
			success:function(data){
				if(data == 1){
					swal("이미 모집글을 등록하셨습니다.",'',"error");
				}else{
					if(countCheck){
						$(".modal-contentM").submit();
					}else{
						swal("모집 인원수를 확인하세요.",'',"error");
					}
					
				}
			}
		});
	}
	}
	
	$("#recruitCount").keyup(function() {
		var recruitCount = $("#recruitCount").val();

		if (recruitCount == "") {
			$("#checkCount").css("color", "#f53f29");
			$("#recruitCount").css("border", "2px solid #f53f29");
			$("#checkCount").text("모집인원을 입력하세요.");
			countCheck = false;
		} else if (!($.isNumeric(recruitCount))) {
			$("#checkCount").css("color", "#f53f29");
			$("#recruitCount").css("border", "2px solid #f53f29");
			$("#checkCount").text("숫자만 입력 가능합니다.");
			countCheck = false;
		} else if (parseInt(recruitCount) > 11 || parseInt(recruitCount) < 1) {
			$("#checkCount").css("color", "#f53f29");
			$("#recruitCount").css("border", "2px solid #f53f29");
			$("#checkCount").text("1부터 10까지 숫자만 가능합니다.");
			countCheck = false;
		}else if (recruitCount.search("0") == 0) {
			$("#checkCount").css("color", "#f53f29");
			$("#recruitCount").css("border", "2px solid #f53f29");
			$("#checkCount").text("앞에 0을 쓰지마세요.");
			countCheck = false;
		}else {
			$("#checkCount").css("color", "blue");
			$("#recruitCount").css("border", "2px solid blue");
			countCheck = true;
		}
	});
	
</script>
<script>
	
	$(".teamsearchB").click(function(){
		
		var teamName = $(".searchTeamName").val();
		var nameArr = [];
		
		nameArr = teamName.split("");
		
		console.log("몇글자 :" + nameArr.length);
		
		if(teamName == ''){
			swal("팀 이름을 입력하세요",'',"warning");
		}else if(nameArr.length<3){
			swal("3글자 이상 검색해주세요",'','warning');
		}else{
			$.ajax({
				url:'searchTeamName.tm',
				data:{teamName:teamName},
				success:function(data){
					
					console.log("데이터 길이 :" + data.length);
					
					$tbody = $("tbody");
					$("tbody").text("");
					var appendStr="";
					if(data != null){
						for(var i=0; i<data.length; i++){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data[i].teamNo+"'class='hiddenTno'>";
							appendStr += "<img id='mImg' src='resources/images/team/"+data[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+data[i].recruitCount+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
						}
					}else{
						appendStr += "<tr>";
						appendStr += "<td colspan ='6'>";
						appendStr += "<p>모집글이 없습니다.</p>";
						appendStr += "</td>";
						appendStr += "</tr>";
						
					}
					$tbody.append(appendStr);
					
					$(".moreList").css("display", "none");
				}
			});
		}

	});
</script>


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>