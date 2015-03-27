package PaginationServletPackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.AALOAD;

/**
 * Servlet implementation class PaginationExample
 */
public class AuctionPaginationServlet2 extends HttpServlet {
	

	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{

		String connectionURL = "jdbc:mysql://localhost:3306/DATASTORE";

		Connection connection = null;

		Statement statement = null;

		ResultSet rs = null;
		
		
			try{
				
		Class.forName("com.mysql.jdbc.Driver").newInstance();
		System.out.print("load2");			
		connection = DriverManager.getConnection(connectionURL, "root", "root");

	statement = connection.createStatement();
	System.out.println("after st");
			}
			catch(Exception e)
			{
				
				System.out.println(e.toString());
				
			}
			HttpSession session = request.getSession();
		String pageNo = request.getParameter("id");
		String sub_cat=request.getParameter("subcat");
		String main_cat=(String)session.getAttribute("maincatid");
		final int offSet = 4;
		ArrayList<Integer> itemids;
		System.out.println("here"+main_cat);
		ArrayList<ArrayList<Integer>> data=(ArrayList<ArrayList<Integer>>)session.getAttribute("data");
		Integer subcatloc=Integer.parseInt(request.getParameter("subcatloc"));
		if(pageNo==null){
			pageNo="1";
		}
	

		int pageNumber = Integer.parseInt(pageNo);
		System.out.println(pageNumber);
		if(pageNumber != 0){

		
		//	session.setAttribute("data",arrayList );
	//		session.setAttribute("MainCategory",(String)request.getParameter("cat"));
		//	System.out.println(arrayList.size());			
			int numberOfData = data.get(subcatloc).size()-1;
			//System.out.println("total data"+numberOfData+count);
			double total = (double)numberOfData/offSet;
			int totalPages=(int)Math.ceil(total);
			//int totalPages = numberOfData/offSet;
			String noPages = Integer.toString(totalPages);
			System.out.println(noPages + 1);

			System.out.println("Page No 1");

						int nodata = offSet*pageNumber;

						int fistNo = nodata - offSet;
						System.out.println("NO Of Data"+nodata);
						System.out.println("From"+fistNo+"To"+nodata);
						
						if(nodata>data.get(subcatloc).size()-1){
							nodata = data.get(subcatloc).size()-1;
						}
						System.out.print("jk"+nodata);
						//ArrayList<ArrayList<Integer>> onlyData = new ArrayList<ArrayList<Integer>>();
						ArrayList<String> items=new ArrayList<String>();
						int h=0;
						itemids=new ArrayList<Integer>();
						while (fistNo<nodata ){
							//StudentBean student = (StudentBean) arrayList.get(fistNo);
							//System.out.println(student.getName_Strudet());
							
							items.add(main_cat+data.get(subcatloc).get(0)+data.get(subcatloc).get(fistNo+1));
							itemids.add(h,(Integer)data.get(subcatloc).get(fistNo+1));
							fistNo++;h++;
							System.out.print("j");
						}
						for(int i=0;i<items.size();i++)
							System.out.println(items.get(i));
						System.out.println("items size"+items.size()+noPages+"item ids"+itemids.size());
						session.setAttribute("data",data );
						session.setAttribute("pages", noPages);
						session.setAttribute("items",items);
						session.setAttribute("subcatloc",subcatloc);
						session.setAttribute("itemids", itemids);
						//System.out.println(items.size()+itemids.length);
						//System.out.println(itemids[0]+itemids[1]+itemids[2]);
						if(items.size()==0 && itemids.size()==0)
						{
							RequestDispatcher rd=request.getRequestDispatcher("NoProducts.jsp");
							try {
								rd.forward(request,response);
							} catch (ServletException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
					
						}
						else
						{
							RequestDispatcher rd = request.getRequestDispatcher("AuctionAllProducts.jsp");
							
							try {
								rd.forward(request, response);
								//System.out.println();
								
							} catch (ServletException e) {
								// TODO Auto-generated catch block
								e.printStackTrace();
							}
						}
						
		}

	}
}