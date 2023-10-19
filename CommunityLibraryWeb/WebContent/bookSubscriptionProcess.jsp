<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  try
	{
    int bookId = Integer.parseInt(request.getParameter("bookId").trim());
    int userId = (Integer) request.getSession(false).getAttribute("userId");
  
    BookSubscription subs = new BookSubscription();
    int lenderId = subs.issueBookSubscription(userId, bookId);
    
    if(lenderId > 0)
    {
      System.out.println("Book Subscription successful");
      subs.sendNotificationToUser(userId, "Pending", "BP");
      subs.sendNotificationToUser(lenderId, "Pending", "LP");
      
      request.getSession(false).setAttribute("result", "success");
      request.getRequestDispatcher("borrowBooks.jsp").include(request, response);
    }
    else
    {
      System.out.println("error ocuured");
      request.getSession(false).setAttribute("result", "error");
      request.getRequestDispatcher("borrowBooks.jsp").include(request, response);
    }
	}
  catch(Exception e){
    System.out.println("error ocuured");
    request.getSession(false).setAttribute("result", "error");
    request.getRequestDispatcher("borrowBooks.jsp").include(request, response);
  	e.printStackTrace();
  }
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="library.*" %>
