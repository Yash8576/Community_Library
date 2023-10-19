package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class UserLogin
{
	public int userLoginAuthentication(String emailId, String password)
	{
		int userId = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement = connection.prepareStatement("SELECT UserId FROM [dbo].[USER_MASTER] WHERE EmailId = ? AND Password = ?");
			statement.setString(1, emailId);
			statement.setString(2, password);
			
			ResultSet rset = statement.executeQuery();
			if(rset.next())
				userId = rset.getInt("UserId");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return userId;
	}
	
	public ArrayList<String> getUserDetails(int userId)
	{
		ArrayList<String> userDetails = new ArrayList<>();
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement = connection.prepareStatement("SELECT * FROM [dbo].[USER_MASTER] WHERE UserId = ?");
			statement.setInt(1, userId);
			
			ResultSet rset = statement.executeQuery();
			rset.next();
			int i = 2;
			while(i <= 11)
			{
				String value = rset.getString(i);
				userDetails.add(value);
				i++;
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return userDetails;
	}
}
