<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isErrorPage="true" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>BlogPlatform</title>
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
</head>
<body>


<div id="colorlib-page">
    <a href="/" class="js-colorlib-nav-toggle colorlib-nav-toggle"><i></i></a>
    <aside id="colorlib-aside" role="complementary" class="js-fullheight">
        <nav id="colorlib-main-menu" role="navigation">
            <ul>
                <li class="colorlib-active"><a href="/">Home</a></li>
                <li><a href="/login">Login/Register</a></li>
                <li><a href="/login">Add New Post</a></li>
            </ul>
        </nav>

        <div class="colorlib-footer">
            <h1 id="colorlib-logo" class="mb-4"><a href="/" style="background-image: url(images/bg_1.jpeg);">Blog <span>Coding Dojo</span></a></h1>
            <div class="mb-4">
                <h3>Subscribe for newsletter</h3>
                <form action="#" class="colorlib-subscribe-form">
                    <div class="form-group d-flex">
                        <div class="icon"><span class="icon-paper-plane"></span></div>
                        <input type="text" class="form-control" placeholder="Enter Email Address">
                    </div>
                </form>
            </div>
            <p class="pfooter"><!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                Copyright &copy;<script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank">Coding Dojo Students</a>
                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. --></p>
        </div>
    </aside> <!-- END COLORLIB-ASIDE -->
    <div id="colorlib-main">
        <section class="ftco-section ftco-no-pt ftco-no-pb">
            <div class="container">
                <div class="row d-flex">
                    <div class="col-xl-8 py-5 px-md-5">
                        <div class="row pt-md-4">
                            <c:forEach var="post" items="${allPosts}">
                            <div class="col-md-12">
                                <div class="blog-entry ftco-animate d-md-flex">
                                    <a href="/viewPost/${post.id}" class="img img-2" style="background-image: url(images/image_2.jpg);"></a>
                                    <div class="text text-2 pl-md-4">
                                        <h3 class="mb-2"><a href="/viewPost/${post.id}"><c:out value="${post.title}"/></a></h3>
                                        <div class="meta-wrap">
                                            <p class="meta">
                                                <span><i class="icon-calendar mr-2"></i><fmt:formatDate value="${post.createdAt}" pattern="yyyy-MM-dd"/></span>
                                                <span><a href="/viewPost/${post.id}"><i class="icon-folder-o mr-2"></i><c:out value="${post.type}"/></a></span>
                                                <span><i class="icon-comment2 mr-2"></i><c:out value="${post.comment.size()}"/></span>
                                            </p>
                                        </div>
                                        <p class="mb-4"><c:out value="${post.body}"/></p>
                                        <p><a href="/viewPost/${post.id}" class="btn-custom">Read More <span class="ion-ios-arrow-forward"></span></a></p>
                                    </div>
                                </div>
                            </div>
                            </c:forEach>



                            <div id="ftco-loader" class="show fullscreen"><svg class="circular" width="48px" height="48px"><circle class="path-bg" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke="#eeeeee"/><circle class="path" cx="24" cy="24" r="22" fill="none" stroke-width="4" stroke-miterlimit="10" stroke="#F96D00"/></svg></div>


                            <script src="js/jquery.min.js"></script>
                            <script src="js/jquery-migrate-3.0.1.min.js"></script>
                            <script src="js/popper.min.js"></script>
                            <script src="js/bootstrap.min.js"></script>
                            <script src="js/jquery.easing.1.3.js"></script>
                            <script src="js/jquery.waypoints.min.js"></script>
                            <script src="js/jquery.stellar.min.js"></script>
                            <script src="js/owl.carousel.min.js"></script>
                            <script src="js/jquery.magnific-popup.min.js"></script>
                            <script src="js/aos.js"></script>
                            <script src="js/jquery.animateNumber.min.js"></script>
                            <script src="js/scrollax.min.js"></script>
                            <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBVWaKrjvy3MaE7SQ74_uJiULgl1JY0H2s&sensor=false"></script>
                            <script src="js/google-map.js"></script>
                            <script src="js/main.js"></script>

</body>
</html>
