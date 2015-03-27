

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String email=(String)request.getParameter("email");
		String password=(String)request.getParameter("password");
		System.out.println(email+password);
		System.out.println("hi"); 
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt;
		 HttpSession session=request.getSession();
		 PrintWriter out=response.getWriter();
		 try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("select * from user_details where password='"+password+"' and user_email='"+email+"';");
				
				if(rs.next())
				{
					String verify=(String)rs.getObject("verified");		
					if(verify.equals("0"))
					{
						out.println("You have comple Registration but not verified yet.");
					}
					else
					{
						System.out.println("here");
						out.println("Success");
						session.setAttribute("username", (String)rs.getObject("username"));
						session.setAttribute("user_email",(String)rs.getObject("user_email"));
						session.setAttribute("user_id",(String)rs.getObject("user_id"));
						
					}
					
					//RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
					//rd.forward(request,response);
				}
				else
				{
					//out.println("Error");
					System.out.println("here2");
					out.println("<label style=font-family:verdana;font-size:110%;color:red>Enter valid username and password.</label>");
				}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		
		//out.println("<label style=font-family:verdana;font-size:110%;color:red>successfull login</label>");
		System.out.println(email+password);
	}

}
