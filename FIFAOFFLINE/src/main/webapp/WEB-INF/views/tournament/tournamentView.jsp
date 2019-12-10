<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script>
  var $$$ = jQuery.noConflict();
</script>
<!-- <script src="//code.jquery.com/jquery-1.11.3.min.js"></script> -->
<script src="resources/js/jquery.bracket.min.js"></script>
<link href="resources/css/jquery.bracket.min.css" rel="stylesheet">
<title>Insert title here</title>

<script type="text/javascript">
  
/* Custom data objects passed as teams */
var customData = {
    teams : [
      [{name: "Team 1", flag: 'logo.png'}, null],
      [{name: "Team 3", flag: 'se'}, {name: "Team 4", flag: 'us'}]
    ],
    results : []
  }
 
/* Edit function is called when team label is clicked */
function edit_fn(container, data, doneCb) {
  var input = $$$('<input type="text">')
  input.val(data ? data.flag + ':' + data.name : '')
  container.html(input)
  input.focus()
  input.blur(function() {
    var inputValue = input.val()
    if (inputValue.length === 0) {
      doneCb(null); // Drop the team and replace with BYE
    } else {
      var flagAndName = inputValue.split(':') // Expects correct input
      doneCb({flag: flagAndName[0], name: flagAndName[1]})
    }
  })
}
 
/* Render function is called for each team label when data is changed, data
 * contains the data object given in init and belonging to this slot.
 *
 * 'state' is one of the following strings:
 * - empty-bye: No data or score and there won't team advancing to this place
 * - empty-tbd: No data or score yet. A team will advance here later
 * - entry-no-score: Data available, but no score given yet
 * - entry-default-win: Data available, score will never be given as opponent is BYE
 * - entry-complete: Data and score available
 */
function render_fn(container, data, score, state) {
  switch(state) {
    case "empty-bye":
      container.append("No team")
      return;
    case "empty-tbd":
      container.append("Upcoming")
      return;
 
    case "entry-no-score":
    case "entry-default-win":
    case "entry-complete":
      container.append('<img src="resources/images/'+data.flag+'" style = "width:15px; height:15px;"/> ').append(data.name)
      return;
  }
}
 
$$$(function() {
	$$$('#tTree').bracket({
    init: customData,
    save: function(){}, /* without save() labels are disabled */
    decorator: {edit: edit_fn,
                render: render_fn}})
  	/* save: null, // called whenever bracket is modified
	  userData: null, // custom user data
	  onMatchClick: null, // callback
	  onMatchHover: null, // callback
	  decorator: null, // a function
	  skipSecondaryFinal: false,
	  skipGrandFinalComeback: false,
	  skipConsolationRound: false,
	  dir: 'rl', // "rl" or  "lr",
	  disableToolbar: false,
	  disableTeamEdit: false,
	  teamWidth: '', // number
	  scoreWidth: '', // number
	  roundMargin: '', // number
	  matchMargin: '', // number */
  })


</script>





</head>
<jsp:include page = "../common/header.jsp"/>

<style>
	.tools{
		width: 100%;
		height: 200px;
	}
	

</style>

<body>

<div id = "outer" style = "margin-top: 150px;">
			<div class="ha-waypoint" data-animate-down="ha-header-show" data-animate-up="ha-header-subshow" style = "height: 800px; width: 90%; background: white; margin: auto; margin-top: 300px;">
				
				
					<div id = "tTree"></div>
				
				
			</div>
			<br>
			<div class="ha-waypoint" data-animate-down="ha-header-shrink" data-animate-up="ha-header-show" style = "height: 800px; width: 90%; background: white; margin: auto; margin-bottom: -200px;">
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


<jsp:include page = "../common/footer.jsp"/>
</body>
</html>