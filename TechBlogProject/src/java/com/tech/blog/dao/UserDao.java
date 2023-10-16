/**
 *
 * @author pankaj kuamr
 */
package com.tech.blog.dao;

import com.tech.blog.entities.User;
import java.sql.*;

public class UserDao {

    private Connection con;

    public UserDao(Connection con) {
        this.con = con;
    }

    //to insert user data in to database
    public boolean saveUser(User user) {
        boolean flag = false;
        try {
            String about = user.getAbout();

            String query;
            if (about == null) {
                query = "Insert into user(name, email, password, gender) values(?, ?, ?, ?)";
            } else {
                query = "Insert into user(name, email, password, gender, about) values(?, ?, ?, ?, ?)";
            }

            PreparedStatement pst = this.con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getEmail());
            pst.setString(3, user.getPassword());
            pst.setString(4, user.getGender());
            if (about != null) {
                pst.setString(5, about);
            }
            pst.executeUpdate();
            flag = true;
        } catch (SQLException e) {
        }
        return flag;
    }

    //get user by useremail and password
    public User getUserbyEmailAndPassword(String email, String password) {
        User user = null;

        try {
            String query = "Select * from user where email=? and password=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, email);
            pst.setString(2, password);
            ResultSet set = pst.executeQuery();

            if (set.next()) {
                user = new User();
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }

        } catch (Exception e) {

        }

        return user;
    }

    //Update User Detail
    public boolean updateUser(User user) {
        boolean saved = false;
        try {
            String query = "update user set name=?,about=?,profile=? where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setString(1, user.getName());
            pst.setString(2, user.getAbout());
            pst.setString(3, user.getProfile());
            pst.setInt(4, user.getId());
            pst.executeUpdate();
            saved = true;
        } catch (Exception e) {

        }
        return saved;
    }

    public User getUserDetailById(int id) {
        User user = null;
        try {
            String query = "Select * from user where id=?";
            PreparedStatement pst = con.prepareStatement(query);
            pst.setInt(1, id);
            ResultSet set = pst.executeQuery();
            if (set.next()) {
                user = new User();
                user.setName(set.getString("name"));
                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));
                user.setAbout(set.getString("about"));
                user.setDateTime(set.getTimestamp("rdate"));
                user.setProfile(set.getString("profile"));
            }
        } catch (SQLException e) {

        }
        return user;
    }
}
