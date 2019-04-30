package webapp;

import com.sun.deploy.util.ArrayUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "Item")
public class Item extends HttpServlet {

    private List<String[]> list= new ArrayList<>();

    private String[] item = {"ID001","Rice","Sri Lankan Rice","500.00"};
    private String[] item2 = {"ID002","Dhal","Indian Dhal","200.00"};
    private String[] item3 = {"ID003","Potato","Lankan Potato","220.00"};
    private String[] item4= {"ID004","Cream Cracker","Biscuit","180.00"};
    String[] item5 = {"ID005","Maggie","Noodles","70.00"};

//    Item(){
//        list.add(item);
//        list.add(item2);
//        list.add(item3);
//        list.add(item4);
//        list.add(item5);
//    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String id = request.getParameter("id");
        String name = request.getParameter("name");
        String desc = request.getParameter("desc");
        String price = request.getParameter("price");
        request.setAttribute("userName",Dashboard.userName);

        String[] lst = {id,name,desc,price};

        if (!(id.isEmpty() && name.isEmpty() && desc.isEmpty() && price.isEmpty())) { // check parameters are not empty
            for (int i=0;i<lst.length;i++){
                System.out.println(lst[i]);
            }
            request.setAttribute("list",lst);    // set attribute "list" so it can be added to the item list in dashboard.jsp
            request.getRequestDispatcher("dashboard.jsp").forward(request,response);
        } else {
            request.getRequestDispatcher("dashboard.jsp").forward(request,response);
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String lst = request.getParameter("list");
        String[] list = lst.split(",");

        request.setAttribute("list",list);
        request.getRequestDispatcher("items.jsp").forward(request,response);
    }

    @Override
    protected void doPut(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doPut(req, resp);
        String[] list = req.getParameterValues("list");

        for (int i=0;i<list.length;i++){
            System.out.println(list[i]);
        }
    }

    @Override
    protected void doDelete(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        super.doDelete(req, resp);
        String[] list = req.getParameterValues("list");

        for (int i=0;i<list.length;i++){
            System.out.println(list[i]);
        }
    }

}
