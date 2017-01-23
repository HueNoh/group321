package a.b.c.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@RequestMapping(value="/chat")
@Controller
public class ChatController {

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		
		
		return "home";
	}
}
