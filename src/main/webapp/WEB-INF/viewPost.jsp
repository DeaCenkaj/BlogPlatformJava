<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html>
<head>
    <title>View Post</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link href="https://fonts.googleapis.com/css?family=Poppins:300,400,500,600,700" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lora:400,400i,700,700i&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Abril+Fatface&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/open-iconic-bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/magnific-popup.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/aos.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/jquery.timepicker.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/icomoon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/style.css">
    <style>
        /* Use the background photo */
        body {
            background-image: url('https://mdbootstrap.com/img/Photos/Others/architecture.webp');
            background-size: cover;
            background-repeat: no-repeat;
            font-family: 'Roboto', sans-serif;
            display: flex;
            align-items: center;
            justify-content: center;
            height: 100vh;
            color: #333; /* Set text color to dark gray */
        }

        .view {
            height: 100%;
        }

        @media (max-width: 740px) {
            html,
            body,
            header,
            .view {
                height: 1000px;
            }
        }

        @media (min-width: 800px) and (max-width: 850px) {
            html,
            body,
            header,
            .view {
                height: 600px;
            }
        }

        .btn .fa {
            margin-left: 3px;
        }

        .navbar:not(.top-nav-collapse) {
            background: transparent !important;
        }

        @media (max-width: 991px) {
            .navbar:not(.top-nav-collapse) {
                background: #424f95 !important;
            }
        }

        .btn-white {
            color: black !important;
        }

        h6 {
            line-height: 1.7;
        }

        #colorlib-logo {
            margin-bottom: 4px;
        }

        #colorlib-logo a span {
            color: #fff;
        }

        /* Adjust the post content style */
        .post-content {
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 800px; /* Adjust the maximum width as needed */
            margin: 0 auto; /* Center the content horizontally */
        }

        /* Update the <h1> style */
        h1 {
            color: #424f95;
            font-weight: bold;
            font-family: 'Playfair Display', serif;
        }

        /* Adjust the layout for blog-style appearance */
        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-between;
        }

        .film-details {
            flex-basis: 70%;
        }

        .post-details {
            flex-basis: 30%;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .comments-section {
            margin-top: 20px;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.9);
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .scroll-to-comments {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="view">
    <div class="mask rgba-gradient align-items-center">
        <div class="container">
            <div class="row">
                <div class="col-md-12">
                    <h1 class="text-center mb-4">View Post</h1>
                    <div class="post-content">
                        <div class="container">
                            <div class="film-details">
                                <h1 class="text-dark"><a href="/dashboard">Dashboard</a></h1>

                                <div class="post-details">
                                    <h2 class="text-dark">Post Details</h2>
                                    <table class="table">
                                        <tbody class="text-dark">
                                        <tr>
                                            <td>Title:</td>
                                            <td><c:out value="${post.title}"></c:out></td>
                                        </tr>
                                        <tr>
                                            <td>Body:</td>
                                            <td><c:out value="${post.body}"></c:out></td>
                                        </tr>
                                        <tr>
                                            <td>Type:</td>
                                            <td><c:out value="${post.type}"></c:out></td>
                                        </tr>

                                        </tbody>
                                    </table>
                                    <h5><a href="/post/${post.id}/comments">See Comments</a></h5>
                                    <c:if test="${post.lead.id eq user}">
                                        <div class="btn-group">
                                            <a class="btn-primary" href="/post/edit/${post.id}">Edit Post</a>
                                            <a class="btn-secondary" href="/post/delete/${post.id}">Delete Post</a>
                                        </div>
                                    </c:if>

                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
</html>
