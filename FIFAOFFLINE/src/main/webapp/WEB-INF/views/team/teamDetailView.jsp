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

</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<div id = "title"> 모집글 상세보기 </div>
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
				<td>${t.userName }</td>
			</tr>
			<tr>
				<td>활동지역</td>
				<td>${t.teamArea }</td>
			</tr>
			<tr>
				<td>모집인원</td>
				<td>${t.recruitCount }</td>
			</tr>
			<tr>
				<td align> 모집내용 </td>
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
				<td> 팀 장 </td> 
				<td> ${t.userName } </td>
			</tr>
			<tr>
				<td> 활동지역 </td>
				<td> ${t.teamArea } </td>
			</tr>
			<tr>
				<td> 모집인원</td>
				<td> ${t.recruitCount} </td>
			</tr>
			<tr>
				<td> 모집내용 </td>
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
				<input type = button id = deleteBtn value = "글 삭제하기" onclick="deleteTeamAD()">
				<input type = button id = modifyBtn value = "글 수정하기" onclick="UpdateView()"> <br> <br>
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
  							<img onclick="modalUp(${join.userNo})" src="resources/images/testimage/${join.profile }" alt="Person" width="96" height="96">
  							${join.name }
  							<%-- <c:url var="cancel" value="cancel.tm">
								<c:param name="userNo" value="${join.userNo }"/>
								<c:param name="teamNo" value="${t.teamNo}"/>
							</c:url> --%>
  							<input type = button id = "agreeBtn${join.userNo}" class = agreeBtn name = "O" value="O" style="background: green; color:white; margin-left:50px;" onclick="agree(${join.userNo})">
  							<input type = button id = 'cancelBtn${join.userNo}' class=cancelBtn name = "X" value="X" style="background: red; color:white; margin-left:17px;" onclick="cancel(${join.userNo})">
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
        $("#applyDetail").show();
        $("#detailContentDiv1").hide();
        $("#detailContentDiv2").show();
        
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
					$("#joinUser"+id).remove();
				}
				else{
					alert("거절 실패.");
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
				if(data != 0){
					$("#joinUser"+id).remove();
				}else{
					alert("승인 실패");
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
		
		var userNo=${loginUser.userNo};
		var teamNo=${t.teamNo};
		
		var confirmFlag = confirm("신청하시겠습니까?");
		if(confirmFlag){
			location.href="applyTeam.tm?userNo="+userNo+"&teamNo="+teamNo;
			alert("신청완료");
		}	
		else
			alert("취소");
	}		
	
	function deleteTeamAD(){
		
		var teamFlag = false;
		var myTeamNo = [];
		<%for(int i=0; i<myTeam.size(); i++){%>
			myTeamNo[<%=i%>] = <%=myTeam.get(i).getTeamNo()%>;
		<%}%>
		
		var myTeamGrade = [];
		<%for(int i=0; i<myTeam.size(); i++){%>
			myTeamGrade[<%=i%>] = <%=myTeam.get(i).getT_Grade()%>;
		<%}%>
		
		for(var i=0; i<myTeamNo.length; i++){
			if(${t.teamNo} == myTeamNo[i]){
				teamFlag = true;
			}
		}
		
		if(teamFlag){
			if(${t.userNo} == ${loginUser.userNo}){
				var teamNo = ${t.teamNo};
				var confirmFlag = confirm("삭제하시겠습니까");
				if(confirmFlag){
					location.href="deleteTeamAD.tm?teamNo="+teamNo;
				}
				
			}else{
				alert("팀장만 삭제할 수 있습니다.");
			}
		}else{
			alert("팀장만 삭제할 수 있습니다.");
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
				var confirmFlag = confirm("수정하시겠습니까");
				if(confirmFlag){
					location.href="updateTeamView.tm?teamNo="+teamNo;
				}
				
			}else{
				alert("팀장만 수정할 수 있습니다.");
			}
		}else{
			alert("팀장만 수정할 수 있습니다.");
		}
		
	}
	
	

	
</script>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>