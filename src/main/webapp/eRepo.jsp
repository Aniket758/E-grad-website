<%if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
} %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<title>My Page</title>
	<link rel="stylesheet" href="css/e-repository.css">
</head>
<body>
	<nav>
		<ul>
			<li><a href="index.jsp" target="_blank">Home</a></li>
			<li><a href="eExam.jsp" target="_blank">e-Exam</a></li>
			<li><a href="eRepo">e-Repository</a></li>
			<li><a href="">Openforum</a></li>
			<li><a href="wall.jsp">MyWall</a></li>
		</ul>
	</nav>
	<main>
		<form method="post" action="fileuploadd" enctype="multipart/form-data">
			<label for="file">Choose a file:</label>
			<input type="file" id="file" name="file">
			<input type="hidden" id="firstName" name="firstName" value="<%=session.getAttribute("fname")%>">
			<input type="hidden" id="lastName" name="lastName" value="<%=session.getAttribute("lname")%>">
			<input type="submit" value="Upload" class="upload-btn">
			
		</form>
	</main>
	<table class="content-table">
        <thead>
          <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>File</th>
            <th>Time</th>
          </tr>
        </thead>
        <tbody>
		  <%
          
          try{   
        	Class.forName("com.mysql.cj.jdbc.Driver");
  			String url = "jdbc:mysql://localhost:3306/iwt";
  			String username = "root";
  			String password = "Aniket123";
  			Connection connection = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM up_files";
          	PreparedStatement statement = connection.prepareStatement(sql);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                  String firstName = resultSet.getString("first_name");
                  String lastName = resultSet.getString("last_name");
                  String time =resultSet.getString("date_time");
                  Blob fi=resultSet.getBlob("files");
                  
                 %>
         
              <tr>
	            <td><%=firstName %></td>
	            <td><%=lastName %></td>
	            <td><%=fi %></td>
	            <td><%=time %></td>
             </tr>
              
              <%          
              }
          }
          catch(Exception e) {
  			e.printStackTrace();
  		}
          
          %>
        </tbody>
      </table>
</body>
</html>