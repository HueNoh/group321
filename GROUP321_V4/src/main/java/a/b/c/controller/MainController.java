package a.b.c.controller;

import java.util.List;
import java.util.Locale;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.JsonObject;

import a.b.c.service.MemberServiceInterface;

@RequestMapping(value = "/main")
@Controller
public class MainController {

	@Autowired
	MemberServiceInterface memberService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Model model) {

		return "home";
	}

	@RequestMapping(value = "/board", method = RequestMethod.GET)
	public String board(Model model, @RequestParam Map map) {
		// String page = null;
		return "board";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public String list(Model model, @RequestParam Map map, HttpServletRequest request) {
		model.addAttribute("b_num", request.getParameter("b_num"));
		return "list";
	}

	@RequestMapping(value = "/searchBoard", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchBoard(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		Gson gson = new Gson();
		JsonArray jArr = new JsonArray();

		try {
			List list = memberService.searchBoard(map);
			System.out.println(list);

			for (int i = 0; i < list.size(); i++) {
				map = (Map) list.get(i);
				JsonObject obj = new JsonObject();
				obj.addProperty("b_num", (int) map.get("b_num"));
				jArr.add(obj);
			}
			System.out.println(jArr);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			System.out.println("dd");
			e.printStackTrace();
		}

		return gson.toJson(jArr);
	}

	@RequestMapping(value = "/searchList", method = RequestMethod.POST, produces = "text/plain;charset=UTF-8")
	@ResponseBody
	public String searchList(Locale locale, Model model, HttpSession session, HttpServletRequest request,
			@RequestParam Map map) {

		Gson gson = new Gson();
		JsonObject jobj = gson.fromJson((String) map.get("DATA"), JsonObject.class);
		JsonElement je = jobj.get("b_num");
		map.put("b_num", je.getAsInt());
		JsonArray jArr = new JsonArray();
		try {
			List list = memberService.searchList(map);
			System.out.println("list : " + list);
			for (int i = 0; i < list.size(); i++) {
				map = (Map) list.get(i);
				JsonObject obj = new JsonObject();
				obj.addProperty("l_num", (int) map.get("l_num"));
				jArr.add(obj);
			}
			System.out.println(jArr);

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return gson.toJson(jArr);
	}

	/*
	 * @RequestMapping(value = "/createBoard", method = RequestMethod.POST,
	 * produces = "text/plain;charset=UTF-8")
	 * 
	 * @ResponseBody public String createBoard(Locale locale, Model model,
	 * HttpSession session, HttpServletRequest request,
	 * 
	 * @RequestParam Map map) {
	 * 
	 * Gson gson = new Gson(); JsonObject obj = new JsonObject(); try { int
	 * result = memberService.createBoard(map); if (0 < result) {
	 * 
	 * obj.addProperty("b_num", result);
	 * 
	 * } } catch (Exception e) { // TODO Auto-generated catch block
	 * e.printStackTrace(); }
	 * 
	 * return gson.toJson(obj); }
	 */
}
