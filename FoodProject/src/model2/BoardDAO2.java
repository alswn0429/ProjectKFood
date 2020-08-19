package model2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class BoardDAO2 {
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
	public void insertBoard(BoardBean2 bean) {
		//��Ŭ������ �Ѿ���� �ʾҴ� �����͵��� �ʱ�ȭ ���־�� �Ѵ�
		getCon();
		int ref=0;	//�۱׷��� �ǹ� = ������ ������Ѽ� ���� ū ref���� ������ �� +1�� �����ָ��
		int re_step = 1;	//���ο� ���̱⿡ = �θ�� �̱⿡
		int re_level =1;
		
		try {
			//���� ū ref���� �о���� ���� �غ�
			String refsql = "select max(ref) from board2";	//ref�� ���� ���� ū���� �������ּ���
			
			//���� �غ�
			pstmt = con.prepareStatement(refsql);
			//���� ������ ����� ����
			rs = pstmt.executeQuery();
			if (rs.next()) {
				ref = rs.getInt(1)+1;	//�ִ밪�� +1�� ���ؼ� �� �׷��� ����
				
			}
			//������ �Խñ� ��ü���� ���̺� ����
			String sql = "insert into board2 values(board2_seq.NEXTVAL,?,?,?,?,?,sysdate,?,?,?,0,?)";	//board_seq.NEXTVAL(������)�������� ���ִ� ���� �������� �־��ش�
			//sysdate : ���� �������� �ð����� �־��ش�
			pstmt = con.prepareStatement(sql);
			//?�� ���� ����
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getKind());
			pstmt.setInt(6, ref);
			pstmt.setInt(7, re_step);
			pstmt.setInt(8, re_level);
			pstmt.setString(9, bean.getContent());
			//���� ����
			pstmt.executeUpdate();
			//�ڿ� �ݳ�
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	//��� �Խñ��� �������ִ� �޼ҵ� �ۼ�
	public Vector<BoardBean2> getAllBoard(int start,int end) {
		
		//������ ��ü ����
		Vector<BoardBean2> v = new Vector<>();
		
		getCon();
		
		try {
			//�����غ�
			String sql = "select * from (select A.*,Rownum Rnum from (select * from board2 order by ref desc , re_step asc)A)"
					+"where Rnum >= ? and Rnum <= ?";
			//���� �����Ұ�ü ����
			pstmt = con.prepareStatement(sql);
			
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			
			//���� ������ ��� ����
			rs = pstmt.executeQuery();
			
			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� ������ ����
			while(rs.next()) {
				//�����͸� ��Ű¡(���� = BoardBeanŬ�������̿�)
				BoardBean2 bean = new BoardBean2();
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setKind(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());	//�ڿ� toString�� �ٿ� reg_date�� ��Ʈ������ ��ȯ
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
				
				//��Ű¡�� �����͸� ���Ϳ� ����
				v.add(bean);
				
			}
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	//���õ� �������� �۵��� �������ִ� �޼ҵ�
	public Vector<BoardBean2> getRecipeBoard(int start,int end,String kind) {
		
		//������ ��ü ����
		Vector<BoardBean2> v = new Vector<>();
		
		getCon();
		
		try {
			//�����غ�
			String sql = "select * from (select A.*,Rownum Rnum from (select * from board2 order by ref desc , re_step asc)A)"
					+"where Rnum >= ? and Rnum <= ? and kind=?";
			//���� �����Ұ�ü ����
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, start);
			pstmt.setInt(2, end);
			pstmt.setString(3, kind);
			
			
			//���� ������ ��� ����
			rs = pstmt.executeQuery();
			
			//������ ������ ����� �𸣱⿡ �ݺ����� �̿��Ͽ� ������ ����
			while(rs.next()) {
				BoardBean2 bean = new BoardBean2();
				//�����͸� ��Ű¡(���� = BoardBeanŬ�������̿�)
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setKind(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());	//�ڿ� toString�� �ٿ� reg_date�� ��Ʈ������ ��ȯ
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
				
				//��Ű¡�� �����͸� ���Ϳ� ����
				v.add(bean);
				
			}
			con.close();
			
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return v;
	}
	public BoardBean2 getOneBoard(int num) {
		BoardBean2 bean = new BoardBean2();
		getCon();
		
		try {
			//��ȸ�� ���� ����
			String readsql = "update board2 set readcount = readcount+1 where num=?";
			pstmt=con.prepareStatement(readsql);
			pstmt.setInt(1, num);
			//��������
			pstmt.executeUpdate();
			
			String sql = "select * from board2 where num=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setKind(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	//�亯���� ���� �Ǵ� �޼ҵ�
	public void reWriteBoard(BoardBean2 bean) {
		//�θ�� �׷�� �۷��� �۽����� �о�帲
		int ref = bean.getRef();
		int re_step = bean.getRe_step();
		int re_level= bean.getRe_level();
		
		getCon();
		
		try {
			///////////////�ٽ� �ڵ�//////////////
			//�θ�� ���� ū re_level���� ���� 1�� ����
			String levelsql = "update board2 set re_level = re_level+1 where ref=? and re_level > ?";
			pstmt = con.prepareStatement(levelsql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, re_level);
			pstmt.executeUpdate();
			
			//�亯�� �����͸� ����
			String sql = "insert into board2 values(board2_seq.NEXTVAL,?,?,?,?,?,sysdate,?,?,?,0,?)";
			pstmt=con.prepareStatement(sql);
			
			pstmt.setString(1, bean.getWriter());
			pstmt.setString(2, bean.getEmail());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getPassword());
			pstmt.setString(5, bean.getKind());
			pstmt.setInt(6, ref);	//�θ��� ref���� �־���
			pstmt.setInt(7, re_step+1);		//����̱⿡ �θ� step�� 1�� ���� ��
			pstmt.setInt(8, re_level+1);	//����̱⿡ �θ�level�� 1�� ������
			pstmt.setString(9, bean.getContent());
			
			pstmt.executeUpdate();
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	
	//boardupdate�� �ϳ��� �Խñ��� ����
	public BoardBean2 getOneUpdateBoard(int num) {
		BoardBean2 bean = new BoardBean2();
		getCon();
		
		try {
			
			String sql = "select * from board2 where num=?";
			
			pstmt=con.prepareStatement(sql);
			
			pstmt.setInt(1, num);
			
			rs=pstmt.executeQuery();
			if (rs.next()) {
				bean.setNum(rs.getInt(1));
				bean.setWriter(rs.getString(2));
				bean.setEmail(rs.getString(3));
				bean.setSubject(rs.getString(4));
				bean.setPassword(rs.getString(5));
				bean.setKind(rs.getString(6));
				bean.setReg_date(rs.getDate(7).toString());
				bean.setRef(rs.getInt(8));
				bean.setRe_step(rs.getInt(9));
				bean.setRe_level(rs.getInt(10));
				bean.setReadcount(rs.getInt(11));
				bean.setContent(rs.getString(12));
			}

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return bean;
	}
	//UpDate�� Delete�� �ʿ��� �н����尪�� �������ִ� �޼���
	public String getPass(int num) {
		//������ ���� ��ü ����
		String pass ="";
		getCon();
		
		try {
			String sql = "select password from board2 where num=?";
			
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
	public void updateBoard(BoardBean2 bean) {
		getCon();
		
		try {
			String sql = "update board2 set subject=? , content=? where num=?";
			
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
			String sql = "delete from board2 where num=?";
			
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
		
		//�Խñ� ��ü���� �����ϴ� ����
		int count = 0;
		try {
			String sql = "select count(*) from board2";
			
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);	//��ü �Խñ� ��
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
	public int getRecipeCount(String kind) {
		getCon();
		
		//�Խñ� ��ü���� �����ϴ� ����
		int count = 0;
		try {
			BoardBean2 bean = new BoardBean2();
			String sql = "select count(*) from board2 where kind=?";
			
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, kind);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				count = rs.getInt(1);	//��ü �Խñ� ��
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return count;
	}
}
