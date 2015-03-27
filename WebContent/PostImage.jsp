<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="java.util.*"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Post an Add</title>
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
//open popup
$("#pop2").click(function(){
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
	
	width: 65px;
	text-align: center;
	padding: 6px;
	border-radius: 5px;
	text-decoration:inherit;
	margin: 0 auto;
}
</style>

 
</head>
<body>

<script src="js/postjs.js" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.init();
</script>
<link href="css/postcss.css" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/postcss2.css" />
<style type="text/css">
    .form-label{
        width:150px !important;
    }
    .form-label-left{
        width:150px !important;
    }
    .form-line{
        padding-top:12px;
        padding-bottom:12px;
    }
    .form-label-right{
        width:150px !important;
    }
    .form-all{
        width:480px;
        color:Black !important;
        font-family:'Lucida Grande','Lucida Sans Unicode','Lucida Sans','Verdana','Tahoma','sans-serif';
        font-size:14px;
    }
</style>

<script language="javascript" type="text/javascript">  


 var xmlHttp  
 var xmlHttp
 function showState(str){
if (typeof XMLHttpRequest != "undefined"){
   xmlHttp= new XMLHttpRequest();
       }
       else if (window.ActiveXObject){
   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
       }
if (xmlHttp==null){
    alert ("Browser does not support XMLHTTP Request")
return
} 
var url="Fetch_Subcat";
url += "?maincatname=" +(str.toString()); //+"&pass2="+"";

xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
 function stateChange(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("input_34").innerHTML=xmlHttp.responseText;  
 }   
 }

 function showState2(str){
	 
	 if (typeof XMLHttpRequest != "undefined"){
	    xmlHttp= new XMLHttpRequest();
	        }
	        else if (window.ActiveXObject){
	    xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
	        }
	 if (xmlHttp==null){
	     alert ("Browser does not support XMLHTTP Request")
	 return
	 } 
	 var url="Fetch_Field";
	 url += "?subcatname=" +(str.toString()); //+"&pass2="+"";

	 xmlHttp.onreadystatechange = stateChange2;
	 xmlHttp.open("POST", url, true);
	 xmlHttp.send(null);
	 }

 function stateChange2(){   
	 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){  
		  
	 document.getElementById("category").innerHTML=xmlHttp.responseText;  
	 }   
	 }
 function addDuration()
 {
	 if (typeof XMLHttpRequest != "undefined"){
		   xmlHttp= new XMLHttpRequest();
		       }
		       else if (window.ActiveXObject){
		   xmlHttp= new ActiveXObject("Microsoft.XMLHTTP");
		       }
		if (xmlHttp==null){
		    alert ("Browser does not support XMLHTTP Request")
		return
		} 
		var url="Fetch_Duration";

		xmlHttp.onreadystatechange = stateChange3;
		xmlHttp.open("POST", url, true);
		xmlHttp.send(null);
		}
		 function stateChange3(){   
		 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 
			 document.getElementById("d1").style.display="block";  
		 document.getElementById("d1").innerHTML=xmlHttp.responseText;  
		 //document.getElementById("d1").style.display="none"; 
		 }   
		 }


		 function removeFields()
		 {
			 document.getElementById("d1").style.display="none"; 	 
	     }
 

 function hello(){
      var txt = '';
     if (window.getSelection)
    {
        txt = window.getSelection();
             }
    else if (document.getSelection)
    {
        txt = document.getSelection();
            }
    else if (document.selection)
    {
        txt = document.selection.createRange().text;
            }
    document.getElementById('name').value=txt;
    alert(txt);

  }
 </script>  
<p id="d2"></p>
<%String itemid=(String)request.getParameter("itemid"); %>
<form class="jotform-form"  method="post" action="SuccessItemPosted.jsp" enctype="multipart/form-data" name="form_30935635978469" id="30935635978469"  >
  <input type="hidden" name="formID" value="30935635978469" />
  <div class="form-all">
    <ul class="form-section">
      <li id="cid_1" class="form-input-wide">
        <div class="form-header-group">
          <h1 id="header_1" class="form-header">
            Upload Your Product!
          </h1>
        </div>
      </li>
     
      <li class="form-line" id="id_5">
        <label class="form-label-left" id="label_5" for="input_5"> Upload File </label>
        <div id="cid_5" class="form-input"><span class="form-sub-label-container"><div class="qq-uploader-buttonText-value">
              Upload Product Image<span class="form-required">*</span>
            </div>
            <input class="form-upload-multiple validate[required]"  NAME="file" TYPE="file" id="input_5"  />
            
        <!--   <input type="button" id="upload"  onclick="uploadImage()">upload</input>" -->
         
            <label class="form-sub-label" for="input_5"> You can upload any type of file. Max: 1 MB </label></span>
        </div>
      </li>
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="text-align:center" class="form-buttons-wrapper">
          

           <button id="pop" type="submit" class="form-submit-button">
              Post
            </button> 
			 
				<div id="overlay_form" style="display:none">
				<h2> Log In here:</h2>
				<label>Username: </label><input type="text" name="username" /><br /><br />
				<label>Password: </label><input type="text" name="password" /><br /><br />
				<input type="button" value="Login" />
				<a href="#" id="close" >Close</a>
			</div>
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="" />
      </li>
    </ul>
  </div>
  <input type="hidden" id="simple_spc" name="simple_spc" value="30935635978469" />
  <script type="text/javascript">
    </script>
    
</form>

</body>
</html>
