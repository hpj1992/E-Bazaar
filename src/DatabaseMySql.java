import java.sql.*;

class DatabaseMySql
{
public static void main(String [] args)
{}

public Connection getDatabaseConnection(String ip,String port,String schema,String userid,String password)
{
Connection connection=null;
	try{
		Class.forName("com.mysql.jdbc.Driver");
	}
	catch(Exception e)
	{
		System.out.println("No Class Found"+e.toString());
	}


	try{
		connection = DriverManager.getConnection("jdbc:mysql://"+ip+":"+port+"/"+schema,userid,password); 
	}
	catch(Exception e)
	{
		System.out.println(e.toString());
	}
return connection;
}
}