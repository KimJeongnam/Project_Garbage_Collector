package com.spring.project.Board;

import java.util.List;
import java.util.Map;

import org.springframework.ui.Model;

public class Board{
	public void setList(Map<String, Object> map, Model model, BoardInterface board) {
		List<Object> dtos = null;

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

		if (!map.containsKey("pageSize")) {
			pageSize = 10;
		} else {
			if( map.get("pageSize") instanceof Integer)
				pageSize = (Integer) map.get("pageSize");
			else if(map.get("pageSize") instanceof String)
				pageSize = Integer.parseInt((String) map.get("pageSize"));
		}
		
		if (!map.containsKey("pageNum"))
			pageNum = 1;
		else {
			if (map.get("pageNum") instanceof Integer)
				pageNum = (Integer) map.get("pageNum");
			else if (map.get("pageNum") instanceof String)
				pageNum = Integer.parseInt((String) map.get("pageNum"));
		}

		cnt = board.getListCount(map);

		pageCount = cnt / pageSize + (cnt % pageSize > 0 ? 1 : 0);

		start = (pageNum - 1) * pageSize + 1;
		end = start + pageSize - 1;

		map.put("start", start);
		map.put("end", end);

		if (end > cnt)
			end = cnt;

		number = cnt - (pageNum - 1) * pageSize;

		if (cnt > 0) {
			dtos = board.getList(map);
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
}
