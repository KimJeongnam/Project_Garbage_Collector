package com.spring.project.share.controller;

import java.util.List;
import java.util.Map;

import javax.naming.spi.DirStateFactory.Result;
import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.servlet.support.RequestContextUtils;

import com.spring.project.admin.service.AdminService;
import com.spring.project.share.MessageLists;
import com.spring.project.share.service.ShareService;

@Controller
public class ShareController {
	@Autowired
	ShareService shareService;
	@Autowired
	AdminService adminService;

	private static final Logger logger = LoggerFactory.getLogger(ShareController.class);

	@RequestMapping(value = { "/loginForm", "/" })
	public String login(HttpServletRequest request, Model model, RedirectAttributes redirectAttributes) {
		logger.info("login()");
		String url = "share/login";

		Map<String, ?> flashMap = RequestContextUtils.getInputFlashMap(request);

		String message = "";
		String alertIcon = "";

		if (flashMap != null) {
			if (flashMap.containsKey("message"))
				message = (String) flashMap.get("message");

			if (flashMap.containsKey("alertIcon"))
				alertIcon = (String) flashMap.get("alertIcon");
		}
		
		if (request.getSession().getAttribute("userNumber") != null) {
			
			if(message.length()>0)
				redirectAttributes.addFlashAttribute("message", message);

			if(alertIcon.length()>0)
				redirectAttributes.addFlashAttribute("alertIcon", alertIcon);


			switch ((String) request.getSession().getAttribute("authority")) {
			case "admin":
				url = "redirect:" + "/admin/index";
				break;
			case "professor":
				url = "redirect:" + "/professor/index";
				break;
			case "student":
				url = "redirect:" + "/student/personalProfile";
				break;
			}
		} else {
			if(message.length()>0)
				model.addAttribute("message", message);

			if(alertIcon.length()>0)
				model.addAttribute("alertIcon", alertIcon);
		}

		return url;
	}

	@RequestMapping("/loginSucces")
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("loginSucces()");
		String redirectUrl = shareService.loginSucces(request, redirectAttributes, logger);
		logger.info("redirectUrl:" + redirectUrl);
		return "redirect:" + redirectUrl;
	}

	@RequestMapping("/loginFail")
	public String loginFail(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("loginFail()");
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		String message = shareService.loginFailEvent(id, pw);
		redirectAttributes.addFlashAttribute("message", message);
		redirectAttributes.addFlashAttribute("alertIcon", "error");
		return "redirect:/loginForm";
	}

	@RequestMapping("/logoutDo")
	public String logoutDo(HttpServletRequest request, RedirectAttributes redirectAttributes) {
		logger.info("logoutDo()");
		MessageLists.map.remove((String)request.getSession().getAttribute("userNumber"));
		request.getSession().invalidate();
		redirectAttributes.addFlashAttribute("message", "로그아웃!");
		redirectAttributes.addFlashAttribute("alertIcon", "success");
		return "redirect:/loginForm";
	}

	@RequestMapping(value = { "/admin/messagePage", "/professor/messagePage",
			"/student/messagePage" }, method = RequestMethod.GET)
	public String messagePage() {
		return "share/messagePage";
	}

	@RequestMapping(value = "/ajax/api/v1.1/messages/list", method = RequestMethod.POST)
	public String messageBoard(@RequestBody Map<String, Object> map, Model model) {
		logger.info("messageBoard()");
		shareService.messageBoard(map, logger, model);
		return "share/messageBoard";
	}

	@RequestMapping(value = "/ajax/api/v1.1/messages/show", method = RequestMethod.POST)
	public String messageShow(@RequestBody Map<String, Object> map, Model model) {
		logger.info("messageShow()");
		shareService.messageShow(map, logger, model);
		return "share/messageShow";
	}

	@ResponseBody
	@RequestMapping(value = "/ajax/api/v1.1/getFacultys")
	public List<String> getFacultys() {
		return shareService.getFacultys();
	}

	@ResponseBody
	@RequestMapping(value = "/ajax/api/v1.1/getMajorCurrval")
	public int getMajorCurrval() {
		return shareService.getMajorCurrval();
	}

	// 해당 강의의 시간 조회 ...
	@RequestMapping(value = "/share/LecTime/{lecCode}")
	public String getLecTime(@PathVariable String lecCode, Model model) {
		logger.info("getLecTime()");
		adminService.getLectureTime(lecCode, model);
		return "admin/majorLecMangePage/lectureTimeSelector";
	}

	// 해당 교수의 강의시간 조회
	@RequestMapping(value = "/share/professor/getLecTime/{empNumber}/{semester}", method = RequestMethod.GET)
	public String getEmptyLecTime(@PathVariable String empNumber, @PathVariable String semester, Model model) {
		logger.info("getEmptyLecTime()");
		shareService.getProfessorLectureTime(empNumber, semester, model);
		return "admin/majorLecMangePage/lectureTimeSelector";
	}
	
	@ResponseBody
	@RequestMapping(value="/share/ajax/getBachelorStatus", method=RequestMethod.GET)
	public Map<String, Object> getBachelorStatus(){
		return shareService.getBachelorStatus();
	}

}
