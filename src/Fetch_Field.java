

import java.io.IOException;
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


public class Fetch_Field extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static HttpSession session=null;
	static RequestDispatcher reqdis=null;
       
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String selectedcat=request.getParameter("subcatname");
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
				ResultSet rs = stmt.executeQuery("SELECT FIELD1,FIELD2,FIELD3 FROM CATEGORY_DESC WHERE SUBCAT_NAME='"+selectedcat+"' ");
				
				if(rs.next()){
				   
				//String val=rs.getString(1);  		buffer=buffer+"<option value="+val+"> "+val+" </option>";
				
				flist.add(rs.getString(1));
				flist.add(rs.getString(2));
				flist.add(rs.getString(3));
				}
				
				String query="select * from category_desc where subcat_name='"+selectedcat+"';";
				rs=stmt.executeQuery(query);
				
				Integer selectedSubcat=0;
				if(rs.next())
				{
					selectedSubcat=(Integer)rs.getObject("subcat_id");
				}
				request.getSession().setAttribute("dlist2",flist);
				request.getSession().setAttribute("selectedSubcat",selectedSubcat);
		
		} catch (SQLException e) {
		
			e.printStackTrace();
		}  
		 
		String buffer="<div>"; 
		for(int i=0; i<flist.size() ;i++) 
		{
			
		int t=26+i;	
		 buffer= buffer +"<li class=\"form-line\" id=\"id_"+t+"\" >"+
	        "<label class=\"form-label-top\" id=\"label_"+t+"\" for=\"input_"+t+"\" > "+flist.get(i)+" </label>"+
	        "<div id=\"cid_26\" class=\"form-input-wide\" >"+
	         "<input type=\"text\" class=\" form-textbox\" id=\"input_"+t+"\" name=\"q"+t+"_desc1\" size=\"20\" />"+
	        "</div>"+
	        "</li>";
	      		
		  
			
		}
		buffer=buffer+"<br></div>";
		System.out.println("in field"+flist);
		System.out.println(" "+buffer);
	    
		response.getWriter().println(buffer);  
		
		
		// reqdis=request.getRequestDispatcher("droplist.jsp");
		// session.setAttribute("flist", flist);
		// reqdis.forward(request, response);
		
	}

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

	}

}
