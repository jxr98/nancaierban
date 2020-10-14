package service;
import bean.Manager;
import dao.ManagerDao;
public class ManagerService {
    ManagerDao managerDao=new ManagerDao();

    public boolean login(String name,String password){
        return managerDao.login(name,password);
    }
}
