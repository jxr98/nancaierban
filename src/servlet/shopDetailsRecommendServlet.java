package servlet;

import bean.Shop;
import dao.ShopDao;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVParser;
import org.apache.commons.csv.CSVRecord;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "shopDetailsRecommendServlet")
public class shopDetailsRecommendServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json;charset=UTF-8");
        double[][] data=new double[30][30];
        try{
            int shopId= Integer.parseInt(request.getParameter("shopId"));
            BufferedReader bufferedReader=new BufferedReader(new FileReader("G:/MyProjects/nancaierban/src/recommend/shopsSimilaritiy.csv"));
            String columnNames=bufferedReader.readLine();
            String line;
            int counter=0;
            while((line=bufferedReader.readLine())!=null){
                CSVParser parser = CSVParser.parse(line, CSVFormat.DEFAULT);
                for (CSVRecord csvRecord : parser) {
                    for (int n = 0; n < 30; n++) {
                        data[counter][n] = Double.parseDouble(csvRecord.get(n));
                    }
                }
                counter++;
            }
            //取到相似度最高的序号
            int max=0;
            double temp=data[shopId][0];
            for(int i=1;i<30;i++){
                if(temp<data[shopId][i]&&data[shopId][i]<1.0){
                    max=i;
                    temp=data[shopId][i];
                }
            }
            data[shopId][max]=0;
            //取到相似度第二高的序号
            int secondMax=0;
            temp=data[shopId][0];
            for(int i=1;i<30;i++){
                if(temp<data[shopId][i]&&data[shopId][i]<1.0){
                    secondMax=i;
                    temp=data[shopId][i];
                }
            }
            data[shopId][secondMax]=0;
            //取到相似度第三高的序号
            int thirdMax=0;
            temp=data[shopId][0];
            for(int i=1;i<30;i++){
                if(temp<data[shopId][i]&&data[shopId][i]<1.0){
                    thirdMax=i;
                    temp=data[shopId][i];
                }
            }
            data[shopId][thirdMax]=0;
            //取到相似度第四高的序号
            int fourthMax=0;
            temp=data[shopId][0];
            for(int i=1;i<30;i++){
                if(temp<data[shopId][i]&&data[shopId][i]<1.0){
                    fourthMax=i;
                    temp=data[shopId][i];
                }
            }

            ShopDao shopDao=new ShopDao();
            Shop[] bean=new Shop[4];
            bean[0]=shopDao.get(max);
            bean[1]=shopDao.get(secondMax);
            bean[2]=shopDao.get(thirdMax);
            bean[3]=shopDao.get(fourthMax);
            String jsonArray="[";
            for(int i=0;i<4;i++){
                jsonArray+= "{\"shopName\":\""+ bean[i].getShopName()
                        + "\",\"location\":\"" + bean[i].getLocation()
                        + "\",\"shopId\":\""+ bean[i].getShopId()
                        +"\",\"picture\":\"" + bean[i].getPicture()
                        + "\"}";
                if(i!=4-1){
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
