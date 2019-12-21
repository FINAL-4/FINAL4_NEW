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
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
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
   
   textarea:focus{
   	outline:none;
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
	
	#cke_1_bottom{
		display: none;
	}
	
	#cke_1_contents{
		height: 500px !important;
	}
	
	.cke_wysiwyg_frame{
		height: 500px !important;
	}
	
	#rSubmit{
		background: black;
		color: white;
		width: 70px;
		height: 35px;
		border: 1px solid black;
	}
	
	#rSubmit:hover{
		background: white;
		color: black;
	}
	
	.board_view tbody td, .board_view tbody th{
		padding: 10px 0px 10px 10px;
		font-size: 15px;
	}
	
	.btns button{
		border: none;
		margin-left: 5px;
		background: none;
	}
	
	.likeImg:hover{
		cursor: pointer;
		width: 45px;
		
	}
 </style> 

<<title>Insert title here</title> 
</head>
<jsp:include page="../common/header.jsp"/>
<body>
<c:set var="mem" value="<%=m%>"/>
<!-- 각페이지별 고정  start-->
	<div id="outer" style="margin-top: 180px;">
		<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style="width: 90%; margin: auto; height: 800px;">
			<input type="hidden" name="nId" value="${notice.nId }" />
			<div id="wrap" style = "margin-top: 200px;">
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
									<td><img src ="resources/proFiles/${notice.profile }" width= "15px" height= "15px" style = "float: left; ">${notice.nWriter }</td>
									<th scope="row">작성시간</th>
									<td>${notice.nCreateDate }</td>
								</tr>
								<tr>
									<th scope="row">제목</th>
									<td colspan="3">${notice.nTitle }</td>
								</tr>
								<tr>
									<td colspan="4" style = "border-bottom: none;">${notice.nContent }</td>
								</tr>
								<tr>
									<td colspan="4" style = "border-bottom: none; padding-top: 50px; text-align: center;">
										<div id = "likeDiv" style = "width: 100%;">
											<div id = "likeImg"><img class = "likeImg" src = "resources/images/like/likeB.png" width = "35px" height="35px;" onclick = "appLike();"></div>
											<h4 id = "likeCount" style = "margin: 8px 0px 12px 0px;">${notice.likeCount }</h4>
										</div>
									</td>
								</tr>
								<c:if test="${!empty notice.filePath }">
									<tr>
										<td>첨부파일</td>
										<td><img
											src="${contextPath }/resources/nuploadFiles/${notice.filePath}">
											<br> <a
											href="${contextPath }/resources/nuploadFiles/${notice.filePath}" download> ${notice.filePath } </a></td>
									</tr>
								</c:if>
							</tbody>
						</table>
						
						
						
						
						<!-- 댓글 등록하기 -->
						<table align="center" width="500" cellspacing="0">
							<tr>
								<td><textarea cols="80" rows="5" id="rContent" style = "resize: none;"></textarea></td>
								<td>
									<button id="rSubmit">등록하기</button>
								</td>
							</tr>
						</table>

						<!-- 댓글 목록보기 -->
						<table align="center" width="800" cellspacing="0"
							id="rtb">
							<thead>
								<tr>
									<td colspan="2" style = "font-size: 15px;"><b id="rCount"></b></td>
								</tr>
							</thead>
							<tbody>
								
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
							
							<c:if test="${loginUser.userNo == notice.userNo }">
							&nbsp;&nbsp;
							<button type="button" id=updateBtn onclick="NupView();">
								<b>수정하기</b>
							</button>
							&nbsp;&nbsp;
							
							<button type="button" id=deleteBtn onclick="Ndelete();">
								<b>삭제</b>
							</button>
							</c:if>
							
							
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="ha-waypoint" data-animate-down="ha-header-shrink"data-animate-up="ha-header-show" style="height: 100px; width: 90%; margin: auto;">
	</div>


