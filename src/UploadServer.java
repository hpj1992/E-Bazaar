import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Blob;


public class UploadServer {
	
	public UploadServer(String imageid)
	{
		
		String path="";
		System.out.println("hello"+imageid);
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			System.out.print(e1.toString());
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String s="select * from tempimages where imageid="+imageid;
		
		FileOutputStream fos =null;
		try
		{
			ResultSet rs=stmt.executeQuery(s);
			
			if(rs.next())
			{
				Blob imageBlob = (Blob) rs.getBlob(2);
				byte[] data = imageBlob.getBytes(1, (int) imageBlob.length());
				path="C:/workspace/FinalProject/WebContent/images/products/";
				String path3=path+imageid+"_2.jpg";
				 fos = new FileOutputStream(path3);  
			    fos.write(data);  
			      
			}
			
		}
		catch(Exception e)
		{
			
		}
		try {
			fos.close();
		} catch (IOException e) {
			System.out.print(e.toString());
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		String path1=path+imageid+"_2.jpg";
		String path2=path+imageid+"_1.jpg";
		new ImageResize(path1,path2);
		 
	}
	

}
