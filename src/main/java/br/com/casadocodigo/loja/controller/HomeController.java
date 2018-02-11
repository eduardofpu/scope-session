package br.com.casadocodigo.loja.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
// a HomeController precisa de uma ServletSpringMVC
@Controller
public class HomeController {  
	
	@RequestMapping("/")
	public String index() {
		
		System.out.println("Entrando na home da CDC");
		return "home";
	}
	
}

