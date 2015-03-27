<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web Store Theme - About Our Company</title>
<meta name="keywords" content="web store, about us, company, free ecommerce templates, website templates" />
<meta name="description" content="Web Store, About Us, Our Company, free HTML CSS template" />


 <link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link href="css/logincss1.css?3.1.153" rel="stylesheet" type="text/css" />
<link type="text/css" rel="stylesheet" href="css/logincss2.css?3.1.153" />
<script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
 function isValid(str1,str2){
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
var url="LoginServlet";
url += "?email=" +(str1.toString())+"&password="+str2.toString(); //+"&pass2="+"";

xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
 function stateChange(){
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("message").innerHTML=xmlHttp.responseText; 
 
 if( document.getElementById("message").innerHTML==parseStr("Success"))
 {location.replace("home.jsp");
 }
 
 }
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
 
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">



/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

</script>
   <script src="js/login1.js?3.1.153" type="text/javascript"></script>
<script type="text/javascript">
   JotForm.init(function(){
      $('input_4').hint('ex: myname@example.com');
      JotForm.highlightInputs = false;
   });
</script>


<script type="text/javascript">

ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
</script>

</head>
<%
String username="h";
try
{
	username=(String)session.getAttribute("username");
	
}
catch(NullPointerException e)
{
	username="Guest";
}
if(username==null)
	username="Guest";
%>
<body id="subpage">

<div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title"><h1><a href="http://www.templatemo.com">Free CSS Templates</a></h1></div>
        
        <div id="header_right">
            <ul id="language">
                <li><a><img src="images/india.png" alt="Indian" /></a></li>
                 <div id="intro">
             
            <li> <p>welcome, <%=username %></p></li></div>
            </ul>
            <div class="cleaner"></div>
            <div id="templatemo_search">
                <form action="#" method="get">
                  <input type="text" value="Search" name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                </form>
            </div>
         </div> <!-- END -->
    </div> <!-- END of header -->
    
    <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="home.jsp">Home</a></li>
           
            <li><a href="about.jsp" class="selected">About</a>
                
            </li>
            <li><a href="faqs.jsp">FAQs</a></li>
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="contact.jsp">Contact</a></li>
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
    
    <div class="cleaner h20"></div>
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	        
        <div id="sidebar">
        	<h3>Categories</h3>
            <nav>
					<ul id="css3menu1" class="topmenu">
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=0&catid=18">Footwear</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=1&catid=18">Wood</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=2&catid=18">Weapon</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=3&catid=1">Ornament</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=4&catid=1">Ivory</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=5&catid=1">Furniture</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=6&catid=1">Paintings</a></li>
		<li class="topfirst"><a href="AuctionPaginationServlet?flag=7&catid=1">Metal</a></li>
	</ul>
			
		</nav>
             <!-- <h3>Stay updated .. !!</h3> -->
            <p>Subscribe with us to know about  all new products and new offers.</p>
            <div id="newsletter">
                <form action="#" method="get">
                  <input type="text" value="Subscribe" name="email_newsletter" id="email_newsletter" title="email_newsletter" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="subscribe" value="Subscribe" alt="Subscribe" id="subscribebtn" title="Subscribe" class="subscribebtn"  />
                </form>
                <div class="cleaner"></div>
            </div>
        </div> <!-- END of sidebar -->
        
        <div id="content">
        	
         

<style type="text/css">
    .form-label{
        width:150px !important;
    }
    .form-label-left{
        width:150px !important;
    }
    .form-line{
        padding-top:5px;
        padding-bottom:5px;
    }
    .form-label-right{
        width:150px !important;
    }
    .form-all{
        width:375px;
        background:transparent;
        color:#555 !important;
        font-family:'Lucida Grande';
        font-size:14px;
    }
    .form-radio-item label, .form-checkbox-item label, .form-grading-label, .form-header{
        color:#555;
    }

    /* Injected CSS Code */
.form-all{
background-image:url();
}
.form-line { background: none; }
.form-all {font-family: "Lucida Grande", "Lucida Sans Unicode", "Lucida Sans", Verdana, Tahoma, sans-serif !important;}
.form-header {color: #FFA100;}
.form-line {color: #000;}
.form-textbox,.form-textarea,.form-submit-button {border: 1px solid
#74B235 !important;}
.form-line-error {
background:none repeat scroll 0 0;
}
    /* Injected CSS Code */
</style>

<form class="jotform-form"  method="post" name="form_31036444888460" id="31036444888460" accept-charset="utf-8">
  <input type="hidden" name="formID" value="31036444888460" />
  <div class="form-all">
    <ul class="form-section">
      <li id="cid_1" class="form-input-wide">
        <div class="form-header-group">
          <h1 id="header_1" class="form-header">
            Sign In
          </h1>
        </div>
      </li>
      <li class="form-line" id="id_4">
        <label class="form-label-top" id="label_4" for="input_4">
          E-mail:<span class="form-required">*</span>
        </label>
        <div id="cid_4" class="form-input-wide">
          <input type="email" class=" form-textbox validate[required, Email]" id="email" name="q4_email" size="30" />
        </div>
      </li>
      <li class="form-line" id="id_5">
        <label class="form-label-left" id="label_5" for="input_5">
          Password"<span class="form-required">*</span>
        </label>
        <div id="cid_5" class="form-input">
          <input type="password" class=" form-textbox validate[required]" id="password" name="q5_password" size="30" />
        </div>
      </li>
      <li class="form-line" id="id_2">
        <div id="cid_2" class="form-input-wide">
          <div style="text-align:center" class="form-buttons-wrapper">
            <button id="input_2" type="submit" class="form-submit-button" onclick="isValid(email.value,password.value)">
              Login
            </button>
          </div>
          <div id="message">
				</div>
        </div>
      </li>
      <li class="form-line" id="id_6">
        <div id="cid_6" class="form-input-wide">
          <div id="text_6" class="form-html">
            <p style="text-align: right;">
              <strong>
                Forgot password?
              </strong>
            </p>
          </div>
        </div>
      </li>
      <li class="form-line" id="id_7">
        <div id="cid_7" class="form-input-wide">
          <div id="text_7" class="form-html">
            <p style="text-align: right;">
              <strong>
                Don't hane paNya Account?
              </strong>
            </p>
          </div>
        </div>
      </li>
      <li style="display:none">
        Should be Empty:
        <input type="text" name="website" value="" />
      </li>
    </ul>
  </div>
  <input type="hidden" id="simple_spc" name="simple_spc" value="31036444888460" />
  <script type="text/javascript">
  document.getElementById("si" + "mple" + "_spc").value = "31036444888460-31036444888460";
  </script>
</form>
        </div> <!-- END of content -->
        <div class="cleaner"></div>
    </div> <!-- END of main -->
    
    <div id="templatemo_footer">
    	<div class="col col_16">
        	<h4>Categories</h4>
            <ul class="footer_menu">
			    <li><a href="#">abc</a></li>
                <li><a href="#">bcdr</a></li>				
                <li><a href="#">Ctor</a></li>
                <li><a href="#">Dum</a></li>				
		  </ul>  
        </div>
        <div class="col col_16">
        	<h4>Pages</h4>
            <ul class="footer_menu">
            	<li><a href="#">Home</a></li>
                <li><a href="#">Services</a></li>
                <li><a href="#">Shipping</a></li>
                <li><a href="#">Privacy</a></li>
			</ul>  
        </div>
        
        <div class="col col_16">
        	<h4>Social</h4>
            <ul class="footer_menu">
            	<li><a href="#">Twitter</a></li>
                <li><a href="#">Facebook</a></li>
                <li><a href="#">Youtube</a></li>
                <li><a href="#">LinkedIn</a></li> 
		  </ul>  
        </div>
        <div class="col col_13 no_margin_right">
        	<h4>About Us</h4>
            <p>We provides wide range of facilities to customers for online buying and selling of used products as well as new products among huge range of categories.</p>
        </div>
        
        <div class="cleaner h40"></div>
		<center>
			Copyright © 2013 paNya | Designed & Maintained by Harshit Mrugesh Harsh</a>
		</center>
    </div> <!-- END of footer -->   
   
</div>

</body>
</html>











