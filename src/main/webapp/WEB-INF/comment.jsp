<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page isErrorPage="true"%>

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
    .scroll-to-comments {
      position: fixed;
      bottom: 20px;
      right: 20px;
      display: none;
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
  </style>
</head>
<body>
<div class="view">
  <div class="mask rgba-gradient align-items-center">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-center mb-4">Post's Comments</h1>
          <div class="container">
            <h2 class="text-light"><a href="/dashboard">Dashboard</a></h2>

            <h1 class="text-light">Post Title: ${post.title}</h1>
            <h5 class="text-light">Posted By: ${post.lead.firstName}</h5>

            <div>
              <form:form action="/post/${post.id}/comments" method="post" modelAttribute="comment">
                <div class="form-group">
                  <label for="comment" class="float-left text-light">Add a comment for this movie:</label>
                  <form:textarea rows="4" class="form-control" path="name" id="comment"></form:textarea>
                  <form:errors path="name" cssClass="text-danger"/>
                </div>
                <button type="submit" class="btn btn-primary">Submit</button>
              </form:form>
            </div>

            <hr>

            <c:forEach var="comment" items="${comments}">
              <div class="card mt-2">
                <div class="card-body">
                  <h4 >Added by <c:out value="${comment.creator.firstName}"></c:out> at <fmt:formatDate value="${comment.createdAt}" pattern="h:mm a MMMM dd"/></h4>
                  <p ><c:out value="${comment.name}"></c:out></p>
                </div>
              </div>
            </c:forEach>
            <a href="#comments-section" class="scroll-to-comments btn btn-primary btn-lg">
              Scroll to Comments</a>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
<script>
  // Show scroll button when the user scrolls down
  window.addEventListener('scroll', function() {
    var scrollButton = document.querySelector('.scroll-to-comments');
    if (window.scrollY > 300) {
      scrollButton.style.display = 'block';
    } else {
      scrollButton.style.display = 'none';
    }
  });
</script>
</body>
</html>