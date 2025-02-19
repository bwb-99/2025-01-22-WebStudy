package com.sist.model;

import jakarta.servlet.http.HttpServletRequest;

public class InsertModel {
	public void execute(HttpServletRequest request)
	{
		request.setAttribute("msg", request);
	}

}
