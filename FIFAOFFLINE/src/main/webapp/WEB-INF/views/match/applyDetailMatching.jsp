<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  var $$$ = jQuery.noConflict();
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<!-- <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script> -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
<title>Insert title here</title>
<style>
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


#title{
	font-size: 40px; 
	margin-top: 120px; 
	border-bottom: 5px solid grey;
}

#teamContent{
	width: 20%;
	margin-left:3%;
	margin-right:2%;
	font-size:2.4em;
	font-weight: bold;
	margin-top : 3%;
	display: inline-block;
}

#detailContentDiv1{

	width: 40%;
	margin-right:2%;
	margin-left:2%;
	display: inline-block;
	margin-top : 3%;
}

#locationDiv{

	width: 25%;
	margin-right:3%;
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
#detailContent2{

	margin-top: 50px;
	font-size:2em;
	border-collapse: separate;
	border-spacing: 60px 30px;
	letter-spacing: 4px;
}
#btn{
	margin-top: 2%;
}
#recruitBtn, #applyBtn, #deleteBtn, #modifyBtn {
	width:150px;
	height: 40px;
	font-size: 1.5em;
	font-weight: bold;
	background: black;
	border: 1px solid black;
	color: white;
}
#applyingBtn{
	width:505px;
	height:50px;
	color:white;
	font-size: 2em;
	font-weight: bold;
	background: black;
	border: 1px solid black;
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

#applyDetailTable td{
	border-bottom: 1px solid lightgrey;
	border-collapse: collapse;
} 

.agreeBtn, .cancelBtn{
	width:35px;
	height:30px;
	font-weight: bold; 
	font-size:1.5em;
}
#agreeBtn:hover, #cancelBtn:hover, #closeBtn:hover{
	cursor: pointer;
}
#closeBtn{
	background: white;
	border: 1px solid white;
}
#detailContent1 td{
	width:400px;
	margin-left: 15px;
	border-bottom: 1px solid lightgrey;
}
#detailContent2 td{
	text-align:left;
}

#teamContent button{
	font-size: 15px;
	margin :auto;
	width: 100%;
	height: 5%;
	padding-top: 5px;
	padding-bottom: 5px;
}

h6{
	margin-top: 0px;
	margin-bottom: 10px;
	font-size: 20px;

}

#teamView{
	background: black;
	color: white;
	border: 1px solid black;
	font-weight: bold;
	font-size: 14px;
}

#teamView:hover{
	background: white;
	color: black;

}


