<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!doctype html>
<html lang="en">
    <head>
        <title>Login Page</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta http-equiv="x-ua-compatible" content="ie=edge">

        <!-- materialized css -->
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">
        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>

        <!-- stylesheet -->
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/reset.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/css/login.css">
    </head>
    <body>
        <div id="" class="container row">
            <h3 class="col s12 row">sign in</h3>
            <main class="row">
                <!-- Login Form -->
                <form:form action="${pageContext.request.contextPath}/authenticateTheUser" method="POST">
                    <!-- Place for messages: error, alert etc ... -->
                    <section class="col s12 msgSection">
                        <!-- Check for login error -->
                        <c:if test="${param.error != null}">
                            <div class="red accent-2 msg z-depth-2">
                                <span class="white-text text-darken-2">Invalid username and password.</span>
                            </div>
                        </c:if>
                        <!-- check for logout -->
                        <c:if test="${param.logout != null}">
                            <div class="teal accent-4 white-text msg z-depth-2">
                                <span class="white-text text-darken-2">You have been logged out.</span>
                            </div>
                        </c:if>
                    </section>
                    <!-- User name -->
                    <section class="input-field col s12">
                        <input type="text" name="username" id="username" class="form-control">
                        <label for="username">username</label>
                    </section>
                    <!-- Password -->
                    <section class="input-field col s12">
                        <input type="password" name="password" class="form-control" id="password">
                        <label for="password">password</label>
                    </section>
                    <!-- Login/Submit Button -->
                    <section class="col s6">
                        <button type="submit" class="btn blue waves-effect waves-light">Login
                            <i class="material-icons right">send</i>
                        </button>
                        <a href="${pageContext.request.contextPath}/register/showRegistrationForm" class="btn waves-effect waves-light registerBtn" role="button" aria-pressed="true">
                            Register <i class="material-icons right">add</i>
                        </a>
                    </section>
                </form:form>
            </main>
        </div>
    </body>
</html>