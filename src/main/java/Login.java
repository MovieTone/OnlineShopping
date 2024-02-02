
import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@SuppressWarnings("serial")
@WebServlet(name = "login", urlPatterns = { "/login" })
public class Login extends HttpServlet {

	private HttpSession session;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void service(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Session initialization
		session = request.getSession();

		// Initialization of currentUser
		String nickname = null;
		try {
			nickname = session.getAttribute("user").toString();
		} catch (NullPointerException e) {
			nickname = null;
		}

		// login.jsp
		nickname = request.getParameter("user");
		String password = request.getParameter("password");

		UserDao userDao;
		userDao = new UserDao();

		if (!(nickname == null || password == null)) {
			if (userDao.isValid(nickname, password)) {
				request.setAttribute("isValid", "true");
				session.setAttribute("user", nickname);
				session.setAttribute("loggedIn", "true");
				response.sendRedirect("home");
			} else {
				request.setAttribute("isValid", "false");
			}
		}

		if (!response.isCommitted()) {
			RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
			dispatcher.forward(request, response);
		}
	}

}
