<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	border-spacing: 60px 30px;
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
	margin-left:30px;
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
	text-align:left;
}
#detailContent2 td{
	text-align:left;
}
</style>
</head>
<jsp:include page = "../common/header.jsp"/>
<body>
<div id="content" style="margin-top: 15px; border-bottom: 5px solid grey; border-top: 5px solid grey; margin-left: 5%; margin-right:5%; width: 90%;">
<div id = "title"> ${pRecruit.rTitle } </div>
	<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="height: 1000px; width: 90%; border: black; margin: auto;">
		<form>																									<!-- 730 -->
		<div style = "float:left;"> 
		<table align = center id = pictureContent>
			<tr>
				<img id = "picture" src="resources/images/logo.png"> 
				<td> 팀 이름 어떻게 받지 </td>
			</tr>
		</table>
		</div>
		
		<div style = "float:left;">
		<div id = "detailContentDiv1">
		<table id = detailContent1> 
			<tr>
				<td>팀 장</td> 
				<td> 팀장 이름 어떻게 받지 </td>
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
				<td>${pRecruit.deadline } 명</td>
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
		
		<div id = "detailContentDiv2" style = "display:none;">
		<table id = detailContent2> 
			<tr>
				<td>팀 장</td> 
				<td> 팀장 이름 어떻게 받지 </td>
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
				<td>${pRecruit.deadline } 명</td>
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
		<!-- 기능시 구현!
		글 작성자가 로그인 시 신청하기 버튼 대신  글삭제하기 + 신청현황 보여주기
		글 작성자 제외 로그인 시 글 삭제하기 + 신청현황 버튼 안보이기  
		신청하기는 글 작성자 제외 모두 가능 (용병은 같은 팀원에서는 신청하기 못하게 신청하면 원래 같은 팀이라는 문구 나오게) 
		-->
			<div id = btn>
				<div id = btnPosition1>
				<input type = button id = recruitBtn value = "모집 리스트 보기" onclick = "location.href='playMain.pl'">
				<input type = button id = applyBtn value = "신청하기"> <br> <br>
				</div>
				<div id = btnPosition2>
				<c:url var="tplDelete" value="teamPlayListDelete.pl">
					<c:param name="rNum" value="${pRecruit.rNum }"/>
				</c:url>
				<c:url var="tplModify" value="teamPlayListModifyView.pl">
					<c:param name="rNum" value="${pRecruit.rNum }"/>
				</c:url>
				<input type = button id = deleteBtn value = "글 삭제하기" onclick="location.href='${tplDelete }'">
				<input type = button id = modifyBtn value = "글 수정하기" onclick="location.href='${tplModify }'"> <br> <br>
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
				<%for(int i = 0; i <= 10; i++) { %>
				<tr>
					<td style = "font-size:1.7em;"> 신청 한 사람 받아오기 </td>
					<td> 
					<input type = button id = cancelBtn<%=i %> class=cancelBtn name = "X" value="X" style="background: red; color:white;">
					</td>
					<td>
					<input type = button id = agreeBtn<%=i %> class = agreeBtn name = "O" value="O" style="background: green; color:white;">
					</td>
				</tr>
				<% } %>
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
</script>

<jsp:include page = "../common/footer.jsp"/>
</body>
</html>