<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@page import="com.kh.FIFAOFFLINE.notice.model.vo.Reply"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import = "com.kh.FIFAOFFLINE.notice.model.vo.*,com.kh.FIFAOFFLINE.member.model.vo.Member, java.util.ArrayList"%>

<%
	Member m =(Member)session.getAttribute("loginUser");
%>
<%
	Notice n = (Notice)request.getAttribute("notice");
 
	

	/* Ajax이후 */
	ArrayList<Reply> rList = (ArrayList<Reply>)request.getAttribute("rList"); 
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="<c:url value='/resources/css/ui.css'/>" /> <!-- css파일에서 상세읽기 스타일 정의 -->
 <style>
    #outer{
  		position: relative;
       width: 100%;
       padding: 0px;
   	   border:none;
  	} 
   
    #tableDiv{
      position: relative;
      width: 1300px;
      padding:10px;
      margin: auto;
      border:none;
    }
    
  	.titleDiv1{
		border:none;
		border-bottom: 1px solid darkgray;
		position: relative;	
		width:1230px;
		height:100px;
		margin-left:auto;
		margin-right:auto;
		align: center;
	}

	.titleDiv2{
		position: relative;
		width: 240px;	
		font-size: 45px;
		margin-left:auto;
		margin-right:auto;
	}
    
    #listArea{
    	width: 1230px;
    	border-spacing:0px;
   		border-top:2px solid black;
    }
    
    .tableTd{
    	border-bottom:1px solid  #dbdbdb;
    	border-right: 1px solid  #dbdbdb;
    	
    }
    
    .titleTd{
    	width: 180px;
    	height: 50px;
    	background: #f3f3f3 ;
    	text-align: center;
    	font-size: 16px;
    	border-left: 1px solid  #dbdbdb;
    }
    
    .inputTd{
    	width: 800px;
    	height: 30px; 
    	margin-left: 10px;
    }
    
    textrea{
    	border-left: 1px solid  #dbdbdb;
    	overflow-y:scroll;
		resize:none;
		width: 1229px;
    }
    #textareaDiv{
    	position: relative;
    	margin:auto;
    	width: 1230px;
    }
    
    .attachTd{
		padding: none; 
		padding-left: 15px;
		padding-bottom: 12px;
	
    }
    

    #attachCount{    
    	width: 50px;
    	height: 40px;
    }

	#attachTable{
		border: 1px solid #dbdbdb;
		width: 1230px;
	}   
	
	.attachTd input{
		height: 40px;
		padding-left:10px;
		font-size: 15px;
		width: 400px;
	} 
	
	.attachBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;		
	}
	
	.attachBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	
	#listBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 90px;
	}
	
	#listBtn:hover{
	   background-color: darkgray;
	   color: white;
	}
	
	#updateBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 90px;
	}
	
	#deleteBtn{
	   border:none;
	   outline: none;
	   background-color: black; 
	   color: white;
	   font-size: 16px;
	   height: 40px;
	   width: 90px;
	}
	
	#updateBtn:hover{
	   background-color: #f53f29; 
	   color: white;
	}
	#deleteBtn:hover{
	   background-color: #f53f29; 
	   color: white;
	}
	
	.btnDiv{
		border-top: 1px solid darkgray;
		height: 80px;
		text-align: center;
		padding-top: 30px;
	}
	

	#resetBtn{
		outline: none;
		border: none; 
		background: black;
		color: white;
		font-size: 15px;
		width: 100px;
		height: 40px;	
		margin-left: 183px; 
	}
	
	#resetBtn:hover{
	   background-color: #f53f29; ;
	   color: white;
	}
	
	
	
	#superCheck{
		width: 23px; 
		height: 23px;
		position: absolute; 
		background-color: white;
		border: 1px solid black;
		outline: none;
	}
	
	#checkLabel{
		font-size: 16px;
		margin-left: 30px;
	}
	
	#boardImg1{
	position: relative;	
	width:100%;
	height:300px;
	margin-left:auto;
	margin-right:auto;
	align: center;
	text-align: center;
	background: black;
}
	
		.modal-dialog {
	    width: 600px;
	    margin: 30px auto;
	    margin-top: 300px;
	}
 </style> 

