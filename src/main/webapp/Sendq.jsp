<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
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
  // Set up the database connection
  String url = "jdbc:mysql://localhost:3306/mydatabase";
  String username = "myusername";
  String password = "mypassword";
  Connection conn = DriverManager.getConnection(url, username, password);

  // Retrieve the data from the database
	String sql = "SELECT SUBSTRING_INDEX(choices, ',', 1) AS choice1,SUBSTRING_INDEX(SUBSTRING_INDEX(choices, ',', 2), ',', -1) AS choice2,SUBSTRING_INDEX(SUBSTRING_INDEX(choices, ',', 3), ',', -1) AS choice3,SUBSTRING_INDEX(choices, ',', -1) AS choice4";  Statement stmt = conn.createStatement();
  ResultSet rs = stmt.executeQuery(sql);

  // Build arrays of data
  String[] questions = new String[100];
  String[][] choices = new String[100][4];
  int[] correctAnswers = new int[100];
  int i = 0;
  while (rs.next()) {
    // Store question
    questions[i] = rs.getString("question");
    // Store choices
    choices[i][0] = rs.getString("choice1");
    choices[i][1] = rs.getString("choice2");
    choices[i][2] = rs.getString("choice3");
    choices[i][3] = rs.getString("choice4");
    // Store correct answer
    correctAnswers[i] = rs.getInt("correctAnswer");
    i++;
  }

  // Generate the JavaScript file
  String js = "var questions = " + Arrays.toString(questions) + ";\n";
  js += "var choices = " + Arrays.deepToString(choices) + ";\n";
  js += "var correctAnswers = " + Arrays.toString(correctAnswers) + ";\n";
  out.println("<script src='myjsfile.js'></script>");
  out.println("<script>" + js + "</script>");

  // Close the database connection
  rs.close();
  stmt.close();
  conn.close();
%>

		
</body>
</html>