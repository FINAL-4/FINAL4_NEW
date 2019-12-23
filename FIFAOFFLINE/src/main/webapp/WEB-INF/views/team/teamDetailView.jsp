<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.kh.FIFAOFFLINE.team.model.vo.MyTeam, java.util.ArrayList"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<%
	ArrayList<MyTeam> myTeam =(ArrayList<MyTeam>)session.getAttribute("myTeam");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
}
#detailContent2{
	margin-left:70px;
	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 0 30px;
}
#btn{
	margin-left : 180px;
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
	margin-top:20px;
	margin-left:20px;
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
  height:180px;
  width:100%;
  vertical-align:center;
  text-align:center;
  align:center;
}

img.avatarM {
  margin-top:20px;
  margin-left:13px;
  width: 458px;
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

table.type03 {
    border-collapse: collapse;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-left: 3px solid #369;
    margin : 20px 10px;
}
table.type03 th {
    width: 147px;
    padding: 10px;
    font-weight: bold;
    vertical-align: center;
    background: #efefef;
    /* color: #153d73; */
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-size:1.7em;

}
table.type03 td {
    width: 349px;
    padding: 10px;
    vertical-align: top;
    border-right: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    font-size:1.7em;
}

</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<br><br><br><br><div id = "title"> 
	<h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;"">모집글 상세보기</h4>
	<div style = "width: 14%; display: inline-block;">
	<input type = button id = deleteBtn value = "글 삭제하기" onclick="deleteTeamAD()">			
	<input type = button id = modifyBtn value = "글 수정하기" onclick="UpdateView()">
	</div>
</div>
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 900px; width: 90%; border: black; margin: auto;">
		<form>																									<!-- 730 -->
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
				<td class="tRecruitCount">${t.recruitCount }</td>
			</tr>
			<tr>
				<td style="font-weight:bold;"> 모집내용 </td>
			</tr>
			<tr>
				<td colspan=2>${t.teamAdver }</td>
			</tr>
			
			<tr>
				<td colspan=2> 신청을 신청하기를 눌러주세요. <br> 수락 여부를 메일로 보내드리겠습니다. (24시간 이내 발송) </td>
			</tr>
		</table>
		</div>
		
		<div id = "detailContentDiv2" style = "display:none;">
		<table id = detailContent2> 
			<tr>
				<td style="font-weight:bold;"> 팀 장 </td> 
				<td> ${t.userName } </td>
			</tr>
			<tr>
				<td style="font-weight:bold;"> 활동지역 </td>
				<td> ${t.teamArea } </td>
			</tr>
			<tr>
				<td style="font-weight:bold;"> 모집인원</td>
				<td class="tRecruitCount"> ${t.recruitCount} </td>
			</tr>
			<tr>
				<td style="font-weight:bold;"> 모집내용 </td>
			</tr>
			<tr>
				<td colspan=2>${t.teamAdver }</td>
			</tr>
			
			<tr>
				<td colspan=2> 신청을 신청하기를 눌러주세요. <br> 수락 여부를 메일로 보내드리겠습니다. (24시간 이내 발송) </td>
			</tr>
		</table>
		</div>
		<!-- 기능시 구현!
		글 작성자가 로그인 시 신청하기 버튼 대신  글삭제하기 + 신청현황 보여주기
		글 작성자 제외 로그인 시 글 삭제하기 + 신청현황 버튼 안보이기  
		신청하기는 글 작성자 제외 모두 가능 (용병은 같은 팀원에서는 신청하기 못하게 신청하면 원래 같은 팀이라는 문구 나오게) 
		근데 수정하기는 모집글을 살려서 다시 수정해야 하지 않을까요 ??? 
		-->
		
			<c:url var="applyTeam" value="applyTeam.tm">
				<c:param name="userNo" value="${loginUser.userNo}"/>
				<c:param name="teamNo" value="${t.teamNo }"/>							
			</c:url>		
			<div id = btn>
				<div id = btnPosition1>
				<input type = button id = recruitBtn value = "모집 리스트 보기">
				<input type = button id = applyBtn value="신청하기" onclick='applyTeam()'> <br> <br>
				</div>
				<div id = btnPosition2>
				 <br> <br>
				<input type = button id = applyingBtn value = "신  청  현  황">
				</div>
			</div>
		</div>		
		<div id = applyDetail style="float: left; display:none;"> 
			<table id = applyDetailTable>
				<tr>
					<td colspan="3" style="border-bottom:3px solid gray; font-size: 2.3em;">
						신청현황
					</td>
				</tr>
				<c:if test="${!empty joinList }">
				<c:forEach var="join" items="${joinList}" varStatus="status">
				<tr>
					<td id="joinUser${join.userNo }">
						<div class="chip">
  							<img onclick="modalUp(${join.userNo})" src="resources/proFiles/${join.profile }" alt="Person" width="96" height="96">
  							${join.userName }
  							<%-- <c:url var="cancel" value="cancel.tm">
								<c:param name="userNo" value="${join.userNo }"/>
								<c:param name="teamNo" value="${t.teamNo}"/>
							</c:url> --%>
  							<input type = button id = "agreeBtn${join.userNo}" class = agreeBtn name = "O" value="O" style="background: green; color:white; margin-left:30px;" onclick="agree(${join.userNo})">
  							<input type = button id = 'cancelBtn${join.userNo}' class=cancelBtn name = "X" value="X" style="background: red; color:white; margin-left:10px;" onclick="cancel(${join.userNo})">
  						</div>
					</td>
				</tr>
				</c:forEach>
				</c:if>
				<c:if test="${empty joinList }">
				<tr>	
					<td>
						<p>신청한 인원이 없습니다.</p>
					</td>
				</tr>		
				</c:if>
				<tr>
					<td colspan=3 align = right>
						<input type = button id = closeBtn value="닫기" style="font-weight: bold; font-size:2em;">
					</td>
				</tr>
			</table>
		</div>
		</form>
	</div>
</div>

<div id="myModal" class="modal">
  <div class="modal-contentM animateM">
  	<span class="closeM" onclick="closeM()">&times;</span>
  	<div class="imgcontainerM">
      <img alt="Avatar" class="avatarM">
    </div>
    <div class="container" align="center">
     <table class="type03">
	    <tr>
	        <th scope="row">유저이름</th>
	        <td><p class="mUserName"></p></td>
	    </tr>
	    <tr>
	        <th scope="row">성별</th>
	        <td><p class="mGender"></p></td>
	    </tr>
	    <tr>
	        <th scope="row">이메일</th>
	        <td><p class="mEmail"></p></td>
	    </tr>
	    <tr>
	        <th scope="row">주소</th>
	        <td><p class="mAddress"></p></td>
	    </tr>
	</table>
    </div>
  </div>
</div>



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
	
	
	$("#applyingBtn").click(function(){
		var teamFlag = false;
		
		var myTeamNo = [];
		<%for(int i=0; i<myTeam.size(); i++){%>
			myTeamNo[<%=i%>] = <%=myTeam.get(i).getTeamNo()%>;
		<%}%>
		
		for(var i=0; i<myTeamNo.length; i++){
			if(${t.teamNo} == myTeamNo[i]){
				teamFlag = true;
			}
		}
		
		if(teamFlag){
			if(${t.userNo} == ${loginUser.userNo}){
				 $("#applyDetail").show();
			     $("#detailContentDiv1").hide();
			     $("#detailContentDiv2").show();
			}else{
				swal("팀장만 확인 할 수 있습니다.",'',"error");
				
			}
		}else{
			swal("같은 팀이 아닙니다.",'',"error");
		}
        
    });
	$("#closeBtn").click(function(){
		$("#applyDetail").hide();
		$("#detailContentDiv1").show();
		$("#detailContentDiv2").hide();
	});
	
	function cancel(id){
		
		var userNo = id;
		var teamNo = ${t.teamNo};
		
		$.ajax({
			url:"cancel.tm",
			data:{userNo:userNo,
				  teamNo:teamNo},
			dataType:"json",
			success:function(data){
				if(data != 0){
					swal("거절 하셨습니다.",'',"info");
					$("#joinUser"+id).remove();
				}
				else{
					swal("거절 실패.");
				}
			}
		});

	}
	
	function agree(id){
		var userNo = id;
		var teamNo = ${t.teamNo};
		
		$.ajax({
			url:"agree.tm",
			data:{userNo:userNo,
				  teamNo:teamNo},
			dataType:"json",
			success:function(data){
				if(data == 1){
					swal("승인하셨습니다.", "새로운 팀 멤버가 들어 왔습니다.", "success");
					$("#joinUser"+id).remove();
					$('.tRecruitCount').text(parseInt($('.tRecruitCount').text()) -1);
				}else if(data == 3){
					swal("해당 유저가 팀이 3개 입니다.",'',"warning");
				}else{
					swal("실패");
				}
			}
		});
	}


	// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	
	function modalUp(id){
		
		var userNo = id;
		
		$.ajax({
			url:"modal.tm",
			data:{userNo:userNo},
			dataType:"json",
			success:function(data){
				
				$(".mUserName").text(data.userName);
				$(".mGender").text(data.gender);
				$(".mEmail").text(data.userEmail);
				$(".mAddress").text(data.address);
				$(".avatarM").attr('src',"resources/images/testimage/"+data.profile)
				
				var modal = document.getElementById("myModal");
				
				modal.style.display="block";
			}
		});
		
		
	}
	
	function closeM(){
		var modal = document.getElementById("myModal");
		
		modal.style.display="none";
	}
	
	window.onclick = function(event) {
		var modal = document.getElementById("myModal");
		if (event.target == modal) {
		   modal.style.display = "none";
		}
	}
	

	function applyTeam(){
		if(${myTeam.size()} == 3){
			swal("3개 이상 팀을 가입하거나 생성할 수 없습니다.",'',"warning");
			
		}else{
			var teamFlag = false;
			var myTeamNo = [];
			var userNo=${loginUser.userNo};
			var teamNo=${t.teamNo};
			
			<%for(int i=0; i<myTeam.size(); i++){%>
				myTeamNo[<%=i%>] = <%=myTeam.get(i).getTeamNo()%>;
			<%}%>
			
			
			for(var i=0; i<myTeamNo.length; i++){
				if(teamNo == myTeamNo[i]){
					teamFlag = true;
				}
			}
			
			
			if(!teamFlag){
			$.ajax({
				url:"dupApply.tm",
				data:{userNo:userNo,
					  teamNo:teamNo},
				success:function(data){
					if(data == 1){
						swal("이미 신청한 팀입니다.",'',"error");
					}else{
						swal({
							  title: "신청하시겠습니까?",
							  icon: "info",
							  buttons: true,
							  dangerMode: true,
							})
							.then((willDelete) => {
							  if (willDelete) {
								location.href="applyTeam.tm?userNo="+userNo+"&teamNo="+teamNo;
							    swal("신청완료", {
							      icon: "success",
							    });
							  } else {
							    swal("취소");
							  }
							});
					}
				}	  
			});
			}else{
				swal("이미 가입되어있는 팀 입니다.");
			}
		}	
		
	}		
	
	function deleteTeamAD(){
		
		var teamFlag = false;
		var myTeamNo = [];
		<%for(int i=0; i<myTeam.size(); i++){%>
			myTeamNo[<%=i%>] = <%=myTeam.get(i).getTeamNo()%>;
		<%}%>
		
		for(var i=0; i<myTeamNo.length; i++){
			if(${t.teamNo} == myTeamNo[i]){
				teamFlag = true;
			}
		}
		if(teamFlag){
			if(${t.userNo} == ${loginUser.userNo}){
				var teamNo = ${t.teamNo};
				
				swal({
					  title: "삭제 하시겠습니까?",
					  icon: "warning",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						location.href="deleteTeamAD.tm?teamNo="+teamNo;
					    swal("삭제되었습니다.", {
					      icon: "success",
					    });
					  } else {
					    swal("취소되었습니다.");
					  }
					}); 
				
			}else{
				swal("팀장만 삭제할 수 있습니다.",'',"error");
			}
		}else{
			swal("팀장만 삭제할 수 있습니다.",'',"error");
		}
	}
	
	function UpdateView(){
		var teamFlag = false;
		
		var myTeamNo = [];
		<%for(int i=0; i<myTeam.size(); i++){%>
			myTeamNo[<%=i%>] = <%=myTeam.get(i).getTeamNo()%>;
		<%}%>
		
		for(var i=0; i<myTeamNo.length; i++){
			if(${t.teamNo} == myTeamNo[i]){
				teamFlag = true;
			}
		}
		
		if(teamFlag){
			if(${t.userNo} == ${loginUser.userNo}){
				var teamNo = ${t.teamNo};
				
				swal({
					  title: "수정하시겠습니까?",
					  icon: "info",
					  buttons: true,
					  dangerMode: true,
					})
					.then((willDelete) => {
					  if (willDelete) {
						location.href="updateTeamView.tm?teamNo="+teamNo;  
					  } else {
					    swal("취소되었습니다.");
					  }
					});
				
			}else{
				swal("팀장만 수정할 수 있습니다.",'',"error");
			}
		}else{
			swal("팀장만 수정할 수 있습니다.",'',"error");
		}
		
	}
	
	

	
</script>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>