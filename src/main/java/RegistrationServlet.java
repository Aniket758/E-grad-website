import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RegisterServlet")
public class RegistrationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// Set content type of response
		response.setContentType("text/html");

		// Retrieve form data
		String firstName = request.getParameter("fname");
		String lastName = request.getParameter("lname");
		String email = request.getParameter("email");
		String password = request.getParameter("pass");
		String dob = request.getParameter("dob");
		String mobileNumber = request.getParameter("contact");
		String gender = request.getParameter("gender");
		String address = request.getParameter("address");
		String state = request.getParameter("state");
		String city = request.getParameter("city");
		String country = request.getParameter("country");
		String pincode = request.getParameter("pincode");
		String courseApplied="";
		String[] cApplied = request.getParameterValues("course[]");
		
		if (cApplied != null) {
		    for (String course : cApplied) {
		    	courseApplied=courseApplied+" "+course;
		    }
		}
		RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
		// Validate form data
//		System.out.println(firstName);
//		System.out.println(lastName);
//		System.out.println(email);
//		System.out.println(password);
//		System.out.println(mobileNumber);
//		System.out.println(address);
//		System.out.println(state);
//		System.out.println(city);
//		System.out.println(country);
//		System.out.println(pincode);
//		System.out.println(courseApplied);
		
		
		if (firstName == null || firstName.equals("") || lastName == null || lastName.equals("") || email == null || email.equals("")
				|| password == null || password.equals("") || dob == null || dob.equals("") || mobileNumber == null || mobileNumber.equals("")
				|| gender == null || gender.equals("") || address == null || address.equals("") || state == null || state.equals("")
				|| city == null || city.equals("") || country == null || country.equals("") || pincode == null || pincode.equals("")
				|| courseApplied == null || courseApplied.equals("")) {
			request.setAttribute("status", "nope");
			System.out.println("eithi total problem");
			rd.forward(request, response);
		} else {
			// Store form data in the database
			Connection con = null;
			Statement stmt = null;
			try {
				// Load JDBC driver
				Class.forName("com.mysql.cj.jdbc.Driver");

				// Connect to the database
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "Aniket123");

				// Create SQL statement
				String sql = "INSERT INTO iwt_users (first_name, last_name, email, password, date_of_birth, mobile_number, gender, address, state, city, country, pincode, course_applied) "
						+ "VALUES ('" + firstName + "', '" + lastName + "', '" + email + "', '" + password + "', '" + dob + "', '" + mobileNumber + "', '"
						+ gender + "', '" + address + "', '" + state + "', '" + city + "', '" + country + "', '" + pincode + "', '" + courseApplied + "')";

				// Execute SQL statement
				stmt = con.createStatement();
				int rowcount = stmt.executeUpdate(sql);
				if(rowcount>=1) {
					request.setAttribute("status","success");
				}
				else {
					request.setAttribute("status","failed");
				}
				rd.forward(request, response);
				// Redirect to success page
			} catch (ClassNotFoundException e) {
				e.printStackTrace();
			} catch (SQLException e) {
				e.printStackTrace();
			} finally {
				// Close the database resources
				try {
					if (stmt != null) {
						stmt.close();
					}
					if (con != null) {
						con.close();
					}
				} catch (SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	}

