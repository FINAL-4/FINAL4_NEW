<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session="false" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, inital-scale=1">
<script src="js/jquery-3.1.1.js"></script>
<script src="js/bootstrap.js"></script>
<title>Insert title here</title>
<style>

    
</style>

</head>
	<jsp:include page="../common/header.jsp"/>	
<body>
	<div id = "outer" style = "margin-top: 180px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style ="width: 90%; margin: auto;">
		<div style="height:100%; width:100%; border-bottom:3px solid red;">
			<div class="example">
			<br><br><br>
		</div>
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 1200px; width: 90%;  margin: auto;">
			<div align="center">


	
	<br><br>
		
	<!-- <table align="center" width="600" border="1" cellspacing="0" style="clear:right;" id="td"> -->
	<table class="table table-striped" font:14px;>
		<tr>
         <th width="100px">번 호</th>
         <th width="600px">제 목</th>
         <th width="150px">작성자</th>
         <th width="100px">조회수</th>
         <th width= "100px">첨부</th>
         <th width="180px">작성일</th>
       </tr>
	
		<c:forEach var="n" items="${list }">
			<tr>
				<td align="center">${n.nId }</td>
				<td>
					<c:if test="${!empty loginUser }">
						<c:url var="ndetail" value="ndetail.do">
							<c:param name="nId" value="${n.nId }"/>
						</c:url>
						<a href="${ndetail }">${n.nTitle }</a>
					</c:if>
					<c:if test="${empty loginUser }">
						${n.nTitle }
					</c:if>
				</td>
				
				<td align="center">${n.nWriter }</td>
				<td align="center">${n.nCount }</td>
				<td align="center">
					<c:if test="${!empty n.filePath }">
						★
					</c:if>
					<c:if test="${!empty n.filePath }">
						&nbsp;
					</c:if>

				<td align="center">${n.nCreateDate }</td>

				</td>
			</tr>
		</c:forEach>

	</table>
  	  
  <!--     <align="right" style="outline:none;border:none;padding:0px;margin:0px" class = "searchBtn"><i class="fa fa-search searchBtn" style="color:white;width:40px;height:39px;font-size:25px;padding-top:7px"><i>  -->
		<%-- <%-- 	<c:if test="${!empty loginUser }">
			<div align="center">
			<button onclick="location.href='nWriterView.do'">글쓰기</button>	
			</div>
		</c:if> --%>

 			<!-- 페이징 부분 -->
 			<tr align="center" height="20">
 				<td colspan="6">
	 				<!-- [이전] -->
	 				<c:if test="${pi.currentPage == 1 }">
	 					[이전]&nbsp;
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage > 1 }">
	 					<c:url var="nlistBack" value="/selectList.do">
	 						<c:param name="Page" value="${pi.currentPage - 1 }"/>
	 					</c:url>
	 					<a href="${nlistBack }">[이전]</a>
	 				</c:if>
	 				
	 				<!-- [번호들] -->
	 				<c:forEach var="p" begin="${pi.startPage }" end="${pi.endPage }">
	 					<c:if test="${p eq pi.currentPage }">
	 						<font color="red" size="4"><b>[${p}]</b></font>
	 					</c:if>
	 					
	 					<c:if test="${p ne pi.currentPage }">
	 						<c:url var="nlistCheck" value="nList.do">
	 							<c:param name="Page" value="${p }"/>
	 						</c:url>
	 						<a href="${nlistCheck }">${p }</a>
	 					</c:if>
	 				</c:forEach>
	 				
	 				<!-- [다음] -->
	 				<c:if test="${pi.currentPage == pi.maxPage }">
	 					&nbsp;[다음]
	 				</c:if>
	 				
	 				<c:if test="${pi.currentPage < pi.maxPage }">
	 					<c:url var="nlistEnd" value="nlist.do">
	 						<c:param name="Page" value="${pi.currentPage + 1 }"/>
	 					</c:url>
	 					<a href="${nlistEnd }">&nbsp;[다음]</a>
	 				</c:if>
 				</td>
 			</tr>
 			<br><br>
	
 		</div class="in-line">
  			   		<span><img id = "search-logo" src="resources/images/search.jpg" width="30px;" height="30px;"></span> 
<!--  			   <button  style="width:100px; float:right; height:30px;">글쓰기</button> -->
 				   <input type="button" name="name" value="글쓰기"  style = "float:right; height:30px; width:60px;" onclick="location.href='nWriterView.do'">
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


    <jsp:include page="../common/footer.jsp"/>
</body>
</html>