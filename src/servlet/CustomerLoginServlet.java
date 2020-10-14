package servlet;

import service.CustomerService;
import bean.Customer;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "CustomerLoginServlet")
public class CustomerLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String customerName=request.getParameter("customerName");
        String customerPassword=request.getParameter("customerPassword");
        CustomerService customerService=new CustomerService();
        if(customerService.login(customerName,customerPassword)==true){
            HttpSession session=request.getSession();
            Customer bean=new CustomerService().get(customerName);
            int customerId=bean.getCustomerId();
            session.setAttribute("customerId",customerId);
            response.sendRedirect("index.jsp");
        }else{
            out.println("failed to login in");
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
