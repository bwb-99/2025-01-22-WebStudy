package com.sist.dao;
// 오라클 연동
import java.util.*;
import java.lang.foreign.AddressLayout;
import java.sql.*;
import com.sist.vo.*;
public class MusicDAO {
		private Connection conn;
		private PreparedStatement ps;
		private final String URL="jdbc:oracle:thin:@localhost:1521:XE";
		private static MusicDAO dao;
		
		public MusicDAO()
		{
			try
			{
				Class.forName("oracle.jdbc.driver.OracleDriver");
			}catch(Exception ex) {}
			
		}
		public static MusicDAO newInstance()
		{
			if(dao==null)
				dao=new MusicDAO();
			return dao;
		}
		public void getConnection()
		{
			try
			{
				conn=DriverManager.getConnection(URL,"hr","happy");
			}catch(Exception ex) {}
		}
		public void disConnection()
		{
			try
			{
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			}catch(Exception ex) {}
		}
		
		public List<MusicVO> musicListData(int page)
		{
			List<MusicVO> list=new ArrayList<MusicVO>();
			try
			{
				//1. 연결
				getConnection();
				//2. SQL문장 전송
				String sql="SELECT mno,title,singer,poster,num "
						   +"FROM (SELECT mno,title,singer,poster,rownum as num "
						   +"FROM (SELECT /*+ INDEX_ASC(genie_music gm_mno_pk)*/mno,title,singer,poster "
						   +"FROM genie_music)) "
						   +"WHERE num BETWEEN ? AND ?";
				//3. 오라클로 전송
				ps=conn.prepareStatement(sql);
				//4. ?에 값을 채운다
				int rowSize=12;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				ps.setInt(1, start);
				ps.setInt(2, end);
				// rownum은 1번부터 시작한다

				//5. 실행 결과 읽기
				ResultSet rs=ps.executeQuery();

				while(rs.next())
				{
					MusicVO vo=new MusicVO();
					vo.setMno(rs.getInt(1));
					vo.setTitle(rs.getString(2));
					vo.setSinger(rs.getString(3));
					vo.setPoster(rs.getString(4));
					list.add(vo);
				}
				rs.close();
			}catch(Exception ex) 
			{
			   //오류처리
				ex.printStackTrace();
			}
			finally
			{
				//닫기
				disConnection();
			}
			return list;
		}
		// 총페이지
		// 시행착오
		public int musicTotalPage()
		{
			int total=0;
			try
			{
				getConnection();
				String sql="SELECT CEIL(COUNT(*)/12.0) "
						   +"FROM genie_music";
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
			}catch(Exception ex) 
			{
				
			}
			finally
			{
				
			}
			return total;
		}
		
		// 상세보기 
		

	}


