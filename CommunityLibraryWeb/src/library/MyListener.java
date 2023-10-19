package library;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

public class MyListener implements ServletContextListener 
{
	@Override
	public void contextDestroyed(ServletContextEvent sce) 
	{
		System.out.println("Project undeployed");
	}

	@Override
	public void contextInitialized(ServletContextEvent sce) 
	{
//		Connection connection = null;
//		PreparedStatement ps = null;
//		String tableCreateQuery = "IF OBJECT_ID('USER_MASTER', 'U') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'TABLE EXISTS\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE TABLE USER_MASTER (\n"
//				+ "	UserId INT,\n"
//				+ "	FullName VARCHAR(4000),\n"
//				+ "	Password VARCHAR(4000),\n"
//				+ "	Address VARCHAR(4000),\n"
//				+ "	DistrictName VARCHAR(4000),\n"
//				+ "	CityName VARCHAR(4000),\n"
//				+ "	StateName VARCHAR(4000),\n"
//				+ "	PinCode VARCHAR(50),\n"
//				+ "	Contact VARCHAR(4000),\n"
//				+ "	EmailId VARCHAR(4000),\n"
//				+ "	PRIMARY KEY(USERID),\n"
//				+ ")\n"
//				+ "PRINT 'USER_MASTER TABLE CREATED SUCCESSFULLY'\n"
//				+ "END\n"
//				+ "IF OBJECT_ID('BOOK_MASTER', 'U') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'TABLE EXISTS'\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE TABLE BOOK_MASTER(\n"
//				+ "	BookId INT,\n"
//				+ "	BookName VARCHAR(4000),\n"
//				+ "	BookAuthorName VARCHAR(4000),\n"
//				+ "	BookGenre VARCHAR(4000),\n"
//				+ "	BookSynopsis VARCHAR(4000),\n"
//				+ "	BookImgUrl VARCHAR(4000),\n"
//				+ "	BookPublicationName VARCHAR(4000),\n"
//				+ "	PRIMARY KEY(BookId),\n"
//				+ ")\n"
//				+ "PRINT 'BOOK_MASTER TABLE CREATED SUCCESSFULLY'\n"
//				+ "END\n"
//				+ "IF OBJECT_ID('USER_BOOK_MAPPING', 'U') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'TABLE EXISTS'\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE TABLE USER_BOOK_MAPPING (\n"
//				+ "	BookId INT,\n"
//				+ "	UserId INT,\n"
//				+ "	Count INT,\n"
//				+ "	FOREIGN KEY(UserId) REFERENCES USER_MASTER(UserId),\n"
//				+ "	FOREIGN KEY(BookId) REFERENCES BOOK_MASTER(BookId),\n"
//				+ ")\n"
//				+ "PRINT 'USER_BOOK_MAPPING TABLE CREATED SUCCESSFULLY'\n"
//				+ "END\n"
//				+ "IF OBJECT_ID('BOOK_SUBSCRIPTION', 'U') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'TABLE EXISTS'\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE TABLE BOOK_SUBSCRIPTION (\n"
//				+ "	SubscriptionId INT,\n"
//				+ "	LenderId INT,\n"
//				+ "	BorrowerId INT,\n"
//				+ "	BookId INT,\n"
//				+ "	PRIMARY KEY(SubscriptionId),\n"
//				+ "	FOREIGN KEY(BookId) REFERENCES BOOK_MASTER(BookId),\n"
//				+ "	FOREIGN KEY(LenderId) REFERENCES USER_MASTER(UserId),\n"
//				+ "	FOREIGN KEY(BorrowerId) REFERENCES USER_MASTER(UserId),\n"
//				+ ")\n"
//				+ "PRINT 'BOOK_SUBSCRIPTION TABLE CREATED SUCCESSFULLY'\n"
//				+ "END\n";
//		
//		String sequenceCreateQuery = "IF OBJECT_ID('USER_ID', 'SO') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'SEQUENCE EXISTS'\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE SEQUENCE USER_ID\n"
//				+ "	START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999 NO CYCLE NO CACHE\n"
//				+ "PRINT 'SEQUENCE CREATED SUCCESSFULLY'\n"
//				+ "END\n"
//				+ "IF OBJECT_ID('BOOK_ID', 'SO') IS NOT NULL\n"
//				+ "BEGIN\n"
//				+ "PRINT 'SEQUENCE EXISTS'\n"
//				+ "END\n"
//				+ "ELSE\n"
//				+ "BEGIN\n"
//				+ "CREATE SEQUENCE BOOK_ID\n"
//				+ "	START WITH 1 INCREMENT BY 1 MINVALUE 1 MAXVALUE 999999999999 NO CYCLE NO CACHE\n"
//				+ "PRINT 'SEQUENCE CREATED SUCCESSFULLY'\n"
//				+ "END\n";
//
//		try
//		{
//			connection = new GetConnection().setUpConnection();
//			ps = connection.prepareStatement(tableCreateQuery);
//			ps.executeUpdate();
//
//			ps = connection.prepareStatement(sequenceCreateQuery);
//			ps.executeUpdate();
//			
//			System.out.println("All tables created successfully");
//		}
//		catch(Exception e) {
//			e.printStackTrace();
//		}
	}
}
