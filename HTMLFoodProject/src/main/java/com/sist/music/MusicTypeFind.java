package com.sist.music;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import com.sist.dao.*;

import com.sist.vo.MusicVO;

@WebServlet("/MusicTypeFind")
public class MusicTypeFind extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doget(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    //1. 브라우저로 전송 => HTML을 전송한다
		response.setContentType("text/html;charset=UTF-8");
		//2. 브라우저 연결
		PrintWriter out=response.getWriter();
		
		// 사용자가 보내준 값을 받는다
		String strPage=request.getParameter("cno");
		if(cno==null)
			cno="TOP50";
	}

}
