<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%
  String bookName = request.getParameter("bookName");
  String bookAuthor = request.getParameter("bookAuthor");
  String bookGenre = request.getParameter("bookGenre");
  String bookSummary = request.getParameter("bookSummary");
  String bookImgUrl = request.getParameter("bookImgUrl");
  
  ArrayList<String> bookDetails = new ArrayList<>();
  bookDetails.add(bookName);
  bookDetails.add(bookAuthor);
  bookDetails.add(bookGenre);
  bookDetails.add(bookSummary);
  bookDetails.add(bookImgUrl);
  
  int userId = (Integer) request.getSession(false).getAttribute("userId");
  
  BookRegistration reg = new BookRegistration();
  int bookId = reg.registerNewBook(bookDetails);
  int userBookMappingStatus = reg.updateBookCount(bookId, userId);
  if(bookId > 0 && userBookMappingStatus==1)
  {
    System.out.println("Book Registration successful");
    request.getSession(false).setAttribute("result", "success");
    request.getRequestDispatcher("lendBooks.jsp").include(request, response);
  }
  else
  {
    System.out.println("error ocuured");
    request.getSession(false).setAttribute("result", "error");
    request.getRequestDispatcher("lendBooks.jsp").include(request, response);
  }
%>

<%@ page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<%@ page import="javax.servlet.*"%>
<%@ page import="library.*" %>
