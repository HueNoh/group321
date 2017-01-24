package a.b.c.controller;


import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;

import a.b.c.service.TestServiceInterface;

/**
 * Handles requests for the application home page.
 */
@RequestMapping(value="/hstest", method={RequestMethod.GET, RequestMethod.POST})
@Controller
public class TestController {

	@Autowired
	TestServiceInterface testService;

	private static final Logger logger = LoggerFactory.getLogger(TestController.class);

	/**
	 * Simply selects the home view to render by returning its name.
	 */
	
	@RequestMapping(value = "loginChk", method = RequestMethod.POST)
	@ResponseBody
	public String home(Model model, @RequestParam Map map) {
			
		String jsonStr = (String) map.get("jsonStr");
		System.out.println(jsonStr);
		
		Gson gson = new Gson();
		
		map = (Map) gson.fromJson(jsonStr, Object.class);
		System.out.println(map);
		
		int loginChk = testService.loginChk(map);
		jsonStr = gson.toJson(loginChk);
		
		return jsonStr;
		
	}

	

}
