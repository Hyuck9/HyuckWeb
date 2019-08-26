package me.hyuck.hyuckweb.account.controller;

import lombok.extern.slf4j.Slf4j;
import me.hyuck.hyuckweb.mapper.mariadb.MariaMapper;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.Locale;

@Slf4j
@Controller
@RequestMapping("/login")
@Transactional
public class LoginController {

	private final MariaMapper mariaMapper;

	public LoginController(MariaMapper mariaMapper) {
		this.mariaMapper = mariaMapper;
	}

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/test.do", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		log.info("Welcome home! The client locale is {}.", locale);


//		String formattedDate = LocalDateTime.now().format(DateTimeFormatter.BASIC_ISO_DATE);

//		model.addAttribute("serverTime", formattedDate );

		model.addAttribute("serverTime", mariaMapper.getNow() );

		return "login/loginForm";
	}

	@GetMapping(value = "/loginForm.do")
	public String loginForm(Model model) {
		model.addAttribute("title", "로그인");
		return "/login/loginForm.loginTpl";
	}

}
