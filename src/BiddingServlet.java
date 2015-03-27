

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
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
 * Servlet implementation class BiddingServlet
 */
public class BiddingServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session=request.getSession();
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		 try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		System.out.println("in bidding");
		if(request.getParameter("status").equals("over"))
		{
			String itemid=(String) session.getAttribute("itemid");
			String emailid=(String)session.getAttribute("user_email");
			int amount=(Integer)session.getAttribute("lastbid");
			String q="select * from buy_sell where item_id="+itemid;
			ResultSet rs;
			try {
				rs = stmt.executeQuery(q);
				String sellerid = null;
				if(rs.next())
				{
					sellerid=(String)rs.getObject("seller_id");
				}
				
				String buyerid=(String)session.getAttribute("user_id");
				System.out.println("over biding"+itemid+emailid+amount+sellerid+buyerid);
				String url="https://172.24.6.251:8443/FinalProject/DoPayment?iid_list="+itemid+"&totalAmount="+amount+"&buid="+buyerid+"&suid="+sellerid;
				//response.sendRedirect(url);
				//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
				//rd.forward(request, response);
			//response.sendRedirect("home.jsp");
				//String s="select * from buy_sell where itemid="+;
				PrintWriter out=response.getWriter();
				out.println("<div id=bid><h3><a href="+url+">CONTINUE BUYING</a></h3></div>");
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
		else
		{
			System.out.println("hehr");
			Integer bidvalue=new Integer((String)request.getParameter("bidvalue"));
			String user_id=(String)request.getParameter("user_id");
			System.out.println(request.getParameter("itemid"));
			Integer itemid=new Integer(request.getParameter("itemid"));
			String baseprice=(String)request.getParameter("baseprice");
			
			PrintWriter out=response.getWriter();
			out.println("<div id=bid><h4>Current Price:"+bidvalue+"</div></h4>");
			
			
				
			try {
				
				Date d=new Date();
				//String s=String.valueOf(d.getYear());
				String s=(d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
				String query="insert into bid values('"+user_id+"',"+itemid+","+bidvalue+",'"+s+"');";
				System.out.println("11");
				stmt.execute(query);
				System.out.println("1");
				
				session.setAttribute("lastbid", bidvalue);
			}
			 
			
			catch(Exception e)
			{
				//ResultSet rs3;
				System.out.println(e.toString());
			}
			
		}
		//System.out.println(baseprice);
		
	}

}
