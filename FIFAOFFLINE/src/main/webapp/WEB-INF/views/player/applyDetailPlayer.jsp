<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.team.model.vo.MyTeam, java.util.ArrayList"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
	ArrayList<MyTeam> myTeam = (ArrayList<MyTeam>)session.getAttribute("myTeam");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<style>
#playerMenu .menu__item-name::after,
#playerMenu .menu__item-name::before{
   background: red;
}
#playerMenu.menu__item::after,
#playerMenu.menu__item::before{
   color: red;
}
#title{
	font-size: 40px; 
	margin-top: 120px; 
	border-bottom: 5px solid grey;
}
#playContent{
	width: 20%;
	margin-left:3%;
	margin-right:2%;
	font-size:2.4em;
	font-weight: bold;
	margin-top : 3%;
	display: inline-block;
}
#playContent button{
	font-size:15px;
	margin:auto;
	width:100%;
	height:5%;
	padding-top:5px;
	padding-bottom:5px;
}
#picture{
	width:300px; 
	height:300px;  
	margin-right: 25%;
}
#detailContentDiv1{
	width: 40%;
	margin-right:2%;
	margin-left:2%;
	display: inline-block;
	margin-top : 3%;
}
#detailContent1{
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
	letter-spacing: 6px;
}
#locationDiv{
	width: 25%;
	margin-right:3%;
	margin-left:2%;
	display: inline-block;
	margin-top : 3%;
}
#btn{
	margin-top: 2%;
}
#recruitBtn, #applyBtn {
	margin-left : 30px;
	width:250px;
	height: 40px;
	font-size: 1.5em;
	font-weight: bold;
	background: black;
	border: 1px solid black;
	color:white;
}
#applyBtn{
	margin-left:64%;
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
	border: 1px solid black;
	margin-left:31.5%;
}
#recruitBtn:hover, #applyBtn:hover, #applyingBtn:hover, #deleteBtn:hover, #modifyBtn:hover{
	color:black;
	background: white;
}
#applyDetail{
	margin-top:50px;
	margin-left:30px;
}
#applyDetailTable{
	width:320px;
	border-collapse: separate;
	border-spacing: 10px 25px;
} 
.agreeBtn, .cancelBtn{
	width:35px;
	height:32px;
	/* font-weight: bold; 
	color:black;
	padding-bottom: 30px;
	padding-left:7px; */
}
.agreeBtn:hover, .cancelBtn:hover, #closeBtn:hover{
	cursor: pointer;
}
/* .agreeBtn{
	background: green;
}
.cancelBtn{
	background: red;
} */
#closeBtn{
	background: white;
	border: 1px solid white;
}
#detailContent1 td{
	width:400px;
	margin-left: 15px;
	border-bottom: 2px solid lightgrey;
}
h6{
	margin-top:0px;
	margin-bottom:10px;
	font-size:20px;
}	

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	left: 0;
	top: 0;
	width: 60%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0,0,0); /* Fallback color */
	background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	padding-top: 60px;
}
/* Modal Content/Box */
.modal-content1 {
	background-color: #fefefe;
	margin: 5% auto 15% auto; /* 5% from the top, 15% from the bottom and centered */
	border: 1px solid #888;
	width: 60%; /* Could be more or less, depending on screen size */
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
.close:hover,
.close:focus {
	color: red;
	cursor: pointer;
}
/* Add Zoom Animation */
.animate {
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
/* Change styles for span and cancel button on extra small screens */
@media screen and (max-width: 300px) {
	span.psw {
		display: block;
     	float: none;
  	}
  	.cancelbtn {
    	 width: 100%;
  	}
}
/* Extra styles for the cancel button */
.cancelbtn {
	width: auto;
	padding: 10px 18px;
	background-color: #f44336;
}

#listTable{
	font-size : 2.5em;
	border-bottom: 2px solid grey;
	text-align: center;
	border-spacing: 20px;
}

#listTr, #listTd{
	border-bottom:2px solid grey;
}


</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 50px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<div id = "title"> 
	<h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;">${pRecruit.rTitle }</h4>
	<div style = "width: 14%; display: inline-block;">
		<c:url var="tplDelete" value="teamPlayListDelete.pl">
			<c:param name="rNum" value="${pRecruit.rNum }"/>
		</c:url>
		<c:url var="tplModify" value="teamPlayListModifyView.pl">
			<c:param name="rNum" value="${pRecruit.rNum }"/>
		</c:url>	
		<c:if test="${loginUser.userNo == pRecruit.userNo }">				 
			<input type = button id = deleteBtn value = "글 삭제하기" onclick="deleteBtn()">
			<input type = button id = modifyBtn value = "글 수정하기" onclick="modifyBtn()" class="addressB">
		</c:if>
	</div>
