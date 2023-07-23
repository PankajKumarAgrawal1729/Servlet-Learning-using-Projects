/**
 *
 * @author pankaj kumar
 */
package com.pankaj.requestDispatcher;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;

public class RequestDispatcherDemo extends HttpServlet {

    @Override
    public void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        
        out.println("<h2>Welcome to Request Dispatcher</h2>");
        
        String name = req.getParameter("user_name");
        String password = req.getParameter("user_password");
        String email = req.getParameter("user_email");
        String gender = req.getParameter("user_gender");
        String course = req.getParameter("user_course");
        String cond = req.getParameter("condition");
        
        if(name.equals("")){
            out.println("<h2>Please Enter the name</h2>");
        }
        else if(password.equals("")){
            out.println("<h2>Please Enter Password</h2>");
        }
        else if(email.equals("")){
            out.println("<h2>Please Enter Email</h2>");
        }
        else if(gender == null){
            out.println("<h2>Please select your gender</h2>");
        }
        else if(cond == null){
            out.println("<h2>You have not accepted the terms and conditions</h2>");
            //here we include output of index.html
            
            //get Object of Request Dispatcher
            
            RequestDispatcher rd = req.getRequestDispatcher("index.html");
            
//            include
            rd.include(req, res);
            
           
        }
        else {
            out.println("<h2>Name: " + name + "</h2>");
            out.println("<h2>Email: " + email + "</h2>");
            out.println("<h2>Gender: " + gender + "</h2>");
            out.println("<h2>Course: " + course + "</h2>");
            
            //JDBC
            
            //save to db
            RequestDispatcher rd = req.getRequestDispatcher("success");
            rd.forward(req, res);
        } 
    }
}