/* ---------------------------------------- 툴팁  종료-------------------------------------*/
				
		.selectTeam{
			padding-top: 15px;
			background: black;
			color: white;
			border-bottom: 0.5px solid lightgrey;
		}
		
		.selectTeam:hover{
			background: white;
			color: black;
			cursor: pointer;
		}
		.con-tooltip {
		
		  position: relative;
		  margin: 10px;
		  
		  display: inline-block;
		  
		  transition: all 0.3s ease-in-out;
		  cursor: default;
		
		}
		
		/*tooltip */
		.tooltip {
		  visibility: hidden;
		  z-index: 10;
		  opacity: .40;
		  
		  width: 140%;
		
		  background: black;
		  color: white;
		  
		  position: absolute;
		  top:-140%;
		  left: -25%;
		  
		
		  font: 25px;
		
		  transform: translateY(9px);
		  transition: all 0.3s ease-in-out;
		  
		  box-shadow: 0 0 3px rgba(56, 54, 54, 0.86);
		}
		
		.tooltip:hover {

		
		  background: black;
		  color: white;

		
		  font: 25px;

		}
		
		
		/* tooltip  after*/
		.tooltip::after {
		  content: "";
		  width: 0;
		  height: 0;
		  
		  border-style: solid;
		  border-width: 0 0 0 0;
		  border-color: black transparent transparent transparent;
		
		  position: absolute;
		  left: 40%;
		
		}
		
		.con-tooltip:hover .tooltip{
		  visibility: visible;
		  transform: translateY(-10px);
		  opacity: 1;
		  transition: .3s linear;
		  animation: odsoky 1s ease-in-out infinite  alternate;
		
		}
		@keyframes odsoky {
		  0%{
		    transform: translateY(1px);	
		  }
		
		  100%{
		    transform: translateY(1px);	
		  }
		
		}
	
		.bottom:hover {transform: translateY(6px);}
	
		.bottom .tooltip { top:115%; left:-20%; }
		
		.bottom .tooltip::after{
		  top:-17%;
		  left:40%;
		  transform: rotate(180deg);
		}
		
		.right:hover {transform: translateX(6px); }
		
		.right .tooltip { top:-500%; left:115%; }

		.right .tooltip::after{
		  top:40%;
		  left:-12%;
		  transform: rotate(90deg);
		}
		
		/* ---------------------------------------- 툴팁  종료-------------------------------------*/
	/* ===============팀정보 보기====================== */
	#showTeamInfo{
		border: 1px solid lightgrey;
		width: 45%;
		height: 300px;
		background: white;
		display: none;
		padding: 20px;
	}
	
	#teamImgDiv{
		width: 30%;
		margin-left:3%;
		height: 260px;
		display: inline-block;
		float: left;
	}
	
	#teamInfoDiv{
		margin-left:5%;
		width: 55%;
		height: 260px;
		display: inline-block;
		float: left;
	}
	
	#teamInfoTb{
		width: 100%;
		height: 100%;
		border-collapse: collapse;
		
	}
	
	#teamInfoTb td{
		padding-top: 3px;
		border-bottom: 2px solid lightgrey;
		vertical-align: top;
	}
	
	#teamInfoTb textarea{
		width: 100%;
		height: 100%;
		resize: none;
		font-size: 15px;
		background: white;
		border: 1px solid white;
	}
	#teamInfoTb button{
		width: 100%;
		height: 100%;
		font-size: 15px;
		background: black;
		color:white;
		border: 1px solid black;
		font-weight: bold;
	}
	
	#teamInfoTb button:hover{
		width: 100%;
		height: 100%;
		font-size: 15px;
		background: white;
		color:black;
		border: 1px solid black;
	}
	
	
	#showTeamInfo h2{
		margin-bottom: 0px;
		margin-top: 0px;
		font-size: 28px;
		font-weight: bold;
	}
	
	#showTeamInfo h3{
		margin-bottom: 0px;
		margin-top: 0px;
		font-size: 18px;
		font-weight: bold;
	}
	
	#showTeamInfo h4{
		margin-bottom: 0px;
		margin-top: 0px;
		font-size: 18px;
	}
	
	#xDiv{
		display: inline-block;
	}
	
	#memberInfoTb{
		color : black;
		text-align: center;	
		border-collapse: collapse;
	}
	
	/* ============================================ */
	
	#inputResultTb{
		border-collapse: collapse;
		border-bottom: 2px solid lightgrey;
	}
	

	#inputResultTb h1{
		border-bottom: 2px solid lightgrey;
		font-size : 30px;
		margin-top: 0px;
		margin-bottom: 0px;
	}
	
	#inputResultTb h2{
		font-size: 25px;
		margin-top: 0px;
		margin-bottom: 0px;
	}
	
	#inputResultTb input{
		font-size: 25px;
		height: 25px;
		width: 60px;
		text-align-last:center;
	}
	
	#inputResultTb button{
		width: 60px;
		height: 25px;
		font-size: 15px;
		margin-left: 5px;
		margin-right: 5px;
		background: black;
		color: white;
		border: 1px solid black; 
	}
	
	#inputResultTb button:hover{
		background: white;
		color: black;
		cursor: pointer;
	}
	
