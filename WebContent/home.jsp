<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<link rel="shortcut icon" href="images/favicon.ico"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Welcome to paNya.com</title>

 <script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="scripts/slideitmoo-1.1.js"></script>

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

<style>
#overlay_form{
	position: absolute;
	border: 5px solid gray;
	padding: 10px;
	background: white;
	width: 400px;
	height: 250px;
}
#pop{
	display: block;
	
	width: 65px;
	text-align: center;
	padding: 4px;
	border-radius: 10px;
	text-decoration:inherit;
	margin: 0 auto;
}
</style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" type="text/css" href="css/styles.css" />

	<script type="text/javascript">
ddsmoothmenu.init({
	mainmenuid: "templatemo_menu", //menu DIV id
	orientation: 'h', //Horizontal or vertical menu: Set to "h" or "v"
	classname: 'ddsmoothmenu', //class added to menu's outer DIV
	//customtheme: ["#1c5a80", "#18374a"],
	contentsource: "markup" //"markup" or ["container_id", "path_to_menu_file"]
})

</script>
 
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
session.setAttribute("username",username);
%>

<body id="home">

<div id="templatemo_wrapper">

	<div id="templatemo_header">
    	<div id="site_title"><h1><a>Buy Sell Bid</a></h1></div>
    	
        <div id="header_right">
            <ul id="language">
              <li><a><img src="images/india.png" alt="Indian" /></a></li>
             <div id="intro">
             
            <li> <p>welcome, <%=username %></p></li></div>
              
            </ul>
            <div class="cleaner"></div>
            <div id="templatemo_search">
                <form action="Search" method="post">
                  <input type="text" value="Search" name="keyword" id="keyword" title="keyword" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="Search" value="" alt="Search" id="searchbutton" title="Search" class="sub_btn"  />
                </form>
                
            </div>
         </div> <!-- END -->
    </div> <!-- END of header -->
    
    <div id="templatemo_menu" class="ddsmoothmenu">
        <ul>
            <li><a href="home.jsp" class="selected">Home</a></li>
           
            <li><a href="about.jsp">About</a>
          
            </li>
            <li><a href="faqs.jsp">FAQs</a></li>
          
            <li><a href="contact.jsp">Contact</a></li>
              <li id="login">
           		<a href="#" id="pop"  style="font-family:verdana;font-size:120%">LogIn</a></li>
						 <form id="overlay_form" style="display:none">
				<h2> Log In here:</h2>
				<label  style="font-size:120%">E-Mail: </label><input type="text" name="username" size="30px" id="email"/><br /><br />
				<label style="font-size:120%">Password: </label><input type="password" name="password" size="30px" id="password"/><br /><br />
				<div id="message">
				</div>
				<input id="signin" type="button" value="SignIn" style="font-size:120%" onclick="isValid(email.value,password.value)"/>
				<a href="#" id="close" style="font-size:120%" >Close</a>
			</form>
              <li><a href="Register.jsp" style="font-family:verdana;font-size:120%" >Register</a></li>
              <li><a href="PostItem.jsp" style="font-family:verdana;font-size:120%;">Post an Free Ad</a></li>
              <li><a href="#">My Account</a>
                <ul>
                    <li><a href="#">Items Posted by me</a></li>
                    <li><a href="https://172.24.6.251:8443/FinalProject/Paypal21.jsp">My paNyaPal Account</a></li>
                    <li><a href="#">Log Out</a></li>
              </ul>
            </li>
           		
        </ul>
        <br style="clear: left" />
    </div> <!-- end of templatemo_menu -->
 
    <div id="templatemo_middle">
    	<img src="images/templatemo_image_01.png" alt="Image 01" />
    	<h1>paNya</h1>
        <p><a href="http://www.templatemo.com" target="_parent">paNya</a> provides wide range of facilities to customers for online buying and selling of used products as well as new products among huge range of categories.</p> 
        <a href="Auction.jsp" class="buy_now">Enter Auction House</a>
    </div> <!-- END of middle -->
    
    <div id="templatemo_main_top"></div>
    <div id="templatemo_main">
    	<div id="product_slider">
    		<div id="SlideItMoo_outer">	
                <div id="SlideItMoo_inner">			
                    <div id="SlideItMoo_items">
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                <img src="images/gallery/01.jpg" alt="product 1" /></a>
                        </div>	
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                <img src="images/gallery/02.jpg" alt="product 2" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                 <img src="images/gallery/03.jpg" alt="product 3" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                <img src="images/gallery/04.jpg" alt="product 4" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                               <img src="images/gallery/05.jpg" alt="product 5" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                <img src="images/gallery/06.jpg" alt="product 6" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href=# target="_parent">
                                <img src="images/gallery/07.jpg" alt="product 7" /></a>
                        </div>
                    </div>			
                </div>
            </div>
            <div class="cleaner"></div>
        </div>
        
        <div id="sidebar"  >
        	<h3>Categories</h3>
        	<form>
        <!--     <ul class="sidebar_menu">
			    <li><a href="products.jsp?value=Electronics">Electronics</a></li>
                <li><a href="products.jsp?value=HomeApp">Home Appliances </a></li>				
                <li><a href="products.jsp?value=Clothes">Clothes</a></li>
                <li><a href="products.jsp?value=Electronics">Furniture</a></li >				
            	<li><a href="products.jsp?value=Electronics">Etiam in tellus</a></li>
                <li><a href="products.jsp?value=Electronics">Hendrerit justo</a></li>     
                <li><a href="products.jsp?value=Electronics">Integer interdum</a></li>				
                <li><a href="products.jsp?value=Electronics">Maecenas a diam</a></li>
				<li><a href="products.jsp?value=Electronics">Nullam in semper</a></li>
				<li><a href="products.jsp?value=Electronics">Posuere in commodo</a></li>
				<li><a href="products.jsp?value=Electronics">Tincidunt leo</a></li>
                <li><a href="products.jsp?value=Electronics">Vestibulum blandit</a></li>
                
                 <%//session.setAttribute("sess_cat",name); %>
			</ul>  -->
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
			
			<!-- <p class="_css3m"><a href="http://css3menu.com/">CSS Vertical Dropdown Menus Css3Menu.com</a></p>  -->
			</form>
			
            <!-- <h3>Stay updated .. !!</h3> -->
            <p></p>
            <div id="newsletter">
                <form action="#" method="get">
                  <input type="text" value="Subscribe" name="email_newsletter" id="email_newsletter" title="email_newsletter" onfocus="clearText(this)" onblur="clearText(this)" class="txt_field" />
                  <input type="submit" name="subscribe" value="Subscribe" alt="Subscribe" id="subscribebtn" title="Subscribe" class="subscribebtn"  />
                </form>
                <div class="cleaner"></div>
            </div>
        </div> <!-- END of sidebar -->
        
        <div id="content">
        	<div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/01.jpg" alt="Product 01" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 100</p>
                
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/02.jpg" alt="Product 02" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 200</p>
                
            </div>        	
            <div class="col col_14 product_gallery no_margin_right">
            	<a href="productdetail.jsp"><img src="images/product/03.jpg" alt="Product 03" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 120</p>
                
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/04.jpg" alt="Product 04" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 260</p>
               
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/05.jpg" alt="Product 05" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 80</p>
               
            </div>        	
            <div class="col col_14 product_gallery no_margin_right">
            	<a href="productdetail.jsp"><img src="images/product/06.jpg" alt="Product 06" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 193</p>
                
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/07.jpg" alt="Product 07" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 30</p>
              
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/08.jpg" alt="Product 08" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 220</p>
               
            </div>        	
            <div class="col col_14 product_gallery no_margin_right">
            	<a href="productdetail.jsp"><img src="images/product/09.jpg" alt="Product 09" /></a>
                <h3>abcdefghi</h3>
                <p class="product_price"> 65</p>
               
            </div>        	
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