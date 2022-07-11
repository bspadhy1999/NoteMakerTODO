<%@page import="com.entities.Note"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.helper.FactoryProvider"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Update Page</title>
<%@include file="all_js_css.jsp" %>
</head>
<body>
<div class="container">
    	<%@include file="navbar.jsp" %>
    	<br>
    	<h1>Please Update your Note</h1>
    	<br>
    	
    	<%
    	int noteId=Integer.parseInt(request.getParameter("note_id").trim());		
		Session s = FactoryProvider.getFactory().openSession();
		Transaction tx = s.beginTransaction();
		Note note=(Note)s.get(Note.class, noteId);
    	%>
    	
<!--     	This is update form -->
	<form action="UpdateServlet" method="post">
	
		<input value="<%= note.getId() %>" name="noteId" type="hidden">
	
  		<div class="mb-3">
    		<label for="title" class="form-label">Note title</label>
    		<input required type="text" class="form-control" id="title" aria-describedby="emailHelp" placeholder="Enter your Note title" name="title" value="<%= note.getTitle() %>">
  		</div>
  		
  		<div class="mb-3">
    		<label for="content" >Note Content</label>
    		<textarea required id="content" placeholder="Enter your content here" class="form-control" style="height: 300px" name="content"><%= note.getContent() %></textarea>
  		</div>
  
  		<div class="container text-center">
  			<button type="submit" class="btn btn-success">Update</button>
  		</div>
	</form>
    
</div>

</body>
</html>