package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import pojo.login;
import service.loginService;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/login")
public class loginController {
    @Autowired
    loginService loginService;

    @RequestMapping("/login")
    public String login( @RequestParam(name="loginId") int loginId, String password, Model model, HttpSession session) {
        login user = loginService.getUserById(loginId, password);
        if (user != null) {
            if (user.getPower() == 0) {
                model.addAttribute("user", user);
                return "user_login";
            }
            else if (user.getPower() == 1) {
                model.addAttribute("user", user);
                return "house/allHouse";
            }
        }
        else if (user != null) {
            session.setAttribute("error", "密码错误");
        } else {
            session.setAttribute("error", "用户不存在");
        }
        return "login";
    }


    @RequestMapping("/logout")
    public String logout(HttpSession session) {
        session.removeAttribute("error");
        return "index";
    }

}
