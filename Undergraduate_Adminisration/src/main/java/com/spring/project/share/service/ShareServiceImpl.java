package com.spring.project.share.service;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.crontab.dao.ScheduleDAO;
import com.crontab.vo.LectrueSelectPeriod;
import com.spring.project.admin.dao.AdminDAO;
import com.spring.project.restful.dao.RestfulDAO;
import com.spring.project.restful.vo.Message;
import com.spring.project.share.MessageLists;
import com.spring.project.share.dao.ShareDAO;
import com.spring.project.share.vo.BachelorStatus;
import com.spring.project.share.vo.ShareUserInfo;
import com.spring.project.student.vo.LectureVO;

@Service
public class ShareServiceImpl implements ShareService{
	@Autowired
	ShareDAO dao;
	@Autowired
	RestfulDAO restDao;
	@Autowired
	AdminDAO adminDao;
	@Autowired
	ScheduleDAO scheduleDao;

	@Override
	public String loginSucces(HttpServletRequest request, RedirectAttributes redirectAttributes, Logger logger) {
		Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
		Collection<? extends GrantedAuthority>  authorities = ((User) authentication.getPrincipal()).getAuthorities();
		String redirectUrl ="";
		
		ShareUserInfo user = null;
		String userNumber = (String)request.getSession().getAttribute("userNumber");
		
		int b_status = dao.getBachelorStatus();
		
		BachelorStatus bachelorStatus = BachelorStatus.valueOf(b_status);
		
		request.getSession().setAttribute("bachelorStatus", bachelorStatus.getStrValue());
		
		if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_ADMIN")).findAny().isPresent()) {
			user = dao.getEmployeeInfo(userNumber);
			request.getSession().setAttribute("authority", "admin");
			redirectUrl = "/admin/index";
		}else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_PROFESSOR")).findAny().isPresent()) {
			user = dao.getEmployeeInfo(userNumber);
			request.getSession().setAttribute("authority", "professor");
			redirectUrl = "/professor/index";
		}else if(authorities.stream().filter(o->o.getAuthority().equals("ROLE_STUDENT")).findAny().isPresent()) {
			redirectUrl = "/student/personalProfile";
			request.getSession().setAttribute("authority", "student");
			user = dao.getStudentInfo(userNumber);
		}
		
		LectrueSelectPeriod lectrueSelectPeriod = scheduleDao.getYearSemester();
		
		if(lectrueSelectPeriod!= null) {
			request.getSession().setAttribute("year", lectrueSelectPeriod.getYear());
			request.getSession().setAttribute("semester", lectrueSelectPeriod.getSemester());
		}
		
		MessageLists.map.put(user.getUserName(), new ArrayList<Message>());
		
		//logger.info(user.toString());
		//logger.info(""+user.getMajorNum());
		request.getSession().setAttribute("user", user);
		if(user.getMajorNum() != 0)
			request.getSession().setAttribute("majorNum", user.getMajorNum());
		redirectAttributes.addFlashAttribute("message","환영합니다. '"+user.getUserName()+"' 님");
		redirectAttributes.addFlashAttribute("alertIcon","success");
		
		return redirectUrl;
	}
	
	@Override
	public void messageBoard(Map<String, Object> map, Logger logger, Model model) {
		List<Message> dtos = null;
		
		int pageSize = 0; // 한 페이지당 출력할 글 갯수
		int pageBlock = 5; // 한블럭당 페이지 갯수

		int cnt = 0; // 총 글 갯수
		int start = 0; // 현재 페이지 시작 글번호
		int end = 0; // 현재 페이지 마지막 글 번호
		int number = 0; // 출력용 글번호
		int pageNum = 0; // 페이지 번호
		int pageCount = 0; // 페이지 갯수
		int startPage = 0; // 시작 페이지
		int endPage = 0; // 마지막 페이지
		
		if(!map.containsKey("pageSize")) {
			pageSize = 10;
		}else
			pageSize = Integer.parseInt((String)map.get("pageSize"));
		
		if(!map.containsKey("pageNum"))
			pageNum = 1;
		else
			pageNum = (Integer)map.get("pageNum");
		
		cnt = dao.messageTotalCnt(map);
		logger.info("Message total : "+cnt);
		
		pageCount = cnt / pageSize + (cnt % pageSize> 0 ? 1:0);
		
		start = (pageNum -1) * pageSize+1;
		end = start + pageSize -1;
		
		logger.info("start : "+start);
		logger.info("end : "+end);
		map.put("start", start);
		map.put("end", end);
		
		if(end > cnt)
			end = cnt;
		
		number = cnt - (pageNum - 1) * pageSize;
		
		logger.info("userNumber : "+map.get("userNumber"));
		logger.info("start : "+map.get("start"));
		logger.info("end : "+map.get("end"));
		
		if(cnt > 0) {
			dtos = dao.getMessages(map);
			model.addAttribute("dtos", dtos);
		}
		
		startPage = (pageNum / pageBlock) * pageBlock + 1;
		
		if (pageNum % pageBlock == 0)
			startPage -= pageBlock;
		
		endPage = startPage + pageBlock - 1;
		if (endPage > pageCount)
			endPage = pageCount;
		
		model.addAttribute("cnt", cnt);
		model.addAttribute("number", number);
		model.addAttribute("pageNum", pageNum);
		
		if (cnt > 0) {
			model.addAttribute("startPage", startPage); // 시작 페이지
			model.addAttribute("endPage", endPage); // 마지막 페이지
			model.addAttribute("pageBlock", pageBlock); // 출력할 페이지 갯수
			model.addAttribute("pageCount", pageCount); // 페이지 갯수
			model.addAttribute("pageSize", pageSize);
		}
	}

	@Override
	public void messageShow(Map<String, Object> map, Logger logger, Model model) {
		Message msg = restDao.showMessage(map);
		model.addAttribute("msg", msg);
	}

	// 단과대명 불러오는 메서드
	@Override
	public List<String> getFacultys() {
		return dao.getFacultys();
	}
	// 학과의 다음 majorNum 조회
	@Override
	public int getMajorCurrval() {
		return dao.getMajorCurrval();
	}

	// 교수의 강의 시간 조회
	@Override
	public void getProfessorLectureTime(String empNumber, String semester, Model model) {
		List<Object> days = new ArrayList<Object>();
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("empNumber", empNumber);
		map.put("semester", semester);
		List<Object> lectures = adminDao.getLecturesTimes(map);
		Map<String, Integer> colorMap = new HashMap<String, Integer>();
		
		int idx = 1;
		for(Object obj: lectures) {
			LectureVO data = ((LectureVO)obj);
			if(!colorMap.containsKey(data.getLectureName())) {
				if(idx==6)
					idx+=1;
				colorMap.put(data.getLectureName(), idx++);
			}
		}
		
		days.add("월");
		days.add("화");
		days.add("수");
		days.add("목");
		days.add("금");
		model.addAttribute("colorMap", colorMap);
		model.addAttribute("lectures", lectures);
		model.addAttribute("days", days);
		model.addAttribute("mode", "timetbl");
		model.addAttribute("semester", semester);
		model.addAttribute("empNumber", empNumber);
	}

	@Override
	public String loginFailEvent(String id, String pw) {
		return dao.loginFailEvent(id, pw);
	}

	@Override
	public Map<String, Object> getBachelorStatus() {
		Map<String, Object> map = new HashMap<String, Object>();
		
		int b_status = dao.getBachelorStatus();
		
		BachelorStatus bachelorStatus = BachelorStatus.valueOf(b_status);
		
		map.put("bachelorStatus", bachelorStatus.getStrValue());
		
		return map;
	}
	
	
	
}
