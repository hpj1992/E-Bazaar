<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title></title>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">



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
    	<div id="site_title"><h1><a href="#">Panya</a></h1></div>
        
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
        	
           
 <h1>Auction .. !</h1>
        <p><h2>Welcome to Auction House of paNya.com</h2><br />
          <br /><h3>You will find various products for auction IF any user has posted any product under Auction category.</h3>
         <br /><b>Please read following rules carefully before proceeding.</b>
          <br />
        </p>
		<ul>
		<li>Product will be displayed only if it's Auction is going on currently.</li><br />
		<li>Each product will remian available to bid for specific time duration given by it's owner.</li><br />
		<li>Any authorised user registerd with paNya and paNyaPal is allowed to bid.</li><br />
		<li>Last bid received before time up is final amout of that item.</li><br />
		<li>Once person bid and that bid got final then User will have to buy that item.Please review our legal terms and conditions.</li>
		</ul>
        <h3>&nbsp;</h3>
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