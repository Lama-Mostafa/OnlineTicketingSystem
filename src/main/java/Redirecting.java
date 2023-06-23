import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Redirecting")
public class Redirecting extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Redirecting() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		
		response.setContentType("text/html");
		String submit = request.getParameter("ss");
		
		
		if (submit.equals("login"))
		{
			request.getRequestDispatcher("Login.html").forward(request, response);
		}
		else if (submit.equals("register"))
		{
			request.getRequestDispatcher("registration.jsp").forward(request, response);
		}
		else
		{
			request.getRequestDispatcher("CancellationData.html").forward(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		doGet(request, response);
	}

}
