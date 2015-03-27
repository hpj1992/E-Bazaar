import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class Fetch_Duration extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
System.out.println("HELO");
		String buffer="";
		buffer= buffer +"<li class=\"form-line\" id=\"d_1\">" +
				"<label class=\"form-label-top\" id=\"dlabel_1\" for=\"d_2\">Auction End Date</label>" +
				"<div id=\"did_29\" class=\"form-input-wide\">" +
				"<input type=\"date\" class=\" form-textbox\" id=\"dinput_29\" name=\"ending_date\" size=\"20\" >" +
				"</div>";
		buffer=buffer +"<li class=\"form-line\" id=\"d_2\">" +
		"<label class=\"form-label-top\" id=\"dlabel_2\" for=\"d_3\">Auction End Time</label>" +
		"<div id=\"did_30\" class=\"form-input-wide\">" +
		"<input type=\"time\" class=\" form-textbox\" id=\"dinput_30\" name=\"ending_time\" size=\"20\" >" +
		"</div>";
		response.getWriter().println(buffer); 
		
	}

}
