package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.login;
import service.loginService;

@Controller
@RequestMapping("/login")
public class loginController {
    @Autowired
    loginService loginService;

    @RequestMapping("/login")
    public String login(@RequestParam(name = "userName") String userName,
                        @RequestParam(name = "password") String password, Model model) {
        login user = loginService.getUserByName(userName, password);
        if (user != null) {
            if (user.getPower() == 0) {
                model.addAttribute("user", user);
                return "user_login";
            } else {
                model.addAttribute("user", user);
                return "admin_login";
            }
        } else return "login_error";
    }

}
