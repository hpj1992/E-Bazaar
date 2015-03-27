

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class EnterAsSeller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static HttpSession session=null;
	static RequestDispatcher reqdis=null;
    

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		session=request.getSession();
		
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement st;
		 ResultSet rs;
		 
		 
		 ArrayList<String> bnamelist=new ArrayList<String>();
		 ArrayList<String> t=new ArrayList<String>();
		 
		 
		 try {
				st = con.createStatement();
				rs = st.executeQuery("SELECT BANK_NAME FROM DB_ACC GROUP BY (BANK_NAME)");
				
				while(rs.next()){
				   
				//String val=rs.getString(1);  		buffer=buffer+"<option value="+val+"> "+val+" </option>";
				
				String temp=rs.getString(1);
				bnamelist.add(temp);
				}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 
		 System.out.println(bnamelist);
		
		 reqdis=request.getRequestDispatcher("Paypal51.jsp");
		 session.setAttribute("bnamelist", bnamelist);
		 
		 t=(ArrayList<String>)session.getAttribute("bnamelist");
		 System.out.println("t:"+t);
			
		 
		 reqdis.forward(request, response);
		
		
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
