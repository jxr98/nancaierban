package recommend;

import dao.ShopDao;
import bean.Shop;
import org.apache.commons.csv.CSVFormat;
import org.apache.commons.csv.CSVPrinter;
import org.wltea.analyzer.core.IKSegmenter;
import org.wltea.analyzer.core.Lexeme;

import java.io.*;
import java.util.*;

public class cosineSimilarityItems {
    Shop[] bean=new ShopDao().getAllShops();
    public static double YUZHI = 0.2 ;

    public void saveSimilarityMatrix() throws Exception {
        List<List<Object>> lists=new ArrayList<>();
        List<Object> list=null;

        for(int i=0;i<30;i++){
            list=new ArrayList<>();
            for(int j=0;j<30;j++){
                double name=new cosineSimilarityItems().getSimilarity(new cosineSimilarityItems().words(bean[i].getShopName()),new cosineSimilarityItems().words(bean[j].getShopName()));
                double location=new cosineSimilarityItems().locationSimilarity(bean[i].getLocation(),bean[j].getLocation());
                double category=new cosineSimilarityItems().categorySimilarity(bean[i].getCategory(),bean[j].getCategory());
                double sim=0.65*name+0.25*location+0.1*category;
                list.add(sim);
            }
            lists.add(list);
        }

        String[] header=new String[30];
        for(int i=0;i<30;i++){
            header[i]="" + i;
        }
        FileOutputStream out=null;
        OutputStreamWriter osw=null;
        BufferedWriter bw=null;
        try{
            out=new FileOutputStream("src/recommend/shopsSimilaritiy.csv");
            osw=new OutputStreamWriter(out,"UTF-8");
//            bw=new BufferedWriter(osw);
            CSVFormat csvFormat=CSVFormat.EXCEL.withHeader(header);
            CSVPrinter csvPrinter=new CSVPrinter(osw,csvFormat);
            csvPrinter.printRecords(lists);
            csvPrinter.flush();
            csvPrinter.close();
        }catch (IOException e){
            e.printStackTrace();
        }
    }

    public static Vector<String> words( String str ) {
        Vector<String> str1 = new Vector<String>() ;//对输入进行分词
        try {
            StringReader reader = new StringReader( str );
            IKSegmenter ik = new IKSegmenter(reader,true);//当为true时，分词器进行最大词长切分
            Lexeme lexeme = null ;
            while( ( lexeme = ik.next() ) != null ) {
                str1.add( lexeme.getLexemeText() );
            }
            if( str1.size() == 0 ) {
                return null ;
            }
        } catch ( IOException e1 ) {
            System.out.println();
        }
        return str1;
    }

    public  double getSimilarity(Vector<String> T1, Vector<String> T2) throws Exception {
        int size = 0 , size2 = 0 ;
        if ( T1 != null && ( size = T1.size() ) > 0 && T2 != null && ( size2 = T2.size() ) > 0 ) {

            Map<String, double[]> T = new HashMap<String, double[]>();

            //T1和T2的并集T
            String index = null ;
            for ( int i = 0 ; i < size ; i++ ) {
                index = T1.get(i) ;
                if( index != null){
                    double[] c = T.get(index);
                    c = new double[2];
                    c[0] = 1;	//T1的语义分数Ci
                    c[1] = YUZHI;//T2的语义分数Ci
                    T.put( index, c );
                }
            }

            for ( int i = 0; i < size2 ; i++ ) {
                index = T2.get(i) ;
                if( index != null ){
                    double[] c = T.get( index );
                    if( c != null && c.length == 2 ){
                        c[1] = 1; //T2中也存在，T2的语义分数=1
                    }else {
                        c = new double[2];
                        c[0] = YUZHI; //T1的语义分数Ci
                        c[1] = 1; //T2的语义分数Ci
                        T.put( index , c );
                    }
                }
            }

            //开始计算，百分比
            Iterator<String> it = T.keySet().iterator();
            double s1 = 0 , s2 = 0, Ssum = 0;  //S1、S2
            while( it.hasNext() ){
                double[] c = T.get( it.next() );
                Ssum += c[0]*c[1];
                s1 += c[0]*c[0];
                s2 += c[1]*c[1];
            }
            //百分比
            return Ssum / Math.sqrt( s1*s2 );
        } else {
            throw new Exception("传入参数有问题！");
        }
    }

    public double locationSimilarity(String a,String b){
        int i=Integer.parseInt(a);
        int j=Integer.parseInt(b);
        double result=0;
        switch (Math.abs(i-j)){
            case 0 :result=1.0;break;
            case 1 :result=0.75;break;
            case 2 :result=0.5;break;
            case 3 :result=0.25;break;
        }
        return result;
    }

    public double categorySimilarity(String a,String b){
        int i=Integer.parseInt(a);
        int j=Integer.parseInt(b);
        if(i==j){
            return 1;
        }else{
            return 0.3;
        }
    }

    public static void main(String[] args) throws Exception {
        Shop[] bean=new ShopDao().getAllShops();
//        System.out.println(new cosineSimilarityItems().getSimilarity(new cosineSimilarityItems().words(bean[14].getShopName()),new cosineSimilarityItems().words(bean[13].getShopName())));
        new cosineSimilarityItems().saveSimilarityMatrix();
        String[] header=new String[30];
        for(int i=0;i<30;i++){
            header[i]="" + i;
        }
    }
}
