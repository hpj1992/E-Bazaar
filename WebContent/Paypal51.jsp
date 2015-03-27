<%@ page contentType="text/html; charset=utf-8" language="java" import="java.sql.*" errorPage="" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<%@page import="java.util.ArrayList"%><html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Sign up with PaNyaPal Payment Step 1</title><!--for buy it now -->
<style type="text/css">
<!--
body {
	font: 100%/1.4 Verdana, Arial, Helvetica, sans-serif;
	background: #42413C;
	margin: 0;
	padding: 0;
	color: #000;
}

/* ~~ Element/tag selectors ~~ */
ul, ol, dl { /* Due to variations between browsers, it's best practices to zero padding and margin on lists. For consistency, you can either specify the amounts you want here, or on the list items (LI, DT, DD) they contain. Remember that what you do here will cascade to the .nav list unless you write a more specific selector. */
	padding: 0;
	margin: 0;
}




h1,h2, h3, h4, h5, h6, p {
	margin-top: 0;	 /* removing the top margin gets around an issue where margins can escape from their containing div. The remaining bottom margin will hold it away from any elements that follow. */
	padding-right: 15px;
	padding-left: 35px; /* adding the padding to the sides of the elements within the divs, instead of the divs themselves, gets rid of any box model math. A nested div with side padding can also be used as an alternate method. */
	margin-bottom:0px;
	color: #333;
}
a img { /* this selector removes the default blue border displayed in some browsers around an image when it is surrounded by a link */
	border: none;
}

/* ~~ Styling for your site's links must remain in this order - including the group of selectors that create the hover effect. ~~ */
a:link {
	color: #42413C;
	text-decoration: underline; /* unless you style your links to look extremely unique, it's best to provide underlines for quick visual identification */
}
a:visited {
	color: #6E6C64;
	text-decoration: underline;
}
a:hover, a:active, a:focus { /* this group of selectors will give a keyboard navigator the same hover experience as the person using a mouse. */
	text-decoration: none;
}

/* ~~ this fixed width container surrounds all other divs ~~ */
.container {
	width: 960px;
	background: #FFF;
	margin: 0 auto; /* the auto value on the sides, coupled with the width, centers the layout */
	overflow: hidden; /* this declaration makes the .container understand where the floated columns within ends and contain them */
}

/* ~~ These are the columns for the layout. ~~ 

1) Padding is only placed on the top and/or bottom of the divs. The elements within these divs have padding on their sides. This saves you from any "box model math". Keep in mind, if you add any side padding or border to the div itself, it will be added to the width you define to create the *total* width. You may also choose to remove the padding on the element in the div and place a second div within it with no width and the padding necessary for your design.

2) No margin has been given to the columns since they are all floated. If you must add margin, avoid placing it on the side you're floating toward (for example: a right margin on a div set to float right). Many times, padding can be used instead. For divs where this rule must be broken, you should add a "display:inline" declaration to the div's rule to tame a bug where some versions of Internet Explorer double the margin.

3) Since classes can be used multiple times in a document (and an element can also have multiple classes applied), the columns have been assigned class names instead of IDs. For example, two sidebar divs could be stacked if necessary. These can very easily be changed to IDs if that's your preference, as long as you'll only be using them once per document.

4) If you prefer your nav on the right instead of the left, simply float these columns the opposite direction (all right instead of all left) and they'll render in reverse order. There's no need to move the divs around in the HTML source.

*/
.sidebar1 {
	float: left;
	width: 180px;
	padding: 50px 0;
	background: #EADCAE;
	padding-bottom: 730px;
}
.content {
	padding-left:100px;

	padding: 20px 0;
	width: 780px;
	float: left;
	margin-top:0;
}



/* ~~ This grouped selector gives the lists in the .content area space ~~ */
.content ul, .content ol { 
	padding: 0 15px 15px 40px; /* this padding mirrors the right padding in the headings and paragraph rule above. Padding was placed on the bottom for space between other elements on the lists and on the left to create the indention. These may be adjusted as you wish. */
}

