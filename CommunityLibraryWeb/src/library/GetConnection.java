package library;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class GetConnection 
{
	public Connection connection;
	public GetConnection()
	{
		if(connection==null)
		{
			try
			{
				Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
				connection = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=LibraryDB" , "sa", "sa@123");
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		}
	}
	
	public Connection setUpConnection()
	{
		return connection;
	}
	
	public int getPrimaryKey(String type)
	{
		int primaryKey = 0;
		Connection con;
		PreparedStatement statement;
		
		String query = "SELECT NEXT VALUE FOR ";
		if(type.equals("user"))
			query += "USER_ID";
		else if(type.equals("book"))
			query += "BOOK_ID";
		else if(type.equals("subscription"))
			query += "SUBSCRIPTION_ID";
		else if(type.equals("notification"))
			query += "NOTIFICATION_ID";

		try
		{
			con = new GetConnection().setUpConnection();
			statement = con.prepareStatement(query);

			ResultSet rset = statement.executeQuery();
			rset.next();
			primaryKey = rset.getInt(1);
		}
		catch(SQLException e) {
			e.printStackTrace();
		}

		return primaryKey;
	}
}