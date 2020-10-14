package servlet;

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
import bean.Comment;
import service.CommentService;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemFactory;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import service.CustomerService;

@WebServlet(name = "AddCommentServlet")
public class AddCommentServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("utf-8");
        PrintWriter out=response.getWriter();
        HttpSession httpSession=request.getSession();
        Comment comment=new Comment();
        int customerId=(int)httpSession.getAttribute("customerId");
        comment.setCustomerId(customerId);
        String customerName=new CustomerService().get(customerId).getCustomerName();
        int lala=new CustomerService().get(customerId).getCustomerId();
        comment.setCustomerName(customerName);
        System.out.println(comment.getCustomerName());
        int shopId=(int)httpSession.getAttribute("shopId");
        comment.setShopsId(shopId);
        String shopName=(String)httpSession.getAttribute("shopName");
        comment.setShopName(shopName);
        Boolean isMultipart=ServletFileUpload.isMultipartContent(request);
        int flag=0;
        String x="";
        if(!isMultipart){
            out.println("有问题");
        }
        try{
            FileItemFactory fileItemFactory=new DiskFileItemFactory();
            ServletFileUpload servletFileUpload=new ServletFileUpload(fileItemFactory);
            List<FileItem> items=servletFileUpload.parseRequest(request);
            comment.setScore(Double.parseDouble(items.get(0).getString("utf-8")));
            comment.setContent(items.get(1).getString("utf-8"));
            String pictureTemp=items.get(2).getName();
            String picture=new String(pictureTemp.getBytes("gbk"),"utf-8");
            while(flag==0) {
                x = items.get(2).getName().substring(0,Math.max(items.get(2).getName().length(),4)-4) + (int) (Math.random() * 100000);
//                System.out.println(x);
                try {
                    items.get(2).write(new File("G:/MyProjects/nancaierban/out/artifacts/web_war_exploded/img/dbimg/comment",x));
                    flag=1;
                } catch (Exception e) {
                    flag =0;
                }
            }
//            items.get(2).write(new File("G:/MyProjects/nancaierban/web/img/dbimg/comment", items.get(2).getName()));
            comment.setPicture("../img/dbimg/comment/" +x);
            SimpleDateFormat simpleDateFormat=new SimpleDateFormat("yyyy.MM.dd");
            Date date=new Date();
            String dateFormat=simpleDateFormat.format(date);
            comment.setDate(dateFormat);
            new CommentService().addComment(comment);
        }catch(Exception e){
            e.printStackTrace();
        }
        HttpSession session=request.getSession(false);
        session.setAttribute("shopId",shopId);
        response.sendRedirect("jsp/shopDetails.jsp");
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
