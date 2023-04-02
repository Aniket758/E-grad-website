<%@ page import="java.util.List" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="model.Message" %>
<%@ page import="dao.messagedao" %>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
    // Get the list of messages from the database using a MessageDAO
    messagedao messageDAO = new messagedao();
    List<Message> messages = messageDAO.getAllMessages();
%>

<table>
    <thead>
        <tr>
            <th>Message Title</th>
            <th>Message Content</th>
            <th>Date Posted</th>
            <th>View Replies</th>
        </tr>
    </thead>
    <tbody>
        <% for (Message message : messages) { %>
            <tr>
                <td><%=message.getTitle()%></td>
                <td><%= message.getContent() %></td>
                <td><%= message.getDatePosted() %></td>
                <%-- <td><%= new SimpleDateFormat("yyyy-MM-dd hh:mm:ss").format(message.getDatePosted()) %></td> --%>
                <td><a href="reply.jsp?Id=<%= message.getMessageId() %>">View Replies</a></td>
            </tr>
        <% } %>
    </tbody>
</table>
<h1>Add New Message</h1>
    <form action="AddMessageServlet" method="post">
        <label for="title">Title:</label>
        <input type="text" name="title" required>
        <br>
        <label for="content">Content:</label>
        <textarea name="content" rows="10" cols="50" required></textarea>
        <br>
        <input type="submit" value="Submit">
    </form>
</body>
</html>