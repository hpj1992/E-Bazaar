<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ page import="package1.FetchData" %>
   <%@page import="java.util.ArrayList"%>

    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web Store - Products</title>
<meta name="keywords" content="web store, products, free templates, website templates, CSS, HTML" />
<meta name="description" content="Web Store, Products, free CSS template by templatemo.com" />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
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

function clearText(field)
{
    if (field.defaultValue == field.value) field.value = '';
    else if (field.value == '') field.value = field.defaultValue;
}
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
                                <img src="images/gallery/02.jpg" alt="product 1" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/3" target="_parent">
                                 <img src="images/gallery/03.jpg" alt="product 1" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/4" target="_parent">
                                <img src="images/gallery/04.jpg" alt="product 1" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/5" target="_parent">
                               <img src="images/gallery/05.jpg" alt="product 1" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/6" target="_parent">
                                <img src="images/gallery/06.jpg" alt="product 1" /></a>
                        </div>
                        <div class="SlideItMoo_element">
                                <a href="http://www.templatemo.com/page/6" target="_parent">
                                <img src="images/gallery/07.jpg" alt="product 1" /></a>
                        </div>
                    </div>			
                </div>
            </div>
            <div class="cleaner"></div>
        </div>
        
        	
   
    
        <div id="sidebar">
        	<h3>Categories</h3>
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
		<li><a href="PaginationServlet?cat=Footwear_boy"><span>Boy 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sandals & Flipflops</a></li>
			<li><a href="#">Slippers</a></li>
			<li><a href="#">Sport Shoes</a></li>
			</ul></li>
		<li><a href="PaginationServlet?cat=Footwear_girl"><span>Girl 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sandals & Flipflops</a></li>
			<li><a href="#">Slippers</a></li>
			<li><a href="#">Trainers & Shoes</a></li>
		</ul></li>
		<li><a href="PaginationServlet?cat=Footwear_men"><span>Men 's</span></a>
		<ul style="width:150px">
			<li><a href="#">Sports Shoes</a></li>
			<li><a href="#">Formal Shoes</a></li>
			<li><a href="#">Sandals & Flotters</a></li>
			<li><a href="#">Slippers & Flipflops</a></li>
			<li><a href="#">Casual Shoes</a></li>
		</ul></li>
		<li><a href="PaginationServlet?cat=Footwear_women"><span>Women 's</span></a>
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
        	   /* FetchData f=new FetchData(); 
        	   
        		int[] data=f.getItemList(request.getParameter("value"));
        		int i=0;
        		System.out.println(data[0]+String.valueOf(data[i]));*/
        	%>
        	 <%
    	ArrayList<String> subcat = new ArrayList<String>();
    ArrayList<Integer> subcatids = new ArrayList<Integer>();
    ArrayList<Integer> itemids = new ArrayList<Integer>();
    ArrayList<ArrayList<Integer>> data=(ArrayList<ArrayList<Integer>>)session.getAttribute("data");
    	String pages;

    	
    	pages = (String)session.getAttribute("pages");
    	subcat =(ArrayList) session.getAttribute("subcat"); // name of sub cat
    	subcatids =(ArrayList) session.getAttribute("subcatids"); // ids of sub cat
    	//itemids=(ArrayList)session.getAttribute("itemids");
    	System.out.println(subcat);
    	System.out.println(subcatids);
    	System.out.println(data);
    	int[] temp=(int[])session.getAttribute("temp");
    	//pages = (String)session.getAttribute("pages");
    	System.out.println("hi");
    	System.out.println(temp[0]);
    	System.out.println(temp[1]);
    	System.out.println(temp[2]);
    %>
    
        <div id="content">
        	<%String maincatid=(String)session.getAttribute("maincatid"); %>
        	<% System.out.println(subcat.get(0)+"_"+subcat.get(0));
        		//System.out.println("Concatimages/products/"+maincatid+data.get(temp[0]).get(0)+data.get(temp[0]).get(1)+"_1.jpg");
        		//System.out.println("images/products/"+maincatid+data.get(temp[0]).get(0)+data.get(temp[0]).get(2)+"_1.jpg");
        		//System.out.println("images/products/"+maincatid+data.get(temp[0]).get(0)+data.get(temp[0]).get(3)+"_1.jpg");
        		String str1="col col_14 product_gallery",str2="col col_14 product_gallery no_margin_right";
        		int h=0;
        		int p=1;
        		String keyword=(String)session.getAttribute("keyword");
        		if(keyword==null)
        		{
        		keyword="";
        		}
        		else
        		{
        			keyword="Search results for ''"+keyword+"''";
        		}
        		String str;%>
        			<h1><%=keyword %></h1>
        		<%
        		for(h=0;h<3;h++)
        		{
        			if(h==2 && temp[h]==0) // if sub category is not present 
        				break;
        			
        			
        			
        	%>
        
        	<h2><%=subcat.get(temp[h])%></h2>
        	
        	<% for(p=1;p<3;p++)
        	{	if(p==3)
        		str=str2;
        	else
        		str=str1;
        	if( p==data.get(temp[h]).size()) // if sub category is present and in case two items are not posted then this condotion will handle
        	{
        	break;
        	}
        	System.out.println(str+" h "+h+" p "+p+" "+maincatid+data.get(temp[h]).get(0)+(data.get(temp[h])).get(p)+"_1.jpg");
        	
        	%>
        	<div class=<%=str %>>
            	<a href="productdetail.jsp"  ><img src="images/products/<%=maincatid+data.get(temp[h]).get(0)+(data.get(temp[h])).get(p)%>_1.jpg" alt="Product 01" style="hspace:50px"/></a>
                <h3>product data</h3>
                
                <a href="shoppingcart.jsp" class="add_to_cart">Add to Cart</a>
            </div>  
            <% }//end of inner for loop      	%>
        	<a href="PaginationServlet2?subcatloc=<%=h %>" class="more float_r">View all</a>
			<div class="cleaner h50"></div>
			<%}//end of outer for loop %>
        
        </div> 
        
        
        <div class="cleaner"></div>
        
        <%
    int j = 1;
	out.println("<p>Total pages found:</p>");
	out.println("<p></p>");
	//String subcatloc=session.getAttribute("subcatloc").toString();
	//System.out.println("sub cat loc"+subcatloc);
	while(j<Integer.parseInt(pages)+1){
		
		//out.println("<font size=8><a href=PaginationServlet2?id="+j+"&cat="+maincat+"&subcat="+subcat2+">"+j+"</a></font>");
		
			out.println("<font size=8><a href=PaginationServlet?id="+j+"&flag=1000&catid="+maincatid+">"+j+"</a></font>");
		
		

		j++;
	} 
	//session.removeAttribute("keyword");
	%>
	
	
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