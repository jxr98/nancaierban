package service;

import bean.Shop;
import dao.ShopDao;

public class ShopService {
    private ShopDao dao=new ShopDao();

    public void add(Shop bean){
        dao.add(bean);
    }

    public void updateShopName(Shop bean){
        dao.updateShopName(bean);
    }

    public void deleteShop(int id){
        dao.deleteShop(id);
    }

    public Shop get(int id){
        return dao.get(id);
    }

    public Shop get(String name){
        return dao.get(name);
    }

    public boolean login(String name,String password){
        return dao.login(name,password);
    }

    public Shop[] getShopsByCategory(String category,int start){
        return dao.getShopsByCategory(category,start);
    }

    public Shop[] getShopsByStatus(int status,int start){
        return dao.getShopsByStatus(status,start);
    }

    public void updateShopStatus(int shopId){
        dao.updateShopStatus(shopId);
    }
}