</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 50px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
	<div id = "title" >
		<h4 style="font-size:45px; margin-bottom: 10px; margin-top: 0px; width: 85%; display: inline-block;">${match.mTitle }</h4>
		<div style = "width: 14%; display: inline-block;">
			<c:choose>
			<c:when test="${loginUser.userNo == match.userNo and match.mStatus == 'Y'}">
			<input type = button id = deleteBtn value = "글 삭제하기" onclick="deleteMatch(${match.mId })" style = "width: 45%; height: 40px; padding: 0px; margin-right: 5%; font-size: 15px;">
				<c:url var="goUpdateMatch" value="goUpdateMatch.ma">
				<c:param name="mId" value="${match.mId }"/>
				<c:param name="teamNo" value="${match.teamNo }"/>
				<c:param name="mContent" value="${match.mContent }"/>
				<c:param name="mTitle" value="${match.mTitle }"/>
				<c:param name="mSystem" value="${match.mSystem }"/>
				<c:param name="dues" value="${match.dues }"/>
				<c:param name="mLocationName" value="${match.mLocationName }"/>
				<c:param name="mLocationX" value="${match.mLocationX }"/>
				<c:param name="mLocationY" value="${match.mLocationY }"/>
				<c:param name="mDay" value="${match.mDay }"/>
				<c:param name="sHour" value="${match.sHour }"/>
				<c:param name="sMinute" value="${match.sMinute }"/>
				<c:param name="eHour" value="${match.eHour }"/>
				<c:param name="eMinute" value="${match.eMinute }"/>
				</c:url>
			<input type = button id = modifyBtn value = "글 수정하기" onclick = "location.href='${goUpdateMatch}'" style = "width: 45%; height: 40px; padding: 0px; font-size: 15px;" class="addressB">
			</c:when>
			<c:otherwise>
			</c:otherwise>
			</c:choose>
		</div>
	</div>




	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 780px; width: 100%; border: black; margin: auto;">																									<!-- 730 -->
			<c:forEach var = "appMatch" items="${amList }" varStatus="status">
				<c:if test="${appMatch.teamNo == match.mtId }">
					<c:set var="am" value="${appMatch }" scope="page"/>
				</c:if>
			</c:forEach>
		
			<div id = teamContent style = "float:left;"> 
				<h6>팀정보</h6>
				<table align = "center" >
					<tr>
						<img id = "logo" src="resources/images/team/${match.teamImg }" width="90%;" height="300px;" style = "margin-left: 7%; margin-right: 25%; border: 1px solid lightgrey;">
					</tr>
					<tr>
						<td colspan="2" style = "width: 100%; text-align: center;">${match.teamName }</td>
					</tr>
					<tr>
						<td style = "width: 50%; margin-left: 25%; margin-right: 25%;"><button id = "teamView" onclick = "showTeamInfo(${match.teamNo})">팀정보 보기</button></td>
					</tr>
				</table>
			</div>
			
			
			<div id = "detailContentDiv1">
				<h6>매치정보</h6>
				<table id = detailContent1> 
					<tr>
						<td style = "width: 30%;">경기 유형</td> 
						<td style = "width: 70%;">${match.mSystem }</td>
					</tr>
					<tr>
						<td>경기 날짜 </td>
						<td>${match.mDay }</td>
					</tr>
					<tr>
						<td>경기 시간</td>
						<td>
							${match.sHour }:${match.sMinute } ~  ${match.eHour }:${match.eMinute }
						</td>
					</tr>
					<tr>
						<td>경기 장소</td>
						<td>
							${match.mLocationName }
					</tr>
					<tr>
						<td>참가비 </td>
						<td>${match.dues } 원</td>
					</tr>
					<tr>
						<td colspan=2>${match.mContent }</td>
					</tr>
				</table>
			</div>
			
			
				<c:if test="${match.mStatus == 'Y' }">
				<div id = "locationDiv">
				<h6 style = "margin-bottom: 5px;">상세위치 </h6>
				<div id = "map" style = "width: 420px; height: 400px; float: left; border: 2px solid grey;"></div>
				</div>
				</c:if>
				
				<c:if test="${match.mStatus == 'ING' }">
				<div id = "locationDiv" style = "display: none; width: 500px; height: 500px;">
				<h6 style = "margin-bottom: 5px;">상세위치 </h6>
				<div id = "map" style = "width: 500px; height: 500px; border: 2px solid grey;"></div>
				</div>
				</c:if>
				
				<c:if test="${match.mStatus == 'ING' }">
				<div id = teamContent style = "float:right; width: 345px; height: 400px; margin-right: 6%;"> 
				<h6>상대팀 정보</h6>
				<table align = "center" >
					<tr>
						<img id = "logo" src="resources/images/team/${am.teamImg }" width="90%;" height="300px;" style = "margin-left: 7%; margin-right: 25%; border: 1px solid lightgrey;">
					</tr>
					<tr>
						<td colspan="2" style = "width: 100%; text-align: center;">${am.teamName }</td>
					</tr>
					<tr>
						<td style = "width: 50%; margin-left: 25%; margin-right: 25%;"><button id = "teamView" onclick = "showTeamInfo(${am.teamNo})">팀정보 보기</button></td>
					</tr>
				</table>
				</div>
				</c:if>
			
			<c:if test="${match.mStatus == 'Y' }">
			<div id = btn style = "margin-left: 30%; margin-top: 5%;">
					<input type = button id = applyingBtn value = "신  청  현  황" style = "margin-right: 26%;" onclick = "showAppMatch();">
					<input type = button id = recruitBtn value = "돌아가기" onclick = "location.href='goMatch.ma'" style = "margin-right: 1%;">
					<div class="con-tooltip bottom">
						<input type = button id = applyBtn value = "신청하기" onclick = "swal('', '팀을 선택해주세요.', 'warning');">
						<div class="tooltip">
							<div id = "teamList">
							<c:forEach var="team" items="${myTeam }">
								<c:if test="${team.t_Grade == 1 }">
									<div class = "selectTeam" onclick = "appMatch(${team.teamNo },'${team.teamName}')" style = "width: 100%; height: 50px; font-size: 15px; text-align: center; font-weight: bold;">${team.teamName }</div>
								</c:if>
							</c:forEach>
							</div>
							<h6 id = "tlInfo" style = "margin: none; font-size: 13px; text-align: center; ">주장으로 소속된 팀이 없습니다.</h6>
				        </div>
					</div>
			</div>	
			</c:if>
			
			<c:if test="${match.mStatus == 'ING' }">
			<div id = btn style = "margin-left: 30%; margin-top: 5%;">
					<input type = button id = applyingBtn value = "매칭 결과 입력" style = "margin-right: 22.5%; " onclick = "showInputResult();">
					<input type = button id = applyBtn value = "상세위치보기" onclick = "showMap()">
					<input type = button id = recruitBtn value = "돌아가기" onclick = "location.href='goMatch.ma'" style = "margin-left: 1%;">
			</div>	
			</c:if>
						
				
		<div id = "applyDetail" style="display:none; background: white; width: 50%; margin: auto;"> 
			<table id = "applyDetailTable" style = "width: 50%; margin-left: 25%; margin-right: 25%;">
				<tr>
					<td colspan="4" style="border-bottom:3px solid gray; font-size: 2.3em;">
						신청현황
					</td>
				</tr>
				<c:choose>
				<c:when test = "${fn:length(amList) != 0 }">
				<c:forEach var="appMatch" items="${amList }" varStatus="status">
				<tr id = "${appMatch.teamNo }">
					<td>
						<input type = "hidden" value ="${appMatch.teamNo }" style = 'disply:none;'/>
					</td>
					<td style = "font-size:1.7em; width: 50%;">
						${appMatch.teamName }
					</td>
					
					<td style = "width: 25%;">
						<c:choose>
						<c:when test="${loginUser.userNo == match.userNo}">
						<input type = button id = "matchingBtn" name = "O" value="매칭하기" style="background: black; color:white; font-size: 15px;"
								 onclick = "confirmAm(${appMatch.teamNo}, ${match.mId},'${appMatch.teamName }', '${appMatch.userName}', ${match.teamNo },
								  '${match.teamName }', '${match.userName }', '${match.mSystem }', '${match.mLocationName }', '${match.mDay }','${match.sHour }',
								  '${match.sMinute }','${match.eHour }','${match.eMinute }','${match.dues }')">
						</c:when>
						<c:when test="${loginUser.userNo == appMatch.userNo}">
						<input type = button id = "cancleBtn" name = "O" value="신청취소" style="background: black; color:white; font-size: 15px;" onclick = "cancleAm(${appMatch.teamNo}, ${match.mId})">
						</c:when>
						<c:otherwise>
						</c:otherwise>
						</c:choose>
					</td>
					<td style = "width: 25%;"> 
						<input type = button id = "detailTeamBtn" name = "O" value="팀상세보기" style="background: black; color:white; font-size: 15px;" onclick = "showTeamInfo(${appMatch.teamNo });">
					</td>
				</tr>
				</c:forEach>
				</c:when>
				<c:otherwise>
				<tr>
					<td id = "noInfo" colspan="4">
						<h1>신청한 팀이 없습니다.</h1>
					</td>
				</tr>
				</c:otherwise>
				</c:choose>
			</table>
			<input type = button id = closeBtn value="닫기" style="font-weight: bold; font-size:2.5em; padding-left: 90%; margin-bottom: 3%;" onclick = "closeBtn();">
		</div>
	</div>
