/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.tech.blog.dao;

import com.tech.blog.entities.Category;
import com.tech.blog.entities.Post;
import java.sql.*;
import java.util.ArrayList;

/**
 *
 * @author pankaj-13162
 */
public class PostDao {

    Connection con;

    public PostDao(Connection con) {
        this.con = con;
    }

    public ArrayList<Category> getAllCategories() {
        ArrayList<Category> category = new ArrayList<>();
        try {
            String query = "Select * from Categories";
            Statement st = con.createStatement();
            ResultSet set = st.executeQuery(query);
            while (set.next()) {
                int cid = set.getInt("cid");
                String name = set.getString("name");
                String description = set.getString("description");
                Category cat = new Category(cid, name, description);
                category.add(cat);
            }

        } catch (SQLException e) {

        }
        return category;
    }

    public boolean savePost(Post post) {
        boolean flag = false;

        try {
            String query = "Insert into posts (pTitle, pContent, pcode, pPic, catId, userId) values(?, ?, ?, ?, ?, ?)";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, post.getpTitle());
            pst.setString(2, post.getpContent());
            pst.setString(3, post.getpCode());
            pst.setString(4, post.getpPic());
            pst.setInt(5, post.getCatId());
            pst.setInt(6, post.getUserId());
            pst.executeUpdate();
            flag = true;
        } catch (SQLException e) {

        }
        return flag;
    }

    //get all the posts
    public ArrayList<Post> getAllPosts() {
        ArrayList<Post> posts = new ArrayList<>();
        try {
            String query = "Select * from posts order by pid desc";
            PreparedStatement pst = con.prepareStatement(query);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int catid = set.getInt("catid");
                int userId = set.getInt("userId");

                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catid, userId);
                posts.add(p);
                
            }
        } catch (SQLException e) {

        }
        return posts;
    }

    public ArrayList<Post> getPostByCategory(int catId) {
        ArrayList<Post> posts = new ArrayList<>();
        try {
            String query = "Select * from posts where catId=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, catId);
            ResultSet set = pst.executeQuery();
            while (set.next()) {
                int pid = set.getInt("pid");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");

                Post p = new Post(pid, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                posts.add(p);
                
            }
        } catch (SQLException e) {

        }

        return posts;
    }
    
    public Post getPostById(int postId){
        Post post = null;
        try{
            String query = "Select * from posts where pid=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, postId);
            ResultSet set = pst.executeQuery();
            if(set.next()){
                int catId = set.getInt("catId");
                String pTitle = set.getString("pTitle");
                String pContent = set.getString("pContent");
                String pCode = set.getString("pCode");
                String pPic = set.getString("pPic");
                Timestamp pDate = set.getTimestamp("pDate");
                int userId = set.getInt("userId");

                post = new Post(postId, pTitle, pContent, pCode, pPic, pDate, catId, userId);
                
            }
        }catch(SQLException e){
            
        }
        return post;
    }
}
