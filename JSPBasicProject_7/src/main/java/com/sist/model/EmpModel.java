package com.sist.model;
import java.util.*;
import com.sist.dao.EmpDAO;
import com.sist.vo.EmpVO;

import jakarta.servlet.http.HttpServletRequest;

// => JSP에서 출력 / 처리를 자바에서 처리
// request /response 
// ------- 요청값을 담고 있다 => 데이터를 추가 다시 JSP로 전송
public class EmpModel {
	public void empListData(HttpServletRequest request) //=> Call By Reference : 배열 / 클래스
	{
		// 1. DataBase연동 
		EmpDAO dao=new EmpDAO();
		List<EmpVO> list=dao.empListDat();
		request.setAttribute("list", list);
		// JSP에서 받은 request에 값을 채워준다
		// request.setAttribute("curpage", curpage); => 여러개 담을 수 있어서 retrun형을 쓰지 않는다.
		
	}

}
