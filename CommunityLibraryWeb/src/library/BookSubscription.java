package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class BookSubscription
{
	public int issueBookSubscription(int userId, int bookId)
	{
		int status = 0, subscriptionId = 0, lenderId = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			PreparedStatement statement = connection.prepareStatement("INSERT INTO [dbo].[BOOK_SUBSCRIPTION] ([SubscriptionId], [LenderId], [BorrowerId], [BookId], [Status]) "
					+ " VALUES(?,?,?,?,?)");
			
			subscriptionId = obj.getPrimaryKey("subscription");
			statement.setInt(1, subscriptionId);
			
			PreparedStatement statement1 = connection.prepareStatement("SELECT UserId FROM [dbo].[USER_BOOK_MAPPING] WHERE BookId = ?");
			statement1.setInt(1, bookId);
			ResultSet rset = statement1.executeQuery();
			rset.next();

			lenderId = rset.getInt("UserId");
			statement.setInt(2, lenderId);
			statement.setInt(3, userId);
			statement.setInt(4, bookId);
			statement.setString(5, "Pending");
			
			status = statement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status==1 ? lenderId : 0;
	}
	
	public int sendNotificationToUser(int userId, String subscriptionStatus, String type)
	{
		int notificationId = 0, status = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			String notificationMsg = "";
			
			if(subscriptionStatus.equals("Pending"))
			{
				if(type.equals("LP"))
					notificationMsg = "Your book has been an intrest to someone, if you are willing to lend your book please acknowledge here";
				else if(type.equals("BP"))
					notificationMsg = "Your request is still pending, please wait for further confirmation";
			}
			else if(subscriptionStatus.equals("approved"))
			{
				if(type.equals("LA"))
					notificationMsg = "Your book will now be in the posession of others, We thank you for your contribution";
				else if(type.equals("BA"))
					notificationMsg = "Success! The owner has accepted your request, wait for the contact details to be shared";
			}
			else if(subscriptionStatus.equals("rejected"))
			{
				if(type.equals("LR"))
					notificationMsg = "Your request was passed onto the borrower";
				else if(type.equals("BR"))
					notificationMsg = "Sorry! The owner refuses to lend this book currently due to some other reasons, kindly accept our sincere apologies";
			}
			
			PreparedStatement statement = connection.prepareStatement("INSERT INTO [dbo].[USER_NOTIFICATION] ([NotificationId], [ReceiverId], [Type], [NotificationMsg], [Status])"
					+ "VALUES (?,?,?,?,?)");
			
			notificationId = obj.getPrimaryKey("notification");
			statement.setInt(1, notificationId);
			statement.setInt(2, userId);
			statement.setString(3, type);
			statement.setString(4, notificationMsg);
			statement.setString(5, "NotRead");
			
			status = statement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	public void changeNotificationStatus(int notificationId)
	{
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement  statement = connection.prepareStatement("UPDATE [dbo].[USER_NOTIFICATION] SET Status = ? WHERE NotificationId = ?");
			statement.setString(1, "Read");
			statement.setInt(2, notificationId);
			
			ResultSet rset = statement.executeQuery();
			rset.next();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
	
	public int getLendedBooksCount(int userId)
	{
		int lendedBooksCount = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement = connection.prepareStatement("SELECT Count (BookId) FROM [dbo].[USER_BOOK_MAPPING] WHERE UserId = ?");
			statement.setInt(1, userId);
			
			ResultSet rset = statement.executeQuery();
			if(rset.next())
				lendedBooksCount = rset.getInt(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return lendedBooksCount;
	}
	
	public int getBorrowedBooksCount(int userId)
	{
		int borrowedBooksCount = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement = connection.prepareStatement("SELECT Count (BookId) FROM [dbo].[BOOK_SUBSCRIPTION] WHERE BorrowerId = ?");
			statement.setInt(1, userId);
			
			ResultSet rset = statement.executeQuery();
			if(rset.next())
				borrowedBooksCount = rset.getInt(1);
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return borrowedBooksCount;
}
}
