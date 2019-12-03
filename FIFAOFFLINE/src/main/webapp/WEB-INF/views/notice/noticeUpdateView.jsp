<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page session="false" %> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	
	<h1 align="center">공지글 수정 페이지</h1>
	
	<br><br>
	
	<form action="nupdate.do" method="post" enctype="Multipart/form-data">
	<!-- 첨부파일도 수정할 수 있으니깐 form태그에 enctype은 multipart로 하자 -->
		
		<!-- 화면에 뿌려줄 필요 x, 사용자가 입력할 필요는 x지만 쿼리에서 필요한 것들 -->
		<input type="hidden" name="nId" value="${notice.nId }"/>
		<!-- 파일을 수정했다면 기존 파일은 지우기 위해 기존 파일명도 넘기자-->
		<input type="hidden" name="filePath" value="${notice.filePath }"/>
		
		
		<table align="center" border="1" cellspacing="0" width="400">
			<tr>
				<td>제목</td>
				<td>
					<input type="text" size="50" name="nTitle" value="${notice.nTitle }">
				</td>
			</tr>
			<tr>
				<td>작성자</td>
				<td>
				<input type="text" size="50" name="nWriter" value="${notice.nWriter }">
				</td>
			</tr>
			<tr>
				<td>내용</td>
				<td>
				<input type="text" size="50" name="nContent" value="${notice.nContent }">
				</td>
			</tr>
			<tr>
				<td>첨부파일</td>
				<td>
					<input type="file" name="reloadFile">
					<c:if test="${!empty notice.filePath }">
						<br>현재 업로드한 파일:
						<img src="${contextPath }/resources/nuploadFiles/${notice.filePath}">
						<a href="${contextPath }/resources/nuploadFiles/${notice.filePath }" download>
						</a>
					</c:if>
					<br>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<input type="submit" value="수정하기">
				</td>
			</tr>
		</table>
	</form>
	
	
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