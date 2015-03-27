

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

/**
 * Servlet implementation class Search
 */
public class Search extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String keyword=(String)request.getParameter("keyword");
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		 ResultSet rs;
		
		 HttpSession session=request.getSession();
		 session.setAttribute("keyword", keyword);
		 String query="select * from main_category_desc where maincat_name like('%"+keyword+"%');";
		 try {
			 stmt = con.createStatement();
			rs=stmt.executeQuery(query);
			if(rs.next())
			{
				System.out.println("not here");
				Integer maincat_id=(Integer)rs.getObject("maincat_id");
				RequestDispatcher rd=request.getRequestDispatcher("PaginationServlet?catid="+String.valueOf(maincat_id)+"&flag=1000");
				rd.forward(request,response);
			}
			else
			{
				String subcat_name="";
				int maincat_id = 0;
				 query="select * from category_desc where subcat_name like('%"+keyword+"%')";
				 try {
					
					// rs=stmt.executeQuery(query);
					 ResultSet rs2=stmt.executeQuery(query);
						if(rs2.next())
						{
							 maincat_id=(Integer)rs2.getObject("maincat_id");
							subcat_name=(String)rs2.getObject("subcat_name");
							Integer subcat_id=(Integer)rs2.getObject("subcat_id");
							//RequestDispatcher rd=request.getRequestDispatcher("PaginationServlet?catid="+String.valueOf(maincat_id)+"&flag=1000");
							//rd.forward(request,response);
						}
						System.out.println(subcat_name);
							int subcatloc=0;
							query="select * from category_desc where maincat_id="+maincat_id;
							 try {
								
								// rs=stmt.executeQuery(query);
								  rs2=stmt.executeQuery(query);
									while(rs2.next())
									{
										subcatloc++;
										if(subcat_name.equals((String)rs2.getObject("subcat_name")))
										{
											
											System.out.println(subcat_name+"=="+(String)rs2.getObject("subcat_name"));
											break;
										}
										
									}
									System.out.println(subcatloc);
									RequestDispatcher rd=request.getRequestDispatcher("PaginationServlet?catid="+maincat_id+"&flag="+(subcatloc-1));
									rd.forward(request,response);
							} catch (SQLException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
							
						
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		
		
		
		
	}

}
