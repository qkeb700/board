package board;

import board.Column;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DbDao {
	private static Connection connection;
	private static DbDao instance;
	final private static String dburi = "jdbc:mysql://localhost:3306/mydb";
	final private static String dbuser = "root";
	final private static String dbpwd = "sksdi1532";
	
	
	//DbDao생성자로 디비 접속 커넥션
	private DbDao() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(dburi, dbuser, dbpwd);
			
		}catch(SQLException e) {
			e.printStackTrace();
			System.out.println("커넥션을 연결할 수 없습니다.");
		}catch(ClassNotFoundException e) {
			e.printStackTrace();
			System.out.println("드라이버를 로드할 수 없습니다.");
		}
	}
	
	//getInstance()
	public static DbDao getInstance() {
		if(instance == null) {
			instance = new DbDao();
		}
		return instance;
	}
	
	
	//insertDb(){}
	public void insertDb(Column column) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into board (writer, pwd, title, content, wdate) values (?,?,?,?,?)"; 
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, column.getWriter());
			pstmt.setString(2, column.getPwd());
			pstmt.setString(3, column.getTitle());
			pstmt.setString(4, column.getContent());
			pstmt.setString(5, column.getWdate());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	// insert memo
	public void insertmemoDb(MemoColumn column) {
		PreparedStatement pstmt = null;
		try {
			String sql = "insert into bbsmemo (bbs_id, writer, pwd, content, wdate) values (?,?,?,?,?)"; 
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, column.getBbs_id());
			pstmt.setString(2, column.getWriter());
			pstmt.setString(3, column.getPwd());
			pstmt.setString(4, column.getContent());
			pstmt.setString(5, column.getWdate());
			
			pstmt.executeUpdate();
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	//updateDb(){}
	public void updateDb(Column column) {
		PreparedStatement pstmt = null;
		try {
			String sql = "update board set title=?, content=?, wdate=? where id=?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, column.getTitle());
			pstmt.setString(2, column.getContent());
			pstmt.setString(3, column.getWdate());
			pstmt.setString(4, column.getId());
			pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	// hit증가
	public void hitUpdateDb(String col, String id) {
		PreparedStatement pstmt = null;
		try {
			String sql;
			if(col == "hit") {
				sql = "update board set hit=hit+1 where id=?";				
			}else {
				sql = "update board set memocount=memocount+1 where id=?";
			}
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();			
		} catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	//delete
	public void delete(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			String sql = "delete from board where id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			pstmt.executeUpdate();
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			if(pstmt!=null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
	}
	//selectOne
	public Column selectOne(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Column column = new Column();
		try {
			String sql = "select * from board where id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					column.setId(rs.getString("id"));
					column.setWriter(rs.getString("writer"));
					column.setPwd(rs.getString("pwd"));
					column.setTitle(rs.getString("title"));
					column.setContent(rs.getString("content"));
					column.setWdate(rs.getString("wdate"));
					column.setHit(rs.getString("hit"));
				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return column;
	}
	
	// select Comment
	/*public Comment selectCom(String id) {
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		Comment comment = new Comment();
		try {
			String sql = "select * from bbsmemo where bbs_id = ?";
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, id);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				comment.setId(rs.getString("id"));
				comment.setBbsid(rs.getString("bbs_id"));
				comment.setWriter(rs.getString("writer"));
				comment.setPwd(rs.getString("pwd"));
				comment.setContent(rs.getString("content"));
				comment.setWdate(rs.getString("wdate"));				
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return comment;
	}
	*/
	
	//selectAll
	public int selectAll(String col, String val) {
		int count = 0;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql;
		try {
			switch(col) {
				case "writer":
					sql ="select count(*) from board where writer like ?";
				break;
				case "title":
					sql ="select count(*) from board where title like ?";
				break;
				case "content":
					sql ="select count(*) from board where content like ?";
				break;
				case "all":
					sql ="select count(*) from board where title like ? or content like ?";
				break;
				default:
					sql ="select count(*) from board";
			}
			pstmt = connection.prepareStatement(sql);
			if(val != "") {
				pstmt.setString(1, "%" + val + "%");
				if(col.equals("all")) {
					pstmt.setString(2, "%" + val + "%");
				}
			}
			
			rs = pstmt.executeQuery();

				while(rs.next()) {
					count = rs.getInt("count(*)");
				}
			
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
			}
		}
		return count;
	}
	//selectPaging
	public List<Column> selectPaging(int st, int ed, String col, String val){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<Column> list = new ArrayList<Column>();
		try {
			switch(col) {
			case "writer":
				sql ="select * from board where writer like ? order by id desc limit ?, ?";
			break;
			case "title":
				sql ="select * from board where title like ? order by id desc limit ?, ?";
			break;
			case "content":
				sql ="select * from board where content like ? order by id desc limit ?, ?";
			break;
			case "all":
				sql ="select * from board where title like ? or content like ? order by id desc limit ?, ?";
			break;
			default:
				sql ="select * from board order by id desc limit ?, ?";
		}
			
			pstmt = connection.prepareStatement(sql);
			if(val == "") {
				pstmt.setInt(1, st);
				pstmt.setInt(2, ed);				
			}else {
				if(col.equals("all")) {
					pstmt.setString(1,  "%" + val + "%");
					pstmt.setString(2,  "%" + val + "%");
					pstmt.setInt(3, st);
					pstmt.setInt(4, ed);				
				}else {
					pstmt.setString(1,  "%" + val + "%");
					pstmt.setInt(2, st);
					pstmt.setInt(3, ed);	
				}
			}
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Column column = new Column();
				column.setId(rs.getString("id"));
				column.setWriter(rs.getString("writer"));
				column.setPwd(rs.getString("pwd"));
				column.setTitle(rs.getString("title"));
				column.setContent(rs.getString("content"));
				column.setWdate(rs.getString("wdate"));
				column.setHit(rs.getString("hit"));
				column.setMemocount(rs.getString("memocount"));
				
				list.add(column);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
	
	public List<MemoColumn> selectMemo(String bbs_id){
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		List<MemoColumn> list = new ArrayList<MemoColumn>();
		try {
			sql ="select * from bbsmemo where bbs_id = ? order by id desc";			
			pstmt = connection.prepareStatement(sql);
			pstmt.setString(1, bbs_id);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				MemoColumn column = new MemoColumn();
				column.setId(rs.getString("id"));
				column.setBbs_id(rs.getString("bbs_id"));
				column.setWriter(rs.getString("writer"));
				column.setPwd(rs.getString("pwd"));
				column.setContent(rs.getString("content"));
				column.setWdate(rs.getString("wdate"));
				list.add(column);
			}
		}catch(SQLException e) {
			e.printStackTrace();
		}finally {
			if(pstmt != null) {
				try {
					pstmt.close();
				}catch(SQLException e) {
					e.printStackTrace();
				}
			}
		}
		return list;
	}
}
