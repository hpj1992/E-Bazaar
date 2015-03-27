<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<%
String user_id=(String)session.getAttribute("user_id");
String itemid2=(String)session.getAttribute("itemid");
System.out.println("upp"+itemid2);
String baseprice=(String)session.getAttribute("baseprice");
%>

<style type="text/css">
.numbers {
    padding: 0px;
    width: 45px;
    text-align: center;
    font-family: Arial;             
    font-size: 28px;
    font-weight: bold;    /* options are normal, bold, bolder, lighter */
    font-style: normal;   /* options are normal or italic */
    color: #FFFFFF;       /* change color using the hexadecimal color codes for HTML */
}
.title {    /* the styles below will affect the title under the numbers, i.e., “Days”, “Hours”, etc. */
    border-style: none;
    padding: 0px 0px 3px 0px;
    width: 45px;
    text-align: center;
    font-family: Arial;
    font-size: 10px;
    font-weight: bold;    /* options are normal, bold, bolder, lighter */
    color: #FFFFFF;       /* change color using the hexadecimal color codes for HTML */
}
#table {
    width: 400px;
    height: 70px;
    border-style: ridge;
    border-width: 3px;
    border-color: #666666;       /* change color using the hexadecimal color codes for HTML */
    background-color: #222222;   /* change color using the hexadecimal color codes for HTML */
    margin: 0px auto;
    position: relative;   /* leave as "relative" to keep timer centered on your page, or change to "absolute" then change the values of the "top" and "left" properties to position the timer */
    top: 0px;            /* change to position the timer */
    left: 0px;            /* change to position the timer; delete this property and it's value to keep timer centered on page */
}
</style>

<script language="javascript" type="text/javascript">  
 var xmlHttp  
 var xmlHttp
 function makeBid(str1){
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
var url="BiddingServlet";
url += "?user_id="+'<%=user_id%>'+"&itemid="+'<%=itemid2%>'+"&status=continue&bidvalue="+str1.toString(); //+"&pass2="+"";

xmlHttp.onreadystatechange = stateChange;
xmlHttp.open("POST", url, true);
xmlHttp.send(null);
}
 function stateChange(){
 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
 document.getElementById("bid").innerHTML=xmlHttp.responseText; 
 
 
 }
 }
  
 </script>  
 
<%String year=(String)session.getAttribute("year");
String month=(String)session.getAttribute("month");
String day=(String)session.getAttribute("day");
String hour=(String)session.getAttribute("hour");
String minute=(String)session.getAttribute("minute");
String seconds=(String)session.getAttribute("seconds");
System.out.println(year+month+day+hour+minute+seconds);%>
<script type="text/javascript">

/*
Count down until any date script-
By JavaScript Kit (www.javascriptkit.com)
Over 200+ free scripts here!
Modified by Robert M. Kuhnhenn, D.O. 
on 5/30/2006 to count down to a specific date AND time,
on 10/20/2007 to a new format, and 1/10/2010 to include
time zone offset.
*/

var current="Bidding Duration Closed...!";    //-->enter what you want the script to display when the target date and time are reached, limit to 20 characters
var year='<%=year%>';    //-->Enter the count down target date YEAR
var month='<%=month%>';      //-->Enter the count down target date MONTH
var day='<%=day%>';       //-->Enter the count down target date DAY
var hour='<%=hour%>';      //-->Enter the count down target date HOUR (24 hour clock)
var minute='<%=minute%>';    //-->Enter the count down target date MINUTE
var tz=+5.5;        //-->Offset for your timezone in hours from UTC (see http://wwp.greenwichmeantime.com/index.htm to find the timezone offset for your location)

//    DO NOT CHANGE THE CODE BELOW!
var montharray=new Array("Jan","Feb","Mar","Apr","May","Jun","Jul","Aug","Sep","Oct","Nov","Dec")