<script type="text/javascript">
	
	flag = false;
	lCount = ${notice.likeCount};
	
	$(function(){
		lCount = ${notice.likeCount};
		if('${loginUser}' != ""){
		
		var userNo = '${loginUser.userNo}';
		var nId = ${notice.nId};
		$.ajax({
				url:"selectLike.do",
				data:{userNo:Number(userNo),
						nId:nId
					},
				success:function(data){
					if(data == 0){
					}else{
						$("#likeImg").html("<img class = 'likeImg' src = 'resources/images/like/likeA.png' width = '35px' height='35px;' onclick ='canLike()'>");
						$("#likeCount").css("color","red");
						flag = true;
					}
				},
				error:function(request, status, errorData){
					alert("error code: " + request.status + "\n"
							+"message: " + request.responseText
							+"error: " + errorData);
				}
			});
		}
	})

	function appLike(){
		if('${loginUser}' == ""){
			swal("", "로그인이 필요한 기능입니다.", "warning");
			return false;
		}
		var userNo = '${loginUser.userNo}';
		var nId = ${notice.nId};
		$.ajax({
			url:"appLike.do",
			data:{userNo:Number(userNo), 
					nId:nId},
			
			success:function(data){
				if(data == 1){
					$("#likeImg").html("<img class = 'likeImg' src = 'resources/images/like/likeA.png' width = '35px' height='35px;' onclick ='canLike()'>");
					$("#likeCount").css("color","red");
					if(flag){
						$("#likeCount").text(lCount);
					}else{
						$("#likeCount").text(lCount+1);
					}
				}
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
	}
	
	function canLike(){
		if('${loginUser}' == ""){
			swal("", "로그인이 필요한 기능입니다.", "warning");
			return false;
		}
		var userNo = '${loginUser.userNo}';
		var nId = ${notice.nId};
		$.ajax({
			url:"canLike.do",
			data:{userNo:Number(userNo), 
					nId:nId},
			
			success:function(data){
				if(data == 1){
					$("#likeImg").html("<img class = 'likeImg' src = 'resources/images/like/likeB.png' width = '35px' height='35px;' onclick ='appLike()'>");
					$("#likeCount").css("color","black");
					if(flag){
						$("#likeCount").text(lCount-1);
					}else{
						$("#likeCount").text(lCount);
					}
				}
			},
			error:function(request, status, errorData){
				alert("error code: " + request.status + "\n"
						+"message: " + request.responseText
						+"error: " + errorData);
			}
		});
	}
	
	
</script>

<script>
	 $(function(){
		getReplyList();
		
		/* setInterval(function(){
			getReplyList();
		}, 10000); */
		
		// 댓글 등록 ajax
		$("#rSubmit").on("click", function(){
			var rContent=$("#rContent").val();
			var nId =${notice.nId};
			
			if('${loginUser}' == ""){
				swal("", "로그인이 필요한 기능입니다.", "warning");
				return false;
			}
			
			swal({
			  	  title: "댓글을 등록하시겠습니까?",
			  	  icon: "info",
			  	  buttons: true,
			  	  dangerMode: false,
			  	})
			  	.then((willDelete) => {
			  	  if (willDelete) {
			  	  } else {
			  		  return false;
			  	  }
			  	});
			
			
			$.ajax({
				url:"addReply.do",
				data:{rContent:rContent, nId:nId},
				
				success:function(data){
					getReplyList(); // 댓글 등록 성공시 댓글 부분이 setInerval 안기다리고 바로 갱신되게 함수 실행
					$("#rContent").val(""); // 댓글 작성한 부분 리셋 해주기
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
				
				var rLength = data.length;
				var height = 800 + (rLength*80);
				
				$(".ha-waypoint").css("height", height+"px");
				$("#rCount").text("댓글("+data.length+")");
				
				if(data.length > 0){	// 댓글이 하나 이상 있으면
					for(var i in data){
						$tableBody.append("<tr>"+
								"<td rowspan='2' style = 'width: 5%; padding-top: 20px;'><img  src='resources/proFiles/"+data[i].profile+"' style = 'width: 30px; height: 30px;'></td>"+
								"<td style = 'width: 85%; font-size: 12px; padding-top: 20px;'>"+data[i].rWriter+"</td>"+
								"<td style = 'width: 15%;'><input type = 'hidden' value = '"+data[i].rId+"'></td>"+
							"</tr>"+
							"<tr>"+
								"<td style = 'width: 85%;'>"+data[i].rCreateDate+"</td>"+
							"</tr>"+
							"<tr>"+
								"<td colspan='2' style = 'border-bottom: 2px solid lightgrey; padding-top: 10px; width: 85%;'>"+
									"<textarea id = 'ta"+data[i].rId+"' style = 'height: 70px; width:100%; resize: none; border: none;' readonly>"+data[i].rContent+"</textarea>"+
								"</td>"+
								"<td style = 'width: 15%; border-bottom: 2px solid lightgrey'>"+
									"<div class = 'btns' style = 'padding-top: 60px;'>"+
										"<button id = 'conBtn"+data[i].rId+"' type = 'button' style = 'display: none;' onclick = 'conRp("+data[i].rId+");'>등록</button>"+
										"<button id = 'canBtn"+data[i].rId+"' type = 'button' style = 'display: none;' onclick = 'canRp("+data[i].rId+");'>취소</button>"+
										"<button id = 'modBtn"+data[i].rId+"' type = 'button' style = 'display: inline-block;' onclick = 'modRp("+data[i].rId+","+data[i].userNo+");'>수정</button>"+
										"<button id = 'delBtn"+data[i].rId+"' type = 'button' style = 'display: inline-block;' onclick = 'delRp("+data[i].rId+","+data[i].userNo+");'>삭제</button>"+
									"</div>"+
								"</td>"+
							"</tr>");
					}
				}else{	// 댓글이 없으면
					$tr=$("<tr>");
					$rContent=$("<td colspan='3' style = 'font-size:25px; text-align: center; margin-top:25px;'>").text("등록된 댓글이 없습니다.");
					
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

	<script type="text/javascript">
		function conRp(rId){
			swal({
			  	  title: "댓글을 수정하시겠습니까?",
			  	  icon: "info",
			  	  buttons: true,
			  	  dangerMode: false,
			  	})
			  	.then((willDelete) => {
			  	  if (willDelete) {
			  		$.ajax({
						url:"modReply.do",
						data:{rId:rId,
							rContent:$("#ta"+rId).val()
						},
						success:function(data){
							if(data == 1){
								swal("", "정상적으로 수정되었습니다.", "success");
								getReplyList();
							}
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
		
		function canRp(rId){
			$("#ta"+rId).attr("readonly","readonly");
			$("#ta"+rId).css("border","none");
			$("#modBtn"+rId).css("display","inline-block");
			$("#delBtn"+rId).css("display","inline-block");
			$("#conBtn"+rId).css("display","none");
			$("#canBtn"+rId).css("display","none");
			getReplyList();
		}
		
		function modRp(rId, userNo){
			if('${loginUser}' == ""){
				swal("", "로그인이 필요한 기능입니다.", "warning");
				return false;
			}else{
				if('${loginUser.userNo}' != userNo){
					swal("", "자신이 등록한 글이 아닙니다.", "warning");
					return false;
				}
			}
			
			$("#ta"+rId).removeAttr("readonly","none");
			$("#ta"+rId).css("border","2px solid lightgrey");
			$("#ta"+rId).focus();
			$("#modBtn"+rId).css("display","none");
			$("#delBtn"+rId).css("display","none");
			$("#conBtn"+rId).css("display","inline-block");
			$("#canBtn"+rId).css("display","inline-block");
		}
		
		function delRp(rId, userNo){
			if('${loginUser}' == ""){
				swal("", "로그인이 필요한 기능입니다.", "warning");
				return false;
			}else{
				if('${loginUser.userNo}' != userNo){
					swal("", "자신이 등록한 글이 아닙니다.", "warning");
					return false;
				}
			}
			
			swal({
			  	  title: "댓글을 삭제하시겠습니까?",
			  	  icon: "info",
			  	  buttons: true,
			  	  dangerMode: true,
			  	})
			  	.then((willDelete) => {
			  	  if (willDelete) {
			  		$.ajax({
						url:"delReply.do",
						data:{rId:rId
						},
						success:function(data){
							if(data == 1){
								swal("", "정상적으로 삭제되었습니다.", "success");
								getReplyList();
							}
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


			<script>
	function NoticeList(){
		location.href="nlist.do";	
	}
	
	function NupView(){
		location.href="nupView.do?nId=" + ${notice.nId};
	}
	
	function Ndelete(){
		swal({
		  	  title: "글을 삭제하시겠습니까?",
		  	  icon: "info",
		  	  buttons: true,
		  	  dangerMode: true,
		  	})
		  	.then((willDelete) => {
		  	  if (willDelete) {
		  		location.href="ndelete.do?nId=" + ${notice.nId};
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