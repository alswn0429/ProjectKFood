package model3;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO3 {
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	
	public void getCon() {
		
		try {
			Context initctx = new InitialContext();
			Context event = (Context) initctx.lookup("java:comp/env");
			DataSource ds = (DataSource) event.lookup("jdbc/pool");
			con = ds.getConnection();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void insertBoard(BoardBean3 bean) {
		//빈클래스에 넘어오지 않았던 데이터들을 초기화 해주어야 한다
		getCon();
		int ref=0;	//글그룹을 의미 = 쿼리를 실행시켜서 가장 큰 ref값을 가져온 후 +1을 더해주면됨
		int re_step = 1;	//새로운 글이기에 = 부모글 이기에
		int re_level =1;
		
		try {
			//가장 큰 ref값을 읽어오는 쿼리 준비
			String refsql = "select max(ref) from board3";	//ref의 값중 가장 큰값을 리턴해주세요
			
			//쿼리 준비
			pstmt = con.prepareStatement(refsql);
			//쿼리 실행후 결과를 리턴
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1)+1;	//최대값에 +1을 더해서 글 그룹을 설정
				
			}
			//실제로 게시글 전체값을 테이블에 저장
			String sql = "insert into board3 values(board3_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";	//board_seq.NEXTVAL(시퀀스)시퀀스에 들어가있는 값의 다음값을 넣어준다
			//sysdate : 현재 데이터의 시간값을 넣어준다
			pstmt = con.prepareStatement(sql);
			//?에 값을 맵핑
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);
			pstmt.setInt(6, re_step);
			pstmt.setInt(7, re_level);
			pstmt.setString(8, bean.getContent());
			//쿼리 실행
			pstmt.executeUpdate();
			//자원 반납
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//모든 게시글을 리턴해주는 메소드 작성
	public Vector<BoardBean3> getAllBoard(int start,int end) {
		
		//리턴할 객체 선언
		Vector<BoardBean3> v = new Vector<>();
		
		getCon();
		
		try {
			//쿼리준비
			String sql = "select * from (select A.*,Rownum Rnum from (select * from board3 order by ref desc , re_step asc)A)"
					+"where Rnum >= ? and Rnum <= ?";
			//쿼리 실행할객체 선언
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			//쿼리 실행후 결과 저장
			rs = pstmt.executeQuery();
			
			//데이터 개수가 몇개인지 모르기에 반복문을 이용하여 데이터 추출
			while(rs.next()) {
				//데이터를 패키징(가방 = BoardBean클래스를이용)
				BoardBean3 bean = new BoardBean3();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());	//뒤에 toString을 붙여 reg_date를 스트링으로 변환
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
				
				//패키징한 데이터를 백터에 저장
				v.add(bean);
				
			}
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public BoardBean3 getOneBoard(int num) {
		BoardBean3 bean = new BoardBean3();
		getCon();
		
		try {
			//조회수 증가 쿼리
			String readsql = "update board3 set readcount = readcount+1 where num=?";
			pstmt=con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			//쿼리실행
			pstmt.executeUpdate();
			
			String sql = "select * from board3 where num=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	//답변글이 저장 되는 메소드
	public void reWriteBoard(BoardBean3 bean) {
		//부모글 그룹과 글레벨 글스텝을 읽어드림
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level= bean.getRe_level();
		
		getCon();
		
		try {
			///////////////핵심 코드//////////////
			//부모글 보다 큰 re_level값을 전부 1씩 증가
			String levelsql = "update board3 set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			//답변글 데이터를 저장
			String sql = "insert into board3 values(board3_seq.NEXTVAL,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setInt(5, ref);	//부모의 ref값을 넣어줌
			pstmt.setInt(6, re_step+1);		//답글이기에 부모 step에 1을 더해 줌
			pstmt.setInt(7, re_level+1);	//답글이기에 부모level에 1을 더해줌
			pstmt.setString(8, bean.getContent());
			
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//boardupdate용 하나의 게시글을 리턴
	public BoardBean3 getOneUpdateBoard(int num) {
		BoardBean3 bean = new BoardBean3();
		getCon();
		
		try {
			
			String sql = "select * from board3 where num=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setReg_date(rs.getDate(6).toString());
				bean.setRef(rs.getInt(7));
				bean.setRe_step(rs.getInt(8));
				bean.setRe_level(rs.getInt(9));
				bean.setReadcount(rs.getInt(10));
				bean.setContent(rs.getString(11));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	//UpDate와 Delete시 필요한 패스워드값을 리턴해주는 메서드
	public String getPass(int num) {
		//리턴할 변수 객체 선언
		String pass ="";
		getCon();
		
		try {
			String sql = "select password from board3 where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				pass = rs.getString(1);
				
			}
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return pass;
	}
	public void updateBoard(BoardBean3 bean) {
		getCon();
		
		try {
			String sql = "update board3 set subject=? , content=? where num=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, bean.getSubject());
			pstmt.setString(2, bean.getContent());
			pstmt.setInt(3, bean.getNum());
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	public void deleteBoard(int num) {
		getCon();
		
		try {
			String sql = "delete from board3 where num=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
			
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public int getAllCount() {
		getCon();
		
		//게시글 전체수를 저장하는 변수
		int count = 0;
		try {
			String sql = "select count(*) from board3";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);	//전체 게시글 수
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
