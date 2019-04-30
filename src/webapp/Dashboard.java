package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "Dashboard")
public class Dashboard extends HttpServlet {
    public static String userName;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");
        userName=username;
        if(username.equals("admin") && password.equals("root")){
            request.setAttribute("userName",username);
            request.getRequestDispatcher("/dashboard.jsp").forward(request,response);
        }else {
            request.setAttribute("userName",username);
            request.setAttribute("password",password);
//            response.sendRedirect("/login");
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
