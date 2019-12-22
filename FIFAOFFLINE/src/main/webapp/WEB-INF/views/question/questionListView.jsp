<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="java.util.Date" %>
<%@page import="java.text.SimpleDateFormat" %>    



<%
	java.text.SimpleDateFormat formatter = new java.text.SimpleDateFormat("yyyy-MM-dd");
	 String today = formatter.format(new java.util.Date());
%>  
    
    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  var $$$ = jQuery.noConflict();
</script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.js'></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/bPopup/0.11.0/jquery.bpopup.min.js'></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<style>

#outer {
	width: 98%;
	height: 100%;

	padding: 20px;
}

input:focus, textarea:focus, button:focus{
	outline: none;
}

#content {
	margin: 3% 15% 25% 15%;
}

#questionList {
	font-size:15px;
	text-align: center;
}

#questionList th{
	border-bottom: 1px solid darkgray;
	border-collapse: collapse;
}

#questionList>table {
	width: 100%;
	border-top: 0.5px solid darkgray;
	border-collapse: collapse;
}

#questionList td {
	text-align: center;
	border-bottom: 0.5px solid darkgray;
	padding: 1.5px;
	height: 50px;
	font-size: 15px;
}

[id*=popUp] {
	width: 400px;
	height: 500px;
	display: none;
}

[id*=popUp]>div {
	width: 347px;
	height: 200px;
	display: inline-block;
	margin: auto;
	vertical-align: center;
}

[id*=popUp]>div>div, [id*=msg] {
	margin: auto;
	text-align: center;
	font-size: 60px;
}

.question:hover{
	background: lightgray;
	cursor: pointer;
}


#mainTitle{

	font-size: 45px;
	width: 80%;
	margin-left: 10%;
	margin-right: 10%;
	border-bottom: 2px solid grey;
	height: 50px;
	text-align: center;
	margin-top: 50px;
	padding-bottom: 80px;
	}

#questionForm{
	width: 500px;
	height: 650px;
}

#btns button{
	width: 80px;
	height: 40px;
	border: 1px solid black;
	font-size: 13px;
	background: black;
	color: white;
}

#btns button:hover{
	background: white;
	color: black;
}

#postQ{
	width: 150px;
	height: 50px;
	border: 1px solid black;
	font-size: 15px;
	background: black;
	color: white;
}

#postQ:hover{
	background: white;
	color: black;
}

</style>
</head>
<jsp:include page="../common/header.jsp"/>
<body>

	<div id="outer">
		<div style = "height: 150px;"></div>
		<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="width: 90%; margin: auto; height: 1000px;">
			<div  id = "mainTitle">
				<div style = "margin-left:2%; display: inline-block; float: left;"><b>1:1 문의</b></div>
				<c:if test="${loginUser.userId != 'admin' }">
				<div style = "display: inline-block; float: right;"><button id="postQ" type = "button" onclick = "postQuestion()">문의 등록</button></div>
				</c:if>
			</div>
			<div id="content">
				<div id="questionList">
					<table align="center">
						<thead>
							<tr>
								<th width="10%">작성자</th>
								<th width="40%">제목</th>
								<th width="20%">게시일</th>
								<th width="10%">상태</th>
								<th width="20%">답변일</th>
							</tr>
						</thead>
						<tbody id = "qTbody">
							<c:forEach var="q" items="${qList }" varStatus="status">
							<tr id="question" class="question" onclick = "showQuestion(${q.qId});">
								<td>${q.userId}(${q.userName })</td>
								<td>${q.qTitle}</td>
								<td>${q.qDate}</td>
								<c:if test = "${q.rYN == 'N' }">
								<td id = "readN">읽지 않음</td>
								</c:if>
								<c:if test = "${q.rYN == 'Y' && q.aYN == 'N' }">
								<td id = "answerN">답변 대기 중</td>
								</c:if>
								<c:if test = "${q.aYN == 'Y' }">
								<td>답변 완료</td>
								</c:if>
								<c:if test="${q.aDate == null}">
								<td id = "aDate">-</td>
								</c:if>
								<c:if test="${q.aDate != null}">
								<td>${q.aDate}</td>
								</c:if>
							</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
			</div>
			
			<div id="popUp">
				<div id = "questionForm" style = "background: white; color: black" >
					<div style = "width: 90%; margin: 20px 5% 20px 5%; height: 50px; font-size: 35px; border-bottom: 2px solid lightgrey;">
						<b style = "">문의</b>
					</div>
					<table border = "1" style = "width: 90%; margin-left:5%; margin-right:5%; height: 300px; border-collapse: collapse; font-size: 12px; text-align: center;" >
						<tr>
							<td colspan="1" style = "height: 32px; font-weight: bold; background: #eeeeee;">제목</td>
							<td colspan="3" style = "height: 32px;"><input id = "qTitle" type = "text" style = "width: 100%; height: 100%; border: none;"></td>
						</tr>
						<tr>
							<td style = "width: 18%; height: 32px; font-weight: bold; background: #eeeeee;">작성자</td>
							<td id = "qWriter" style = "width: 32%; height: 32px;"></td>
							<td style = "width: 18%; height: 32px; font-weight: bold; background: #eeeeee;">작성일</td>
							<td id = "qDate" style = "width: 32%; height: 32px;"></td>
						</tr>
						<tr>
							<td colspan="4"><textarea id = "qContent"style = "width: 100%; height: 100%; border: none; resize: none;"></textarea></td>
						</tr>
					</table>
					<div id = "answer" style = "height: 150px; width: 90; margin: 10px 5% 0px 5%;">
						<img alt="" src="">
						<textarea id = "aContent" style = "width: 80%; height: 130px; border: 1px solid lightgrey;  font-size: 12px; resize: none;" placeholder="답변이 없습니다."></textarea>
					</div>
					<div id = "btns" style = "margin: auto;">
						<button id = "postQBtn" type = "button" onclick = "postQ()">등록</button>
						<button id = "postABtn" type = "button" onclick = "postA()">답변 등록</button>
						<button id = "deleteQBtn" type = "button" onclick = "deleteQ()">삭제</button>
						<button type = "button" onclick = "closePopup()">닫기</button>
						<input id = "qId" type = "hidden" value = "">
					</div>
				</div>
				<div id="msg" style="background-color: none; color: white; font-size: 35px; display: block; width: 500px; height: 100px;">
					<em>FIFA OFFLINE</em>
				</div>
			</div>
		</div>
		
		<div class="ha-waypoint" data-animate-down="ha-header-shrink"data-animate-up="ha-header-show" style="height: 100px; width: 90%; margin: auto;">
		</div>
		
	</div>
	
