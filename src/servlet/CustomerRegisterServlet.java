package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import bean.Customer;
import service.CustomerService;

@WebServlet(name = "CustomerServlet")
public class CustomerRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out=response.getWriter();
        String customerName=request.getParameter("customerName");
        String customerPassword=request.getParameter("customerPassword");
        String gender=request.getParameter("gender");
        String phoneNumber=request.getParameter("phoneNumber");
        Customer bean=new Customer();
        bean.setCustomerName(customerName);
        bean.setPassword(customerPassword);
        bean.setGender(gender);
        bean.setPhoneNumber(phoneNumber);
        CustomerService customerService=new CustomerService();
        customerService.add(bean);
        response.sendRedirect("jsp/login.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}