</div>


<div id = "showTeamInfo">
	<div id = "teamImgDiv">
		<img id = "teamImage" src="" style = "width: 100%; height: 100%; border: 1px solid lightgrey;">
	</div>
	<div id = "teamInfoDiv">
		<table id = "teamInfoTb">
			<tr>
				<td colspan="3" style = "height: 20px; padding: 0px;"><h2 id = "teamName">테스트</h2></td>
			</tr>
			<tr>
				<td style = "height: 20px;"><h3>활동지역</h3></td>
				<td colspan="2"><h4 id = "teamArea"></h4></td>
			</tr>
			<tr>
				<td style = "height: 20px;"><h3>전적</h3></td>
				<td colspan="2"><h4 id = "teamRecord"></h4></td>
			</tr>
			<tr>
				<td style = "height: 15px; width: 20%"><h3>팀원</h3></td>
				<td style =	" width: 60%"><h4 id = "memberCount"></h4></td>
				<td style = " width: 20%">
					<div class="con-tooltip right" style = "width: 100%; height: 100%; font-size: 15px; margin: 0px;">
						<button>팀원확인</button>
						<div class="tooltip" style = "width: 400px; height: 700px; background: white; border: 2px solid lightgrey;">
							<div style = "padding: 10px;">
								<table id = "memberInfoTb" style = "width: 100%; height: 100%;">
									
								</table>
							</div>
				        </div>
					</div>
				</td>
			</tr>
			<tr>
				<td style = "height: 120px;"><h3>팀소개</h3></td>
				<td colspan="2"><textarea id = "teamIntro" readonly></textarea></td>
			</tr>
		</table>
	</div>
	<div id = "xDiv" style = "margin-left: 2.5%;">
		<button id = "xBtn" style = "font-size: 25px; background: white; border: 1px solid white;" onclick="closePop()">X</button>
	</div>
