

import java.io.DataInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.sql.DriverManager;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.mysql.jdbc.Connection;
import com.mysql.jdbc.PreparedStatement;

/**
 * Servlet implementation class servlet
 */
public class ImageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
   
	
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		System.out.println("Uploaded successfully !22222");
		String saveFile="";
		String imageid=String.valueOf(request.getAttribute("imageid"));
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
		ResultSet rs = null;
		PreparedStatement psmnt = null;
		FileInputStream fis;
		try {
			System.out.println("5");
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		connection = (Connection) DriverManager.getConnection(connectionURL, "root", "root");
		File f = new File(saveFile);
		psmnt = (PreparedStatement) connection.prepareStatement("insert into temp(temp) values(?)");
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
		/* ServletContext context=this.getServletContext();
			RequestDispatcher requestDispatcher=context.getRequestDispatcher("/home.jsp");
			requestDispatcher.forward(request, response);*/
		   
	}

}
