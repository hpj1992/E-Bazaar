

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class EmailValidatorServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String email=request.getParameter("eid");
		int flag=0;
		DatabaseMySql od=new DatabaseMySql();
		Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		Statement stmt;
		try {
			stmt = con.createStatement();
			ResultSet rs;
			String s="select * from user_details;";
			rs=stmt.executeQuery(s);
			
			while(rs.next())
			{
				String temail=(String)rs.getObject(1);
				if(email.equals(temail))
				{
					flag=1;
				}
				
				
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		if(flag==1)
		{
			response.getWriter().print("Email-ID already exists.  ");
		}
		else
		{
			response.getWriter().print("");
		}
		
		
		
		
	}

}
