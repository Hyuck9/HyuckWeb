package me.hyuck.hyuckweb.main.web;

import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpSession;

@Slf4j
@Controller
@RequestMapping("/main")
@Transactional
public class MainController {


    @GetMapping(value = "/dashboard.do")
    public String main(HttpSession hs, Model model) {
//        if (hs.getAttribute("userId") == null) {
//            model.addAttribute("title", "로그인");
//            return "/login/loginForm.loginTpl";
//        } else {
            model.addAttribute("title", "고객 관리");
            return "/main.defaultTpl";
//        }
    }
}
