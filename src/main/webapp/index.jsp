
<%@page import="connection.DbCon"%>
<%@page import="dao.IwtUserDao"%>
<%@page import="model.*"%>
<%@page import="java.util.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Silicon Institute of Technology</title>
<link rel="stylesheet" href="css/style-index.css">
    <link rel="preconnect" href="https://fonts.googleapis.com"><link rel="preconnect" href="https://fonts.gstatic.com" crossorigin><link href="https://fonts.googleapis.com/css2?family=Poppins:wght@200;300;400;500;600;700&family=Quicksand:wght@600&family=Roboto:ital,wght@0,400;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

    <!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous"> -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css">
    <style>
    	.header{
    min-height: 100vh;
    width: 100%;
    background-image: linear-gradient(rgba(89, 130, 251, 0.7),rgba(21, 32, 77, 0.7)),url(images/banner3.jpg);
    background-position: center;
    background-size: cover;
    position: relative;
}
    </style>
</head>
<body>
	<section class="header">
        <nav>
            <a href="#"><img src="images/logo6.png" alt=""></a>
            <div class="nav-links" id="navLinks">
                <i class="fa fa-times" aria-hidden="true" onclick="hideMenu()"></i>
                <ul>
                    
             
                    <li><a href="<%if(session.getAttribute("name")==null){%>login.jsp<% } else {%>E_forum.jsp <%}%> ">Opennnnforum</a></li>
                    <li><a href="<%if(session.getAttribute("name")==null){%>login.jsp<% } else {%>wall.jsp <%}%> ">MyWall</a></li>
                    <li><a href="<%if(session.getAttribute("name")==null){%>login.jsp<% } else {%>eRepo.jsp <%}%> ">E-Repo</a></li>
                    <li><a href="<%if(session.getAttribute("name")==null){%>login.jsp<% } else {%>eExam.jsp <%}%> ">E-Exam</a></li>
                    <%if(session.getAttribute("name")==null){%>
	                    <li><a href="login.jsp">SIGNIN</a></li>
	                    <li><a href="registration.jsp">REGISTER</a></li>
                    <% }%>
                    <%if(session.getAttribute("name")!=null){%> HII <%=session.getAttribute("name")%><% }%> 
                    <%if(session.getAttribute("name")!=null){%> HII <%=session.getAttribute("ID")%><% }%>
                    <li class="nav-item mx-0 mx-lg-1 bg-danger"><a
						<%-- class="nav-link py-3 px-0 px-lg-3 rounded" href="logout"><%=session.getAttribute("name") %></a></li> --%>
						<%if(session.getAttribute("name")!=null){%>
						class="nav-link py-3 px-0 px-lg-3 roundedlogout" href="logout"> Logout</a></li>
						<% }%>
                </ul>
            </div>
            <form class="d-flex"> <input class="form-control mr-2" type="search" placeholder="Search" aria-label="Search"> <button type="button" class="btn btn-danger">Search</button> </form>
            <i class="fa fa-bars" aria-hidden="true" onclick="showMenu()"></i>
        </nav>
        <div class="text-box">
            <h1>Best Examination Portal</h1>
            <p>onsectetur adipisicing elit. Amet voluptatibus, repellat, nulla officia, necessitatibus eveniet <br> impedit nisi blanditiis quod atque veritatis.</p>
            <a href="" class="hero-btn">Visit Us to know more</a>
            
        </div>
       
        
		        <%-- <%
		IwtUserDao pd = new IwtUserDao(DbCon.getConnection());
		List<IwtUser> users = pd.getAllUsers();
		
		%>
		
		 <%
			if (!users.isEmpty()) {
				for (IwtUser p : users) {
			%>
			<h6>name: <%=p.getFirstName() %></h6>
			<h3>DOB: <%=p.getDateOfBirth() %></h3>
			<%
			}
			} else {
			out.println("There is no users");
			}
			%> --%>
			
		
    </section>

    <!-- _____________________________________________________________ -->
    <section class="course">
        <h1>Exam we offer</h1>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Provident, odio!</p>
        <div class="row">
            <div class="course-col">
                <h3>Intermediate</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo modi architecto magni magnam, quod veritatis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, corporis.</p>
            </div>
            <div class="course-col">
                <h3>Degree</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo modi architecto magni magnam, quod veritatis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, corporis.</p>
            </div>
            <div class="course-col">
                <h3>Post Graduation</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nemo modi architecto magni magnam, quod veritatis! Lorem ipsum dolor sit amet consectetur adipisicing elit. Deserunt, corporis.</p>
            </div>
        </div>
    </section>
    <footer>
        <a href="#">About Us</a>
        <a href="#">Contact Us</a>
        <a href="#">Address</a>
        <a href="#">Privacy Policy</a>
        <a href="#">&copy;2022 | e-Grad</a>
    </footer>

    <script>
        var navLinks =  document.getElementById("navLinks");
        function showMenu(){
            navLinks.style.right = "0";
        }
        function hideMenu(){
            navLinks.style.right = "-200px";
        }
    </script>
</body>
</html>