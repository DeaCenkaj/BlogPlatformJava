<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
         pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
  <title>Edit Post</title>
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

    /* Adjust the form content style */
    .form-content {
      padding: 20px;
      background-color: rgba(255, 255, 255, 0.9);
      border-radius: 10px;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
      max-width: 400px; /* Adjust the maximum width as needed */
      margin: 0 auto; /* Center the form horizontally */
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
<div class="view" style="background-image: url('https://mdbootstrap.com/img/Photos/Others/architecture.webp'); background-repeat: no-repeat; background-size: cover; background-position: center center;">
  <div class="mask rgba-gradient align-items-center">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <h1 class="text-center mb-4">Edit Post</h1>
          <div class="form-content">
            <form:form action="/post/edit/${post.id}" method="post" modelAttribute="post">
              <input type="hidden" name="postId" value="${post.id}">
              <div class="form-group">
                <label for="title">Title:</label>
                <form:errors path="title" cssClass="text-danger"/>
                <form:input class="form-control" path="title"/>
              </div>
              <div class="form-group">
                <label for="body">Body:</label>
                <form:errors path="body" cssClass="text-danger"/>
                <form:textarea class="form-control" path="body" name="body" rows="5" />
              </div>
              <div class="container additional-options">
                <div class="row">
                  <div class="col-md-12">
                    <h2>Type of Post</h2>
                    <div class="form-group">
                      <%--@declare id="type"--%><label for="type">Select an Option:</label>
                        <div class="list-group">
                          <form:errors path="type" cssClass="text-danger"/>
                          <form:select path="type" class="form-select list-group-item list-group-item-action">
                            <form:option value="Tech News">Tech News</form:option>
                            <form:option value="Solution">Solution</form:option>
                            <form:option value="Need for Help">Need for Help</form:option>
                            <form:option value="Advice">Advice</form:option>
                            <form:option value="Job Information">Job Information</form:option>
                          </form:select>
                        </div>
                    </div>
                  </div>
                </div>
              </div>
              <form:errors path="lead" cssClass="error"/>
              <form:input type="hidden" path="lead" value="${userId}" class="form-control"/>

              <div class="form-group">
                <a class="linkBtn" href="/dashboard">Cancel</a>
                <input type="submit" class="input" value="Submit" />
              </div>
              </form:form>
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
</body>
</html>