/* ~~ The navigation list styles (can be removed if you choose to use a premade flyout menu like Spry) ~~ */
ul.nav {
	list-style: none; /* this removes the list marker */
	border-top: 1px solid #666; /* this creates the top border for the links - all others are placed using a bottom border on the LI */
	margin-bottom: 15px; /* this creates the space between the navigation on the content below */
}
ul.nav li {
	border-bottom: 1px solid #666; /* this creates the button separation */
}
ul.nav a, ul.nav a:visited { /* grouping these selectors makes sure that your links retain their button look even after being visited */
	padding: 5px 5px 5px 15px;
	display: block; /* this gives the link block properties causing it to fill the whole LI containing it. This causes the entire area to react to a mouse click. */
	width: 160px;  /*this width makes the entire button clickable for IE6. If you don't need to support IE6, it can be removed. Calculate the proper width by subtracting the padding on this link from the width of your sidebar container. */
	text-decoration: none;
	background: #C6D580;
}
ul.nav a:hover, ul.nav a:active, ul.nav a:focus { /* this changes the background and text color for both mouse and keyboard navigators */
	background: #ADB96E;
	color: #FFF;
	text-align:center;
}

/* ~~ miscellaneous float/clear classes ~~ */
.fltrt {  /* this class can be used to float an element right in your page. The floated element must precede the element it should be next to on the page. */
	float: right;
	margin-left: 8px;
}
.fltlft { /* this class can be used to float an element left in your page. The floated element must precede the element it should be next to on the page. */
	float: left;
	margin-right: 8px;
}
.clearfloat { /* this class can be placed on a <br /> or empty div as the final element following the last floated div (within the #container) if the overflow:hidden on the .container is removed */
	clear:both;
	height:0;
	font-size: 1px;
	line-height: 0px;
}

/* User defined*/

.smallfont{
	font-family:Verdana, Geneva, sans-serif;
	font-size: 10px;
}

.smallfontright{
	font-family:Verdana, Geneva, sans-serif;
	font-size: 13px;
	text-align:right;
}


.padd{
	padding-left:15px;
	margin-top:5px;
	margin-bottom:0px;
}

.rightalignn{
	text-align:right;
}

.secondh1{
	display:block;
	border-top: 1px solid #e1bf48;
	border-left: 1px solid #e1bf48;
	border-right: 1px solid #e1bf48;
	border-bottom: 1px solid #e1bf48;
	margin-left: -3px;
	margin-right: 5px;
	margin-top: 4px;
	background-color:#FC6;
	font-weight: bold;
	color: #5d5d5d;
	padding-top: 0;
	padding-bottom: 4px;
	padding-left: 3px;
}

.block1{
		display:block;
	border-top: 1px solid #e1bf48;
	border-left: 1px solid #e1bf48;
	border-right: 1px solid #e1bf48;
border-bottom: 1px solid #e1bf48;
margin-left: 5px;
margin-right: 5px;
margin-top: 4px;

color: #5d5d5d;
padding-top: 0;
padding-bottom: 4px;
padding-left: 9px;
	
}

.inputbox{
	font-family: Arial;
font-size: 11px;
font-weight: normal;
color: #5d5d5d;
border: 1px solid #7c9eba;
width: 335px;
height:20px;
}

.red{
	font-size:13px;
	color:#900;
}

.redpad{
	margin-left:20px;
	font-size:13px;
	color:#900;
}



-->
</style></head>



<script language="javascript" type="text/javascript">  
 var xmlHttp;  
 function fetchCity(str){ 
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
var url="PaNyaPalSignUp";
url += "?userType=2\&flag=1\&ajax=1\&bname="+str; //+"&pass2="+"";
xmlHttp.onreadystatechange = stateChange1;
xmlHttp.open("GET", url, true);
xmlHttp.send(null);
}
 function stateChange1(){   
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("ccity").innerHTML=xmlHttp.responseText;
		
 }   
 }
</script>  


<script language="javascript" type="text/javascript">  

function fetchBranch(str,str2){ 
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
	var url="PaNyaPalSignUp";
	url += "?userType=2\&flag=2\&ajax=1\&ct="+str+"\&bbname="+str2; 
	xmlHttp.onreadystatechange = stateChange2;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	}
	 function stateChange2(){   
	 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
	 document.getElementById("bbranch").innerHTML=xmlHttp.responseText;

	 }   
	 }
