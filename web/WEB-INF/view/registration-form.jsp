<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
    <head>
        <title>register new user form</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
    </head>
    <body>
        <header>
            <h1>register</h1>
        </header>
        <main>
            <section>
                <div id="loginBox" style="margin-top: 50px;" class="mainbox col-md-3 col-md-offset-2 col-sm-6 col-sm-offset-2">
                    <div class="panel panel-primary">
                        <div class="panel-heading">
                            <div class="panel-title">register new user</div>
                        </div>
                        <div class="panel-body" style="padding-top: 30px;">
                            <!-- Registration Form -->
                            <form:form action="/register/processRegistrationForm" modelAttribute="crmUser" class="form-horizontal">
                                <!-- Place for messages: error, alert etc ... -->
                                <div class="form-group">
                                    <div class="col-xs-15">
                                        <div>
                                            <!-- Check for registration error -->
                                            <c:if test="${registrationError != null}">
                                                <div class="alert alert-danger col-xs-offset-1 col-xs-10"> ${registrationError}</div>
                                            </c:if>
                                        </div>
                                    </div>
                                </div>

                                <!-- User name -->
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                    <form:errors path="userName" cssClass="error"/>
                                    <form:input path="userName" placeholder="username (*)"
                                                class="form-control"/>
                                </div>

                                <!-- Password -->
                                <div style="margin-bottom: 25px" class="input-group">
                                    <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                    <form:errors path="password" cssClass="error"/>
                                    <form:password path="password" placeholder="password (*)"
                                                   class="form-control"/>
                                </div>

                                <!-- Roles -->
                                <div style="margin-bottom: 25px" class="input-group">
                                    <form:select path="formRole" items="${roles}" class="form-control"/>
                                </div>

                                <!-- Register Button -->
                                <div style="margin-top: 10px" class="form-group">
                                    <div class="col-sm-6 controls">
                                        <button type="submit" class="btn btn-primary">Register</button>
                                    </div>
                                </div>
                                <a href="${pageContext.request.contextPath}/" class="btn btn-danger">back to home page</a>
                            </form:form>
                        </div>
                    </div>
                </div>
            </section>
        </main>
    </body>
</html>