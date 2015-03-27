

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class AuctionItemServlet
 */
public class AuctionItemServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con2 = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt2=null;
		 ResultSet rs=null;
		 try {
			 stmt2 = con2.createStatement();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 String basePrice = null;
		 Date duration = null;
		 String enddate=null;
		 String itemid=(String)request.getParameter("itemid");
		 String q="select * from ITEM_DETAILS where item_id="+itemid+" and NAME_DESC='End Time';";
		 try {
			rs=stmt2.executeQuery(q);
			if(rs.next())
			{
				//basePrice=(String)rs.getObject("bprice");
				enddate=(String)rs.getObject("DESCRIPTION");
				}
		 }
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		  q="select * from ITEM_DETAILS where item_id="+itemid+" and NAME_DESC='Price';";
		 try {
			rs=stmt2.executeQuery(q);
			if(rs.next())
			{
				basePrice=(String)rs.getObject("DESCRIPTION");
				//duration=(Date)	rs.getObject("description");
				}
		 }
		 catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			//System.out.println(basePrice+duration);
			Date d=new Date();
			//System.out.println(duration.getDay()-d.getDay()+duration.getHours()-d.getHours());
			HttpSession session=request.getSession();
			System.out.println("price");
			System.out.println("date"+enddate+basePrice);
			session.setAttribute("year",enddate.toString().substring(0, 4));
			session.setAttribute("month", enddate.toString().substring(5, 7));
			session.setAttribute("day", enddate.toString().substring(8, 10));
			session.setAttribute("hour", enddate.toString().substring(11, 13));
			session.setAttribute("minute", enddate.toString().substring(14, 16));
			session.setAttribute("seconds",enddate.toString().substring(17, 18));
			//TimeDiff td=new TimeDiff(d,duration);
			//long[] values=(long[])td.getValues();
			//System.out.println("time duration"+values[0]+values[1]+values[2]+values[3]);
		
		
		String s="select * from item_details where item_id="+itemid+";";
		//HttpSession session = request.getSession();
			
				try{
					Class.forName("com.mysql.jdbc.Driver").newInstance();
					System.out.print("load2");			
					int i=0;
					String[] desc=new String[9];
					String[] value=new String[9];
					rs=stmt2.executeQuery(s);
					while(rs.next())
					{
						desc[i]=rs.getString("name_desc");
						value[i]=rs.getString("description");
						i++;
					}
					System.out.println(desc[0]+desc[1]+desc[2]+desc[3]+desc[4]+desc[5]);
					System.out.println(value[0]+value[1]+value[2]+value[3]+value[4]+value[5]);
					session.setAttribute("desc",desc);
					session.setAttribute("value",value);
					session.setAttribute("imageid", request.getParameter("imageid"));
					// Base price in field Price-desc[1]-value[1]
					session.setAttribute("baseprice", basePrice);
					//RequestDispatcher rd = request.getRequestDispatcher("productdetail.jsp");
					RequestDispatcher rd = request.getRequestDispatcher("AuctionProductDetails.jsp");
					
					try {
						rd.forward(request, response);
						
						
					} catch (ServletException e) {
					e.printStackTrace();
					}
				}
				catch(Exception e)
				{
					
					System.out.println(e.toString());
					
				}
		
		
	}

}