</div>
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 850px; width: 90%; border: black; margin: auto;">
																													<!-- 730 --> 
		<div id = playContent style = "float:left">																					
		<table align = center>
			<tr>
				<img id = "picture" src="resources/images/team/${pRecruit.teamImage }">
			</tr>
			<tr>
				<td colspan = 2 style = "width: 100%; text-align: center;"> ${pRecruit.teamName } </td> 
			</tr>
		</table>
		</div>
		
		<div id = "detailContentDiv1">
		<h6> 팀 정보 </h6>
		<table id = detailContent1> 
			<tr>
				<td>팀 장</td> 
				<td>${pRecruit.userName } </td>
			</tr>
			<tr>
				<td>사용 경기장</td>
				<td>${pRecruit.rPlace } </td>
			</tr>
			<tr>
				<td>경기 날짜 </td>
				<td>${pRecruit.rDay }</td>
			</tr>
			<tr>
				<td>경기 시간</td>
				<td>${pRecruit.rsHour } : ${pRecruit.rsMin } ~ <br> 
				    ${pRecruit.rfHour } : ${pRecruit.rfMin }
				</td>
			</tr>
			<tr>
				<td> 마감인원 </td>
				<td class="deadlineCount">${pRecruit.deadline } 명</td>
			</tr>
			<tr>
				<td> 참가비 </td>
				<td>${pRecruit.rMoney } 원</td>
			</tr>
			<tr>
				<td align> 모집내용 </td>
			</tr>
			<tr>
				<td colspan=2> &nbsp;&nbsp;&nbsp;${pRecruit.rContent }</td>
			</tr>
		</table>
		</div>
		
		<div id = locationDiv>
			<h6 style = "margin-bottom: 5px;">상세위치 </h6>
			<div id = "map" style = "width: 420px; height: 400px; float: left; border: 2px solid grey;"></div>
		</div>
	
		<div id = btn>
		<c:url var="tplApply" value="teamPlayApply.pl">
			<c:param name="rNum" value="${pRecruit.rNum }"/>
			<c:param name="userNo" value="${loginUser.userNo }"/>
		</c:url>
		<c:if test="${loginUser.userNo != pRecruit.userNo }">
			<input type = button id = applyBtn value = "신청하기" onclick = "applyBtn()"> 
		</c:if>
			<input type = button id = recruitBtn value = "모집 리스트 보기" onclick = "location.href='playMain.pl'"><br><br><br><br><br>
		<c:if test="${loginUser.userNo == pRecruit.userNo }">                 <!-- "document.getElementById('id02').style.display='block'" -->
			<input type = button id = applyingBtn value = "신  청  현  황" onclick = "document.getElementById('id02').style.display='block';">
		</c:if>
	</div>	
</div>

<div id = id02 class = "modal">
	<form class="modal-content1 animate" action="/action_page.php" method="post">
    <div class="imgcontainer">
      <span onclick="document.getElementById('id02').style.display='none'" class="close" title="Close Modal">&times;</span>
    </div>

    <div class="container">
    	<label style="font-size:3em; font-weight: bold; border-bottom: 5px solid grey;"> 신 청 현 황</label> <br><br><br><br>
    	
    	<table id = listTable>
    	<c:if test="${!empty pList }">
    	<thead>
    		<tr id = listTr >
    			<th> 프로필사진 </th>
    			<th> 이름 </th>
    			<th style="width:90px;"> 포지션 </th>
    			<th> 번호 </th>
    			<th></th>
    			<th></th>
    		</tr>
    	</thead>
    	
    	<c:forEach var="pList" items="${pList }" varStatus="status">   
    		<tr id = "listTd${pList.userNo }">
    			<td><img id = "picture" src="resources/proFiles/${pList.proFile }" style="width:170px; 
    																					  height: 100px; margin-left:5px; border-radius:50%;
			  																			  border-bottom:5px solid grey;"></td>
    			<td style="width:250px;">${pList.userName }</td>
    			<td style="width:80px;">${pList.position }</td>
    			<td style="width:500px;">${pList.phone }</td>
    			<td> 
    			<img id="agreeBtn${pList.userNo }" src="resources/images/agree2.png" class=agreeBtn value="O" name="agree" onclick="agree1(${pList.userNo})" style="margin-left:20px;">
    			<%-- <input type = "button" id="agreeBtn${pList.userNo }" class="agreeBtn" value="O" name="agree" onclick="agree1(${pList.userNo})" style="margin-left:20px;"> --%>
    			</td>
    			<td>
    			<img id="cancelBtn${pList.userNo }" src="resources/images/reject2.png" class="cancelBtn" value="X" name="cancel" onclick="cancel1(${pList.userNo})"> 
    			<%-- <input type = "button" id="cancelBtn${pList.userNo }" class="cancelBtn" value="X" name="cancel" onclick="cancel1(${pList.userNo})"> --%>
    			</td>
    		</tr>
    	</c:forEach>
    	</c:if>
    	
    	<c:if test="${empty pList }">
    		<tr>
    			<td colspan=6> 신청한 인원이 없습니다. </td>
    		</tr>
    	</c:if>
    	</table> 	
    	
    </div>

   
  </form>
</div>
	</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f9f6250199748b3a23d7b3d7d88dde&libraries=services"></script>
