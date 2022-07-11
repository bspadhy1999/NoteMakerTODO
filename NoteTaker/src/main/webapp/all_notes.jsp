<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Query"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.helper.FactoryProvider"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes: Note Taker</title>
 <%@include file="all_js_css.jsp" %>
</head>
<body>

<div class="container">
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1 class="text-uppercase">All notes:</h1>
    	
    	<% 
    	Session s=FactoryProvider.getFactory().openSession();
        Query q=s.createQuery("from Note");
    	List<Note> list=q.list();
    	for(Note note:list){
    		%>
    		
    		<div class="card" mt-3 ">
  			<img src="image/notepad.png" style="max-width: 50px" class="card-img-top m-4 mx-auto" alt="Card image cap">
  			<div class="card-body px-5">
    		<h5 class="card-title"><%=note.getTitle()%></h5>
    		<p class="card-text"><%=note.getContent()%></p>
    		<p><b class="text-primary"><%=note.getAddedDate()%></b></p>
    		<div class="container text-center mt-2">
    		<a href="DeleteServlet?note_id=<%=note.getId() %>" class="btn btn-danger">Delete</a>
    		<a href="edit.jsp?note_id=<%=note.getId() %>" class="btn btn-primary">Update</a>
    		</div>
   			
  			</div>
			</div>
    		
    		<% 
    	}
    	s.clear();
    	%>
    
    </div>


</body>
</html>