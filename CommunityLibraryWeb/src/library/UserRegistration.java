package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Iterator;

public class UserRegistration
{
	public int registerNewUser(ArrayList<String> userDetails)//, String fullName, String password, String address, String districtName, String cityName, String StateName, String pinCode, String contact, String emailId, String gender)
	{
		int status = 0, userId = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			PreparedStatement statement = connection.prepareStatement("INSERT INTO [dbo].[USER_MASTER] ([UserId], [FullName], [Password], [Address], [DistrictName], [CityName], [StateName], [PinCode], [Contact], [EmailId], [Gender]) "
					+ " VALUES(?,?,?,?,?,?,?,?,?,?,?)");
			
			userId = obj.getPrimaryKey("user");
			statement.setInt(1, userId);

			int i = 2;
			Iterator<String> userDetialsIterator = userDetails.iterator();
			while(userDetialsIterator.hasNext())
			{
				String value = userDetialsIterator.next();
				statement.setString(i, value);
				i++;
			}
			
			status = statement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status==1 ? userId : 0;
	}
}
