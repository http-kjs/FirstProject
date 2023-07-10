package com.sist.dao;

import java.sql.*;

import com.sist.common.*;
import java.util.*;
import com.sist.vo.*;

public class HotelDAO {
	private Connection conn;
	private PreparedStatement ps;
	private CreateDataBase db = new CreateDataBase();
	private String[] tab = {"'%'", "1", "2", "3", "4"};
	private static HotelDAO dao;
	private String hotelURL = "http://www.jejutori.com/";
	
	// 싱글턴
	public static HotelDAO newInstance() {
		if (dao == null) {
			dao = new HotelDAO();
		}
		return dao;
	}
	
	// 기능
	// 리스트출력
	public List<HotelVO> hotelListData(int page, int type) {
		List<HotelVO> list = new ArrayList<HotelVO>();
		
		try {
			conn = db.getConnection();
			String sql = "SELECT hdno, huno, name, poster, addr, hcno, num "
						+"FROM (SELECT hdno, huno, name, poster, addr, hcno, rownum as num "
						+"FROM (SELECT hdno, huno, name, poster, addr,  hcno "
						+"FROM hotel_detail WHERE hcno like "+tab[type]
						+" ORDER BY hdno ASC)) "
						+"WHERE num BETWEEN ? AND ?";
			ps = conn.prepareStatement(sql);
			int rowSize = 12;
			int start = (rowSize*page)-(rowSize-1);
			int end = rowSize*page;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			ResultSet rs = ps.executeQuery();
			while(rs.next()) {
				HotelVO vo = new HotelVO();
				vo.setHdno(rs.getInt(1));
				vo.setHuno(rs.getInt(2));
				vo.setName(rs.getString(3));
				String poster = rs.getString(4).substring(0, rs.getString(4).indexOf("^"));
				vo.setPoster(hotelURL+poster);
				vo.setAddress(rs.getString(5).substring(0, rs.getString(5).indexOf("/")));
				vo.setHcno(rs.getInt(6));
				list.add(vo);
			}
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return list;
	}
	
	// 총페이지
	public int goodsTotalPage(int type) {
		int total=0;
		try {
			conn = db.getConnection();
			String sql = "SELECT CEIL(COUNT(*)/12.0) FROM hotel_detail where hcno like "+tab[type];
			ps = conn.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();
			rs.next();
			total = rs.getInt(1);
			rs.close();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			db.disConnection(conn, ps);
		}
		return total;
	}
}