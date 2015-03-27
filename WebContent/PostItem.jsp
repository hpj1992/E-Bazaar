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

<form class="jotform-form"  method="get" action="StoreItemDetails" enctype="multipart/form-data" name="form_30935635978469" id="30935635978469"  >
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
      <li class="form-line" id="id_31">
        <label class="form-label-top" id="label_31" for="input_31"> Select Type: <span class="form-required">*</span></label>
        <div id="cid_31" class="form-input-wide">
          <div class="form-single-column"><span class="form-radio-item" style="clear:left;" ><input type="radio" class="form-radio" id="input_31_0" name="q31_selectType" value="Buy it Now" onclick="removeFields()" />
              <label for="input_31_0"> Buy it Now </label></span><span class="clearfix"></span><span class="form-radio-item " style="clear:left;"><input type="radio" class="form-radio validate[required]" id="input_31_1" name="q31_selectType" value="Auction" onclick="addDuration()"/>
              <label for="input_31_1"> Auction </label></span><span class="clearfix"></span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_24">
        <label class="form-label-top" id="label_24" for="input_24"> Select Main-Category <span class="form-required">*</span></label>
        <div id="cid_24" class="form-input-wide ">
          
          
        </div>
      </li>
      
      <li class="form-line" id="id_34">
        <label class="form-label-top" id="label_34" for="input_34"> Select Sub-Category <span class="form-required">*</span></label>
        <div id="cid_24" class="form-input-wide ">
          
          <select class="form-dropdown validate[required]" style="width:150px" id="input_34" name="selectCategory" "> 
             <option value="" selected>Please Select </option>
           <option value="126" >Footwear </option>
           <option value="127" >Wood </option>
           <option value="128" >Weapon </option>
           <option value="129" >Ornament </option>
           <option value="130" >Ivory </option>
           <option value="131" >Furniture </option>
           <option value="132" >Paitings </option>
           <option value="133" >Metal </option>
           
            </select>
        </div>
      </li>
      
  
 <li class="form-line" id="id_26">
        <label class="form-label-top" id="label_25" for="input_26">Title for your product <span class="form-required">*</span></label>
        <div id="cid_26" class="form-input-wide">
          <input type="text" class=" form-textbox validate[required]" id="input_26" name="q25_brand" size="20" />
        </div>
      </li>
 <li class="form-line" id="id_25">
        <label class="form-label-top" id="label_25" for="input_25">Brand</label>
        <div id="cid_25" class="form-input-wide">
          <input type="text" class=" form-textbox" id="input_25" name="q25_brand" size="20" />
        </div>
      </li>
      
            
            
 <br>  
 <div id='category'>  
 
 </div>
   
      <!--  
      <li class="form-line" id="id_26">
        <label class="form-label-top" id="label_26" for="input_26" > 00 </label>
        <div id="cid_26" class="form-input-wide">
          <input type="text" class=" form-textbox" id="input_26" name="q26_desc1" size="20" />
        </div>
      </li>
      <li class="form-line" id="id_27">
        <label class="form-label-top" id="label_27" for="input_27"> 01</label>
        <div id="cid_27" class="form-input-wide">
          <input type="text" class=" form-textbox" id="input_27" name="q27_desc2" size="20" />
        </div>
      </li>
      <li class="form-line" id="id_28">
        <label class="form-label-top" id="label_28" for="input_28">12  </label>
        <div id="cid_28" class="form-input-wide">
          <input type="text" class=" form-textbox" id="input_28" name="q28_desc3" size="20" />
        </div>
      </li>
      
      -->
      
      <!-- Other Fields -->
      <li class="form-line" id="id_29">
        <label class="form-label-top" id="label_29" for="input_29"> Manufacturing Date / Buying Date </label>
        <div id="cid_29" class="form-input-wide">
          <input type="text" class=" form-textbox" id="input_29" name="q29_manufacturingDate" size="20" />
        </div>
      </li>
      <li class="form-line" id="id_32">
        <label class="form-label-top" id="label_32" for="input_32"> Price / Base Price <span class="form-required">*</span></label>
        <div id="cid_32" class="form-input-wide">
          <input type="text" class=" form-textbox validate[required]" id="input_32" name="q32_price" size="20" />
        </div>
      </li>
      <p id="d1">
      
      
      
      </p>
      
      <li class="form-line" id="id_22">
        <label class="form-label-top" id="label_22" for="input_22">
          Description<span class="form-required">*</span>
        </label>
        <div id="cid_22" class="form-input-wide">
          <div class="form-textarea-limit"><span><textarea id="input_22" class="form-textarea validate[required]" maxlength="20" name="q22_description" cols="40" rows="6"></textarea>
              <div class="form-textarea-limit-indicator"><span type="Words" limit="2000" id="input_22-limit">0/2000</span>
              </div></span>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_16">
        <div id="cid_16" class="form-input-wide">
          <div id="text_16" class="form-html">
            <p style="text-align: justify;"><span style="font-size: small;"><strong>
                  Terms:
                </strong></span>
            </p>
            <p style="text-align: justify;"><span style="font-size: medium; font-family: 'book antiqua', palatino;">By submitting this Item Details , I retains all ownership rights of Product and I agree to Auction or sell it.</span>
            </p>
          </div>
        </div>
      </li>
    
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="text-align:center" class="form-buttons-wrapper">
          

           <button  type="submit" class="form-submit-button">
              Post
            </button> 
			 
				
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
