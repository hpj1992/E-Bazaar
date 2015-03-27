

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class TrollyServlet
 */
public class TrollyServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void addData(int itemid,ArrayList<String> images,ArrayList<String> titles,ArrayList<String> prices,ArrayList<String> trollyitemids,int index)
	{
		trollyitemids.add(index, String.valueOf(itemid));
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		 try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		ResultSet rs2;
		String query="";
		query="select * from item_mapping where item_id="+itemid+";";
		 try {
			rs2=stmt.executeQuery(query);
			 System.out.println("26");
			 if(rs2.next())
			 {
				 String temp=(String.valueOf(rs2.getObject("MAINCAT_ID"))+String.valueOf(rs2.getObject("SUBCAT_ID"))+String.valueOf(rs2.getObject("ITEM_ID"))+"_1.jpg");
				 images.add(index,temp);
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		 
		
		 query="select * from item_details where NAME_DESC='Price' and item_id="+itemid+";";
		 try {
			rs2=stmt.executeQuery(query);
			if(rs2.next())
			 {
				 String temp=(String)rs2.getObject("description");
				prices.add(index,temp); 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 
		 
		 query="select * from item_details where NAME_DESC='Title' and item_id="+itemid+";";
		 try {
			rs2=stmt.executeQuery(query);
			 if(rs2.next())
			 {
				 String temp=(String)rs2.getObject("description");
				titles.add(index,temp); 
			 }
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
	}
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		HttpSession session=request.getSession();
		String imageid=(String) session.getAttribute("imageid");
		String itemid=(String)session.getAttribute("itemid");
		if(itemid==null)
			itemid=(String)request.getParameter("itemid");
		
		String user_email=(String)session.getAttribute("user_email");
		String username;
		try
		{
			username=(String)session.getAttribute("username");
			
		}
		catch(NullPointerException e)
		{
			username="Guest";
		}
		if(username==null)
		{
			username="Guest";
			response.sendRedirect("Register.jsp");
			//System.exit(4);
		}
		else
		{
				ResultSet rs=null;;
		ArrayList<String> images;
		ArrayList<String> titles;
		ArrayList<String> prices;
		ArrayList<String> trollyitemids = null;
		
		
        
		int id = 1;
		String flag=(String)request.getParameter("flag");
		String userid = null;
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		 try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		
		if(flag.equals("0"))
		{
			
			 images=new ArrayList<String>();
			 titles=new ArrayList<String>();
			 prices=new ArrayList<String>();
			 trollyitemids=new ArrayList<String>();
	        
		 String query="select * from trolly";
		 try {
			
			rs=stmt.executeQuery(query);
			while(rs.next())
			{
				id=(Integer)rs.getObject("TROLLY_ID")+1;
			}
			
			
			System.out.println("2"+user_email);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			id=1;
			e.printStackTrace();
		}
		catch(Exception e)
		{
			id=1;
		}
		query="select * from user_details where user_email='"+user_email+"'";
		try {
			rs=stmt.executeQuery(query);
			
			if(rs.next())
			{userid=(String)rs.getObject("user_id");
			System.out.println(userid);
			}
			Date d=new Date();
			//String s=String.valueOf(d.getYear());
			String s=(d.getYear()+1900)+"-"+(d.getMonth()+1)+"-"+d.getDate()+" "+d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
			query="insert into trolly values("+id+",'"+userid+"',"+itemid+",'"+s+"');";
			System.out.println("11");
			stmt.execute(query);
			System.out.println("1");
			
		}
		 
		
		catch(Exception e)
		{
			//ResultSet rs3;
			System.out.println(e.toString());
			PrintWriter out=response.getWriter();
			System.out.println("here also???");
			//out.println("You have already added this produvt into your trolly.");
			/*int i=0;
			query="select * from trolly where user_id='"+userid+"';";
			try {
				rs3=stmt.executeQuery(query);
				while(rs3.next())
				{
					 int itemid1=(Integer)rs3.getObject("item_id");
					 query="select * from item_mapping where item_id="+itemid1+";";
					 ResultSet rs2=stmt.executeQuery(query);
					 if(rs2.next())
					 {
						 String temp=(String.valueOf(rs2.getObject("MAINCAT_ID"))+String.valueOf(rs2.getObject("SUBCAT_ID"))+String.valueOf(rs2.getObject("ITEM_ID"))+"_1.jpg");
						 images.add(i,temp);
					 }
					 
					
					 query="select * from item_details where NAME_DESC='Price' and item_id="+itemid1+";";
					 rs2=stmt.executeQuery(query);
					 if(rs2.next())
					 {
						 String temp=(String)rs2.getObject("description");
						prices.add(i,temp); 
					 }
					 
					 query="select * from item_details where NAME_DESC='Title' and item_id="+itemid1+";";
					 rs2=stmt.executeQuery(query);
					 if(rs2.next())
					 {
						 String temp=(String)rs2.getObject("description");
						titles.add(i,temp); 
					 }
					 
					i++;
					
				}
				 System.out.println(images);
				 System.out.println(titles);
				 System.out.println(prices);
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			RequestDispatcher rd=request.getRequestDispatcher("shoppingcart.jsp");
			rd.forward(request,response);*/
			}
		finally
		{
			try {
				rs.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		ResultSet rs3 = null,rs2 = null;
		try
		{
			
			int i=0;
			query="select * from trolly where user_id='"+userid+"';";
			System.out.println("22");
			rs3=stmt.executeQuery(query);
			System.out.println("23");
			while(rs3.next())
			{	System.out.println("24");
				 int itemid1=(Integer)rs3.getObject("item_id");
				 System.out.println("25");
				 //trollyitemids.add(String.valueOf(itemid1));
				 addData(itemid1,images,titles,prices,trollyitemids,i);
				 
				System.out.println(i);
				 //System.out.println(images);
				 //System.out.println(titles);
				 //System.out.println(prices);
				i++;
				
			}
			System.out.println(images);
			 
			System.out.println(titles);
			 System.out.println(prices);
			 System.out.println(trollyitemids);
			 session.setAttribute("images", images);
			 session.setAttribute("titles", titles);
			 session.setAttribute("prices", prices);
			 session.setAttribute("trollyitemids", trollyitemids);
			//RequestDispatcher rd=request.getRequestDispatcher("shoppingcart.jsp");
			//rd.forward(request,response);
			 response.sendRedirect("shoppingcart.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e.toString());
		}
		finally
		{
			try {
				rs3.close();
				//rs2.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
	} // end of if 
		if(flag.equals("1")) // if control came from add to cart second time to remove any item from trolly
		{
			  images=(ArrayList<String>)session.getAttribute("images");
             titles=(ArrayList<String>)session.getAttribute("titles");
             prices=(ArrayList<String>)session.getAttribute("prices");
             trollyitemids=(ArrayList<String>)session.getAttribute("trollyitemids");
             int index=new Integer((String)request.getParameter("index"));
            
             int tempitemid=new Integer(trollyitemids.get(index));
             images.remove(index);
             titles.remove(index);
             prices.remove(index);
             trollyitemids.remove(index);
             session.setAttribute("images", images);
			 session.setAttribute("titles", titles);
			 session.setAttribute("prices", prices);
			 session.setAttribute("trollyitemids", trollyitemids);
			 DatabaseMySql od2=new DatabaseMySql();
			 Connection con2 = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
			 Statement stmt2 = null;
			 try {
				stmt2 = con.createStatement();
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			String s="delete from trolly where item_id="+tempitemid+";";
			try {
				stmt2.executeUpdate(s);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			System.out.println("here also 2");
			RequestDispatcher rd=request.getRequestDispatcher("shoppingcart.jsp");
			rd.forward(request,response);
             
		}
		 
			
		}
		
	} // end of service

}
