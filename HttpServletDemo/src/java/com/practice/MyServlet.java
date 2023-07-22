/**
 *
 * @author pankaj Kumar
 */

package com.practice;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

public class MyServlet extends HttpServlet{
    
    public void doGet(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException{
        System.out.println("This is a get method");
        res.setContentType("text/html");
        PrintWriter out = res.getWriter();
        out.print("<h1>This is a get method of my servlet</h1>");
        out.print("<h1> Date is: " + new Date().toString() + "</h1>");
    }
}