<script type="text/javascript">
	function showQuestion(qId){
		
		$("#qWriter").html("");
		$("#qDate").html("");
		$("#qTitle").attr("readonly","readonly");
		$("#qContent").attr("readonly","readonly");
		$("#qTitle").val("");
		$("#qContent").val("");

		
		if('${loginUser.userId}' == 'admin'){
			$("#postQBtn").css("display","none");
			$("#deleteQBtn").css("display","none");
			$("#postABtn").css("display","inline-block");
			$("#qId").val(qId);
			$("#aContent").removeAttr("readonly");
		}else{
			$("#postQBtn").css("display","none");
			$("#postABtn").css("display","none");
			$("#deleteQBtn").css("display","inline-block");
			$("#qId").val(qId);
			$("#aContent").attr("readonly","readonly");
			$("#answer").css("display","block");
			$("#questionForm").css("height","650px");
		}
		
		$.ajax({
			url:"selectQ.do",
			data:{qId:qId},
			success:function(data){
				$("#qTitle").val(data.qTitle);
				$("#qContent").val(data.qContent);
				$("#qWriter").html(data.userId+"("+data.userName+")");
				$("#qDate").html(data.qDate);
				$("#aContent").val(data.qAnswer);
				$("#readN").html("답변 대기 중");
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
		
		$$$("#popUp").bPopup();
		
	}

	function postQuestion(){
		
		$("#qTitle").val("");
		$("#qContent").val("");
		$("#qTitle").removeAttr("readonly");
		$("#qContent").removeAttr("readonly");
		$("#qWriter").html("${loginUser.userId}(${loginUser.userName})");
		$("#qDate").html(formatDate(new Date()));
		$("#postQBtn").css("display","inline-block");
		$("#postABtn").css("display","none");
		$("#deleteQBtn").css("display","none");
		$("#answer").css("display","none");
		$("#questionForm").css("height","500px");
		
		$$$("#popUp").bPopup();
	}
	
	function closePopup(){
		$$$("#popUp").bPopup().close();
	}
	
	function deleteQ(){
		var qId = $("#qId").val();
		
		swal({
		  	  title: "문의를 삭제하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: true,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		$.ajax({
					url:"deleteQ.do",
					data:{qId:qId},
					success:function(data){
						swal("", "삭제가 완료되었습니다.", "success");
						setTimeout(function() {location.reload(); }, 3000);
						 
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
		  	  } else {
		  		  return false;
		  	  }
		  	});

	}
</script>
	
<script type="text/javascript">
	function postA(){
		var qId = $("#qId").val();
		var qAnswer = $("#aContent").val();
		
		swal({
		  	  title: "답변을 등록하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: false,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		$.ajax({
					url:"postA.do",
					data:{qId:qId,
						qAnswer:qAnswer},
					success:function(data){
						swal("", "등록이 완료되었습니다.", "success");
						$("#readN").html("답변 완료");
						$("#answerN").html("답변 완료");
						$("#aDate").html(formatDate(new Date()));
						$$$("#popUp").bPopup().close();
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
		  	  } else {
		  		  return false;
		  	  }
		  	});

	}

	function postQ(){
		var qContent = $("#qContent").val();
		var qTitle = $("#qTitle").val();
		var userNo = ${loginUser.userNo};
		
		if(qTitle == "" || qTitle == null){
			swal("", "제목을 입력해주세요", "warning");
			return false;
		}
		if(qContent == "" || qContent == null){
			swal("", "내용을 입력해주세요", "warning");
			return false;
		}
		
		swal({
		  	  title: "문의를 등록하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: false,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		$.ajax({
					url:"postQ.do",
					data:{userNo:userNo, 
							qContent:qContent,
							qTitle:qTitle},
					
					success:function(data){
						swal("", "등록이 완료되었습니다.", "success");
						setTimeout(function() {location.reload(); }, 3000);
						 
					},
					error:function(request, status, errorData){
						alert("error code: " + request.status + "\n"
								+"message: " + request.responseText
								+"error: " + errorData);
					}
				});
		  	  } else {
		  		  return false;
		  	  }
		  	});

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
	
<script type="text/javascript">
function formatDate(date) {
    var d = new Date(date),
        month = '' + (d.getMonth() + 1),
        day = '' + d.getDate(),
        year = d.getFullYear();

    if (month.length < 2) 
        month = '0' + month;
    if (day.length < 2) 
        day = '0' + day;

    return [year, month, day].join('-');
}
</script>
<jsp:include page="../common/footer.jsp" />
</body>
</html>