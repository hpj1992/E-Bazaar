

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Fetch_Subcat extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static HttpSession session=null;
	static RequestDispatcher reqdis=null;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedcat=request.getParameter("maincatname");
		System.out.println("Entered in fied"+selectedcat);
		
		session = request.getSession();
		  
		
		//String buffer="<select class=\"form-dropdown\" style=\"width:150px\" id=\"input_24\" name=\"selectCategory\" onkeyup=\"showState(this.value)\"> ";
         
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt;
		 ArrayList<String> flist=new ArrayList<String>();
		 try {
			 System.out.println("1");
				stmt = con.createStatement();
				PrintWriter out=response.getWriter();
				ResultSet rs = stmt.executeQuery("select subcat_name from category_desc where maincat_id=(select maincat_id from main_category_desc where maincat_name='"+selectedcat+"')");
				 out.println("<option  selected> Please Select </option>");
				while(rs.next()){
					   
					//String val=rs.getString(1);  		buffer=buffer+"<option value="+val+"> "+val+" </option>";
					
					String temp=rs.getString(1);
					System.out.println(temp);
					flist.add(temp);
					out.println(" <option>"+temp+" </option>");
					}
				String query="select * from main_category_desc where maincat_name='"+selectedcat+"';";
				rs=stmt.executeQuery(query);
				Integer selectedMaincat=0;
				if(rs.next())
				{
					selectedMaincat=(Integer)rs.getObject("maincat_id");
				}
				request.getSession().setAttribute("dlist2",flist);
				request.getSession().setAttribute("selectedMaincat",selectedMaincat);
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}  
		 
	
		
		
		// reqdis=request.getRequestDispatcher("droplist.jsp");
		// session.setAttribute("flist", flist);
		// reqdis.forward(request, response);
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
