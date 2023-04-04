<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Reply" %>
<%@ page import="dao.ReplyDao" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1"> 
<title>Insert title here</title>
</head>
<body>
		<h1>Replies</h1>
    <%
        // Get the message ID from the request parameter
        int messageId = Integer.parseInt(request.getParameter("Id"));
		//out.print(messageId);
        // Get the list of replies for the given message ID from the database
        List<Reply> replies = ReplyDao.getRepliesByMessageId(messageId);

        // Display the replies
        SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy HH:mm:ss");
        for (Reply reply : replies) {
            out.println("<p><strong>" + reply.getReplyContent() + "</strong></p>");
            out.println("<p>Posted on " + dateFormat.format(reply.getReplyDate()) + "</p>");
            out.println("<hr>");
        }
    %>
    <h1>Add New Reply</h1>
    <form action="AddReplyServlet" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" required>
        <br>
        <label for="content">Content:</label>
        <textarea name="content" rows="10" cols="50" required></textarea>
        <br>
         <input type="hidden" id="msgID" name="msgID" value="<%=messageId%>">
        
        <input type="submit" value="Submit">
    </form>
    <%-- <a href="reply.jsp?id=<%=messageId%>">Add Reply</a> --%>
    
</body>
</html>