<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>
<head>
<title>A very Simple jQuery Popup</title>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
//open popup
$("#pop").click(function(){
  $("#overlay_form").fadeIn(1000);
  positionPopup();
});

//close popup
$("#close").click(function(){
	$("#overlay_form").fadeOut(500);
});
});

//position the popup at the center of the page
function positionPopup(){
  if(!$("#overlay_form").is(':visible')){
    return;
  } 
  $("#overlay_form").css({
      left: ($(window).width() - $('#overlay_form').width()) / 2,
      top: ($(window).width() - $('#overlay_form').width()) / 7,
      position:'absolute'
  });
}

//maintain the popup at center of the page when browser resized
$(window).bind('resize',positionPopup);
</script>

	<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="scripts/slideitmoo-1.1.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

<script type="text/javascript" src="js/jquery.leanModal.min.js"></script>
<script type="text/javascript" src="js/jquery.min.js"></script>


<style>
#overlay_form{
	position: absolute;
	border: 5px solid gray;
	padding: 10px;
	background: white;
	width: 270px;
	height: 190px;
}
#pop{
	display: block;
	border: 1px solid gray;
	width: 65px;
	text-align: center;
	padding: 6px;
	border-radius: 5px;
	text-decoration: none;
	margin: 0 auto;
}
</style>
</head>
<body>

<p>
Lorem ipsum dolor sit amet, consectetur adipiscing elit. Proin blandit tellus iaculis nisi ornare ac imperdiet eros sodales. Quisque fermentum posuere enim, dapibus condimentum lorem euismod sed. Vestibulum quis mauris sit amet quam blandit accumsan non sed urna. Nunc felis erat, luctus et sagittis eu, tristique ac enim. Praesent at est eget justo feugiat semper et sed ante. Proin convallis eleifend adipiscing. Duis nisi lorem, lobortis id fringilla at, malesuada quis nibh. Nunc nibh odio, sagittis eu fringilla id, accumsan eu enim. Vestibulum elementum consectetur ipsum, nec faucibus dui pretium eget.
</p>
<p>
Duis at felis dui. Proin a turpis augue, in porttitor nisl. Proin eget enim velit, ut sagittis massa. Mauris non dolor sed nibh volutpat gravida. Sed mattis, felis sit amet egestas iaculis, sapien tortor venenatis augue, quis dignissim leo neque nec velit. Nam justo nisl, interdum non molestie sit amet, tempus quis elit. Nullam leo enim, sagittis eget tempus aliquet, suscipit ac arcu. In arcu massa, feugiat id luctus quis, egestas et velit. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Proin fermentum adipiscing elementum. Mauris leo neque, placerat vel semper quis, porttitor in urna. Aenean ut turpis nisi, quis vulputate turpis. Maecenas ut felis consequat dui gravida volutpat. Donec convallis suscipit eros, ut laoreet sem faucibus rutrum. Lorem ipsum dolor sit amet, consectetur adipiscing elit.
</p>
<p>
Proin adipiscing nisl a tellus dapibus ut sagittis lacus pellentesque. Proin ut sapien eu neque sagittis porttitor vitae lacinia metus. Fusce congue, enim ac convallis sodales, nulla nisi molestie lectus, id congue lectus est a nibh. Proin pellentesque imperdiet erat, bibendum euismod nisl mollis a. Nullam est nibh, gravida vel ornare at, lacinia semper massa. Suspendisse sit amet risus lacus, sed volutpat ante. Vivamus mollis rutrum dolor eu eleifend. Morbi felis lectus, interdum sed pretium non, tincidunt ac dui. Fusce imperdiet dapibus metus nec ultrices. Sed quam enim, elementum eget pharetra id, placerat nec tortor. Vestibulum dapibus malesuada enim vel aliquet. Morbi sit amet pharetra elit. Quisque at risus et nibh fermentum auctor.
</p>
<p>
Aenean ultricies ligula massa. Suspendisse lorem erat, aliquam imperdiet euismod eu, tincidunt et lacus. Donec felis quam, pharetra et mollis ac, euismod eget diam. Curabitur sit amet nibh lorem. Mauris et odio a ipsum rutrum interdum in luctus lorem. Nam id nulla et lorem pretium lacinia a non nisl. Ut ipsum ante, fermentum nec pellentesque nec, placerat non risus. Vestibulum imperdiet lacus nec sapien elementum vel dignissim neque aliquet.
</p>
<p>
Aenean eget diam turpis. Cras venenatis sapien quis lacus eleifend commodo. Curabitur luctus ultricies faucibus. Donec ut enim urna. Duis tortor orci, pretium non lacinia sit amet, volutpat eu lacus. Sed mollis volutpat libero, in pharetra quam luctus vitae. Nam sed lacus ac elit dictum gravida. Morbi pellentesque, massa vel lacinia rutrum, nunc sapien placerat est, a fermentum nibh risus eu nunc. Aenean vitae massa tortor, ut aliquet tortor. Vivamus convallis tristique est ut consequat. Etiam pretium turpis at nisl posuere scelerisque. Nunc tincidunt, nunc et accumsan iaculis, felis arcu adipiscing orci, ut fermentum dui enim vel eros. Integer eu convallis purus.
</p>
<a href="#" id="pop" >PopUp</a>
<br />
<form id="overlay_form" style="display:none">
	<h2> Put your contents here..</h2>
	<label>Username: </label><input type="text" name="username" /><br /><br />
	<label>Password: </label><input type="text" name="password" /><br /><br />
	<input type="button" value="Login" />
	<a href="#" id="close" >Close</a>
</form>

</body>
</html>