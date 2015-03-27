<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web Store Theme - Product Details</title>
<meta name="keywords" content="web store, free templates, website templates, CSS, HTML" />
<meta name="description" content="Web Store Theme is a free CSS template provided by templatemo.com." />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />

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

<script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
 function proceed(){
	 document.getElementById("message").innerHTML="hi ...here";
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


var url="Register";
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
 
 
  
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

<link rel="stylesheet" href="css/lightbox.css" type="text/css" media="screen" />
		
<script src="js/prototype.js" type="text/javascript"></script>
<script src="js/scriptaculous.js?load=effects,builder" type="text/javascript"></script>
<script src="js/lightbox.js" type="text/javascript"></script>
	
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/ddsmoothmenu.js"></script>

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
            
            <li><a href="about.jsp">About</a>
                
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
	<li class="topfirst"><a href="PaginationServlet?cat=Technology" style="width:130px;"><span>Technology</span></a>
	<ul>
		<li><a href="PaginationServlet2?subcat=Television&cat=Technology">Television</a></li>
		<li><a href="PaginationServlet2?subcat=Set Top Box&cat=Technology">Set Top Box &amp; Satellite</a></li>
		<li><a href="PaginationServlet2?subcat=Dvd&cat=Technology">DVD Player,BlueRay Player,Home Cinema,Personal Audio</a></li>
		<li><a href="PaginationServlet2?subcat=Video&cat=Technology">Video Games &amp; Consoles</a></li>
		<li><a href="PaginationServlet2?subcat=Ipad&cat=Technology">iPad, Tablets &amp; E-Readers</a></li>
		<li><a href="PaginationServlet2?subcat=Laptop&cat=Technology">Laptops &amp; PCs</a></li>
		<li><a href="PaginationServlet2?subcat=Mobile&cat=Technology">Mobile Phones &amp; Accessories</a></li>
		<li><a href="PaginationServlet2?subcat=Home&cat=Technology">Home Office</a></li>
		<li><a href="PaginationServlet2?subcat=Cameras&cat=Technology">Cameras &amp; Camcoders</a></li>
		<li><a href="PaginationServlet2?subcat=Batteries&cat=Technology">Batteries &amp; Chargers</a></li>
		<li><a href="PaginationServlet2?subcat=Cds&cat=Technology">CD,DVDs &amp; BlueRays</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:130px;"><span>Home</span></a>
	<ul>
		<li style="width:130px"><a href="PaginationServlet?cat=Home_furniture"><span>Furniture</span></a>
		<ul style="width:135px">
			<li><a href="#">Sofa</a></li>
			<li><a href="#">Arm-Chair</a></li>
			<li><a href="#">Chairs</a></li>
			<li><a href="#">Show-Case</a></li>
			<li><a href="#">Dining Table &amp; Chairs</a></li>
			<li><a href="#">Cupboard</a></li>
			<li><a href="#">Beds</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Home_decor"><span>Decor</span></a>
		<ul style="width:150px">
			<li><a href="#">Clocks</a></li>
			<li><a href="#">Rugs &amp; Mates</a></li>
			<li><a href="#">Wall Arts &amp; PhotoFrames</a></li>
			<li><a href="#">Candles</a></li>
			<li><a href="#">Vases</a></li>
			<li><a href="#">Stands</a></li>
			<li><a href="#">Show-Piece</a></li>
			<li><a href="#">Cushiouns</a></li>
			<li><a href="#">Drapes</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Home_appliances"><span>Appliances</span></a>
		<ul>
			<li><a href="#">Washing Machines</a></li>
			<li><a href="#">Dish Washer</a></li>
			<li><a href="#">Refrigerator</a></li>
			<li><a href="#">Oven &amp; Microwaves</a></li>
			<li><a href="#">Coffee Maker</a></li>
			<li><a href="#">Toaster &amp; Tea-Kitley</a></li>
			<li><a href="#">Mixer,Juicer &amp; Grinder</a></li>
			<li><a href="#">Cook Ware</a></li>
			<li><a href="#">Irons</a></li>
			<li><a href="#">Vaccume Cleaners</a></li>
			<li><a href="#">Coolers &amp; Air-Conditioners</a></li>
			<li><a href="#">Fans</a></li>
			<li><a href="#">Taps &amp; Mixtures</a></li>
		</ul></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:130px;"><span>Clothing</span></a>
	<ul>
		<li style="width:130px"><a href="PaginationServlet?cat=Clothing_boy"><span>Boy 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Tops &amp; Tees</a></li>
			<li><a href="#">Shirts</a></li>
			<li><a href="#">Jeans &amp; Trousers</a></li>
			<li><a href="#">Night Wear</a></li>
			<li><a href="#">Inner Wear</a></li>
			<li><a href="#">Coat &amp; Jackets</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Clothing_girl"><span>Girl 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Tops &amp; Tees</a></li>
			<li><a href="#">Dresses</a></li>
			<li><a href="#">Skirts</a></li>
			<li><a href="#">Leggings</a></li>
			<li><a href="#">Night Wear</a></li>
			<li><a href="#">Jeans</a></li>
			<li><a href="#">Inner Wear</a></li>
			<li><a href="#">Coat &amp; Jackets</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Clothing_men"><span>Men 's</span></a>
		<ul style="width:150px">
			<li><a href="#">T Shirt</a></li>
			<li><a href="#">Casual &amp; Party Wear</a></li>
			<li><a href="#">Jeans &amp; Trousers</a></li>
			<li><a href="#">Cargos &amp; 3/4ths</a></li>
			<li><a href="#">Ethenic Wear</a></li>
			<li><a href="#">Night Wear</a></li>
			<li><a href="#">Inner Wear</a></li>
			<li><a href="#">Coat &amp; Jackets</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Clothing_women"><span>Women 's</span></a>
		<ul style="width:150px">
		
			<li><a href="#">Jeans &amp; Shorts</a></li>
			<li><a href="#">Leggings &amp; Jeggings</a></li>
			<li><a href="#">Trousers &amp; Capries</a></li>
			<li><a href="#">Dresses &amp; Skirts</a></li>
			<li><a href="#">T-Shirts</a></li>
			<li><a href="#">Business Wear</a></li>
			<li><a href="#">Sarees & Kurties</a></li>
			<li><a href="#">Night Wear</a></li>
			<li><a href="#">Inner Wear</a></li>
			<li><a href="#">Winter Wear &amp; Jackets</a></li>
		</ul></li>
	</ul></li>
	<li class="topmenu"><a href="PaginationServlet?cat=Books" style="width:130px;"><span>Books</span></a>
	<ul style="width:150px">
		<li><a href="#">E-Books</a></li>
		<li><a href="#">Fiction</a></li>
		<li><a href="#">Non-Fiction</a></li>
		<li><a href="#">Literature</a></li>
		<li><a href="#">Graphic Novel &amp; Comics</a></li>
		<li><a href="#">Children Books</a></li>
		<li><a href="#">Mystery &amp; Thriller</a></li>
		<li><a href="#">Crime</a></li>
		<li><a href="#">Engineering Books</a></li>
		<li><a href="#">Competitive Exam </a></li>
	</ul></li>
	<li class="topmenu"><a href="PaginationServlet?cat=Sports_&_leisure" style="width:130px;"><span>Sports &amp; Leisure</span></a>
	<ul>
		<li><a href="#">Sports</a></li>
		<li><a href="#">Fitnes Equipments</a></li>
		<li><a href="#">Bags Luggage &amp; Travel</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:130px;"><span>Footwear</span></a>
	<ul style="width:130px">
		<li><a href="#"><a href="PaginationServlet?cat=Footwear_boy"><span>Boy 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sandals & Flipflops</a></li>
			<li><a href="#">Slippers</a></li>
			<li><a href="#">Sport Shoes</a></li>
			</ul></li>
		<li><a href="#"><a href="PaginationServlet?cat=Footwear_girl"><span>Girl 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sandals & Flipflops</a></li>
			<li><a href="#">Slippers</a></li>
			<li><a href="#">Trainers & Shoes</a></li>
		</ul></li>
		<li><a href="#"><a href="PaginationServlet?cat=Footwear_men"><span>Men 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sports Shoes</a></li>
			<li><a href="#">Formal Shoes</a></li>
			<li><a href="#">Sandals & Flotters</a></li>
			<li><a href="#">Slippers & Flipflops</a></li>
			<li><a href="#">Casual Shoes</a></li>
		</ul></li>
		<li><a href="#"><a href="PaginationServlet?cat=Footwear_women"><span>Women 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Flats & Flipflops</a></li>
			<li><a href="#">Heels & Pumps</a></li>
			<li><a href="#">Sandals</a></li>
			<li><a href="#">Slippers & Flipflops</a></li>
			<li><a href="#">Casual Shoes</a></li>
			<li><a href="#">Formal Shoes</a></li>
			<li><a href="#">Sports Shoes</a></li>
		</ul></li>
	</ul></li>
	<li class="topmenu"><a href="PaginationServlet?cat=Toys" style="width:130px;"><span>Toys</span></a>
	<ul>
		<li><a href="#">Animal Play Set</a></li>
		<li><a href="#">Baby Bath</a></li>
		<li><a href="#">Creative Science Toys</a></li>
		<li><a href="#">Games &amp; Puzzles</a></li>
		<li><a href="#">Dolls &amp; Play Set</a></li>
		<li><a href="#">Electronic Toys</a></li>
		<li><a href="#">Outdoor toys</a></li>
		<li><a href="#">Others</a></li>
	</ul></li>
	<li class="topmenu"><a href="#" style="width:130px;"><span>Accessories</span></a>
	<ul>
		<li style="width:130px"><a href="PaginationServlet?cat=Accessories_men"><span>Men 's</span></a>
		<ul style="width:130px">
			<li><a href="#">Watches</a></li>
			<li><a href="#">Tie</a></li>
			<li><a href="#">Belts</a></li>
			<li><a href="#">Hats &amp; Caps</a></li>
			<li><a href="#">Wallets</a></li>
			<li><a href="#">Cufflinks</a></li>
			<li><a href="#">Sunglasses</a></li>
		</ul></li>
		<li style="width:130px"><a href="PaginationServlet?cat=Accessories_women"><span>Women 's</span></a>
		<ul style="width:130px">
			<li><a href="#">Watches</a></li>
			<li><a href="#">Sunglasses</a></li>
			<li><a href="#">Purses</a></li>
			<li><a href="#">Belts</a></li>
			<li><a href="#">Ties</a></li>
			<li><a href="#">Hats &amp; Caps</a></li>
		</ul></li>
	</ul></li>
	<li class="toplast"><a href="PaginationServlet?cat=Miscellaneous" style="width:130px;"><span>Miscellaneous</span></a></li>
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
        <%
        String itemid=(String)request.getParameter("itemid");
        String[] desc=(String[])session.getAttribute("desc");
		String[] value=(String[])session.getAttribute("value");
		String imageid=(String)session.getAttribute("imageid");
		session.setAttribute("imageid",imageid);
		session.setAttribute("itemid",itemid);
        System.out.println(desc[0]+desc[1]+desc[2]+desc[3]+desc[4]+imageid);
        %>
        <div id="content">
        	<h2>Product Details</h2>
            <div class="col col_13">
        	<a  rel="lightbox[portfolio]" href="images/products/<%=imageid %>_2.jpg" title="Lady Shoes"><img src="images/products/<%=imageid %>_1.jpg" alt="Image 10" /></a>
            </div>
            <div class="col col_13 no_margin_right">
                <table>
                	
                    <tr>
                        <td height="30" width="160"><%=desc[0] %></td>
                        <td><%=value[0] %></td>
                    </tr>
                    <tr>
                        <td height="30"><%=desc[1] %></td>
                        <td><%=value[1] %></td>
                    </tr>
                    <tr>
                        <td height="30"><%=desc[2] %></td>
                        <td><%=value[2] %></td>
                    </tr>
                    <tr>
                        <td height="30"><%=desc[3] %></td>
                        <td><%=value[3] %></td>
                    </tr>
                    <tr><td height="30"><%=desc[4] %></td>
                    <td><%=value[4] %></td></tr>
                     <tr>
                        <td height="30" width="160"><%=desc[5] %></td>
                        <td><%=value[5] %></td>
                    </tr>
                     <tr>
                        <td height="30" width="160"><%=desc[6] %></td>
                        <td><%=value[6] %></td>
                    </tr>
                </table>
                <div class="cleaner h20"></div>
              
                 <a href="BuyItNowServlet" class="buy_it_now">Buy It Now</a>
                  <br></br><a href="TrollyServlet?flag=0"  class="add_to_cart">Add to Cart</a>
               <!--   <a href="TrollyServlet?flag=0" id="pop" class="add_to_cart">Add to Cart</a>-->
                 
                <form id="overlay_form" style="display:none" action="Register.jsp">
				<h3> You need to have account on paNya.com.</h3>
				<h3> . Sign Up and enjoy the shopping.</h3>
				<input id="proceed" type="submit" value="Proceed to Registration" style="font-size:120%" onclick="proceed()" />
				<input id="close" type="button" value="No Thanks." style="font-size:120%" />
				
			</form>
                </div>
            <div class="cleaner h30"></div>
            
            <h5><strong>Product Description</strong></h5>
            <p><%=(String)value[7] %></p>	
            
            <div class="cleaner h50"></div>
            
            <h4>Other Products</h4>
        	<div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/01.jpg" alt="Product 01" /></a>
                <h3>ab cd ef gh</h3>
                <p class="product_price">$ 100</p>
                <a href="shoppingcart.jsp" class="add_to_cart">Add to Cart</a>
            </div>        	
            <div class="col col_14 product_gallery">
            	<a href="productdetail.jsp"><img src="images/product/02.jpg" alt="Product 02" /></a>
                <h3>ab cd ef gh</h3>
                <p class="product_price">$ 200</p>
               
                <a href="shoppingcart.jsp" class="buy_it_now">Buy It Now</a></br>
                 </br><a href="shoppingcart.jsp" class="add_to_cart">Add to Cart</a>
            </div>        	
            <div class="col col_14 product_gallery no_margin_right">
            	<a href="productdetail.jsp"><img src="images/product/03.jpg" alt="Product 03" /></a>
                <h3>ab cd ef gh</h3>
                <p class="product_price">$ 120</p>
                <a href="shoppingcart.jsp" class="add_to_cart">Add to Cart</a>
            </div>
            <a href="#" class="more float_r">View all</a>
            
            <div class="cleaner"></div>
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