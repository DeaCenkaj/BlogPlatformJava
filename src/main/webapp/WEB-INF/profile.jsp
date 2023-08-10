<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page isErrorPage="true" %>
<!-- For demo purpose -->
<head>
    <link rel="stylesheet" href="${pageContext.request.contextPath}css/css/profile.css">

    <title>Profile</title>
    <style>
        .profile-header-info h4,
        .timeline-content h4.card-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 10px;
            position: relative;
            display: inline-block;
        }

        .profile-header-info h4::before,
        .timeline-content h4.card-title::before {
            content: "";
            position: absolute;
            bottom: -3px;
            left: 0;
            width: 100%;
            height: 2px;
            background-color: #3498db; /* Choose your desired color */
            transform: scaleX(0);
            transform-origin: left center;
            transition: transform 0.3s ease-in-out;
        }

        .profile-header-info h4:hover::before,
        .timeline-content h4.card-title:hover::before {
            transform: scaleX(1);
        }

        .timeline-content p {
            margin-bottom: 0;
        }

    </style>

</head>

<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
<div class="container">
    <div class="row">
        <div class="col-md-12">
            <div id="content" class="content content-full-width">
                <!-- begin profile -->
                <div class="profile">
                    <div class="profile-header">
                        <!-- BEGIN profile-header-cover -->
                        <div class="profile-header-cover"></div>
                        <!-- END profile-header-cover -->
                        <!-- BEGIN profile-header-content -->
                        <div class="profile-header-content">
                            <!-- BEGIN profile-header-img -->
                            <div class="profile-header-img">
                                <img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt="">
                            </div>
                            <!-- END profile-header-img -->
                            <!-- BEGIN profile-header-info -->
                            <div class="profile-header-info">
                                <h4 class="m-t-10 m-b-5"><c:out value="${user.firstName}"/></h4>
                                <p class="m-b-10">UXUI + Frontend Developer</p>
                                <a href="#" class="btn btn-sm btn-info mb-2">‎</a>
                            </div>
                            <!-- END profile-header-info -->
                        </div>
                        <!-- END profile-header-content -->
                        <!-- BEGIN profile-header-tab -->
                        <ul class="profile-header-tab nav nav-tabs">
                            <li class="nav-item"><b>POSTS</b></li>
                            <a href="/dashboard">HomePage</a>
                        </ul>
                        <!-- END profile-header-tab -->
                    </div>
                </div>
                <!-- end profile -->
                <!-- begin profile-content -->
                <div class="profile-content">
                    <!-- begin tab-content -->
                        <!-- begin #profile-post tab -->
                        <c:forEach var="post" items="${allPosts}">
                        <div class="tab-pane fade active show" id="profile-post">
                            <!-- begin timeline -->
                            <ul class="timeline">
                                <li>
                                    <!-- begin timeline-time -->
                                    <div class="timeline-time">
                                        <span class="time"><fmt:formatDate value="${post.createdAt}" pattern="HH:mm"/></span>
                                    </div>
                                    <!-- end timeline-time -->
                                    <!-- begin timeline-icon -->
                                    <div class="timeline-icon">
                                        <a href="javascript:;">&nbsp;</a>
                                    </div>

                                    <!-- end timeline-icon -->
                                    <!-- begin timeline-body -->

                                    <div class="timeline-body">
                                        <div class="timeline-header">
                                            <span class="userimage"><img src="https://bootdey.com/img/Content/avatar/avatar3.png" alt=""></span>
                                            <span class="username"><c:out value="${user.firstName}"></c:out></span>
                                        </div>
                                        <div class="timeline-content">
                                            <p>
                                                <a href="/viewPost/${post.id}">  <h4 class="card-title "><c:out value="${post.title}"/></h4></a>

                                            </p>
                                            <c:out value="${post.body}"/>
                                                </form>
                                            </div>
                                        </div>
                                    <!-- end timeline-body -->
                                </li>
                            <!-- end timeline -->
                        <!-- end #profile-post tab -->
                    </c:forEach>
                </div>
                    <!-- end tab-content -->
                </div>
                <!-- end profile-content -->
            </div>
        </div>
    </div>
</div>