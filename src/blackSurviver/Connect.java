package blackSurviver;

import java.sql.*;


public class Connect {

	private DBConnectionMgr pool;

	public Connect() {
		pool = DBConnectionMgr.getInstance();
	}

	
	//로그인후 시작시 insert되는 user_info value
	
	public boolean start(String id, int ch) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert user_info(id,ch,level,nowhp,nowst,maxhp,maxst,atk,def,local) values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.setInt(2, ch);
			pstmt.setInt(3, 1);
			pstmt.setInt(4, 100);
			pstmt.setInt(5, 100);
			pstmt.setInt(6, 100);
			pstmt.setInt(7, 100);
			pstmt.setInt(8, 100);
			pstmt.setInt(9, 100);
			pstmt.setInt(10, 1);

			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	
	//count가 0이될시 insert된 user_info를 delete시켜서 리셋함
	
	public boolean reset(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "delete from user_info where `id`=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
			System.out.println(id + pstmt + flag);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}

	
	//회원가입시 id,pwd,ch(캐릭터) 값저장
	
	public boolean insert(User bean) {

		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		boolean flag = false;
		try {
			con = pool.getConnection();
			sql = "insert user values(?,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getId());
			pstmt.setString(2, bean.getPwd());
			pstmt.setInt(3, bean.getCh());
			System.out.println(bean.getId() + bean.getPwd() + bean.getCh());

			if (pstmt.executeUpdate() == 1) {
				flag = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
		return flag;

	}
	
	//해당 id의 유저 select

	public User userlist(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		User bean = new User();
		try {
			con = pool.getConnection();
			sql = "select * from user where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setPwd(rs.getString("pwd"));
				bean.setCh(rs.getInt("ch"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	
	//해당 id의 User 값을 select해옴

	public User user_info(String id) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		User bean = new User();
		try {
			con = pool.getConnection();
			sql = "select * from user_info where id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setId(rs.getString("id"));
				bean.setCh(rs.getInt("ch"));
				bean.setLevel(rs.getInt("level"));
				bean.setNowhp(rs.getInt("nowhp"));
				bean.setNowst(rs.getInt("nowst"));
				bean.setMaxhp(rs.getInt("maxhp"));
				bean.setMaxst(rs.getInt("maxst"));
				bean.setAtk(rs.getInt("atk"));
				bean.setDef(rs.getInt("def"));
				bean.setLocal(rs.getInt("local"));
				bean.setWeapon(rs.getInt("weapon"));
				bean.setArmor1(rs.getInt("armor1"));
				bean.setArmor2(rs.getInt("armor2"));
				bean.setArmor3(rs.getInt("armor3"));
				bean.setArmor4(rs.getInt("armor4"));
				bean.setArmor5(rs.getInt("armor5"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;

	}
	
	//아이템찾기시 사용할 예정

	public int finditem(String id) {
		int item = 0;
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "select * from find_item_list";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if (rs.next()) {
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}

		return item;
	}
	
	//맵이동시에 업데이트되는정보 (local=맵)
	
	public boolean updateboard(User bean) {
	      Connection con = null;
	      PreparedStatement pstmt = null;
	      String sql = null;
	      boolean flag = false;
	      
	      try {
	          con = pool.getConnection();
	          sql = "update boarddb set btitle=?,bcontent=? where bnum=?";
	          pstmt = con.prepareStatement(sql);
	         /* pstmt.setString(1,bean.getBtitle());
	          pstmt.setString(2,bean.getBcontent());
	          pstmt.setInt(3,bean.getBnum());	*/		          
	          if(pstmt.executeUpdate()==1){
	         	 flag=true;
	          }
	       }catch (Exception e) {
	          e.printStackTrace();
	       } finally {
	          pool.freeConnection(con, pstmt);
	       }
	       return flag;
	    }
	
	
	

}