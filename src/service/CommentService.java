package service;

import bean.Comment;
import dao.CommentDao;
import dao.CustomerDao;

public class CommentService {
    private CommentDao dao=new CommentDao();

    public void addComment(Comment bean){
        dao.add(bean);
    }

    public void deleteComment(int id){
        dao.deleteComment(id);
    }

    public Comment[] getCommentsByShopId(int shopId,int start){
        return dao.getCommentsByShopId(shopId,start);
    }

    public double getAverageScore(int shopId){
        return dao.getAverageScore(shopId);
    }

    public Comment[] getCommentsByCustomerId(int customerId,int start){
        return dao.getCommentsByCustomerId(customerId,start);
    }
}
