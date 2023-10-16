<%-- 
    Document   : profile
    Created on : 13-Sept-2023, 1:38:07 am
    Author     : pankaj-13162
--%>
<%@page import="com.tech.blog.entities.User" %> 
<%@page import="com.tech.blog.entities.Message" %>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page errorPage="error_handling_page.jsp" %>

<% 
    User user = (User)session.getAttribute("currentuser"); 
if(user == null){
response.sendRedirect("login-page.jsp");
    }
    
%> 
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">      
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styles.css"/>
        <style>
              body{
                background: url("images/blog_wallpaper.jpg");
                background-size: cover;
                background-attachment: fixed;
            }
            .banner-background{
                clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
            }
        </style>
        <title>Profile Page</title>
    </head>
    <body>

        <!--navbar start-->

        <nav class="navbar navbar-expand-lg navbar-dark  primary-background ">
            <div class="container-fluid">
                <a class="navbar-brand" href="profile.jsp"><span class="fa fa-laptop"></span> Tech Blog</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbarSupportedContent">
                    <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#"><span class="fa fa-home"></span> Home</a>
                        </li>

                        <li class="nav-item dropdown">
                            <a class="nav-link dropdown-toggle active" href="#" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                                <span class="fa fa-cart-plus"></span> Categories
                            </a>
                            <ul class="dropdown-menu">
                                <li> <a href="#" onclick="getPost(0)" class="dropdown-item c-link" aria-current="true">All Posts</a></li>
                                    <%
                                        PostDao pdao = new PostDao(ConnectionProvider.getConnection());
    ArrayList<Category> category = pdao.getAllCategories();
    for(Category c: category){  %>
                                <li><a href="#" onclick="getPost(<%=c.getCid()%>)" class="dropdown-item c-link"><%=c.getName()%></a></li>
                                    <%}%>
                            </ul>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#"><span class="fa fa-users"></span> contact US</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="#!" data-bs-toggle="modal" data-bs-target="#addPost"><span class="fa fa-pencil-square-o"></span> Do Post</a>
                        </li>

                    </ul>
                    <ul class="navbar-nav mr-right">
                        <li class="nav-item">
                            <a href="#!" class="nav-link active" data-bs-toggle="modal" data-bs-target="#profile-modal"><span class="fa fa-user-circle-o"></span> <%= user.getName() %></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link active" href="LogoutServlet"><span class="fa fa-user-times"></span> Logout</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>
        <%
                Message msg = (Message)session.getAttribute("msg");
                if(msg != null){
        %>

        <div class="alert <%= msg.getCssClass() %>" role="alert" >
            <%= msg.getContent() %>
        </div>

        <%
            session.removeAttribute("msg");
        }
        %>

        <!--navbar end-->

        <!--profile page main body start-->

        <main>
            <div class="container">
                <div class="row mt-4">
                    <!--list of categories-->
                    <div class="col-md-4">
                        <div class="list-group">
                            <a href="#" onclick="getPost(0)" class="list-group-item list-group-item-action active c-link" id="allpost" aria-current="true">
                                All Posts
                            </a>
                            <% 