</script>



<script language="javascript" type="text/javascript">  

function retypeDisplay(str){ 
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
	var url="PaNyaPalSignUp";
	url += "?userType=2\&flag=3\&ajax=1\&eUser="+str; //+"&pass2="+"";
	xmlHttp.onreadystatechange = stateChange3;
	xmlHttp.open("GET", url, true);
	xmlHttp.send(null);
	}
	function stateChange3(){   
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){ 

	var temp=xmlHttp.responseText;

	  	if(temp == "")
	  	{
	  		document.getElementById("retype_lable").style.visibility="hidden";
		 	    
	 	}
	  	else
	  	{
	  		document.getElementById("retype_lable").style.visibility="visible";
		  	
	  	} 	
	}
	}
</script>



 <script>

 function matchPassword(str1,str2){
		
	 if(str1 != str2)
	 {
		 document.getElementById("err1").innerHTML="*Check the password again";  
			 
	 }
	 else
	 {
		 document.getElementById("err1").innerHTML="";  
		 
					
		 }
 }
 </script>




<body>

<div class="container">
  <div class="sidebar1">
    <ul class="nav">
      <li><img  align="middle" src="images/logo1.jpg" width="178" height="51" /></li>
      <li><a href="#">Sell upto 5000 Rs. &amp;  Get 20% off Commision.*</a></li>
      <li><a href="#"> offer2</a> </li>
      <li><a href="#"> offer3</a></li>
    </ul>
    <!-- end .sidebar1 --></div>
    
    
    
    
    
    
<form method="post" action="PaNyaPalSignUp?userType=2&flag=4" >

<div class="content">
  <h1><span class="pad">Register to Sell with paNyaPal</span></h1>
    <p class="pad">&nbsp;</p>
    
 <a id='error1' class="redpad" value=""></a>
    
     <%  
    String visibilityCondition="";
     visibilityCondition=(String)session.getAttribute("visibilityCondition");
    System.out.println("visibilityCondition:"+visibilityCondition);
    
    String errorT="";
    errorT=(String)session.getAttribute("errorText");
    session.setAttribute("errorText","");
    
    if(errorT==null)   {errorT="";    }
    %>
    
    <script>

    document.getElementById("error1").style.visibility="hidden";
    var v='<%= visibilityCondition %>';
    
    if(v== "visible" )
    	{
    	document.getElementById("error1").style.visibility="visible";
    	  	var errorText = '<%= errorT %>';
    	    document.getElementById("error1").innerHTML=errorText;
    	    errorText='';
        }
    else
    	{
    	document.getElementById("error1").style.visibility="hidden";

}
    </script>
    
    
    
    
    
    
<div class="block1">
  <p class="secondh1">PaNyaPal Registartion Details</p>
    <p class="smallfont">PaisaPay requires your bank details to regularly send you the payments you receive from your buyers. These payments are transferred online to your bank account, so you face no hassles or security risks in receiving your money.</p>
    <p class="pad">&nbsp;</p>
    <p class="pad">Payee Name</p>
    <p class="pad">
      <input name="payeename" type="text" size="50" height="20px"   onfocus="if(this.value=='')this.value='';" value="" />
    </p>
    <p class="pad">&nbsp;</p>
    <p class="pad">Bank Account Number</p>
    <p class="pad">
      <input name="bankaccountno" type="text"    size="50" height="20px"   onfocus="if(this.value=='')this.value='';" value="" />
    </p>
    <p class="pad">&nbsp;</p>
    <p class="pad">Bank Name</p>
    <p class="pad">
	      <select name="bankname" size="1" class="inputbox" id="bbankname"  onchange="fetchCity(this.value)">
	      <option selected="selected"></option>
			<% 		
   				ArrayList<String> bnamelist=(ArrayList<String>)session.getAttribute("bnamelist");
                for(int i=0 ; i<bnamelist.size(); i++) {  String s=bnamelist.get(i);
                //System.out.println("s"+i+":"+s);
        	%>
   			<option value="<%= s %>"><%= s  %></option>
        	
   		<% 
   		 }
   		%>
   		</select>
    </p>
    <p class="pad">&nbsp;</p>
    <p class="pad">City</p>
    <p  class="pad">
      <select id="ccity"  name="city" size="1" class="inputbox" onchange="fetchBranch(this.value,bbankname.value)"> <!-- onchange="fetchBranch(this.value,v4-1.value)"> -->       
     
     
      </select> 
     
      </p>
    <p class="pad">&nbsp;</p>
    <p class="pad">Branch</p>
     <p  class="pad">
      <select id="bbranch"  name="branch" size="1" class="inputbox" >   <!-- name="branch" size="1" class="inputbox" id="v4-3"> -->      
     <!--  <option selected="selected"></option>  -->      
      </select>  
      
    </p>
