package com.danielbyun.loginRegistrationMultiroles.controller;

import com.danielbyun.loginRegistrationMultiroles.user.AppUser;
import org.springframework.security.core.userdetails.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.StringTrimmerEditor;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.provisioning.UserDetailsManager;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import javax.annotation.PostConstruct;
import javax.validation.Valid;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

@Controller
@RequestMapping("/register")
public class RegistrationController {
    @Autowired
    private UserDetailsManager userDetailsManager;

    private Map<String, String> roles;
    private BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
    private Logger logger = Logger.getLogger(getClass().getName());

    @InitBinder
    public void initBinder(WebDataBinder dataBinder) {
        StringTrimmerEditor stringTrimmerEditor = new StringTrimmerEditor(true);
        dataBinder.registerCustomEditor(String.class, stringTrimmerEditor);
    }

    // load roles
    @PostConstruct
    protected void loadRoles() {
        roles = new LinkedHashMap<String, String>();

        roles.put("ROLE_EMPLOYEE", "Employee");
        roles.put("ROLE_MANAGER", "Manager");
        roles.put("ROLE_ADMIN", "Admin");
    }

    // display registration from
    @GetMapping("/showRegistrationForm")
    public String showRegistrationForm(Model model) {
        model.addAttribute("user", new AppUser());
        model.addAttribute("roles", roles);

        return "registration-form";
    }

    @PostMapping("/processRegistrationForm")
    public String processRegistrationForm(
            @Valid @ModelAttribute("user") AppUser user,
            BindingResult bindingResult,
            Model model) {
        String userName = user.getUserName();
        String role = user.getFormRole();

        logger.info("processing registration form for: " + userName);
        logger.info("role: " + role);

        if (bindingResult.hasErrors()) {
            model.addAttribute("user", new AppUser());
            model.addAttribute("roles", roles);
            model.addAttribute("registrationError", "user name // password cannot be empty.");

            logger.warning("user name // password cannot be empty.");

            return "registration-form";
        }
        boolean userExists = doesUserExist(userName);

        if (userExists) {
            model.addAttribute("user", new AppUser());
            model.addAttribute("roles", roles);
            model.addAttribute("registrationError", "user name already exists");

            logger.warning("user name exists already");

            return "registration-form";
        }

        // encode password usuing bCrypt
        String encodedPassword = passwordEncoder.encode(user.getPassword());
        // add {bcrypt} prefix to identify the bcrypt encryption
        encodedPassword = "{bcrypt}" + encodedPassword;

        // create authorityList
        List<GrantedAuthority> authorities = AuthorityUtils.createAuthorityList();
        // default role = ROLE_EMPLOYEE
        authorities.add(new SimpleGrantedAuthority("ROLE_EMPLOYEE"));

        String formRole = user.getFormRole();
        logger.info(formRole);

        // add ROLE_MANAGER when ROLE_ADMIN is selected
        if (formRole.equals("ROLE_ADMIN")) {
            authorities.add(new SimpleGrantedAuthority("ROLE_MANAGER"));
        }

        if (!formRole.equals("ROLE_EMPLOYEE")) {
            authorities.add(new SimpleGrantedAuthority(formRole));
        }

        org.springframework.security.core.userdetails.User tempUser = new org.springframework.security.core.userdetails.User(userName, encodedPassword, authorities);

        userDetailsManager.createUser(tempUser);

        logger.info("successfully created user: " + userName);

        return "registration-confirmation";
    }

    private boolean doesUserExist(String userName) {
        boolean exists = userDetailsManager.userExists(userName);

        logger.info("checking if user exists: " + userName);
        logger.info("user: " + userName + ", exists: " + exists);

        return exists;
    }
}