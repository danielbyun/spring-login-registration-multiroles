# spring-login-registration-multiroles
## register a user with multi-roles (ADMIN, MANAGER, EMPLOYEE) and log in
### introduction
I realized how powerful Spring MVC could be with less code, and how robust Spring Security is and wanted to implement a login // registration system.
<br><br>
So I wrote a login // registration system where you can assign the roles you would like to have with a list of roles.
<br><br>
 Admin would have all three roles (ADMIN, MANAGER, EMPLOYEE), Manager would have two (MANAGER, EMPLOYEE), and finally Employee would only have the 'EMPLOYEE' role.
 <br><br>
 After login, each user gets redirected to a page where users with certain roles can see certain content, another cool feature from Spring Security.
 <br>
 <small>*also, the passwords are all encrypted</small>
### technology used
* Spring MVC
* Spring Security
* MySQL
* JPA (Using Hibernate)
* JSP (for the view layer)
### testing
try registering!
<br>
or, log in with these credentials to see how it works!
1. for admin: 
    1. username: admin
    2. password: admin
2. for manager:
    1. username: manager
    2. password: manager
3. for employee:
    1. username: employee
    2. username: employee