import java.sql.*;
import java.util.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

//@WebServlet("/FetchList")
public class FetchList extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static HttpSession session=null;
	static RequestDispatcher reqdis=null;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	
	
		session=request.getSession();
		String name=request.getParameter("subid");  
		
		//String buffer="<select class=\"form-dropdown\" style=\"width:150px\" id=\"input_24\" name=\"selectCategory\" onkeyup=\"showState(this.value)\"> ";
         
		
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt;
		 
		 
		 
		 ArrayList<String> dlist=new ArrayList<String>();
		 
		 try {
				stmt = con.createStatement();
				ResultSet rs = stmt.executeQuery("SELECT MAINCAT_NAME FROM MAIN_CATEGORY_DESC ");
				System.out.println(name);
				while(rs.next()){
				   
				//String val=rs.getString(1);  		buffer=buffer+"<option value="+val+"> "+val+" </option>";
				
				String temp=rs.getString(1);
				System.out.println(temp);
				dlist.add(temp);
				}
		
		
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 
		 System.out.println(dlist);
		 
		 reqdis=request.getRequestDispatcher("PostItem.jsp");
		 session.setAttribute("dlist", dlist);
		 reqdis.forward(request, response);
			
	
	
	
	
	
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
