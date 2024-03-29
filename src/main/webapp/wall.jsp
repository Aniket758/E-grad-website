<%@page import="connection.DbCon"%>
<%@page import="dao.IwtUserDao"%>
<%@page import="model.*"%>
<%if(session.getAttribute("name")==null){
	response.sendRedirect("login.jsp");
} %>
<%@page import="java.util.*"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Profile Page</title>
    <link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css" />
    <script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
    <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
    <link rel="stylesheet" href="css/mywall.css" />
</head>

<body>
    <nav>
        <ul>
            <li><a href="./home.html" target="_blank">Home</a></li>
            <li><a href="./e-exam.html" target="_blank">e-Exam</a></li>
            <li><a href="./e-repository.html">e-Repository</a></li>
            <li><a href="">Openforum</a></li>
            <li><a href="">MyWall</a></li>
        </ul>
    </nav>

    <div class="container emp-profile">
        <form method="post">
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-img">
                        <img src="images/profile1.png" alt="" />
                        <div class="file btn btn-lg btn-primary">
                            <%=session.getAttribute("name")%>
                            <input type="file" name="file" />
                        </div>
                    </div>
                </div>
                <div class="col-md-6">
                    <div class="profile-head">
                        <h1><%=session.getAttribute("name")%></h1>
                        <h6>Web Developer and Designer</h6>
                        <p class="proile-rating">
                            RANKINGS : <span>0.5/10</span><br />
                            EXAM : <span>20/10</span><br />
                            PASS : <span>0/10</span><br />
                            FAIL : <span>20/10</span><br />
                        </p>
                        <ul class="nav nav-tabs" id="myTab" role="tablist">
                            <li class="nav-item">
                                <a class="nav-link active" id="home-tab" data-toggle="tab" href="#home" role="tab"
                                    aria-controls="home" aria-selected="true">About</a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-md-4">
                    <div class="profile-work">
                        <p>WORK LINK</p>
                        <a href="https://leetcode.com/accounts/login/">Leetcode Account</a><br />
                        <a href="https://github.com/login">Github Account</a><br />
                        <a href="https://in.linkedin.com/">Linkedin Account</a>
                        <p>SKILLS</p>
                        Web Designer<br />
                        Web Developer<br />
                        WordPress<br />
                        WooCommerce<br />
                        PHP, .Net<br />
                    </div>
                </div>
                <div class="col-md-8">
                    <div class="tab-content profile-tab" id="myTabContent">
                        <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
                            <div class="row">
                                <div class="col-md-6">
                                </div>
                                
                            </div>
                                <%
                                /* converting session object to string */
                                HttpSession sess=request.getSession();
          						
          						String gg=(String)sess.getAttribute("emaill");
          						out.println(gg);
          try{   
        	/* Class.forName("com.mysql.cj.jdbc.Driver");
  			String url = "jdbc:mysql://localhost:3306/iwt";
  			String username = "root";
  			String password = "Aniket123";
  			Connection connection = DriverManager.getConnection(url, username, password);
            String sql = "SELECT * FROM iwt_users where email = ?";
          	PreparedStatement statement = connection.prepareStatement(sql);
          	 */
          	/* statement.setString(1,gg);
            ResultSet rst = statement.executeQuery(); */
            	
            	
            
        		IwtUserDao pd = new IwtUserDao(DbCon.getConnection());
        		IwtUser u = pd.getUserByEmail(gg) ;
        		
        		
        		
        		 
        			if (u!=null) {
        
        			%>
        				<%-- <h6>name: <%=u.getFirstName() %></h6> --%>
        			<%
        			} 
        			else {
        			out.println("There is no users");
        			}
        			%>
                  
                
         
               
                                
                            <div class="row">
					    <div class="col-md-6">
					        <label>First Name</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getFirstName() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Last Name</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getLastName() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Email</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getEmail() %></p>
					    </div>
					</div>
					<!-- Repeat for the remaining attributes -->
					<div class="row">
					    <div class="col-md-6">
					        <label>Date of Birth</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getDateOfBirth() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Mobile Number</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getMobileNumber() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Gender</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getGender() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Address</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getAddress() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>State</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getState() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>City</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getCity() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Country</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getCountry() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Pincode</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getPincode() %></p>
					    </div>
					</div>
					<div class="row">
					    <div class="col-md-6">
					        <label>Course Applied</label>
					    </div>
					    <div class="col-md-6">
					        <p><%= u.getCourseApplied() %></p>
					    </div>
					</div>

              
              <%          
              
          }
          catch(Exception e) {
  			e.printStackTrace();
  		}
          
          %>
                                   
                        </div>
                        <div class="tab-pane fade" id="profile" role="tabpanel" aria-labelledby="profile-tab">
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Experience</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Hourly Rate</label>
                                </div>
                                <div class="col-md-6">
                                    <p>10$/hr</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Total Projects</label>
                                </div>
                                <div class="col-md-6">
                                    <p>230</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>English Level</label>
                                </div>
                                <div class="col-md-6">
                                    <p>Expert</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-6">
                                    <label>Availability</label>
                                </div>
                                <div class="col-md-6">
                                    <p>6 months</p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-md-12">
                                    <label>Your Bio</label><br />
                                    <p>Your detail description</p>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </form>
    </div>
</body>

</html>