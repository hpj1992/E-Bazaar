import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.http.HttpSession;

import com.mysql.jdbc.Blob;


public class UploadServer2 {
	public UploadServer2()
	{
		System.out.println("hello");
		DatabaseMySql od=new DatabaseMySql();
		 Connection con = od.getDatabaseConnection("localhost","3306","datastore","root","root");  
		 Statement stmt = null;
		try {
			stmt = con.createStatement();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		String s="select * from temp";
		
		FileOutputStream fos =null;
		try
		{
			ResultSet rs=stmt.executeQuery(s);
			
			if(rs.next())
			{
				Blob imageBlob = (Blob) rs.getBlob(1);
				byte[] data = imageBlob.getBytes(1, (int) imageBlob.length());
				 fos = new FileOutputStream("d:/Test.jpg");  
			    fos.write(data);  
			      
			}
			
		}
		catch(Exception e)
		{
			
		}
		
		 try {
			fos.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static void main(String[] a)
	{
		new UploadServer2();
	}

}
