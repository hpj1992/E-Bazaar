

import java.io.IOException;
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

public class EnterAsBuyer extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static HttpSession session=null;
	static RequestDispatcher reqdis=null;
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
	
		session=request.getSession();
		
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement st;
		 ResultSet rs;
		 
		 session.setAttribute("useremail","ASD");
		 String umail=(String)session.getAttribute("useremail");
		 System.out.println("umail:"+umail);
		 String billaddress="";
		 
		 try {
				st = con.createStatement();
				rs= st.executeQuery("SELECT FNAME,LNAME,POSTAL_ADDR,CITY,STATE,COUNTRY,PINCODE,PHONE FROM USER_DETAILS WHERE USER_EMAIL='"+umail+"'");
				
				if(rs.next()){
				   			
				    billaddress=rs.getString(1)+rs.getString(2)+
				    			"\n"+rs.getString(3)+
				    			"\n"+rs.getString(4)+
				    			"\n"+rs.getString(5)+"-"+rs.getString(7)+
				    			"\nPHONE:"+rs.getString(8);
				    							
				}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 
		
		System.out.println("billadd:"+billaddress);
		reqdis=request.getRequestDispatcher("Paypal31.jsp");
		session.setAttribute("billaddress", billaddress);
		reqdis.forward(request,response);
	
	
	
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}

}