function countdown(yr,m,d,hr,min){
    theyear=yr;themonth=m;theday=d;thehour=hr;theminute=min;
    var today=new Date();
    var todayy=today.getYear();
    if (todayy < 1000) {todayy+=1900;}
    var todaym=today.getMonth();
    var todayd=today.getDate();
    var todayh=today.getHours();
    var todaymin=today.getMinutes();
    var todaysec=today.getSeconds();
    var todaystring1=montharray[todaym]+" "+todayd+", "+todayy+" "+todayh+":"+todaymin+":"+todaysec;
    var todaystring=Date.parse(todaystring1)+(tz*1000*60*60);
    var futurestring1=(montharray[m-1]+" "+d+", "+yr+" "+hr+":"+min);
    var futurestring=Date.parse(futurestring1)-(today.getTimezoneOffset()*(1000*60));
    var dd=futurestring-todaystring;
    var dday=Math.floor(dd/(60*60*1000*24)*1);
    var dhour=Math.floor((dd%(60*60*1000*24))/(60*60*1000)*1);
    var dmin=Math.floor(((dd%(60*60*1000*24))%(60*60*1000))/(60*1000)*1);
    var dsec=Math.floor((((dd%(60*60*1000*24))%(60*60*1000))%(60*1000))/1000*1);
    if(dday<=0&&dhour<=0&&dmin<=0&&dsec<=0){
        document.getElementById('count2').innerHTML=current;
        document.getElementById('count2').style.display="block";
        document.getElementById('count2').style.width="390px";
        document.getElementById('dday').style.display="none";
        document.getElementById('dhour').style.display="none";
        document.getElementById('dmin').style.display="none";
        document.getElementById('dsec').style.display="none";
        document.getElementById('days').style.display="none";
        document.getElementById('hours').style.display="none";
        document.getElementById('minutes').style.display="none";
        document.getElementById('seconds').style.display="none";
        document.getElementById('spacer1').style.display="none";
        document.getElementById('spacer2').style.display="none";
        var url="BiddingServlet?status=over";
        //url += "?user_id="+'<%=user_id%>'+"&itemid="+'<%=itemid2%>'+"&bidvalue="+str1.toString(); //+"&pass2="+"";

        xmlHttp.onreadystatechange = stateChange2;
        xmlHttp.open("POST", url, true);
        xmlHttp.send(null);
        return;
        function stateChange2(){
        	 if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete"){   
        	 document.getElementById("bid").innerHTML=xmlHttp.responseText; 
        	 
        	 
        	 }
        	 }
    }
    else {
        document.getElementById('count2').style.display="none";
        document.getElementById('dday').innerHTML=dday;
        document.getElementById('dhour').innerHTML=dhour;
        document.getElementById('dmin').innerHTML=dmin;
        document.getElementById('dsec').innerHTML=dsec;
        setTimeout("countdown(theyear,themonth,theday,thehour,theminute)",1000);
    }
}
</script>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>Web Store Theme - Product Details</title>
<meta name="keywords" content="web store, free templates, website templates, CSS, HTML" />
<meta name="description" content="Web Store Theme is a free CSS template provided by templatemo.com." />
<link href="css/templatemo_style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="css3menu1/style.css" type="text/css" /><style type="text/css">._css3m{display:none}</style>
<link rel="stylesheet" type="text/css" href="css/ddsmoothmenu.css" />



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
<body id="subpage" onload="countdown(year,month,day,hour,minute)">

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
        <%
        String itemid=(String)request.getParameter("itemid");
        String[] desc=(String[])session.getAttribute("desc");
		String[] value=(String[])session.getAttribute("value");
		String imageid=(String)session.getAttribute("imageid");
		session.setAttribute("imageid",imageid);
		session.setAttribute("itemid",itemid);
        System.out.println(desc[0]+desc[1]+desc[2]+desc[3]+desc[4]+imageid+itemid);
        System.out.println("year"+session.getAttribute("year")+"year"+session.getAttribute("month")+"year"+session.getAttribute("day")+session.getAttribute("hour")+session.getAttribute("minute")+session.getAttribute("seconds")); 
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
                <div class="cleaner h20">
                 
              
                </div>
                </div>
                
              <h4><strong>Product Description</strong></h4>
            	<h5><%=value[7] %></h5>
            
			                <table id="table" border="0">
			    <tr>
			        <td align="left" colspan="6"><div class="numbers" id="count2" style="padding: 20px; "></div></td>
			    </tr>
			    <tr id="spacer1">
			        <td align="center" ><div class="title" ></div></td>
			        <td align="center" ><div class="numbers" id="dday"></div></td>
			        <td align="center" ><div class="numbers" id="dhour"></div></td>
			        <td align="center" ><div class="numbers" id="dmin"></div></td>
			        <td align="center" ><div class="numbers" id="dsec"></div></td>
			        <td align="center" ><div class="title" ></div></td>
			    </tr>
			    <tr id="spacer2">
			        <td align="center" ><div class="title" ></div></td>
			        <td align="center" ><div class="title" id="days">Days</div></td>
			        <td align="center" ><div class="title" id="hours">Hours</div></td>
			        <td align="center" ><div class="title" id="minutes">Minutes</div></td>
			        <td align="center" ><div class="title" id="seconds">Seconds</div></td>
			        <td align="center" ><div class="title" ></div></td>
			    </tr>
			</table>
				

				<p>&nbsp;</p>
				
				<h4>Base Price:<%=(String)session.getAttribute("baseprice") %></h4>
				<div id="bid">
				</div>
				<p>&nbsp;</p>
                 Your Bid:<input type="text" name="BidAmount" id="bidvalue"></input>
                  <input type="button" onclick="makeBid(bidvalue.value)" value="Make Bid"></input>
         
                
    
            
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
			Copyright Â© 2013 paNya | Designed & Maintained by Harshit Mrugesh Harsh</a>
		</center>
    </div> <!-- END of footer -->   
   
</div>

</body>
</html>