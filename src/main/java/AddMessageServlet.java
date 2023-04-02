import model.Message;
import dao.messagedao;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * Servlet implementation class AddMessageServlet
 */
public class AddMessageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddMessageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		// Get the form data from the request
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        HttpSession sess=request.getSession();
        int k = (int)sess.getAttribute("ID");
        System.out.println(k);

        // Validate the form data
        if (title == null || title.isEmpty() || content == null || content.isEmpty()) {
            // Invalid form data, display an error message
            request.setAttribute("errorMessage", "Please fill out all fields");
            request.getRequestDispatcher("add-message.jsp").forward(request, response);
        } else {
            // Valid form data, create a new Message object and store it in the database
            messagedao messageDao = new messagedao();
            //Message message = new Message(title, content,k,""+ new SimpleDateFormat("HH:mm:ss yyyy-MM-dd"));
            Message message = new Message(title, content,k);

            System.out.println(message.getDatePosted());
            try {
				messageDao.addMessage(message);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

            // Redirect to the message list page
            response.sendRedirect("E_forum.jsp");
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
