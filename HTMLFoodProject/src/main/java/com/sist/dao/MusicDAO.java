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
		public MusicVO musicDetailData(int mno)
		{
			MusicVO vo=new MusicVO();
			try
			{
				getConnection();
				String sql="UPDATE genie_music SET "
						  +"hit=hit+1 "
						  +"WHERE mno="+mno;
				ps=conn.prepareStatement(sql);
				ps.executeUpdate();
				
				//mainpage => 공동작업
				//	private int mno,cno,idcrement,hit;
				//  private String title,singer,album,poster,state,key;
				
				sql="SELECT title,singer,album,poster,state,key,cno,idcrement,hit "
				    +"FROM genie_music "
					+"WHERE mno="+mno;
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				
				vo.setTitle(rs.getString("title"));
				vo.setSinger(rs.getString("singer"));
				vo.setAlbum(rs.getString("album"));
				vo.setPoster(rs.getString("poster"));
				vo.setState(rs.getString("state"));
				vo.setKey(rs.getString("key"));
				vo.setCno(rs.getInt("cno"));
				vo.setIdcrement(rs.getInt("idcrement"));
				vo.setHit(rs.getInt("hit"));
				rs.close();
			}
			catch(Exception ex) 
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return vo;
		}
		// cookie 데이터
		public MusicVO musicCookieData(int mno)
		{
			MusicVO vo=new MusicVO();
			try
			{
				getConnection();
				String sql="SELECT mno,title,singer,poster "
						  +"FROM genie_music "
						  +"WHERE mno="+mno;
				ps=conn.prepareStatement(sql);
				ResultSet rs=ps.executeQuery();
				rs.next();
				vo.setMno(rs.getInt(1));
				vo.setTitle(rs.getString(2));
				vo.setSinger(rs.getString(3));
				vo.setPoster(rs.getString(4));
				rs.close();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return vo;
		}
		// 음악 종류별 검색
		public List<MusicVO> musicTypeFind(int page,int cno)
		{
			List<MusicVO> list= new ArrayList<MusicVO>();
			
			try
			{
				getConnection();
				String sql="";
				int rowSize=12;
				int start=(rowSize*page)-(rowSize-1);
				int end=rowSize*page;
				sql="SELECT mno,title,poster,num "
						 +"FROM (SELECT mno,title,poster,rownum as num "
						 +"FROM (SELECT mno,title,poster "
						 +"FROM  genie_music  "
						 +"WHERE cno=?)) "
						 +"WHERE num BETWEEN ? AND ?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, cno);
				ps.setInt(2, start);
				ps.setInt(3, end);
			 
				ResultSet rs=ps.executeQuery();
				  // => list에 저장 
				  while(rs.next())
				  {
					  MusicVO vo=new MusicVO();
					  vo.setMno(rs.getInt(1));
					  vo.setTitle(rs.getString(2));
					  vo.setPoster(rs.getString(3));
					  list.add(vo);
				  }
				  rs.close();
			}catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return list;
		}

		public int musicTypeTotalPage(int cno)
		{
			int total=0;
			try
			{
				getConnection();
				String sql="SELECT CEIL(COUNT(*)/12.0) "
						  +"FROM genie_music "
						  +"WHERE cno=?"+cno;
				ps=conn.prepareStatement(sql);
				ps.setInt(1, cno);
				
				ResultSet rs=ps.executeQuery();
				rs.next();
				total=rs.getInt(1);
				rs.close();
			}
			catch(Exception ex)
			{
				ex.printStackTrace();
			}
			finally
			{
				disConnection();
			}
			return total;
		}
		// ?page= &col= &fd=
		public List<MusicVO> MusicFind(int page, String col, String fd)
		{
			
			List<MusicVO> list=new ArrayList<MusicVO>();
		try
		{
			getConnection();
			String sql="SELECT mno,title,singer,album,poster,cno,num "
					+ "FROM (SELECT mno,title,singer,album,poster,cno,rownum as num "
					+"FROM (SELECT mno,title,singer,album,poster,cno "
					+"FROM  genie_music "
					+"WHERE "+col+" LIKE '%'||?||'%')) "
				    +"WHERE num BETWEEN ? AND ?";
			
			ps=conn.prepareStatement(sql);
			  int rowSize=20;
			  int start=(rowSize*page)-(rowSize-1);
			  int end=rowSize*page;
			  
			  ps.setString(1, fd);
			  ps.setInt(2, start);
			  ps.setInt(3, end);
			  
			  ResultSet rs=ps.executeQuery();
			  while(rs.next())
			  {
				  MusicVO vo=new MusicVO();
				  vo.setMno(rs.getInt(1));
				  vo.setTitle(rs.getString(2));
				  vo.setPoster(rs.getString(3));

				   
				  
			  }
		}
		catch(Exception ex)
		{
			
		}
		finally
		{
			
		}
		return list;
		
		
	}
}


