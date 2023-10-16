/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.user;

import jakarta.servlet.ServletContext;
import java.sql.*;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.SQLException;

/**
 *
 * @author pankaj-13162
 */
@MultipartConfig
public class Registration extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */

            String name = request.getParameter("user_name");
            String password = request.getParameter("password");
            String email = request.getParameter("email");
            Part image = request.getPart("image"); //Part type used to store image or file
            String fileName;
            fileName = image.getSubmittedFileName();

            //JDBC connection 
            String url = "jdbc:mysql://localhost:3306/registrationServlet";
            String uname = "root";
            String pass = "";
            String insertQuery = "Insert into userdata(name, password,email,image) values (?, ?, ?, ?)";

            try {
                Thread.sleep(3000);
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con;
                con = DriverManager.getConnection(url, uname, pass);
                PreparedStatement pst = con.prepareStatement(insertQuery);
                pst.setString(1, name);
                pst.setString(2, password);
                pst.setString(3, email);
                pst.setString(4, fileName);
                InputStream inp = image.getInputStream();
                byte[] data = new byte[inp.available()];
                inp.read(data);

                ServletContext servletContext = getServletContext();
                String folderPath = servletContext.getRealPath("/") + "images";
                File folder = new File(folderPath);
                if (!folder.exists()) {
                    folder.mkdir(); // Create the folder if it doesn't exist
                }
                String filePath = folderPath + File.separator + fileName;
//                out.println(filePath);
                if (folder.canWrite()) {
//                  
                    try (FileOutputStream fos = new FileOutputStream(filePath)) {
                        fos.write(data);
//                    fos.close();
                    } catch (Exception e) {
                        // Log the exception
                        // Handle the error as needed

                    }
                } else {
                    out.println("Cannot write to the folder: " + folderPath);
                    // Handle the error as appropriate for your application
                }

                pst.executeUpdate();
                out.println("done");
            } catch (IOException | ClassNotFoundException | InterruptedException | SQLException e) {
                out.println(e);
            }

        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            processRequest(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Registration.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
