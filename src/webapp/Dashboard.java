package webapp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.Arrays;
import java.util.Enumeration;

@WebServlet(name = "Dashboard")
public class Dashboard extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String username = request.getParameter("user");
        String password = request.getParameter("pass");

        if(username.equals("admin") && password.equals("root")){
            request.getSession().setAttribute("userName",username);
            Cookie cookieUserName = new Cookie("app.username", username);
            Cookie cookiePassword = new Cookie("app.password", password);
            response.addCookie(cookieUserName);
            response.addCookie(cookiePassword);
            request.getRequestDispatcher("/dashboard.jsp").forward(request,response);
        }else {
            request.setAttribute("userName",username);
            request.setAttribute("password",password);
            request.getRequestDispatcher("/index.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        System.err.println("+++++++++++++++++++++++++++++++++++++++++");
        logOut(request,response);
    }

    @Override
    protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.service(req, resp);


//        if (req.getParameter("_METHOD").equals("LOGOUT")){
//            doGet(req,resp);
//        }

    }

    private void logOut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException{
        req.getSession().invalidate();
        resp.sendRedirect("index.jsp");

    }

}
