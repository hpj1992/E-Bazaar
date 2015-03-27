import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;

public class ActivationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	 
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session=request.getSession();
		DatabaseMySql od=new DatabaseMySql();
		String uid=request.getParameter("uid");
		String id=request.getParameter("id");
		String flag=request.getParameter("flag");
		try{
			
		Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		Statement stmt;
		ResultSet rs;
		stmt=con.createStatement();
		
			if(flag.equals("1"))
			{
				
			String query="SELECT RANDOM_NO,USERNAME FROM USER_DETAILS WHERE USER_ID='"+uid+"'";
			rs=stmt.executeQuery(query);
			   if(rs.next())
			    {
				   String rno=rs.getString(1);
				   String uname=rs.getString(2);
				   if(rno.equals(id))
					{
						session.setAttribute("username",uname);
						String query2="UPDATE USER_DETAILS SET VERIFIED='1'WHERE USER_ID='"+uid+"'";
						stmt.executeUpdate(query2);
						RequestDispatcher rd=request.getRequestDispatcher("Activation.jsp");
						rd.forward(request,response);
					}
					else
					{
						session.setAttribute("username","Guest");
						RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
						rd.forward(request,response);
					}
			
			    }
				else
				{
					session.setAttribute("username","Guest");
					RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
					rd.forward(request,response);
				}
			}
			else if(flag.equals("2"))
			{
				String query="SELECT RANDOM_NO,USER_EMAIL FROM PPUSER_DETAILS WHERE USER_EMAIL='"+uid+"'";
				rs=stmt.executeQuery(query);
				   if(rs.next())
				    {
					   String rno=rs.getString(1);
					   String uname=rs.getString(2);
					   if(rno.equals(id))
						{
							//session.setAttribute("username",uname);
							String query2="UPDATE PPUSER_DETAILS SET VERIFIED='1' WHERE USER_EMAIL='"+uid+"'";
							stmt.executeUpdate(query2);
							RequestDispatcher rd=request.getRequestDispatcher("Activation.jsp");
							rd.forward(request,response);
						}
						else
						{
							session.setAttribute("username","Guest");
							RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
							rd.forward(request,response);
						}
				
				    }
					else
					{
						session.setAttribute("username","Guest");
						RequestDispatcher rd=request.getRequestDispatcher("home.jsp");
						rd.forward(request,response);
					}
				
				
			}
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		}
	
	}


