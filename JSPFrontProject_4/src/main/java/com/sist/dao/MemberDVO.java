package com.sist.dao;
import java.sql.*;
import java.util.*;

import com.sist.vo.FoodVO;
public class MemberDVO {
	 private Connection conn;
	  // SQL=> 송신 , 결과값 => 수신 
	  private PreparedStatement ps;
	  // 연결 => URL 
	  private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
	  // 한사람당 한개의 DAO사용 => 싱글턴 
	  private static MemberDVO dao;
	  
	  // 1. 드라이버 등록 
	  public MemberDVO()
	  {
		  try
		  {
			  Class.forName("oracle.jdbc.driver.OracleDriver");
		  }catch(Exception ex) {}
	  }
	  // 2. 싱글턴 => static으로 설정 (static 메모리 공간이 한개)
	  public static MemberDVO newInstance()
	  {
		  if(dao==null)
			  dao=new MemberDVO();
		  return dao;
	  }
	  // 3. 오라클 연결 
	  public void getConnection()
	  {
		  try
		  {
			  conn=DriverManager.getConnection(URL,"hr","happy");
			  // conn hr/happy
		  }catch(Exception ex) {}
	  }
	  // 4. 오라클 닫기 
	  public void disConnection()
	  {
		  try
		  {
			  if(ps!=null) ps.close();
			  if(conn!=null) conn.close();
		  }catch(Exception ex) {}
	  }
	  public List<ZipcodeVO> postfind(String dong)
	  {
		  List<MemberDVO> list=new ArrayList<MemberDVO>();
		  
		  try
		  {
		  getConnection();
		  String sql="SELECT zipcode,sudo,gugun,dong,NVL(bunji,dong)"
				     +"FROM zipcode "
				     +"WHERE dong LIKE '%'||?||'%'";
		  ps=conn.prepareStatement(sql);
		  ResultSet rs=ps.executeQuery();
		  }
		  catch(Exception ex) 
		  {
			  ex.printStackTrace();
		  }
		  finally
		  {
		     return list;
		  }
		  
	  }
	  

}
