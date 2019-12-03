<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" type="text/css" href="resources/css/style.css" />
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
    background-color: #0d47a1;
    color:white;
}

thead tr {
  background-color: #0d47a1;
  color: #ffffff;
}
tbody tr:nth-child(4n-3) {
  /* background-color: #bbdefb; */
  background-color: #e3f2fd;
}
tbody tr:nth-child(4n-1) {
  background-color: #e3f2fd;
}

#teamMenu .menu__item-name::after,
#teamMenu .menu__item-name::before{
	background: red;
}

#teamMenu.menu__item::after,
#teamMenu.menu__item::before{
   	color: red;
}

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
/* The Modal (background) */
.modal {
  display: none; /* Hidden by default */
  /* position: fixed; /* Stay in place */ */
  z-index: 1; /* Sit on top */
  left: 0;
  top: 0;
  width: 100%; /* Full width */
  height: 100%; /* Full height */
  overflow: auto; /* Enable scroll if needed */
  background-color: rgb(0,0,0); /* Fallback color */
  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
  
}




</style>
</head>
<jsp:include page = "../common/header.jsp"/>

<body>

<div id = "outer" style = "margin-top:180px;">
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; height:800px; margin:auto; padding-bottom:50px;">
		<div style="height:100%; width:100%; border-bottom:3px solid red;">
			<div class="example">
			<button class="createAD" onclick="createAD()">모집글 작성</button>
			<br><br><br>
				<p class="searchBInfo">지역으로 검색하세요.</p>
				<div class="searchButtons">
					<button style="width:200px; margin-left:50px;" class="addressB">역삼/개포/청담</button>
					<button style="width:200px;" class="addressB">삼성/대치/신사</button>
					<button style="width:200px;" class="addressB">논현/압구정/세곡</button>
					<button style="width:200px;" class="addressB">자곡/율현/일원</button>
					<br>
					<button style="width:200px; margin-left:50px;" class="addressB">수서/도곡/대치1</button>
					<button style="width:200px;" class="addressB">대치2/대치4/역삼1</button>
					<button style="width:200px;" class="addressB">역삼1/역삼2/도곡1</button>
					<button style="width:200px;" class="addressB">도곡2/개포/일원본</button>
				</div>	
			
				<p class="searchInfo">팀명으로 검색하세요</p>
				<br>
  				<button class="teamsearchB" style="width:75px; float:right; margin-top:8px; margin-bottom:8px; margin-right:50px; height:60px;"><i class="fa fa-search"></i></button>
  				<input type="text" placeholder="팀 이름으로 검색하세요." class="searchTeamName" style="width:400px; float:right;">
  			</div>
  			
			<h1 style="font-size:48px;">&nbsp;&nbsp;팀원 모집</h1>
		</div>
	</div>
	<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "width: 90%; margin: auto;">
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
			    		<img id="mImg${status.count }" src="resources/images/testimage/${team.teamImage }" style="width:100%; height:100%; padding-left:25px;">
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
		
		$.ajax({
			url:"moreList.tm",
			data:{page:page},
			dataType:"json",
			success:function(data){
				if((${pi.maxPage}+1)!=page){
					if(data.list.length==7){
						$tbody = $("tbody");
						var appendStr="";
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/testimage/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+i+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
						}

					}else if(data.list.length<7){
						$tbody = $("tbody");
						var appendStr="";
						for(var i in data.list){
							appendStr += "<tr class='teamselector'>";
							appendStr += "<td class='teamtest'>";
							appendStr += "<div style='height:200px; width:200px' class='Timgtag'>";
							appendStr += "<input type='hidden' value='"+data.list[i].teamNo+"'class='hiddenTno"+i+"'>";
							appendStr += "<img id='mImg"+i+"'src='resources/images/testimage/"+data.list[i].teamImage+"'style='width:100%; height:100%; padding-left:25px;'>";
							appendStr += "</div>";
							appendStr += "</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].userName+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamArea+"</td>";
							appendStr += "<td class='teamtest'>"+data.list[i].teamIntro+"</td>";
							appendStr += "<td class='teamtest'>"+i+"</td>";
							appendStr += "</tr>";
							appendStr += "<tr class='spacetr'>";
							appendStr += "</tr>";
							
							$(".moreList").remove();
						}
					}else if(data.list.length==0){
						$(".moreList").remove();
					}
					page++;
				}
				
				$tbody.append(appendStr);
			}
		});
	}
</script>
<script>
	$(document).ready( function() {
		$(".addressB").click(function(){
			$(this).toggleClass('clicked');
		});
	});
</script>
<script>
	function createAD(){
		location.href="createAD.tm";
	}
</script>


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>