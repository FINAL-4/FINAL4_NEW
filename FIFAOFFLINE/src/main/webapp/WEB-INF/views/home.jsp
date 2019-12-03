<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
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
			} );
		</script>

<jsp:include page = "common/footer.jsp"/>
</body>
</html>