<script type="text/javascript">
	var X = Number("${pRecruit.rPlaceX }");
	var Y = Number("${pRecruit.rPlaceY }");
	var N = "${pRecruit.rPlace}";
	
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
	    center: new kakao.maps.LatLng(Y, X), // 지도의 중심좌표
	    level: 4 // 지도의 확대 레벨
	};  
	
	//지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption); 
	
	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();
	
	//지도에 컨트롤을 추가해야 지도위에 표시됩니다
	//kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);
	
	//지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);


	// 마커가 표시될 위치입니다 
	var markerPosition  = new kakao.maps.LatLng(Y, X); 

	var imageSrc = 'resources/images/marker.png', // 마커이미지의 주소입니다    
    imageSize = new kakao.maps.Size(80, 80), // 마커이미지의 크기입니다
    imageOption = {offset: new kakao.maps.Point(38, 80)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
      
	// 마커의 이미지정보를 가지고 있는 마커이미지를 생성합니다
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption)
	
	
	// 마커를 생성합니다
	var marker = new kakao.maps.Marker({
	    position: markerPosition,
	    image: markerImage
	});

	// 마커가 지도 위에 표시되도록 설정합니다
	marker.setMap(map);

	var iwContent = '<div style="padding:0px; font-size: 13px;">'+N+'</div>', // 인포윈도우에 표출될 내용으로 HTML 문자열이나 document element가 가능합니다
	    iwPosition = new kakao.maps.LatLng(Y, X); //인포윈도우 표시 위치입니다

	// 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
	    position : iwPosition, 
	    content : iwContent 
	});
	  
	// 마커 위에 인포윈도우를 표시합니다. 두번째 파라미터인 marker를 넣어주지 않으면 지도 위에 표시됩니다
	infowindow.open(map, marker); 

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

<!-- 신청 -->
<script>
// Get the modal
var modal = document.getElementById('id02');

// When the user clicks anywhere outside of the modal, close it
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

// 신청 수락
function agree1(id){
	var userNo = id;
	var rNum = ${pRecruit.rNum};
	
	$.ajax({
		url:"agreePlay.pl",
		data:{userNo:userNo, rNum:rNum},
		dataType:"json",
		success:function(data){
			if(data != 0){
				swal("신청을 수락하였습니다. \n수락 문자메세지가 전송됩니다!", "", "success");
				$("#listTd"+id).remove();
				$(".deadlineCount").text(parseInt($(".deadlineCount").text())-1 + " 명");
			} else {
				swal("이미 수락하였습니다!", "", "error");
			}
		}
	});
}

// 신청 거절 
function cancel1(id){
	var userNo = id;
	var rNum = ${pRecruit.rNum};
	
	$.ajax({
		url:"cancelPlay.pl",
		data:{userNo:userNo, rNum:rNum},
		dataType:"json",
		success:function(data){
			if(data != 0){
				swal("신청을 거절하였습니다. \n거절 문자메세지가 전송됩니다!", "", "success");
				$("#listTd"+id).remove();
			} else {
				swal("거절실패!", "", "error");
			}
		}
	});
}

function applyBtn(){
	var playerFlag = false;
	var userNo = ${loginUser.userNo};
	var myTeamNo = [];
	var rNum = ${pRecruit.rNum};
	
	if(!playerFlag){
		$.ajax({
			url:"ajaxApplyPlayer.pl",
			data:{userNo:userNo, rNum:rNum},
			success:function(data){
				if(data == 1){
					swal("이미 신청했습니다.", "", "error");
				} else {
					swal({
						  title: "정말로 신청하시겠습니까 ? ",
						  buttons: true,
						  dangerMode: true,
						})
						.then((willDelete) => {
						  if (willDelete) {
						    swal("신청이 완료되었습니다!", {
						      icon: "success",
						    });
						    location.href="teamPlayApply.pl?userNo="+userNo+"&rNum="+rNum;
						  } else {
						    swal("신청을 취소했습니다!");
						  }
						});
				}
			}
		});
	} else {
		swal("이미 가입되어있는 팀 입니다!", "", "error");
	}
}

function deleteBtn(){
	swal({
		  title: "정말로 삭제하시겠습니까 ? ",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			location.href='${tplDelete}'
		    swal("삭제가 완료되었습니다!", {
		      icon: "success",
		    });
		  } else {
		    swal("삭제를 취소했습니다!");
		  }
		});
	/* var deleteBtn = confirm("정말로 삭제하시겠습니까 ?");
	if(deleteBtn){
		location.href='${tplDelete}';
	}else{
		return false;
	} */
}

function modifyBtn(){
	swal({
		  title: "정말로 수정하시겠습니까 ? ",
		  buttons: true,
		  dangerMode: true,
		})
		.then((willDelete) => {
		  if (willDelete) {
			location.href='${tplModify}'
		   swal("수정화면으로 넘어가겠습니다!", {
		      icon: "success",
		    });
		  } else {
		    swal("수정을 취소했습니다!");
		  }
		});
/* var modifyBtn = confirm("정말로 수정하시겠습니까 ?");
	if(modifyBtn){
		location.href='${tplModify}';
	} else {
		return false;
	} */
}
</script>


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>