<<title>Insert title here</title> 
</head>
<jsp:include page="../common/header.jsp"/>
<body>
<c:set var="mem" value="<%=m%>"/>
<!-- 각페이지별 고정  start-->
	<div id="outer" style="margin-top: 180px;">
		<div class="ha-waypoint" data-animate-down="ha-header-show"
			data-animate-up="ha-header-subshow" style="width: 90%; margin: auto; height: 750px;">

			<div class="example"></div>

			<br>
			<br>
			<br>
			
			<br>
			<br>
			<!-- 각 페이지별 고정  end-->
			<input type="hidden" name="nId" value="${notice.nId }" />

			<div id="wrap">

				<div id="container">
					<div id="content" style="">
						<table class="board_view" style = "width: 70%; margin-left: 15%; margin-right: 15%;">
							<colgroup>
								<col width="15%" />
								<col width="35%" />
								<col width="15%" />
								<col width="35%" />
							</colgroup>
							<tbody>
								<tr>
									<th scope="row">글 번호</th>
									<td>${notice.nId }</td>
									<th scope="row">조회수</th>
									<td>${notice.nCount }</td>
								</tr>
								<tr>
									<th scope="row">작성자</th>
									<td>${notice.nWriter }</td>
									<th scope="row">작성시간</th>
									<td>${notice.nCreateDate }</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">${notice.nTitle }</td>
								</tr>
								<tr>
									<td colspan="4">${notice.nContent }</td>
								</tr>
								</br>
								</br>
								</br>
								<c:if test="${!empty notice.filePath }">
									<tr>
										<td>첨부파일</td>
										<td><img
											src="${contextPath }/resources/nuploadFiles/${notice.filePath}">
											<br> <a
											href="${contextPath }/resources/nuploadFiles/${notice.filePath}"
											download> ${notice.filePath } </a></td>
									</tr>
								</c:if>


								<%-- 		<c:url var="nupView" value="nupView.do">
			<c:param name="nId" value="${notice.nId }"/>
		</c:url>
	
	 	<c:url var="ndelete" value="ndelete.do">
			<c:param name="nId" value="${notice.nId }"/>
		</c:url>
		
		<c:if test="${loginUser.userId eq notice.nWriter }">
			<tr>
				<td colspan="2" align="center">
					<a href="${nupView}">수정하기</a> &nbsp;&nbsp;
					<a href="${ndelete}">삭제</a>
				</td>
			</tr>
 
		</c:if>   --%>

							</tbody>

						</table>
						<c:url var="nupView" value="nupView.do">
							<c:param name="nId" value="${notice.nId }" />
						</c:url>

						<c:url var="ndelete" value="ndelete.do">
							<c:param name="nId" value="${notice.nId }" />
						</c:url>
						<div class=btnDiv>
							<button type='button' id=listBtn onclick="NoticeList();">
								<b>목록</b>
							</button>
							&nbsp;&nbsp;
							<button type="button" id=updateBtn onclick="NupView();">
								<b>수정하기</b>
							</button>
							&nbsp;&nbsp;
							<button type="button" id=deleteBtn onclick="Ndelete();">
								<b>삭제</b>
							</button>
						</div>

						<!-- ajax 이후 댓글달기 했을 때 작성한 부분 -->
						<!-- 댓글 등록하기 -->
						<table align="center" width="500" border="1" cellspacing="0">
							<tr>
								<td><textarea cols="55" rows="3" id="rContent"></textarea></td>
								<td>
									<button id="rSubmit">등록하기</button>
								</td>
							</tr>
						</table>

						<!-- 댓글 목록보기 -->
						<table align="center" width="500" border="1" cellspacing="0"
							id="rtb">
							<thead>
								<tr>
									<td colspan="2"><b id="rCount"></b></td>
								</tr>
							</thead>
							<tbody>

							</tbody>
						</table>

						

						<!-- 이제는 AOP해보자  우선 POM.XML 추가하잔 -->

						<!--  본문 끝 -->

					</div>
					<!-- content 끝 -->
				</div>
				<!--  container 끝 -->



			</div>
	</div>
		</div>
	<br>
	<div class="ha-waypoint" data-animate-down="ha-header-shrink"
		data-animate-up="ha-header-show"
		style="height: 100px; width: 90%; margin: auto;">
		<div align="center">
			
</div>
</div>


<script>
	$(function(){
		getReplyList();
		
		setInterval(function(){
			getReplyList();
		}, 10000);
		
		// 댓글 등록 ajax
		$("#rSubmit").on("click", function(){
			var rContent=$("#rContent").val();
			var refBid =${notice.nId};
			
			$.ajax({
				url:"addReply.do",
				data:{rContent:rContent, refBid:refBid},
				
				success:function(data){
					if(data=="success"){
						getReplyList(); // 댓글 등록 성공시 댓글 부분이 setInerval 안기다리고 바로 갱신되게 함수 실행
						$("#rContent").val(""); // 댓글 작성한 부분 리셋 해주기
					}
				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			});
			
		});
		
		
	});
	function getReplyList(){	// 댓글 리스트를 불러오는 함수
		var nId = ${notice.nId};
	
		$.ajax({
			url:"rList.do",
			data:{nId:nId},
			dataType:"json",
			success:function(data){
				$tableBody = $("#rtb tbody");
				$tableBody.html("");
				
				var $tr;
				var $rWriter;
				var $rContent;
				var $rCreateDate;
				
				$("#rCount").text("댓글("+data.length+")");
				
				if(data.length > 0){	// 댓글이 하나 이상 있으면
					for(var i in data){
						$tr=$("<tr>");
						$rWriter=$("<td width='100'>").text(data[i].rWriter);
						$rContent=$("<td>").text(decodeURIComponent(data[i].rContent.replace(/\+/g," "))); 
						$rCreateDate=$("<td width='100'>").text(data[i].rCreateDate);
						
						$tr.append($rWriter);
						$tr.append($rContent);
						$tr.append($rCreateDate);
						$tableBody.append($tr);
					}
				}else{	// 댓글이 없으면
					$tr=$("<tr>");
					$rContent=$("<td colspan='3'>").text("등록된 댓글이 없습니다.");
					
					$tr.append($rContent);
					$tableBody.append($tr);
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



			<script>
	function NoticeList(){
		location.href="nlist.do";	
	}
	
	function NupView(){
		location.href="nupView.do?nId=" + ${notice.nId};
	}
	
	function Ndelete(){
		location.href="ndelete.do?nId=" + ${notice.nId};
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
			<script>
	function tdetail(id){
		alert($(".hiddenTno"+id).val());
	}
</script>

			<script>
	$(document).ready( function() {
		$(".addressB").click(function(){
			$(this).toggleClass('clicked');
		});
	});
</script>
			<jsp:include page="../common/footer.jsp" />
</body>

</html>