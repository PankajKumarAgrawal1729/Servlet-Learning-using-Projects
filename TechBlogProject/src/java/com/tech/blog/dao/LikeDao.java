package com.tech.blog.dao;
import java.sql.*;
/**
 * @author pankaj kumar
 */
public class LikeDao {
    private int pid;
    private int uid;
    Connection con;

    public LikeDao(Connection con) {
        this.con = con;
    }
    
    
    public boolean insertLike(int pid, int uid){
        boolean inserted = false;
        try{
            String query = "Insert INTO likes(pid, uid) values(?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            inserted = true;
        }catch(SQLException e){
            
        }
        return inserted;
    }
    
    public int getLikesCount(int pid){
        int count = 0;
        try{
            String query = "Select count(*) as likeCount from likes where pid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            ResultSet set = pst.executeQuery();
            if(set.next()){
               
                count = set.getInt("likeCount");
            }
            
        }catch(SQLException e){
            
        }
        return count;
    }
    
    public boolean checkAlreadyLikedByUser(int pid, int uid){
        boolean liked = false;
        try{
            String query = "select * from likes where pid=? and uid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            ResultSet set = pst.executeQuery();
            if(set.next()){
                liked = true;
            }
        }catch(SQLException e){
            
        }
        return liked;
    }
    
    public boolean deleteLike(int pid, int uid){
        boolean deleted = false;
        try{
            String query = "DELETE from likes where pid=? and uid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, pid);
            pst.setInt(2, uid);
            pst.executeUpdate();
            deleted = true;
        }catch(SQLException e){
            
        }
        return deleted;
    }
}
