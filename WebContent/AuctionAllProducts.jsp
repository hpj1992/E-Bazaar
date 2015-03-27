<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@page import="java.util.ArrayList"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>paNya</title>
<style>
nav {
  display:block;
}
</style>
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

<script>
$(document).ready(function(){
  
    $("#temp").empty();
  
});
</script>
<script>
document.createElement('nav');
</script>


<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js">


/***********************************************
* Smooth Navigational Menu- (c) Dynamic Drive DHTML code library (www.dynamicdrive.com)
* This notice MUST stay intact for legal use
* Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
***********************************************/

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

<link rel="stylesheet" type="text/css" href="css/styles.css" />
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2.1-core.js"></script>
<script language="javascript" type="text/javascript" src="scripts/mootools-1.2-more.js"></script>
<script language="javascript" type="text/javascript" src="scripts/slideitmoo-1.1.js"></script>
<script language="javascript" type="text/javascript">
	window.addEvents({
		'domready': function(){
			/* thumbnails example , div containers */
			new SlideItMoo({
						overallContainer: 'SlideItMoo_outer',
						elementScrolled: 'SlideItMoo_inner',
						thumbsContainer: 'SlideItMoo_items',		
						itemsVisible: 5,
						elemsSlide: 2,
						duration: 200,
						itemsSelector: '.SlideItMoo_element',
						itemWidth: 171,
						showControls:1});
		},
		
	});

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
<body id="home">

<div id="templatemo_wrapper">
	<div id="templatemo_header">
    	<div id="site_title"><h1><a href="">panya</a></h1></div>
        
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
            <li><a href="home.jsp" class="selected">Home</a></li>
           
            <li><a href="about.jsp">About</a>
                
            </li>
            <li><a href="faqs.jsp">FAQs</a></li>
            <li><a href="checkout.jsp">Checkout</a></li>
            <li><a href="contact.jsp">Contact</a></li>
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
                                <a href="http://www.templatemo.com/page/1" target="_parent">
                                <img src="images/gallery/01.jpg" alt="product 1" /></a>
                        </div>	
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/2" target="_parent">
                                <img src="images/gallery/02.jpg" alt="product 2" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/3" target="_parent">
                                 <img src="images/gallery/03.jpg" alt="product 3" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/4" target="_parent">
                                <img src="images/gallery/04.jpg" alt="product 4" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/5" target="_parent">
                               <img src="images/gallery/05.jpg" alt="product 5" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/6" target="_parent">
                                <img src="images/gallery/06.jpg" alt="product 6" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/6" target="_parent">
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
			
		</nav>
			
			<!-- <p class="_css3m"><a href="http://css3menu.com/">CSS Vertical Dropdown Menus Css3Menu.com</a></p>  -->
			</form>
			
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
        
        
    <%
    	ArrayList<Integer> items=(ArrayList<Integer>)session.getAttribute("items");
    	//ArrayList<String> aL ;
    	String pages;
    	
    	//aL =(ArrayList<String>)session.getAttribute("data");
    	pages = (String)session.getAttribute("pages");
    	ArrayList<Integer> itemids=(ArrayList<Integer>)session.getAttribute("itemids");
    	//String maincat=(String)request.getParameter("cat");
    	//System.out.println(itemids[0]+itemids[1]+itemids[2]);
    	//String subcat2=(String)request.getParameter("subcat");
    	//System.out.println(maincat+subcat2);
    	
    	
    	//String subcat=subcat2.substring(0,3);
    	//System.out.println(maincat+subcat);
    	int i=0;
    	String keyword=(String)session.getAttribute("keyword");
		if(keyword==null)
		{
		keyword="";
		}
		else
		{
			keyword="Search results for ''"+keyword+"''";
		}
    	
    %>
        <div id="content">
        <h1><%=keyword %></h1>
        	<%int h=0;
        	for(h=0;h<4;h++)
        	{
        		if(items.size()==h)
        		{
        			System.out.println("ItemD");
        			break;
        		}
        		System.out.println("ItemDescriptionServlet?itemid="+itemids.get(h)+"&imageid="+items.get(h));
        	%>
        	<div class="col col_14 product_gallery">
            	<a href="AuctionItemServlet?itemid=<%=itemids.get(h) %>&imageid=<%=items.get(h)%>"><img src="images/products/<%=items.get(h) %>_1.jpg" alt="Product 01" /></a>
               
                
                 <a href="AuctionItemServlet?itemid=<%=itemids.get(h) %>&imageid=<%=items.get(h)%>" class="bid_now">Bid Now</a>
                  
                <!-- <a href="shoppingcart.jsp" class="add_to_cart">Add to Cart</a> -->
            </div>
            <%} %>
        	
    
        </div> <!-- END of content -->
         <%
        
     int j = 1;
	out.println("<p>Total pages found:</p>");
	out.println("<p></p>");
	String subcatloc=session.getAttribute("subcatloc").toString();
	//System.out.println("sub cat loc"+subcatloc);
	while(j<Integer.parseInt(pages)+1){
		
		//out.println("<font size=8><a href=PaginationServlet2?id="+j+"&cat="+maincat+"&subcat="+subcat2+">"+j+"</a></font>");
		out.println("<font size=8><a href=AuctionPaginationServlet2?id="+j+"&subcatloc="+subcatloc+">"+j+"</a></font>");
		
		j++;
	} %>
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