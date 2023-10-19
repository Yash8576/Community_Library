package library;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Iterator;

public class BookRegistration
{
	public int registerNewBook(ArrayList<String> bookDetails)
	{
		int status = 0, bookId = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement1 = connection.prepareStatement("SELECT (BookId) FROM [dbo].[BOOK_MASTER] WHERE BookName = ? AND BookAuthorName = ?");
			statement1.setString(1, bookDetails.get(0));
			statement1.setString(2, bookDetails.get(1));
			
			ResultSet rset = statement1.executeQuery();
			PreparedStatement statement;
			if(rset.next())
			{
				bookId = rset.getInt("BookId");
				return bookId;
			}
			else
			{
				statement = connection.prepareStatement("INSERT INTO [dbo].[BOOK_MASTER] ([BookId], [BookName], [BookAuthorName], [BookGenre], [BookSummary], [BookImgUrl])"
						+ "VALUES(?,?,?,?,?,?)");

				bookId = obj.getPrimaryKey("book");
				statement.setInt(1, bookId);
				
				int i = 2;
				Iterator<String> bookDetailsIterator = bookDetails.iterator();
				while(bookDetailsIterator.hasNext())
				{
					String value = bookDetailsIterator.next();
					statement.setString(i, value);
					i++;
				}

				status = statement.executeUpdate();
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}

		return status==1 ? bookId : 0;
	}
	
	public int updateBookCount(int bookId, int userId)
	{
		int count = 0, status = 0;
		try
		{
			GetConnection obj = new GetConnection();
			Connection connection = obj.setUpConnection();
			
			PreparedStatement statement1 = connection.prepareStatement("SELECT Count FROM [dbo].[USER_BOOK_MAPPING] WHERE BookId = ? AND UserId = ?");
			statement1.setInt(1, bookId);
			statement1.setInt(2, userId);
			
			ResultSet rset = statement1.executeQuery();
			PreparedStatement statement;
			if(rset.next())
			{
				count = rset.getInt("Count");
				statement = connection.prepareStatement("UPDATE [dbo].[USER_BOOK_MAPPING] SET Count = ? WHERE BookId = ? AND UserId = ?");
				statement.setInt(1, count+1);
				statement.setInt(2, bookId);
				statement.setInt(3, userId);
			}
			else
			{
				statement = connection.prepareStatement("INSERT INTO [dbo].[USER_BOOK_MAPPING] ([BookId], [UserId], [Count]) VALUES (?,?,?)");
				statement.setInt(1, bookId);
				statement.setInt(2, userId);
				statement.setInt(3, 1);
			}
			status = statement.executeUpdate();
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
}
