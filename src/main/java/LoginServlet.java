import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String uemail = request.getParameter("email");
		String upass = request.getParameter("password");
		HttpSession sess =request.getSession();
		RequestDispatcher dis  = null;
		if(uemail==null || uemail.equals("")) {
			request.setAttribute("status", "invalid email");
			dis =request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		if(upass==null || upass.equals("")) {
			request.setAttribute("status", "invalid password");
			dis =request.getRequestDispatcher("login.jsp");
			dis.forward(request, response);
		}
		try {
			// Set up the connection string
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/iwt";
			String username = "root";
			String password = "Aniket123";
			Connection con = DriverManager.getConnection(url, username, password);
			PreparedStatement pst = con.prepareStatement("select * from iwt_users where email = ? and password =?");
			pst.setString(1, uemail);
			pst.setString(2, upass);
			ResultSet rs = pst.executeQuery();
			if(rs.next()) {
				sess.setAttribute("name", rs.getString("first_name"));
				sess.setAttribute("fname", rs.getString("first_name"));
				sess.setAttribute("lname", rs.getString("last_name"));
				sess.setAttribute("emaill", rs.getString("email"));
				sess.setAttribute("ID", rs.getInt("id"));
				
				
				dis =request.getRequestDispatcher("index.jsp");
			}
			else {
				request.setAttribute("status","failed");
				dis =request.getRequestDispatcher("login.jsp");

			}
			dis.forward(request, response);
			
		}catch(Exception e) {
			e.printStackTrace();
		}
			
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
