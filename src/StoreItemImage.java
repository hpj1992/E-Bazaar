

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
public class StoreItemImage extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 HttpSession session=request.getSession();
		 RequestDispatcher reqdis=null;
		
		
		 DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		 ResultSet rs;
		 int itemid=0;
		 try {
				stmt = con.createStatement();
		 }
		 catch(Exception e)
		 {
			 System.out.println(e.toString());
		 }
	
		 // image upload code below
		// String imageid=String.valueOf(session.getAttribute("selectedMaincat"))+String.valueOf(session.getAttribute("selectedSubcat"))+String.valueOf(itemid);
		String imageid=(String)session.getAttribute("imageid_forupload");	
		 System.out.println("new image id"+imageid);

			
			
		 System.out.println("Uploaded successfully !22222");
			String saveFile="";
			// imageid=String.valueOf(request.getAttribute("imageid"));
			System.out.println("1");
			String contentType = request.getContentType();
			System.out.println("11"+contentType);
			if ((contentType != null) && (contentType.indexOf("multipart/form-data") >= 0)) {
			DataInputStream in = new DataInputStream(request.getInputStream());
			System.out.println("111");
			int formDataLength = request.getContentLength();
			System.out.println("11111");
			byte dataBytes[] = new byte[formDataLength];
			int byteRead = 0;
			int totalBytesRead = 0;
			while (totalBytesRead < formDataLength) {
			byteRead = in.read(dataBytes, totalBytesRead,formDataLength);
			totalBytesRead += byteRead;
			}
			System.out.println("1");
			String file = new String(dataBytes);
			saveFile = file.substring(file.indexOf("filename=\"") + 10);
			saveFile = saveFile.substring(0, saveFile.indexOf("\n"));
			saveFile = saveFile.substring(saveFile.lastIndexOf("\\") + 1,saveFile.indexOf("\""));
			int lastIndex = contentType.lastIndexOf("=");
			String boundary = contentType.substring(lastIndex + 1,contentType.length());
			int pos;
			System.out.println("2");
			pos = file.indexOf("filename=\"");
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			pos = file.indexOf("\n", pos) + 1;
			int boundaryLocation = file.indexOf(boundary, pos) - 4;
			int startPos = ((file.substring(0, pos)).getBytes()).length;
			int endPos = ((file.substring(0, boundaryLocation)).getBytes()).length;
			System.out.println("3");
			File ff = new File(saveFile);
			
			FileOutputStream fileOut = new FileOutputStream(ff);
			fileOut.write(dataBytes, startPos, (endPos - startPos));
			fileOut.flush();
			fileOut.close();
			//out.println(saveFile);
			System.out.println("4");
			Connection connection = null;
			String connectionURL = "jdbc:mysql://localhost:3306/datastore";
			 rs = null;
			PreparedStatement psmnt = null;
			FileInputStream fis;
			try {
				System.out.println("5");
			Class.forName("com.mysql.jdbc.Driver").newInstance();
			connection = (Connection) DriverManager.getConnection(connectionURL, "root", "root");
			File f = new File(saveFile);
			psmnt = (PreparedStatement) connection.prepareStatement("insert into tempimages values("+imageid+",?)");
			fis = new FileInputStream(f);
			psmnt.setBinaryStream(1, (InputStream)fis, (int)(f.length()));
			int s = psmnt.executeUpdate();
			System.out.println("6");
			if(s>0) {
			System.out.println("Uploaded successfully !");

			}
			else{
			System.out.println("Error!");
			}
			}
			catch(Exception e){
				System.out.print(e.toString());
				e.printStackTrace();}
			}
			
			
			new UploadServer(imageid);
			
			
			try {
				stmt = con.createStatement();
				stmt.executeUpdate("delete from tempimages where imageid="+imageid);
				
				
				
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			// data insert in BUY SELL
			String query="select * from buy_sell";
			try {
				rs=stmt.executeQuery(query);
				int i=0;
				while(rs.next())
				{
					i++;
				}
				int tid=i+1;
				String userid=(String)session.getAttribute("user_id");
				itemid=new Integer(request.getParameter("itemid"));
				query="insert into buy_sell(`trans_id`,`seller_id`,`item_id`) values("+tid+",'"+userid+"',"+itemid+");";
				stmt.execute(query);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
			
			
			
			
			RequestDispatcher rd=request.getRequestDispatcher("SuccessItemPosted.jsp");
			rd.forward(request, response);
			
			
		/* ServletContext context=this.getServletContext();
			RequestDispatcher requestDispatcher=context.getRequestDispatcher("/ImageServlet?imageid="+imageid);
		requestDispatcher.forward(request, response);
		*/
		 
		 //System.out.println("imgpath"+imgpath);
		}

	

}
