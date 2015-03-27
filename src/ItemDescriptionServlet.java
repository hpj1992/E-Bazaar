

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ItemDescriptionServlet
 */
public class ItemDescriptionServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{

		String connectionURL = "jdbc:mysql://localhost:3306/DATASTORE";

		Connection connection = null;

		Statement statement = null;

		ResultSet rs = null;
		
		
		String itemid=(request.getParameter("itemid"));
		int id=Integer.parseInt(itemid);
	System.out.println("after st");
	String s="select * from item_details where item_id="+id+";";
	HttpSession session = request.getSession();
		
			try{
				Class.forName("com.mysql.jdbc.Driver").newInstance();
				System.out.print("load2");			
				connection = DriverManager.getConnection(connectionURL, "root", "root");
				statement = connection.createStatement();
				rs=statement.executeQuery(s);
				int i=0;
				String[] desc=new String[8];
				String[] value=new String[8];
				while(rs.next())
				{
					desc[i]=rs.getString("name_desc");
					value[i]=rs.getString("description");
					i++;
				}
				System.out.println(desc[0]+desc[1]+desc[2]+desc[3]+desc[4]+desc[5]+value[6]+value[7]);
				System.out.println(value[0]+value[1]+value[2]+value[3]+value[4]+value[5]+value[6]+value[7]);
				session.setAttribute("desc",desc);
				session.setAttribute("value",value);
				session.setAttribute("imageid", request.getParameter("imageid"));
				//RequestDispatcher rd = request.getRequestDispatcher("productdetail.jsp");
				RequestDispatcher rd = request.getRequestDispatcher("productdetail.jsp");
				
				try {
					rd.forward(request, response);
					
					
				} catch (ServletException e) {
				e.printStackTrace();
				}
			}
			catch(Exception e)
			{
				
				System.out.println(e.toString());
				
			}
			
		
	}
}