for(Category c: category){  %>
                            <a href="#" onclick="getPost(<%=c.getCid()%>)" class="list-group-item list-group-item-action c-link"><%=c.getName()%></a>
                            <% } %>
                        </div>
                    </div>

                    <!--Posts-->
                    <div class="col-md-8">
                        <div class="container text-center" id="loader">
                            <i class="fa fa-refresh fa-4x fa-spin"></i>
                            <h4 class="mt-2">Loading...</h4>
                        </div>
                        <div class="container-fluid" id="post-container"></div>
                    </div>
                </div>
            </div>
        </main>


        <!--profile page main body end-->


        <!--Start of Profile Modal-->

        <!-- Modal -->
        <div class="modal fade" id="profile-modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header primary-background text-white">
                        <h1 class="modal-title fs-5" id="exampleModalLabel"><span class="fa fa-laptop"></span> TechBlog</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <div class="container text-center">
                            <img src="profilePics/<%= user.getProfile() %>" alt="Profile Pic" class="img-fluid" style="border-radius: 50%; max-height: 90px"/>
                            <h1 class="modal-title fs-5" id="exampleModalLabel"><%= user.getName() %></h1>

                            <!--User Details-->

                            <div id="profile-details">
                                <table class="table">
                                    <tbody>
                                        <tr>
                                            <th scope="row">ID: </th>
                                            <td><%= user.getId() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Email: </th>
                                            <td><%= user.getEmail() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Gender:  </th>
                                            <td><%= user.getGender() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Status:  </th>
                                            <td><%= user.getAbout() %></td>
                                        </tr>
                                        <tr>
                                            <th scope="row">Registered Date:  </th>
                                            <td><%= user.getDateTime().toString() %></td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>

                            <!--profile edit-->
                            <div id="profile-edit" style="display: none;">
                                <h3 class="mt-2">Please Edit carefully</h3>

                                <form action="EditServlet" method="POST" enctype="multipart/form-data">
                                    <table class="table">
                                        <tr>
                                            <td>ID: </td>
                                            <td><input class="form-control" style="color: gray;" type="text" name="id" value="<%= user.getId() %>" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Name: </td>
                                            <td><input class="form-control" type="text" name="user_name" id="user_name" value="<%= user.getName() %>"/> </td>
                                        </tr>
                                        <tr>
                                            <td>Email: </td>
                                            <td><input class="form-control" style="color: gray;" type="text" name="email" id="email" value="<%= user.getEmail() %>" readonly="readonly"/></td>
                                        </tr>
                                        <tr>
                                            <td>Gender: </td>
                                            <td><input class="form-control" style="color: gray;" type="text" name="gender" id="gender" value="<%= user.getGender() %>" readonly="readonly"/></td>
                                        </tr>

                                        <tr>
                                            <td>Status: </td>
                                            <td><textarea class="form-control" rows="3" name="about" id="about"><%= user.getAbout() %></textarea></td>
                                        </tr>
                                        <tr>
                                            <td>New Profile Pic: </td>
                                            <td><input class="form-control" type="file" name="image" id="image"/></td>
                                        </tr>

                                    </table>
                                    <div class="container">
                                        <button type="submit" class="btn btn-outline-primary">Save</button>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>

                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                        <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    </div>
                </div>
            </div>
        </div>
        <!--End of Profile Modal-->

        <!--post modal-->

        <!-- Modal -->
        <div class="modal fade" id="addPost" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h1 class="modal-title fs-5" id="exampleModalLabel">Start Your Post..</h1>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <form id="add-post-form" action="AddPostServlet" method="POST" enctype="multipart/form-data">
                            <div class="form-group mb-2">
                                <select class="form-control" name="cid">
                                    <option selected disabled>---Select Category--</option>
                                    <% 
for(Category c: category){  %>
                                    <option value="<%= c.getCid() %>"><%= c.getName() %></option>

                                    <% } %>
                                </select>
                            </div>
                            <div class="form-group mb-2">
                                <input name="pTitle" type="text" placeholder="Enter post title" class="form-control"/>
                            </div>
                            <div class="form-group mb-2">
                                <textarea name="pContent" class="form-control" style="height: 200px" placeholder="Enter your post"></textarea>
                            </div>
                            <div class="form-group mb-2">
                                <textarea name="pCode" class="form-control" style="height: 200px" placeholder="Enter your code(if any)"></textarea>
                            </div> 
                            <div class="form-group mb-2">
                                <label>add pic(if any):</label>
                                <input name="pic" type="file" class="form-control"/>
                            </div>
                            <div class="container text-center">
                                <button type="submit" class="btn btn-outline-primary">Post</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <!--post modal end-->
    </body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
    <script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
    <script src="js/script.js" type="text/javascript"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js" type="text/javascript"></script>         
    <script>

$(document).ready(function () {
    <!--now add post js-->
$("#add-post-form").on("submit", function (ev) {
    ev.preventDefault();
    let form = new FormData(this);
    //now requesting to server
    $.ajax({
    url: "AddPostServlet",
            type: "POST",
data: form,
                                success: function (data, textStatus, jqXHR) {
                                if (data.trim() === "Done"){
                                swal("Good Job!", "Post Saved Successfully", "success");
}else{
                            swal("Error", "Something went wrong", "error");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        swal("Error", "Something went wrong", "error");
                    },
                    processData: false,
                    contentType: false
                })
    });
                });
    </script>
</html>
