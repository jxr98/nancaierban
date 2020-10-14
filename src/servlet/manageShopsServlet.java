package servlet;

import bean.Shop;
import service.ShopService;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "managerShopsServlet")
public class manageShopsServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        try{
            int status= Integer.parseInt(request.getParameter("status"));
            int start=Integer.parseInt(request.getParameter("start"));
            ShopService shopDao=new ShopService();
            Shop[] bean=shopDao.getShopsByStatus(status,start);
            String jsonArray="[";
            int j;
            for(j=0;j<bean.length;j++){
                if(bean[j]==null)
                    break;
            }
            for(int i=0;i<j;i++){
                jsonArray+= "{\"shopName\":\""+ bean[i].getShopName()
                        + "\",\"location\":\"" + bean[i].getLocation()
                        + "\",\"shopId\":\""+ bean[i].getShopId()
                        +"\",\"picture\":\"" + bean[i].getPicture()
                        + "\"}";
                if(i!=j-1){
                    jsonArray+=",";
                }
            }
            jsonArray+="]";
            PrintWriter out=response.getWriter();
            out.write(jsonArray);
            out.close();
        }catch(Exception e){
            e.printStackTrace();
        }
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

    }
}
