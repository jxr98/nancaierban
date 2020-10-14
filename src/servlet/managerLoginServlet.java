package servlet;

import bean.Manager;
import service.ManagerService;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "managerLoginServlet")
public class managerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String managerName=request.getParameter("managerName");
        String managerPassword=request.getParameter("managerPassword");
        ManagerService managerService=new ManagerService();
        if(managerService.login(managerName,managerPassword)==true){
            HttpSession session=request.getSession();
            session.setAttribute("managerName",managerName);
            response.sendRedirect("jsp/manageShops.jsp");
        }else{
            out.println("failed to login in");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
