<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
/* body{
	background-image: url('resources/images/ba1.jpg');
	background-size: 100% 100%;
} */


	#infoTableDiv{
		width: 100%;
		height: 60%;
		border: 2px solid blue;
		padding: 5%;
	}
	
	#infoTableDiv p{
		margin: 5px 0px 5px 0px;
		font-weight: bold;
	}
	
	#infoTable{
		width: 100%;
		height: 100%;
		
	}
	
	#scheduleInfo{
		width: 100%;
		height: 100%;
		padding: 4%;
	}
	
	#tournamentInfo{
		width: 100%;
		height: 100%;
		padding: 4%;
	}
	
	
	#noticeInfo{
		width: 100%;
		height: 100%;
		padding: 4%;
	}
	
	
</style>
<title>Insert title here</title>


</head>
<jsp:include page = "common/header.jsp"/>

<body>

<div id = "outer" style = "margin-top: 180px; background-image: url('resources/images/ba1.jpg'); background-size:100% 100%;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 1200px; width: 90%; background: white; margin: auto;">
				
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 1200px; width: 90%; background: white; margin: auto;">
				<div id = "infoTableDiv">
					<table id = "infoTable" border = "1">
						<tr>
							<td rowspan="2" width="50%">
								<div id = "scheduleInfo">
									<h1 style = "margin-top: 5px; margin-bottom: 10px; padding-bottom:5px; border-bottom: 2px solid lightgrey; font-size: 30px">진행중인 매치</h1>
									<div id = "calendar" style = "height: 85%; border: 1px solid red;">
									</div>
								</div>
							</td>
							<td style = "height: 100%;" width="50%">
								<div id = "noticeInfo">
									<h1 style = "margin-top: 5px; margin-bottom: 10px; padding-bottom:5px; border-bottom: 2px solid lightgrey; font-size: 30px">공지사항</h1>
									<div id = "notice" style = "height: 75%; border: 1px solid red;">
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td style = "height: 100%;">
								<div id = "tournamentInfo">
									<h1 style = "margin-top: 5px; margin-bottom: 10px; padding-bottom:5px; border-bottom: 2px solid lightgrey; font-size: 30px">진행중인 대회</h1>
									<div id = "ingTo" style = "height: 75%; border: 1px solid red;">
										<input id = "toNo" type = "hidden" value =""/>
										<table style = "text-align: left; width: 80%; height: 80%; margin: 0% 10% 0% 10%;">
											<tr>
												<td id = "toTitle" colspan="3"></td>
											</tr>
											<tr>
												<td id = "toSdate"></td>
												<td id = "toEdate"></td>
												<td id = "toReward"></td>
											</tr>
											<tr>
												<td id = "toContent" colspan="3"></td>
											</tr>
										</table>
										<button style = "width: 20%; height: 20%; margin-left: 80%; background: white; color: black; border:2px solid black; font-size: 10px;" onclick = "showDetail();">상세보기</button>
									</div>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
</div>


<script type="text/javascript">
$.ajax({
	url:"showTournament.to",
	success:function(data){

		var flag = false;
		
		if(data.length != 0){
			for(var i in data){
				if(data[i].toStatus == "Y"){
					$("#toNo").val(data[i].toNo);
					$("#toTitle").html("<p style = 'font-size:20px; color:grey;'>"+data[i].toName+"</p>");
					$("#toSdate").html("<p>시작일</p>");
					$("#toEdate").html("<p>종료일</p>");
					$("#toReward").html("<p>상금</p>");
					$("#toContent").html("<p>"+data[i].toContent+"</p>");
					flag = true;
				}
			}
		}else{
			$("#ingTo").css({"background":"lightgrey","color":"white"});
			$("#ingTo").html("<h4 style = 'font-size:30px; text-align :center; padding-top:5%; width:100%; '>진행중인 대회가 없습니다.</h4>");
			if('${sessionScope.loginUser}' != "" && '${loginUser.userId}'=='admin'){
				$("#ingTo").append("<button style = 'background:white; color:black; border:1px solid black; width:100px; height:30px; margin-left:43%;' onclick = 'createTo();'>대회 생성</button>");
			}
		}
		
		if(!flag){
			$("#ingTo").css({"background":"lightgrey","color":"white"});
			$("#ingTo").html("<h4 style = 'font-size:30px; text-align :center; padding-top:5%; width:100%;'>진행중인 대회가 없습니다.</h4>");
			if('${sessionScope.loginUser}' != "" && '${loginUser.userId}'=='admin'){
				$("#ingTo").append("<button style = 'background:white; color:black; border:1px solid black; width:100px; height:30px; margin-left:43%;' onclick = 'createTo();'>대회 생성</button>");
			}
		}
		
	},
	error:function(request, status, errorData){
		alert("error code: " + request.status + "\n"
				+"message: " + request.responseText
				+"error: " + errorData);
	}
})


</script>

<script type="text/javascript">
	function createTo(){
		
		
	}
</script>



<script type="text/javascript">
	function showDetail(){
		var toNo = $("#toNo").val();
		location.href="goTournament.to?="+toNo;
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
			} );
		</script>

<jsp:include page = "common/footer.jsp"/>
</body>
</html>