<p class="pad">&nbsp;</p>
<p class="pad">MICR Code</p>
    <p class="smallfont">(9 digit code found at the bottom of your cheque)</p>
    <p class="pad">
      <input name="micr" type="text"    size="50" height="20px"   onfocus="if(this.value=='')this.value='';" value="" />
    </p>
    <p class="pad">&nbsp;</p>
    <p class="pad">&nbsp;</p>
    <p class="pad">User Email</p>
    <p class="pad">
      <input name="email" type="text" size="50" height="20px"   onchange="retypeDisplay(this.value)" value="" />
    </p>
    <p>&nbsp;</p>
    <p><span class="pad">Password</span></p>
    <p><span class="pad">
      <input id="pwd1" name="pwd" type="text" size="50" height="20px"   onfocus="if(this.value=='')this.value='';" value="" />
    </span></p>
    <p>&nbsp;</p>
    <div id="retype_lable">
    <p id="retype_lable1"><span class="pad">Retype Password</span></p>
    <p id="retype_lable2"><span class="pad">
      <input id="pwd2" name="branch4" type="text" size="50" height="20px"   onblur="matchPassword(pwd1.value,this.value)" value="" /><a id="err1" class="red"></a>
    </span></p>
    </div>
    <p id="tt" class="pad">&nbsp;</p>
 
    <script>
		document.getElementById("retype_lable").style.visibility="hidden";
		
    </script>
  </div>

    
    <p class="pad"></p>
<p class="pad">&nbsp;</p>
<div class="block1">
  <p class="secondh1">PaNyaPal Terms &amp; Condition</p>
  <table>
    <tbody>
        <tr class="smallfont">
          <td> <span class="pad">
            <input type="checkbox" value="1" name="iagreecheckbox"  />
          </span>
          <td>That by clicking on the box I agree that I have read and understood the <a href="http://pages.ebay.in/help/policies/pspx-seller-terms-conditions.html" target="_blank">PaNyaPal Seller Terms &amp; Conditions</a>(hereinafter referred as the &quot;Seller Terms &amp; Conditions&quot;) and unconditionally accept to be legally bound by the following:</td>
        </tr>
      </tbody>
</table>
    <ul id="agreement">
      <li class="smallfont">That I have had reasonable opportunity and time to read, understand and take proper advice;</li>
      <li class="smallfont">That while using PaNyaPal services, I unequivocally agree &amp; undertake to abide by and comply with the Seller Terms &amp; Conditions,</li>
      <li class="smallfont">I further agree that the Seller Terms &amp; conditions are in all respects fair, reasonable and nesessary in order to protect the users of PaisaPay services and the legitimate business interests of PaNyaPal;</li>
      <li class="smallfont">I understand that the information I provide will be collected by PaNyaPal (or its succesors and assigns) and stored and processed in accordance with PaisaPay Privacy Policy;</li>
      <li class="smallfont">I agree that PaNyaPal is only a service provider and is not responsible for any non-performance or breach of contract between users of PaNyaPal.</li></ul>
</div>
    <p class="pad">&nbsp;    </p>
    <p class="pad">
      <input type="submit" value="Register &amp; Complete Listing &gt;&gt;" onclick="" onkeypress="" />
    </p>
    <p class="pad">&nbsp;</p>
    <p >&nbsp;</p>
    <p><i>	Payments processed by PaNyaPal</i></p>


   
<!-- end .content --></div>

</form>

<!-- end .container --></div>
</body>
</html>
