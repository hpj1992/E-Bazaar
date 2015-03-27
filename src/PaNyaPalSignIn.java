

import java.io.*;
import java.util.*;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class PaNyaPalSignIn
 */
public class PaNyaPalSignIn extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	static RequestDispatcher reqdis=null;
	static HttpSession session=null;
	
	String s1,s2,s3,s4,s5,s6,s7;

	ArrayList<ArrayList<String>> data=null;
	ArrayList<String> record=null;
	
	
    /**
     * Default constructor. 
     */
    public PaNyaPalSignIn() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		System.out.println("Harry");
		//PrintWriter out=response.getWriter();
		
		session=request.getSession();
		
		String email=request.getParameter("textfield1");
		String password=request.getParameter("textfield2");
		String pwd="";// password from database
		boolean result=false;
		
		DatabaseMySql dm=new DatabaseMySql();
		Connection con;
		Statement st;
		ResultSet rs;
		
		try
		{
			con=dm.getDatabaseConnection("localhost","3306","datastore","root","root");
			String query="SELECT PASSWORD FROM PPUSER_DETAILS WHERE USER_EMAIL='"+email+"'";
						System.out.println(query);
			st=con.createStatement();
			rs=st.executeQuery(query);
			if (rs.next())
			{		
				pwd=rs.getString(1);
				result=true;
			}
			else
			{
				result=false;
			}
			
			System.out.println(result);
			
			if(password.equals(pwd))
			{
				
			}
			
			//rs.close();
			//st.close();
			//new data fetching from database
			
			String query1="SELECT * FROM PPUSER_HISTORY WHERE USER_EMAIL='"+email+"'";
			System.out.println(query1);
			st=con.createStatement();
			rs=st.executeQuery(query1);
			
			
			data=new ArrayList<ArrayList<String>>();
			record=new ArrayList<String>();
			Integer no=0; 
			
			while (rs.next())
			{
				no++;
				
				record.add(no.toString());
				record.add(rs.getString(2));
				record.add(rs.getString(3));
				record.add(rs.getString(4));
				record.add(rs.getString(5));
				record.add(rs.getString(6));
				record.add(rs.getString(7));
			
				data.add(record);
				record=null;
				record=new ArrayList<String>();
				
			}
	
			System.out.println(data);
			
			reqdis=request.getRequestDispatcher("Paypal22.jsp");
			session.setAttribute("data", data);
			reqdis.forward(request, response);
			
			
			rs.close();
			st.close();
			con.close();
						
			}
		catch(Exception e)
		{
		System.out.println("SQLEXCEPTION"+e);
		e.printStackTrace();
		}
			
		
		
		
		
		
		
		
		
		
	
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		
	
	}

}
