import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

/**
 * Servlet implementation class fileupload
 */
@WebServlet("/fileuploadd")
@MultipartConfig(maxFileSize = 16177215)
	/**
	 * @see HttpServlet#HttpServlet()
	 */
	/*
	 * public fileuploadd() { super(); // TODO Auto-generated constructor stub }
	 */
	
	public class fileuploadd extends HttpServlet {
		private static final long serialVersionUID = 1L;
	    // database connection settings
	    private String dbURL = "jdbc:mysql://localhost:3306/iwt";
	    private String dbUser = "root";
	    private String dbPass = "Aniket123";
	     
	    protected void doPost(HttpServletRequest request,
	            HttpServletResponse response) throws ServletException, IOException {
			
	    	String firstName = request.getParameter("firstName");
	        String lastName = request.getParameter("lastName");
	    	
	        SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");  
	        Date date = new Date(); 
	        String dt_time=formatter.format(date);
	        InputStream inputStream = null; // input stream of the upload file
	         
	        // obtains the upload file part in this multipart request
	        Part filePart = request.getPart("file");
	        
	        if (filePart != null) {
	            // prints out some information for debugging
	        	System.out.println("\nfile detail");
	            System.out.println(filePart.getName());
	            System.out.println(filePart.getSize());
	            System.out.println(filePart.getContentType());
	             
	            // obtains input stream of the upload file
	            inputStream = filePart.getInputStream();
	        }
	         
	        Connection con = null; // connection to the database
	        String message = null;  // message will be sent back to client
	         
	        try {
	            // connects to the database
	        	Class.forName("com.mysql.cj.jdbc.Driver");

				// Connect to the database
				con = DriverManager.getConnection("jdbc:mysql://localhost:3306/iwt", "root", "Aniket123");
	            // constructs SQL statement
	            String sql = "INSERT INTO up_files (first_name, last_name, files, date_time) values (?, ?, ?, ?)";
	            PreparedStatement statement = con.prepareStatement(sql);
				
				  statement.setString(1, firstName); 
				  statement.setString(2, lastName);
				 
	            statement.setString(4, dt_time);
	             
	            if (inputStream != null && filePart.getSize()!=0) {
	                // fetches input stream of the upload file for the blob column
	                statement.setBlob(3, inputStream);
	            }
	 
	            // sends the statement to the database server
	            int row = statement.executeUpdate();
	            if (row > 0) {
	                message = "File uploaded and saved into database";
	            }
	        } catch (SQLException ex) {
	            message = "ERROR: " + ex.getMessage();
	            ex.printStackTrace();
	        } catch (ClassNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
	            if (con != null) {
	                // closes the database connection
	                try {
	                    con.close();
	                } catch (SQLException ex) {
	                    ex.printStackTrace();
	                }
	            }
	            // sets the message in request scope
	            request.setAttribute("Message", message);
	             
	            // forwards to the message page
	            getServletContext().getRequestDispatcher("/eRepo.jsp").forward(request, response);
	        }
	    }
	
	
	
	
	
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	/*
	 * protected void doGet(HttpServletRequest request, HttpServletResponse
	 * response) throws ServletException, IOException { // TODO Auto-generated
	 * method stub
	 * response.getWriter().append("Served at: ").append(request.getContextPath());
	 * }
	 * 
	 *//**
		 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
		 *      response)
		 *//*
			 * protected void doPost(HttpServletRequest request, HttpServletResponse
			 * response) throws ServletException, IOException { // TODO Auto-generated
			 * method stub doGet(request, response); }
			 */

}
