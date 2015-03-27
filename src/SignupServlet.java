

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.io.*;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class SignupServlet
 */
public class SignupServlet extends HttpServlet {
	//private static final long serialVersionUID = 1L;
       
   
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String connectionURL = "jdbc:mysql://localhost:3306/datastore";

		Connection connection = null;

		Statement statement = null;

		ResultSet rs = null;
		String firstName=(String)request.getParameter("fname");
		String lastName=(String)request.getParameter("lname");
		String email=(String)request.getParameter("email");
		String username=(String)request.getParameter("username");
		String password=(String)request.getParameter("password");
		String phCode=(String)request.getParameter("phcode");
		String phno=(String)request.getParameter("phno");
		String add1=(String)request.getParameter("line1");
		String add2=(String)request.getParameter("line2");
		String city=(String)request.getParameter("city");
		String state=(String)request.getParameter("state");
		String pincode=(String)request.getParameter("pincode");
		String country=(String)request.getParameter("country");
		String bdate=(String)request.getParameter("bdate");
		String userid="gg";
		
		System.out.println(bdate);
		String query2="select * from user_details";
		
		System.out.println(firstName+lastName+email+username+password+phCode+phno+add1+add2+city+state+pincode+country+bdate);
		
		try {
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			System.out.print("load2");			
			connection = DriverManager.getConnection(connectionURL, "root", "root");
			statement = connection.createStatement();
			
			rs=statement.executeQuery(query2);
			while(rs.next())
			{
				userid=(String)rs.getObject("USER_ID");
				
				
			}
			Integer temp=new Integer(userid.substring(1, userid.length()));
			temp++;
			userid="u"+temp.toString().trim();
			System.out.println(userid);
			
			//verification mail
			HttpSession session=request.getSession();
			session.setAttribute("username", username);
			GenerateRandomNo grn=new GenerateRandomNo();
			String randomno=grn.generateRandomNumber();
			PrintWriter out=response.getWriter();
			System.out.println("VALUE"+randomno);
			String verify_link="http://172.24.6.250:8081/FinalProject/ActivationServlet?uid="+userid+"&id="+randomno+"&flag=1";
			String title="Congratulations ... !! ";
			String msg="You are sccessfully registered with paNya.com \n Now enjoy experience of buying and selling of old as well as new products.\n Click on the link below to complete the subscription.\n"+verify_link;
			String errorMsg="hh";
			
			
				SendMail sm=new SendMail(email,title,msg);
				String query="insert into user_details values('"+email+"','"+password+"','"+userid+"','"+username+"','"+firstName+"','"+lastName+"','"+bdate+"','"+add1+add2+"','"+city+"','"+state+"','"+country+"','"+pincode+"','"+phCode+"-"+phno+"','"+randomno+"','0')";
				statement.executeUpdate(query);
				RequestDispatcher rd=request.getRequestDispatcher("successSignup.jsp");
				rd.forward(request,response);
			
		} catch (InstantiationException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
	}

}