</div>




<div id = "inputResultDiv" style = "width: 500px; height: 200px; background: white; padding: 30px; display: none;">
	<form id = "scoreForm" action="insertResult.ma">
		<input type = "hidden" name = "mId" value = "${match.mId }">
		<table id = "inputResultTb" style = "width: 100%; height: 100%; text-align: center;">
			<tr>
				<td style = "height: 40px; text-align: left;" colspan="5"><h1>매칭 결과 입력</h1></td>
			</tr>
			<tr>
				<td style = "height: 60px; width: 88px;">
					<h2>${match.teamName }</h2>
					<input type = "hidden" name = "tId" value = "${match.teamNo }">
				</td>
				<td style = "height: 60px; width: 88px;">
					<input id = "myScore" name = "myScore">
				</td>
				<td style = "height: 60px; width: 88px;">
					<h2>VS</h2>
				</td>
				<td style = "height: 60px; width: 88px;">
					<input id = "yourScore" name = "yourScore">
				</td>
				<td style = "height: 60px; width: 88px;">
					<h2>${am.teamName }</h2>
					<input type = "hidden" name = "otId" value = "${am.teamNo }">
				</td>
			</tr>
			<tr>
				<td style = "height: 40px;"></td>
				<td colspan="3">
					<button id = "confirmBtn" type = "button" onclick = "insertResult(${loginUser.userNo}, ${match.userNo })">확인</button>
					<button id = "cancelBtn"  type = "button" onclick = "closeInputResult();">취소</button>
					
				</td>
				<td></td>
			</tr>
		</table>
	</form>
</div>



