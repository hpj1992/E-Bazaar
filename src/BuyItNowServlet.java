

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class BuyItNowServlet
 */
public class BuyItNowServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		DatabaseMySql od=new DatabaseMySql();
				 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
				 Statement stmt;
				 HttpSession session=request.getSession();
				 String username=(String) session.getAttribute("username");
				  if(username.equals("Guest"))
				 {
					 response.sendRedirect("Login.jsp");
				 }
				 else
				 {
					 String email=(String)session.getAttribute("user_email");
					 String query="select * from ppuser_details where panya_email='"+email+"';";
					 
					 PrintWriter out=response.getWriter();
					 try {
							stmt = con.createStatement();
							ResultSet rs=stmt.executeQuery(query);
							if(rs.next())
							{
								
							}
							else
							{
								response.sendRedirect("checkout.jsp");
							}
					 }
					 catch(Exception e)
					 {
						 
					 }
		 
		 }
	}
		 
		 

	

}
