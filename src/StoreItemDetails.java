

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
//import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.PreparedStatement;

//@WebServlet("/StoreItemDetails")
public class StoreItemDetails extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=null;
		 RequestDispatcher reqdis=null;
		
		
		
		session=request.getSession();
		String desc1=(String)request.getParameter("q31_selectType");  
		String desc2=(String)request.getParameter("selectCategory");  
		String desc3=((String)request.getParameter("q25_brand")=="") ? "N/A" : (String)request.getParameter("q25_brand") ;  
		String desc4=((String)request.getParameter("q26_desc1")=="") ? "N/A" : (String)request.getParameter("q26_desc1");  
		String desc5=((String)request.getParameter("q27_desc1")=="") ? "N/A" : (String)request.getParameter("q27_desc1");  
		String desc6=((String)request.getParameter("q28_desc1")=="") ? "N/A" : (String)request.getParameter("q28_desc1");  
		String desc7=((String)request.getParameter("q29_manufacturingDate")=="") ? "N/A" : (String)request.getParameter("q29_manufacturingDate");  
		String desc8=((String)request.getParameter("q32_price")=="") ? "N/A" : (String)request.getParameter("q32_price");  
		String desc9=((String)request.getParameter("q22_description")=="") ? "N/A" : (String)request.getParameter("q22_description");  
		String imgpath=((String)request.getParameter("q5_uploadFile[]")=="") ? "N/A" : (String)request.getParameter("q5_uploadFile[]");  
		  
		
		
		String auc_end_date=(String)request.getParameter("ending_date");
		String auc_end_time=(String)request.getParameter("ending_time")+":00";
		System.out.println("empty field="+desc2);
				String col1="Type";
				String col2="Category";
				String col3="Brand";
				String col4="";
				String col5="";
				String col6="";
				String col7="Manufacturing Date";
				String col8="Price";
				String col9="Description";
				
	
		
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt;
		 ResultSet rs;
		 int itemid=0;
		 try {
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT  * FROM ITEM_MAPPING ");
				
				while(rs.next()){
							
				itemid=(rs.getInt(3));
				
				
				}
				itemid++;
				System.out.println("in item id"+itemid);
		
		 } catch (SQLException e) {
		
			e.printStackTrace();
		 }  
		 
		 //fetching the dynamic colmn names
		 ArrayList<String> flist=new ArrayList<String>();
		 try {
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT FIELD1,FIELD2,FIELD3 FROM CATEGORY_DESC WHERE SUBCAT_ID='"+session.getAttribute("selectedSubcat")+"';");
				
				while(rs.next()){
							
				col4=rs.getString(1);
				col5=rs.getString(2);
				col6=rs.getString(3);
				}
				
		
		 } catch (SQLException e) {
		
			e.printStackTrace();
		 }  
		
		 
		 //create function  [ item_id   function(subcateid,itemtype)]
		 int maincat_id=0;
		int subcat_id=0;
		 
		 try {
				stmt = con.createStatement();
				rs = stmt.executeQuery("SELECT MAINCAT_ID,SUBCAT_ID FROM CATEGORY_DESC WHERE SUBCAT_NAME='"+desc2+"' ;");
				
				if(rs.next()){
							
				maincat_id=rs.getInt(1);
				subcat_id=rs.getInt(2);
				System.out.println("hello:"+maincat_id+"  "+subcat_id);
				}
				
		
		 } catch (SQLException e) {
		
			e.printStackTrace();
		 }  
		
		 // inserting in item mapping

			String selectedSubcat=(String)request.getParameter("selectCategory");
		String imageid="18"+selectedSubcat+String.valueOf(itemid);
		System.out.println("new image id"+imageid);
		session.setAttribute("imageid_forupload", imageid);
		
		 
		 
		 
		 
		 //inserting item details  
		 
		 try {	
			 
				stmt = con.createStatement();
				stmt.execute("INSERT INTO ITEM_MAPPING (MAINCAT_ID,SUBCAT_ID,ITEM_ID,ITEM_TYPE) VALUES ("+session.getAttribute("selectedMaincat")+","+selectedSubcat+","+itemid+",'"+desc1+"');");
				//stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col1+"','"+desc1+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col2+"','"+desc2+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col3+"','"+desc3+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col4+"','"+desc4+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col5+"','"+desc5+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col6+"','"+desc6+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col7+"','"+desc7+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col8+"','"+desc8+"');");
				stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'"+col9+"','"+desc9+"');");
				
				// following code if Auction 
				String userid=(String) session.getAttribute("user_id");
				if(desc1.equals("Auction"))
				{
					stmt.execute("INSERT INTO ITEM_DETAILS (ITEM_ID,NAME_DESC,DESCRIPTION) VALUES ("+itemid+",'End Time','"+auc_end_date+" "+auc_end_time+"');");
					//stmt.execute("INSERT INTO bid VALUES ('"+userid+"',"+itemid+",'"+desc8+"','"+auc_end_date+" "+auc_end_time+"');");
				}
				
				
				
				//stmt.execute("INSERT INTO BUY_SELL (USER_ID,ITEM_ID,USER_TYPE,TIMING) VALUES ('12000','"+itemid+"','SELLER','"+desc9+"');");
				//stmt.execute("INSERT INTO USER_HISTORY (USER_ID,ITEM_ID,ACTION,TIMING) VALUES ('12000','"+itemid+"','"+col9+"','"+desc9+"');");
				
		
		 } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}  
		 
		 // image upload code below
		 
			
			
			RequestDispatcher rd=request.getRequestDispatcher("PostImage.jsp?itemid="+itemid);
			rd.forward(request, response);
			
			
		/* ServletContext context=this.getServletContext();
			RequestDispatcher requestDispatcher=context.getRequestDispatcher("/ImageServlet?imageid="+imageid);
		requestDispatcher.forward(request, response);
		*/
		 
		 //System.out.println("imgpath"+imgpath);
		}

	

}
