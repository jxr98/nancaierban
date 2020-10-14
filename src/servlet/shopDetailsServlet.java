package servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

import bean.Comment;
import service.CommentService;
import jdk.nashorn.internal.parser.JSONParser;
import net.sf.json.JSONArray;

@WebServlet(name = "shopDetailsServlet")
public class shopDetailsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try{
            int shopId=Integer.parseInt(request.getParameter("shopId"));
            int start=Integer.parseInt(request.getParameter("start"));
            CommentService commentService=new CommentService();
            Comment[] bean=commentService.getCommentsByShopId(shopId,start);
            JSONArray jsonArray=JSONArray.fromObject(bean);
            PrintWriter out=response.getWriter();
            out.write(jsonArray.toString());
            out.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
