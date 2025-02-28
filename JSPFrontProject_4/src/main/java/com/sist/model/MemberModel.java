package com.sist.model;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
public class MemberModel {
	@RequestMapping("js/postfind.do")
	public String post_find(HttpServletRequest request, HttpServletResponse response)
	{
		String dong=request.getParameter("dong");
		int count=0;
		return "../js/postfind.jsp";
	}
	@RequestMapping("js/postfind.do")
	public String joind(HttpServletRequest request, HttpServletResponse response)
	{
		return "../js/postfind.jsp";
	}
}
