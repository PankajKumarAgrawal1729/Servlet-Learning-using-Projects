<%-- 
    Document   : show_blog_page
    Created on : 07-Oct-2023, 8:49:42 pm
    Author     : pankaj kumar
--%>


<%@page import="com.tech.blog.entities.User" %> 
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="com.tech.blog.dao.PostDao" %>
<%@page import="com.tech.blog.dao.UserDao" %>
<%@page import="com.tech.blog.helper.ConnectionProvider" %>
<%@page import="com.tech.blog.entities.Post"%>
<%@page import="com.tech.blog.entities.Category" %>
<%@page import="com.tech.blog.dao.LikeDao" %>
<%@page import="java.util.ArrayList"%>
<%@page errorPage="error_handling_page.jsp" %>
<%@page import="java.text.DateFormat"%>


<% 
    User user = (User)session.getAttribute("currentuser"); 
if(user == null){
response.sendRedirect("login-page.jsp");
    }
    
%> 

<%
    
    PostDao dao = new PostDao(ConnectionProvider.getConnection());
    int postId = Integer.parseInt(request.getParameter("post_id"));
    Post post = dao.getPostById(postId);
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="css/styles.css"/>
    <div id="fb-root"></div>
    <script async defer crossorigin="anonymous" src="https://connect.facebook.net/en_GB/sdk.js#xfbml=1&version=v18.0" nonce="80syK3iE"></script>    
    <style>
        body{
            background: url("images/blog_wallpaper.jpg");
            background-size: cover;
            background-attachment: fixed;
        }
        .banner-background{
            clip-path: polygon(30% 0, 70% 0, 100% 0, 100% 91%, 63% 100%, 22% 91%, 0 99%, 0 0);
        }
        .post-title{
            font-weight: 100;
            font-size: 30px;
        }
        .post-content{
            font-weight: 100;
            font-size: 25px;
        }
        .post-code{

        }
        .post-date{
            font-style: italic;
            font-weight: bold;
        }
        .post-userinfo{
            font-size: 20px;
        }
        .row-user{
            border: 1px solid #e2e2e2;
            padding-top: 15px;
        }
    </style>
    <title><%=post.getpTitle()%></title>
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
                        <a class="nav-link active" aria-current="page" href="profile.jsp"><span class="fa fa-home"></span> Home</a>
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
    <!--navbar end-->

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
                        <% UserDao userDao = new UserDao(ConnectionProvider.getConnection());
                                User postedUserDetail = userDao.getUserDetailById(post.getUserId());
                        %>
                        <img src="profilePics/<%= postedUserDetail.getProfile() %>" alt="Profile Pic" class="img-fluid" style="border-radius: 50%; max-height: 90px"/>
                        <h1 class="modal-title fs-5" id="exampleModalLabel"><%= postedUserDetail.getName() %></h1>

                        <!--User Details-->

                        <div id="profile-details">
                            <table class="table">
                                <tbody>
                                    <tr>
                                        <th scope="row">ID: </th>
                                        <td><%= postedUserDetail.getId() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Email: </th>
                                        <td><%= postedUserDetail.getEmail() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Gender:  </th>
                                        <td><%= postedUserDetail.getGender() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Status:  </th>
                                        <td><%= postedUserDetail.getAbout() %></td>
                                    </tr>
                                    <tr>
                                        <th scope="row">Registered Date:  </th>
                                        <td><%= postedUserDetail.getDateTime().toString() %></td>
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
                    <%if(postedUserDetail.getId() == user.getId()){ %>
                    <button id="edit-profile-btn" type="button" class="btn btn-primary">Edit</button>
                    <%}%>
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

    <!--main content-->

    <div class="container">
        <div class="row my-4">
            <div class="col-md-8 offset-md-2">
                <div class="card">
                    <div class="card-header primary-background text-white">
                        <h4 class="post-title"><%=post.getpTitle()%></h4>
                    </div>
                    <div class="card-body">
                        <img class="card-img-top my-2" src="blog_pics/<%= post.getpPic() %>" alt="...">
                        <div class="row my-3 row-user">
                            <div class="col-md-8">

                                <p class="post-userinfo"><a href="#!" data-bs-toggle="modal" data-bs-target="#profile-modal"><%= postedUserDetail.getName() %></a> has Posted</p>
                            </div>
                            <div class="col-md-4">
                                <p class="post-date"><%=DateFormat.getDateTimeInstance().format(post.getTimestamp())%></p>
                            </div>
                        </div>
                        <p class="post-content"><%=post.getpContent()%></p>
                        <br>
                        <div class="post-code">
                            <pre><%=post.getpCode()%></pre>
                        </div>
                    </div>
                    <div class="card-footer text-content primary-background">
                        <% LikeDao likeDao = new LikeDao(ConnectionProvider.getConnection()); 
                        int pid = post.getPid();
                        int uid = user.getId();
                        boolean alreadyLiked = likeDao.checkAlreadyLikedByUser(pid, uid);
                        String counterClass = "counter_" + pid;
            String iconClass = "like-icon_" + pid;
                        %>
                        <a href="#" onclick="doLike(<%= pid %>, <%= uid %>)" class="btn btn-outline-light btn-sm"> <i class="<%= alreadyLiked ? "fa fa-thumbs-up" : "fa fa-thumbs-o-up" %> <%= iconClass %>"></i>
                            <%
                             int likes = likeDao.getLikesCount(pid);
                            if(likes > 0){
                            %>
                            <span class="<%= counterClass %>"><%=likes%></span>
                            <%}%>

                        </a>
                    </div>
                    
                </div>
            </div>
        </div>
    </div>
</body>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<script src="https://code.jquery.com/jquery-3.7.0.min.js" integrity="sha256-2Pmvv0kuTBOenSvLm6bvfBSSHrUJ+3A7x6P5Ebd07/g=" crossorigin="anonymous"></script>
<script src="js/script.js" type="text/javascript"></script>
<script src="js/likescript.js" type="text/javascript"></script>
</html>
