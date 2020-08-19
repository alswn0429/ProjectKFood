package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class MemberDAO {
	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet rs = null;

	public void getCon() {

		try {
			// �ܺο��� �����͸� �о����� �ϱ⿡
			Context initctx = new InitialContext(); // (JNDI)
			// ��Ĺ ������ ������ ��� ���� ������ �̵�
			Context envctx = (Context) initctx.lookup("java:comp/env"); // (java:comp/env�� �ʼ������� ���� ex)c: �� ������
			// ������ �ҽ� ��ü�� ����
			DataSource ds = (DataSource) envctx.lookup("jdbc/pool");// (jdbc/pool = �������� ���)(������ �ҽ��� �̸�)

			con = ds.getConnection();

		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public int loginOK(String id, String pass) {
		int result = -1;

		getCon();

		try {
			String sql = "select password from member where id=?";

			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {

				if (rs.getString("password") != null && rs.getString("password").contentEquals(pass)) {

					result = 1;

				} else
					result = 0;
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	public MemberBean oneSelect(String id) {
		getCon();
		
		MemberBean mbean=new MemberBean();
		try {
			String sql = "select * from member where id=?";
			
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			
			if (rs.next()) {
				mbean.setId(rs.getString(1));
				mbean.setPass1(rs.getString(2));
				mbean.setName(rs.getString(3));
				mbean.setBirth(rs.getInt(4));
				mbean.setGender(rs.getString(5));
				mbean.setTel(rs.getString(6));
				mbean.setEmail(rs.getString(7));
				mbean.setAddress(rs.getString(8));
				
			}
			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return mbean;
	}

	public void insertMember(MemberBean bean) {

		getCon();

		try {
			String sql = "insert into member values(?,?,?,?,?,?,?,?)";

			pstmt = con.prepareStatement(sql);

			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPass1());
			pstmt.setString(3, bean.getName());
			pstmt.setInt(4, bean.getBirth());
			pstmt.setString(5, bean.getGender());
			pstmt.setString(6, bean.getTel());
			pstmt.setString(7, bean.getEmail());
			pstmt.setString(8, bean.getAddress());

			pstmt.executeQuery();

			con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void updateMember(MemberBean bean) {
		getCon();
		
		try {
		String sql = "update member set name=?,tel=?,email=?,address=? where id=?";
		pstmt = con.prepareStatement(sql);
		pstmt.setString(1, bean.getName());
		pstmt.setString(2, bean.getTel());
		pstmt.setString(3, bean.getEmail());
		pstmt.setString(4, bean.getAddress());
		pstmt.setString(5, bean.getId());
		
		pstmt.executeUpdate();
		
		con.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public void deleteMember(MemberBean bean) {
		getCon();
		
		try {
			String sql = "delete from member where id=?";
			
			pstmt= con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.executeUpdate();
			
				
			con.close();
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	// 紐⑤�� ������ ��蹂대�� 由ы�댄���� 硫�����
			public Vector<MemberBean> getAllMember() {

				// 由ы�댄������ 癒쇱�� ����(媛�泥대�� 癒쇱�� ����)����.
				Vector<MemberBean> v = new Vector<>();

				getCon();

				try {
					// 荑쇰━ 以�鍮�
					String sql = "select * from member";
					// 荑쇰━ 媛�泥� 以�鍮�
					pstmt = con.prepareStatement(sql);
					// 荑쇰━ �ㅽ���� 寃곌낵瑜� 由ы�댄����.
					rs = pstmt.executeQuery();
					// 諛�蹂듬Ц�� ��硫댁�� ������ ��蹂대�� ���ν����.
					// ���μ�� ���ㅻ㈃ 鍮� �대���ㅼ���� 鍮�怨듦��� ���댁�� ��湲� ��臾몄�� 媛�泥대�� ���깊����.
					while (rs.next()) {
						MemberBean bean = new MemberBean();
						bean.setId(rs.getString(1));
						bean.setPass1(rs.getString(2));
						bean.setName(rs.getString(3));
						bean.setBirth(rs.getInt(4));
						bean.setGender(rs.getString(5));
						bean.setTel(rs.getString(6));
						bean.setEmail(rs.getString(7));
						bean.setAddress(rs.getString(8));

						// 踰≫�곗�� 鍮� �대���ㅼ�� ���ν��
						v.add(bean);
					}

					con.close();

				} catch (Exception e) {

					e.printStackTrace();
				}
				return v;
			}
}