<!-- 팀보기 -->
<script type="text/javascript">
	function showTeamInfo(tId){
		$$$("#showTeamInfo").bPopup();
		
		$.ajax({
			url:"showTeamInfo.ma",
			data:{tId:tId
			},
			success:function(data){
				
				$("#teamImage").attr("src", "resources/images/team/"+data.teamImage);
				$("#teamName").html(data.teamName);
				$("#teamRecord").html(data.teamRecord);
				$("#teamArea").html(data.teamArea);
				$("#memberCount").html(data.memberCount+"명");
				$("#teamIntro").html(data.teamIntro);
				showMemberInfo(tId);
				
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		})
	}
	
	function showMemberInfo(tId){
		$.ajax({
			url:"showMemberInfo.ma",
			data:{tId:tId
			},
			success:function(data){
				$("#memberInfoTb").html("<tr>"+
						"<td colspan='4'><h2>팀원 확인</h2></td>"+
						"</tr>"+
						"<tr>"+
							"<td width = '10%'><h4></h4></td>"+
							"<td width = '20%'><h4>이름</h4></td>"+
							"<td width = '30%'><h4>생년월일</h4></td>"+
							"<td width = '40%'><h4>포지션</h4></td>"+
						"</tr>");
				
				for(var i in data){
					$("#memberInfoTb").append("<tr>"+
							"<td><img src = 'resources/proFiles/"+data[i].profile+"' width = '22px' height = '22px' style = 'border-radius: 50%;'></td>"+
							"<td><h4>"+data[i].userName+"</h4></td>"+
							"<td><h4>"+data[i].birthDay+"</h4></td>"+
							"<td><h4>"+data[i].position+"</h4></td>"+
						"</tr>")
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

<!-- 지도 -->
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=e5f9f6250199748b3a23d7b3d7d88dde&libraries=services"></script>
<script type="text/javascript">
	var X = Number("${match.mLocationX }");
	var Y = Number("${match.mLocationY }");
	var N = "${match.mLocationName}";
	
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

<!-- 헤더 -->
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

<!-- 매칭 -->
<script type="text/javascript">

	function confirmAm(amTeamNo, mId, amTeamName, amUserName, mTeamNo, mTeamName, mUserName, mSystem, mLocationName, mDay, sHour, sMinute, eHour, eMinute, dues){
		
		swal({
		  	  title: amTeamName+"와의 매칭을 확정하시겠습니까.\n매칭 확정 시에 문자로 매칭정보가 전송됩니다.",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: false,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		$.ajax({
					url:"confirmMatching.ma",
					data:{amTeamNo:amTeamNo,
						mId:mId, 
						amTeamName:amTeamName,
						amUserName:amUserName,
						mTeamNo:mTeamNo,
						mTeamName:mTeamName, 
						mUserName:mUserName,
						mSystem:mSystem, 
						mLocationName:mLocationName,
						mDay:mDay,
						sHour:sHour,
						sMinute:sMinute,
						eHour:eHour,
						eMinute:eMinute,
						dues:dues
					},
					success:function(data){
						swal("", "매치가 확정되었습니다.\n경기 종료 후에 매칭결과를 입력하셔야 다음 매치생성이 가능합니다.", "success");
						swal("", "리스트로 돌아갑니다..", "success");
						
						setTimeout(function() { location.href="goMatch.ma"; }, 3000);
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				})
		  	  } else {
		  		  return false;
		  	  }
		  	});

		
		
		
	}

	
	

</script>


<!-- 매칭 삭제 -->
<script type="text/javascript">

	function deleteMatch(mId){
		swal({
		  	  title: "매칭을 삭제하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: true,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		swal("", "매칭이 삭제되었습니다.", "success");
		  		setTimeout(function() { location.href="deleteMatch.ma?mId="+mId; }, 3000);
		  	  } else {
		  		  return false;
		  	  }
		  	});

		
		
	}
</script>


<!-- 예외처리 -->
<script type="text/javascript">
	$(function(){
		if($("#teamList").children().hasClass("selectTeam")){
			$("#tlInfo").html("팀을 선택해주세요.");
		}
	});

</script>

<!-- 신청삭제 -->
<script type="text/javascript">

	function cancleAm(tId, mId){
		swal({
		  	  title: "신청을 취소하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: false,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		$.ajax({
					url:"cancleAm.ma",
					data:{mId:mId,
						tId:tId
					},
					success:function(data){
						
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				})

				$("#"+tId).css("display","none");
				swal("", "신청이 취소되었습니다.", "success");
		  	  } else {
		  		  return false;
		  	  }
		  	});

		
		
	}

</script>


<!-- 팝업 -->
<script	src="https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js"></script>
<script type="text/javascript">

	function showAppMatch(){
			$$$("#applyDetail").bPopup();
	}

	function closeBtn(){
		$$$("#applyDetail").bPopup().close();
	}
	
	function closePop(){
		$$$("#showTeamInfo").bPopup().close();
	}

	function showMap(){
		$$$("#map").bPopup();
	}
	
	function showInputResult(){
		$$$("#inputResultDiv").bPopup();	
	}
	
	function closeInputResult(){
		$$$("#inputResultDiv").bPopup().close();	
	}
	
	
</script>

<!-- 신청 -->
<script type="text/javascript">
	function appMatch(tId, tName){
	
		$.ajax({
			url:"checkAppMatch.ma",
			data:{mId:${match.mId},
				tId:tId
			},
			success:function(data){
				if(data>0){
					swal("", "이미 신청한 매치입니다.", "warning");
					return false;
				}
				
				if(${match.userNo} == ${loginUser.userNo}){
					swal("", "자신의 매치글에는 신청할 수 없습니다.", "warning");
					return false;
				}
				
				
				swal({
				  	  title: '팀"'+tName+'"으로 매치를 신청하시겠습니까?',
				  	  icon: "info",
				  	  buttons: true,
				  	  dangerMode: false,
				  	})
				  	.then((willDelete) => {
				  	  if (willDelete) {
				  		$.ajax({
							url:"appMatch.ma",
							data:{mId:${match.mId},
								tId:tId,
								userNo:${loginUser.userNo}
							},
							success:function(data){
								if(data == "1"){
									$("#applyDetailTable").append("<tr id = '"+tId+"'>"+
										"<td>"+
											"<input type = 'hidden' value ='"+tId+"' style = 'disply:none;'/>"+
										"</td>"+
										"<td style = 'font-size:1.7em; width: 50%;'>"+
											tName+
										"</td>"+
										"<td style = 'width: 25%;'> "+
											"<input type = button id = 'matchingBtn' name = 'O' value='신청취소' style= 'background: black; color:white; font-size: 15px;' onclick = 'cancleAm("+tId+", "+${match.mId}+")'>"+
										"</td>"+
										"<td style = 'width: 25%;'> "+
											"<input type = 'button' id = 'detailTeamBtn' name = 'O' value='팀상세보기' style= 'background: black; color:white; font-size: 15px;' onclick = 'showTeamInfo("+tId+")'>"+
										"</td>"+
									"</tr>");
								}
								
								$("#noInfo").css("display","none");
								swal("", "신청이 완료되었습니다.", "success");
									
							},
							error:function(request, status, errorData){
								alert("error code: " + request.status + "\n"
										+"message: " + request.responseText
										+"error: " + errorData);
							}
						})
				  	  } else {
				  		  return false;
				  	  }
				  	});	
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		})
		
		

	}

</script>

<script type="text/javascript">
	$("#myScore").keyup(function(){
		if($(this).val() >= 0 && $(this).val() <= 99){
			return false;
		}else{
			$(this).val("");
		}
	});

	$("#yourScore").keyup(function(){
		if($(this).val() >= 0 && $(this).val() <= 99){
			return false;
		}else{
			$(this).val("");
		}
	});
	
	function insertResult(loginUser, matchUser){
		if(loginUser != "" && loginUser != matchUser){
			swal("", "팀의 팀장만 점수를 입력할 수 있습니다.", "warning");
			return false;
		}
		
		if($("#yourScore").val() == "" || $("#myScore").val() == ""){
			swal("", "점수를 입력하세요.", "warning");
			return false;
		}else{
			swal({
			  	  title: "결과를 등록하시겠습니까?",
			  	  icon: "info",
			  	  buttons: true,
			  	  dangerMode: false,
			  	})
			  	.then((willDelete) => {
			  	  if (willDelete) {
			  		swal("", "리스트 페이지로 이동합니다.", "success");
			  		setTimeout(function() { $("#scoreForm").submit(); }, 3000);
			  	  } else {
			  		  return false;
			  	  }
			  	});
		}
		
	}
	
	

</script>

       



<jsp:include page = "../common/footer.jsp"/>
</body>
</html>