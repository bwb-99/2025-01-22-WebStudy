package com.sist.model;


import java.util.*;

import com.sist.controller.Controller;
import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
@Controller
public class JjimModel {
	private String[] table={"","project_food","recipe"};
	private String[] noName={"","fno","no"};
	private String[] urls= {"","../food/food_detail.do?fno=","../recipe/recipe_detail.d0?no="};
	
	@RequestMapping("../jjim/jjim_insert.do")
	public String jjim_insert(HttpServletRequest request, HttpServletResponse response)
	{
		String rno=request.getParameter("rno");
		String type=request.getParameter("type");
		HttpSession session=request.getSession();
		
		return "redirect:"+urls[Integer.parseInt(type)]+rno;
	}
	
	

}
