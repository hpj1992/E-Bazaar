

import java.io.*;
import javax.servlet.*;
import java.sql.*;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class PaNyaPalSignUp
 */
public class PaNyaPalSignUp extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	
	static RequestDispatcher reqdis=null;
	static HttpSession session=null;
	
	
	
	/**
     * @see HttpServlet#HttpServlet()
     */
    public PaNyaPalSignUp() {
               // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#service(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		// TODO Auto-generated method stub
		session=request.getSession();
		String userType=request.getParameter("userType");
		String flag=request.getParameter("flag");
		String ajax=request.getParameter("ajax");
		
		
		
		System.out.println("userType:"+userType);
		System.out.println("flag:"+flag);
		System.out.println("ajax:"+ajax);
		System.out.println("cardno:"+request.getParameter("cardno"));
		
		
		boolean f=true;
		
		DatabaseMySql dm=new DatabaseMySql();
		Connection con;
		Statement st;
		ResultSet rs;
		try
		{
			con=dm.getDatabaseConnection("localhost","3306","datastore","root","root");
			st=con.createStatement();
					
			String dcountry="",dfullname="",dcardnumber="",dmm="",dyy="",dcsc="",dtelephone="",demail="",dexp_dt="",dcredit_pwd="";
			String dused="";
			String email="",pwd="";
			String	country="" ,fullname="" ,cardnumber="" ,mm="" ,yy="" ,csc="" ,billaddress="",telephone="" ,exp_dt ="" ;
			boolean eixistingUser=false;
			boolean invalidCreditcardNumber=false;
			
			String buttonCondition="Disable"; 
			session.setAttribute("buttonCondition", buttonCondition);
			
			if(userType.equals("1") && flag.equals("1")  )
			{	
				
				
				String credit=request.getParameter("credit");
				String cardno=request.getParameter("cardno");
					
					if(cardno.equals(""))
					{
						reqdis=request.getRequestDispatcher("Paypal31.jsp");
						String err="Please Enter Creditcard Details";
						session.setAttribute("errorText", err);
						String visibilityCondition="visible";
						session.setAttribute("visibilityCondition", visibilityCondition);
						reqdis.forward(request,response);
						err="";
					
					}
				
				String query="SELECT * FROM DB_CREDIT WHERE CREDITCARD_NO='"+cardno+"'";
				System.out.println(query);
				st=con.createStatement();
				rs=st.executeQuery(query);
				
				
					if (rs.next())
					{	
						dused=rs.getString(7);
						if(dused.equals("0"))	
						{
							invalidCreditcardNumber=true;
							dcountry=rs.getString(1);
							dcardnumber=rs.getString(2);
							dfullname=rs.getString(3);
							dexp_dt=rs.getObject("EXP_DATE").toString();
							dcsc=rs.getString(5);
							dcredit_pwd=rs.getString(6);
							//buttonCondition="Enable";
							//session.setAttribute("buttonCondition", buttonCondition);
							session.setAttribute("dcredit_pwd", dcredit_pwd);
						
						}
						else
						{	
							f=false;
							invalidCreditcardNumber=false;
						}	
					}
					else
					{
						f=false;
						invalidCreditcardNumber=false;
					}
					
					
					
					if(invalidCreditcardNumber==false)
					{
						String buffer="<a class='red' >"+"*Invalid Credit Card Number"+"</a>";
						System.out.println("buffeRerrorText:"+buffer);
						response.getWriter().println(buffer);
					
					}
					
					//System.out.println("dcredit_pwd"+dcredit_pwd);
					if(ajax==null )
					{
							country=request.getParameter("country");
							fullname=request.getParameter("fullname");
							cardnumber=request.getParameter("cardno");
							mm=request.getParameter("mm");
							yy=request.getParameter("yy");
							csc=request.getParameter("csc");
							billaddress=request.getParameter("billaddress");
							telephone=request.getParameter("telephone");
							email=request.getParameter("email");
						
							exp_dt ="20"+yy+"-"+mm+"-"+"25" ;
							
							//Validate the Values
							
							
							/*
							if(dcountry.equals(country))
							{
								String buffer="<a class='red'>"+""+"</a>";
								response.getWriter().println(buffer);
							}*/
							
							System.out.println(dcsc+" "+csc+" \ndtexpdt:"+dexp_dt+" expdt:"+exp_dt+" \nfnm "+dfullname+" "+fullname);
							String errorText="";
							
							
							if(!(dcsc.equals(csc)))
							{
								errorText="";
								errorText="*Invalid CSC Number";
								System.out.println("errorText:"+errorText);
							}
							if(!(dexp_dt.equals(exp_dt)))
							{			
								errorText="";
								errorText="*Invalid Expiry Date";
								System.out.println("errorText:"+errorText);
							}
							if(!(dfullname.equals(fullname)))
							{	
								errorText="";
								errorText="*Invalid Full Name";
								System.out.println("errorText:"+errorText);
							}
							if(invalidCreditcardNumber==false)
							{
								errorText="*Invalid Credit Card Number";
								System.out.println("errorText:"+errorText);
							}
							
											
							if(!(errorText.equals("")) || invalidCreditcardNumber==false)
							{
								reqdis=request.getRequestDispatcher("Paypal31.jsp");
								session.setAttribute("errorText", errorText);
								String visibilityCondition="visible";
								session.setAttribute("visibilityCondition", visibilityCondition);
								reqdis.forward(request,response);
								errorText="";
							}
							
							
							
						if(f==true)
						{
							//only execute follow update if all the deytails you have fetched is right
							
							//check that whether user email is entered as seller account or not?
							String query1="SELECT * FROM PPUSER_DETAILS WHERE USER_EMAIL='"+email+"'";
							System.out.println(query1);
							st=con.createStatement();
							rs=st.executeQuery(query1);
							
							
								if (rs.next())
								{		
									eixistingUser=true;
								}
								else
								{
									eixistingUser=false;
								}
				
							
							
							reqdis=request.getRequestDispatcher("Paypal32.jsp");
							session.setAttribute("eixistingUser",eixistingUser);
							
							
							session.setAttribute("country",country);
							session.setAttribute("fullname",fullname);
							session.setAttribute("cardno", cardnumber);
							session.setAttribute("exp_dt",exp_dt);
						    session.setAttribute("csc",csc);
						    session.setAttribute("billaddress",billaddress);
						    session.setAttribute("telephone",telephone);
							
							session.setAttribute("email", email);
							reqdis.forward(request,response);
						}
					}
			}
			if(userType.equals("1")  && flag.equals("2"))
			{
				String credit_pwd=request.getParameter("creditpwd");
				pwd=request.getParameter("pwd1");
				
				//retrival of all the fields from previous page
				country =(String)session.getAttribute("country");
				fullname =(String)session.getAttribute("fullname");
				cardnumber =(String)session.getAttribute("cardno");
				exp_dt =(String)session.getAttribute("exp_dt");
				csc =(String)session.getAttribute("csc");
				billaddress =(String)session.getAttribute("billaddress");
				telephone =(String)session.getAttribute("telephone");
				
				email =(String)session.getAttribute("email");
		
				//to check whether he is existing user or not
				eixistingUser=(Boolean)session.getAttribute("eixistingUser");
				
				//varify creditcard password
				/*String query2="SELECT CREDITCARD_PASSWORD FROM DB_CREDIT WHERE CREDITCARD_NO='"+cardnumber+"'";
				System.out.println(query2);
				st=con.createStatement();
				rs=st.executeQuery(query2);
				
				if(rs.next())
				{
					dcredit_pwd=rs.getString(1);
				}
				*/
				
				dcredit_pwd=(String)session.getAttribute("dcredit_pwd");
				System.out.println("credit_pwd:"+dcredit_pwd+" "+credit_pwd);
				
				if(dcredit_pwd.equals(credit_pwd) && !(credit_pwd.equals("")) )
				{	}
				else
				{
					String buffer="<a class='red' >"+"*Invalid Creditcard Password"+"</a>";
					System.out.println(buffer);
					response.getWriter().println(buffer);
				}
								
				if(ajax==null)
				{
					int temp=0;
					System.out.println("Entered in Payment");
					/*String query2 = "SELECT BUYERPAL_PROC('"+email+"','"+pwd+"','"+country+"','"+cardnumber+"','"+fullname+"','"+exp_dt+"','"+csc+"','"+credit_pwd+"','"+telephone+"')"; 
					System.out.println(query2);
					st=con.createStatement();
					rs=st.executeQuery(query2);
						if(rs.next())
						{
							temp=rs.getInt(1);
							System.out.println("User Value:"+temp);
						}*/
					
					CallableStatement cs = con.prepareCall("{CALL BUYERPAL_PROC(?,?,?,?,?,?,?,?,?,?,?)}");
					
					 // register input parameters
					cs.setString(2, email);
				    cs.setString(3, pwd);
				    cs.setString(4, country);
				    cs.setString(5, cardnumber);
				    cs.setString(6, fullname);
				    cs.setString(7, exp_dt);
				    cs.setString(8, csc);
				    cs.setString(9, credit_pwd);
				    cs.setString(10,telephone);
				    cs.setString(11,billaddress);
				    
				    // regsiter ouput parameters
					cs.registerOutParameter(1, Types.INTEGER);
					 // Procedure execution
				    cs.execute();
				    
				    temp=cs.getInt(1);
					System.out.println("User Value:"+temp);
					cs.close();
					
				    	if(temp==0)
						{
							String errorText=""; 
							errorText="*Invalid PaNyaPal Password";
							System.out.println("errorText:"+errorText);
							session.setAttribute("errorText", errorText);
							String visibilityCondition="visible";
							session.setAttribute("visibilityCondition", visibilityCondition);
							reqdis=request.getRequestDispatcher("Paypal32.jsp");
							reqdis.forward(request,response);
									
						}
						else
						{
							reqdis=request.getRequestDispatcher("Paypal33.jsp");
							reqdis.forward(request,response);
						}
						
						
						
						
						
						//old logic
					/*	String query="SELECT CREDITCARD_PASSWORD FROM DB_CREDIT WHERE CREDITCARD_NO='"+cardnumber+"'";
						System.out.println(query);
						st=con.createStatement();
						rs=st.executeQuery(query);
						
						if(rs.next())
						{
							dcredit_pwd=rs.getString(1);
						}
						
						credit_pwd="11";
						System.out.println("credit_pwd:"+dcredit_pwd+" "+credit_pwd);
						
						System.out.println("0");
						
						if(dcredit_pwd.equals(credit_pwd) && !(dcredit_pwd.equals("")))
						{	
							System.out.println("1");
							try
							{
								System.out.println("2");
								
								if(eixistingUser==true)
								{
									System.out.println("3");
									String query1 = "CALL BUYERPAL_PROC(@FF,'"+email+"','"+pwd+"','"+country+"','"+cardnumber+"','"+fullname+"','"+exp_dt+"','"+csc+"','"+credit_pwd+"','"+telephone+"'  )"; 
									st=con.createStatement();
									st.executeQuery(query1);
		
									System.out.println("4");
									rs=st.executeQuery("SELECT @FF");
										if(rs.next())
										{
											int temp=rs.getInt(1);
											System.out.println("User Value:"+temp);
										}
									
								}
								else
								{
									String query4="INSERT INTO `datastore`.`ppuser_details` (`USER_EMAIL`, `PASSWORD`, `COUNTRY`, `CREDITCARD_NO`, `HOLDER_NAME`, `EXP_DATE`, `CSC`, `CREDITCARD_PASSWORD`, `PHONE`) VALUES ('"+email+"','"+pwd+"','"+country+"','"+cardnumber+"','"+fullname+"','"+exp_dt+"','"+csc+"','"+credit_pwd+"','"+telephone+"' )";
									System.out.println(query4);
									st.executeUpdate(query4);
								
								
								}
							}
							catch(Exception e)
							{
								System.out.println(e);
								
							}
							reqdis=request.getRequestDispatcher("Paypal33.jsp");
							reqdis.forward(request,response);
						
						
						}
						else
						{
							
							
							String buffer="<a class='red' >"+"**Invalid Creditcard Password"+"</a>";
							System.out.println(buffer);
							response.getWriter().println(buffer);
						
							
						}*/
				}
			}
			
			if(userType.equals("2"))
			{
								
				String payeename="", bankaccountno="",bankname="",city="",branch="",micr="";
				String iagree="";
				String dpayyename="",dbankaccountno="",dbankname="",dcity="",dbranch="",dmicr="";
				String errorText="";
				boolean micrCorrectness=false;
				boolean accountnoCorrectness=false;
				
				
				if(true)
				{
				payeename=request.getParameter("payeename");
				bankaccountno=request.getParameter("bankaccountno");
				bankname=request.getParameter("bankname");
				city=request.getParameter("city");
				branch=request.getParameter("branch");
				micr=request.getParameter("micr");
				
				email=request.getParameter("email");
				pwd=request.getParameter("pwd");
				
				iagree=request.getParameter("iagreecheckbox");
				if(iagree==null){ iagree="";}
				
				//only execute follow update if all the deytails you have fetched is write
					
				
				
				}//temporary ends
				
				if(flag.equals("1"))
					{
						String bname=request.getParameter("bname");
						String query1="SELECT DISTINCT CITY FROM DB_ACC WHERE BANK_NAME='"+bname+"'";
						System.out.println(query1);
						st=con.createStatement();
						rs=st.executeQuery(query1);
						
						String buffer="<select id=\"ccity\"  >";  //onchange="fetchBranch(this.value,v4-1.value)
						
					    buffer=buffer+"<option selected=\"selected\"></option>";
						while(rs.next())
						{
							buffer=buffer+"<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>";
											
						}
						buffer=buffer+"</select>";
						System.out.println(buffer);
						response.getWriter().println(buffer);
					}
					if(flag.equals("2"))
					{
						String bname=request.getParameter("bbname");
						String ct=request.getParameter("ct");
						String query2="SELECT DISTINCT BRANCH FROM DB_ACC WHERE BANK_NAME='"+bname+"' and CITY='"+ct+"'";
						System.out.println(query2);
						st=con.createStatement();
						rs=st.executeQuery(query2);
						
						String buffer="<select id=\"bbranch\" >";
						
					    buffer=buffer+"<option selected=\"selected\"></option>";
						while(rs.next())
						{
							buffer=buffer+"<option value=\""+rs.getString(1)+"\">"+rs.getString(1)+"</option>";
											
						}
						buffer=buffer+"</select>";
						System.out.println(buffer);
						response.getWriter().println(buffer);
					
						
					}
					if(flag.equals("3"))
					{	
						String tempMail=request.getParameter("eUser");
						String query3="SELECT USER_EMAIL FROM PPUSER_DETAILS WHERE USER_EMAIL='"+tempMail+"'";
						System.out.println(query3);
						st=con.createStatement();
						rs=st.executeQuery(query3);
						String buffer="";
						if(rs.next())
						{
							buffer="Yes";		
						}
						System.out.println("eUser:"+buffer);
						response.getWriter().println(buffer);
							
					}
								
				
				if(ajax==null)
				{
					
					if(iagree.equals("1"))
					{
							//due to limitation// String query3="SELECT * FROM DB_ACC WHERE MICR_CODE='"+micr+"'";
							String query3="SELECT * FROM DB_ACC WHERE ACC_NO='"+bankaccountno+"'";
							System.out.println(query3);
							st=con.createStatement();
							rs=st.executeQuery(query3);
							
							if(rs.next())
							{	
								dbankname=rs.getString(3);
								dcity=rs.getString(4);
								dbranch=rs.getString(5);
								dmicr=rs.getString(6);
								
								//limitation
								dpayyename=rs.getString(1);
								dbankaccountno=rs.getString(2);
								
								if(dbankname.equals(bankname) && dcity.equals(city) && dbranch.equals(branch))
								{
									//micr code is correct
									if(dmicr.equals(micr)){	micrCorrectness=true;} else{ micrCorrectness=false;}
									
									//limitation
									if(dpayyename.equals(payeename) && dbankaccountno.equals(bankaccountno))
									{
										//bank account is verified
										accountnoCorrectness=true;
									}
									else
									{
										//bank account is not there in bank
										accountnoCorrectness=false;
									}
								}
								else
								{	
									//check your micr code and bank/branch details
									micrCorrectness=false;
								}	
							}
							else
							{
								//check your micr code and bank/branch details
								micrCorrectness=false;
							}
							
							if(micrCorrectness==false || accountnoCorrectness==false)
							{
								reqdis=request.getRequestDispatcher("Paypal51.jsp");
								errorText="*Check your MICR code and Bank/Branch details";
								
								//limitation
								if(accountnoCorrectness==false)
								{
									errorText="";
									errorText="*Check your Bank Account details";
									
								}
								
								System.out.println("errorTextS:"+errorText);
								session.setAttribute("errorText", errorText);
								String visibilityCondition="visible";
								session.setAttribute("visibilityCondition", visibilityCondition);
								reqdis.forward(request,response);
								errorText="";
						
							}
							else
							{
							//transfer the data into database
								CallableStatement cs = con.prepareCall("{CALL SELLERPAL_PROC(?,?,?,?,?,?,?,?,?)}");
								
								 // register input parameters
								cs.setString(2, email);
							    cs.setString(3, pwd);
							    cs.setString(4, payeename);
							    cs.setString(5, bankaccountno);
							    cs.setString(6, bankname);
							    cs.setString(7, city);
							    cs.setString(8, branch);
							    cs.setString(9, micr);
							    
							    // regsiter ouput parameters
								cs.registerOutParameter(1, Types.INTEGER);
								 // Procedure execution
							    cs.execute();
							    
							    int temp=cs.getInt(1);
								System.out.println("Seller Value:"+temp);
								cs.close();
								
							    	if(temp==0)
									{
							    		//existing user with wrong password
										errorText=""; 
										errorText="*Invalid PaNyaPal Password";
										System.out.println("errorText:"+errorText);
										session.setAttribute("errorText", errorText);
										String visibilityCondition="visible";
										session.setAttribute("visibilityCondition", visibilityCondition);
										reqdis=request.getRequestDispatcher("Paypal51.jsp");
										reqdis.forward(request,response);
												
									}
									else
									{
										reqdis=request.getRequestDispatcher("Paypal52.jsp");
										reqdis.forward(request,response);
									}
							
								
								
							}
					}
					else
					{	
						errorText=""; 
						errorText="Agree to our terms and condition to get free PaNyaPal account";
						System.out.println("errorText:"+errorText);
						session.setAttribute("errorText", errorText);
						String visibilityCondition="visible";
						session.setAttribute("visibilityCondition", visibilityCondition);
						reqdis=request.getRequestDispatcher("Paypal51.jsp");
						reqdis.forward(request,response);
					
						
					}
				}//end of ajax if 
			}//end of usertype=2

			st.close();
			con.close();
		}
		catch(Exception e)
		{
			System.out.println("Bigend Error"+e);
		}
	
	
	
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
