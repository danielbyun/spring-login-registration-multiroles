<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>register new user form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">

        <!-- materialized css -->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <script src="https://code.jquery.com/jquery-3.3.1.min.js" integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8=" crossorigin="anonymous"></script>
        <script src="${pageContext.request.contextPath}/resource/js/registration.js"></script>
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/registration.css">
    </head>
    <body>
        <header class="container">
            <h3 class="row">register</h3>
        </header>
        <main>
            <section class="container">
                <div class="row">
                    <!-- Registration Form -->
                    <form:form action="/register/processRegistrationForm" modelAttribute="user" class="form-horizontal">
                        <!-- Place for messages: error, alert etc ... -->
                        <c:if test="${registrationError != null}">
                            <div class="msgSection red accent-2 msg white-text z-depth-2 row">
                                <!-- Check for registration error -->
                                <span>
                                        ${registrationError}
                                </span>
                            </div>
                        </c:if>

                        <!-- User name -->
                        <div class="input-field">
                            <form:errors path="userName" cssClass="error"/>
                            <form:input path="userName"
                                        class="form-control" id="userName"/>
                            <label for="userName">userName</label>
                        </div>

                        <!-- Password -->
                        <div class="input-field">
                            <form:errors path="password" cssClass="error"/>
                            <form:password path="password"
                                           class="form-control" id="password"/>
                            <label for="password">password</label>
                        </div>

                        <!-- Roles -->
                        <div class="input-field">
                            <form:select path="formRole" items="${roles}"/>
                            <label>roles</label>
                        </div>

                        <!-- Register Button -->
                        <div class="form-group">
                            <button type="submit" class="waves-effect waves-light btn">
                                Register <i class="material-icons right">add</i>
                            </button>
                            <a href="${pageContext.request.contextPath}/" class="waves-effect waves-light btn grey lighten-2">back
                                to home page</a>
                        </div>
                    </form:form>
                </div>
            </section>
        </main>
    </body>
</html>