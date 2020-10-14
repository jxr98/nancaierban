package servlet;

import bean.Shop;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.CommentService;
import service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

@WebServlet(name = "shopRegisterServlet")
public class shopRegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        Shop bean=new Shop();

        Boolean isMultipart= ServletFileUpload.isMultipartContent(request);
        int flag=0;
        String x="";
        if(!isMultipart){
            out.println("有问题");
        }
        try {
            FileItemFactory fileItemFactory = new DiskFileItemFactory();
            ServletFileUpload servletFileUpload = new ServletFileUpload(fileItemFactory);
            List<FileItem> items = servletFileUpload.parseRequest(request);
            bean.setShopName(items.get(0).getString("utf-8"));
            bean.setPassword(items.get(1).getString("utf-8"));
            bean.setCategory(items.get(3).getString("utf-8"));
            bean.setLocation(items.get(4).getString("utf-8"));
            bean.setLocationDetail(items.get(5).getString("utf-8"));
            bean.setStatus(0);
//            String pictureTemp=items.get(4).getName();
//            String picture=new String(pictureTemp.getBytes("gbk"),"utf-8");
            while(flag==0) {
                x = items.get(6).getName().substring(0,Math.max(items.get(6).getName().length(),4)-4) + (int) (Math.random() * 100000);
                System.out.println(x);
                try {
                    items.get(6).write(new File("G:/MyProjects/nancaierban/web/img/dbimg/shop",x));
                    flag=1;
                } catch (Exception e) {
                    flag =0;
                }
            }
            bean.setPicture("../img/dbimg/shop/" +x);
            bean.setPhoneNumber(items.get(7).getString("utf-8"));
            new ShopService().add(bean);
        }catch(Exception e){
            e.printStackTrace();
        }
        response.sendRedirect("jsp/shopLogin.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
