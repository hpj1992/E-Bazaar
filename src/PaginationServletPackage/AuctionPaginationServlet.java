package PaginationServletPackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.sun.org.apache.bcel.internal.generic.AALOAD;

/**
 * Servlet implementation class PaginationExample
 */
public class AuctionPaginationServlet extends HttpServlet {
	
	//private static final boolean Integer = false;
	
	
	
	public void service(HttpServletRequest request,HttpServletResponse response) throws IOException{
		
		HttpSession session = request.getSession();
		ArrayList<ArrayList<Integer>> data=new ArrayList<ArrayList<Integer>>();
		ArrayList<String> arrayList = new ArrayList<String>();
		ArrayList<Integer> subcatids=new ArrayList<Integer>();
		
		int[] temp;
		String connectionURL = "jdbc:mysql://localhost:3306/datastore";

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
			
		String pageNo = request.getParameter("id");
		System.out.println("here"+request.getParameter("catid"));
		String main_cat=request.getParameter("catid");
		

		if(pageNo==null){
			pageNo="1";
		}
		final int offSet = 3;

		int pageNumber = new Integer(pageNo);
		System.out.println(pageNumber);
		if(pageNumber != 0){

			
			String s="select * from category_desc where (maincat_id)="+main_cat+";";
		
			try {
				
				rs=statement.executeQuery(s);
				int i=0;
					while(rs.next())
					{
						arrayList.add((String)rs.getObject("SUBCAT_NAME"));
						subcatids.add((Integer)rs.getObject("SUBCAT_ID"));
						ArrayList<Integer> temp1=new ArrayList<Integer>();
						
						System.out.println((String)rs.getObject("SUBCAT_NAME"));
						
						temp1.add(0,(Integer)rs.getObject("SUBCAT_ID"));
						data.add(i,temp1);
						temp1=null;
						i++;
					}
					System.out.println(data);
					
					for(int j=0;j<data.size();j++)
					{
							int tempid=data.get(j).get(0);
						String ss="select * from item_mapping where maincat_id="+main_cat+" and subcat_id="+tempid+" and item_type='Auction';";
						rs=statement.executeQuery(ss);
						int k=1;
						ArrayList<Integer> temp2=new ArrayList<Integer>();
						temp2=data.get(j);
						while(rs.next())
						{
							//temp.remove(k);
							temp2.add(k,(Integer)rs.getObject("item_id"));
							System.out.println((Integer)rs.getObject("item_id")+"added at "+k+" location in data");
							k++;
							//data.get(subcatids.get(i))[j]=(int)rs.getInt("item_id");
							
						}
						System.out.println("Category id:"+data.get(j).get(0)+"name"+arrayList.get(j)+"data");
						System.out.println(temp2);
						//data.add(j,temp);
					}
					System.out.println(data);
				
					//session.setAttribute("temp", temp);
					session.setAttribute("subcat",arrayList );
					session.setAttribute("subcatids",subcatids );
					session.setAttribute("maincatid",main_cat);
					session.setAttribute("data",data);
				
					System.out.println(arrayList.size());
			} catch (SQLException e1) {
				// TODO Auto-generated catch block
				e1.printStackTrace();
			}
			
			
			
			
						try {
							
							if(((String)request.getParameter("flag")).equals("1000"))
							{
								
								int offset=3;
								int numberOfData = data.size();
								System.out.println("total data"+numberOfData);
								double total = (double)numberOfData/offSet;
								int totalPages=(int)Math.ceil(total);
								System.out.println("total"+total+totalPages);
								String noPages = String.valueOf(totalPages);
								System.out.println(noPages + 1);
								System.out.println(noPages);
								System.out.println("Page No 1");

											int nodata = offSet*pageNumber;

											int fistNo = nodata - offSet;
											System.out.println("NO Of Data"+nodata);
											System.out.println("From"+fistNo+"To"+nodata);

											if(nodata>data.size()){
												nodata = data.size();
											}
											System.out.print("jk");
											//ArrayList<ArrayList<Integer>> onlyData = new ArrayList<ArrayList<Integer>>();
											ArrayList<String> items=new ArrayList<String>();
											int h=0;
											temp=new int[offset];
											System.out.print(temp);
											while (fistNo<nodata ){
												//StudentBean student = (StudentBean) arrayList.get(fistNo);
												//System.out.println(student.getName_Strudet());
												temp[h]=fistNo;
												System.out.print(fistNo);
												fistNo++;
												h++;
											/*	items.add(main_cat+data.get(subcatloc).get(0)+data.get(subcatloc).get(fistNo+1));
												itemids[h]=(Integer)data.get(subcatloc).get(fistNo+1);
												fistNo ++;h++;
												System.out.print("j");*/
											}
											for(int i=0;i<temp.length;i++)
												System.out.println(temp[i]);
											
											System.out.println();
											
											
											data=null;
												if(temp[0]==0 && temp[1]==0 && temp[2]==0)
												{
													RequestDispatcher rd = request.getRequestDispatcher("NoProducts.jsp");
													rd.forward(request, response);
												
												}
												else
												{
													
													RequestDispatcher rd = request.getRequestDispatcher("AuctionProducts.jsp");
													session.setAttribute("temp",temp);
													session.setAttribute("pages", noPages);
													rd.forward(request, response);
												}
												
											
											
							}
							else // if flag!=1000 i.e this servlet is called from sub category href
							{
								if(data.size()==0)
								{
									RequestDispatcher rd = request.getRequestDispatcher("NoProducts.jsp");
									rd.forward(request, response);
								}
								else
								{
								 System.out.println("servlet path= " + request.getServletPath());
								 System.out.println("request URL= " + request.getRequestURL());
								 System.out.println("request URI= " + request.getRequestURI());
								
								Integer subcatloc=new Integer(request.getParameter("flag"));
								 ServletContext context=this.getServletContext();
									RequestDispatcher requestDispatcher=context.getRequestDispatcher("/AuctionPaginationServlet2?subcatloc="+subcatloc+"");
								        
									data=null;
								requestDispatcher.forward(request, response);
								}
						
							}
						} catch (ServletException e) {
							
							e.printStackTrace();
						}
		}
			
		

	}
}