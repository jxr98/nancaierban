package servlet;

import bean.Shop;
import service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "shopLoginServlet")
public class shopLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        String shopName=request.getParameter("shopName");
        System.out.println(shopName);
        String shopPassword=request.getParameter("shopPassword");
        System.out.println(shopPassword);
        ShopService shopService=new ShopService();
        if(shopService.login(shopName,shopPassword)==true){
            System.out.println(shopService.login(shopName,shopPassword));
            HttpSession session=request.getSession();
            Shop bean=new ShopService().get(shopName);
            int shopId=bean.getShopId();
            session.setAttribute("shopIdForShops",shopId);
            response.sendRedirect("jsp/commentsOnShop.jsp");
        }
        System.out.println(shopService.login(shopName,shopPassword));
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
