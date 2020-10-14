package service;

import bean.Customer;
import dao.CustomerDao;

public class CustomerService {
    private CustomerDao dao=new CustomerDao();

    public void add(Customer bean){
        dao.add(bean);
    }

    public void updateCustomerName(Customer bean){
        dao.updateCustomerName(bean);
    }

    public void deleteCustomer(int id){
        dao.deleteCustomer(id);
    }

    public Customer get(int id){
        return dao.get(id);
    }

    public Customer get(String name){
        return dao.get(name);
    }

    public boolean passwordIsRight(String name,String password){
        return dao.login(name,password);
    }

    public boolean isExist(String name){
        return dao.get(name)!=null;
    }

    public boolean login(String name,String password){
        return dao.login(name,password);
    }

}
