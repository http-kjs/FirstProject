package com.sist.model;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.*;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sist.controller.RequestMapping;
import com.sist.dao.*;
import com.sist.vo.*;
public class NoticeModel{
	@RequestMapping("notice/list.do")
	public String notice_list(HttpServletRequest request, HttpServletResponse response) {
	    // JSP 첫줄에 나오는 코드 <%  %>
	    String page = request.getParameter("page");
	    if (page == null)
	        page = "1";
	    int curpage = Integer.parseInt(page);

	    // dao연동
	    NoticeDAO dao = NoticeDAO.newInstance();
	    // 게시물 목록
	    List<NoticeVO> list = dao.noticeListData(curpage);
	    // 총페이지
	    int count = dao.noticeRowCount();
	    int totalpage = (int) (Math.ceil(count / 10.0));
	    final int BLOCK = 5;
	    int startpage = ((curpage - 1) / BLOCK * BLOCK) + 1;
	    int endpage = ((curpage - 1) / BLOCK * BLOCK) + BLOCK;
	    if (endpage > totalpage)
	        endpage = totalpage;

	    count = count - ((curpage * 10) - 10);

	    String today = new SimpleDateFormat("yyyy-MM-dd").format(new Date()); // 오늘 날짜
	    // 출력에 필요한 데이터를 모아서 전송 => notice / list.jsp 가 받는다
	    request.setAttribute("curpage", curpage);
	    request.setAttribute("totalpage", totalpage);
	    request.setAttribute("startpage", startpage);
	    request.setAttribute("endpage", endpage);
	    request.setAttribute("count", count);
	    request.setAttribute("today", today);
	    request.setAttribute("list", list);
	    // notice / list.jsp로 전송
	    request.setAttribute("main_jsp", "../notice/list.jsp");
	    return "../main/main.jsp";
	}

	// 데이터 추가
	@RequestMapping("notice/insert.do")
	public String notice_insert(HttpServletRequest request,HttpServletResponse response) {
		request.setAttribute("main_jsp", "../notice/insert.jsp");
		return "../main/main.jsp";
	}
	
	@RequestMapping("notice/insert_ok.do")
	public String notice_insert_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		NoticeVO vo=new NoticeVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		NoticeDAO dao=NoticeDAO.newInstance();
		dao.noticeInsert(vo);
			
		return "redirect:../notice/list.do"; // 실행을 다시 하도록!(.jsp 안되고, .do를 호출해야해 _ 데이터를 가져와야하니까)
	}
	
	// 상세보기
	// JSP -> DispatcherServlet -> Model -> DispatcherSerlet -> JSP
	//		  -----------------				---------------- spring.jar로 고정
	// Model : Model / DAO / VO (세개를 묶어서 다 모델이라고 한다)
	// 화면출력 => main / ajax => 일반jsp / _ok.do => redirect / 
		
	@RequestMapping("notice/detail.do")
	public String notice_detail(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		NoticeDAO dao=NoticeDAO.newInstance();
		NoticeVO vo=dao.noticeDetailData(Integer.parseInt(no));
		
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/detail.jsp");
		
		return "../main/main.jsp";
	}
		
	//Ajax
	@RequestMapping("notice/delete.do")
	public void notice_delete(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		String pwd=request.getParameter("pwd");
	
		NoticeDAO dao=NoticeDAO.newInstance();
		String res=dao.noticeDelete(Integer.parseInt(no), pwd);
		try {
			PrintWriter out=response.getWriter();
			out.println(res); // => out.println 값을 Ajax에서 읽어서 처리 / res => YES or NO
		} catch (Exception e) {}
	}
	
		@RequestMapping("notice/update.do")
	public String notice_update(HttpServletRequest request,HttpServletResponse response) {
		String no=request.getParameter("no");
		// db연동
		NoticeDAO dao=NoticeDAO.newInstance();
		NoticeVO vo=dao.noticeUpdateData(Integer.parseInt(no));
		
		// request를 통해 값을 보낸다
		request.setAttribute("vo", vo);
		request.setAttribute("main_jsp", "../notice/update.jsp");
		
		return "../main/main.jsp";
	}
	
	@RequestMapping("notice/update_ok.do")
	public String notice_update_ok(HttpServletRequest request,HttpServletResponse response) {
		try {
			request.setCharacterEncoding("UTF-8");
		} catch (Exception e) {}
		NoticeVO vo=new NoticeVO();
		vo.setName(request.getParameter("name"));
		vo.setSubject(request.getParameter("subject"));
		vo.setContent(request.getParameter("content"));
		vo.setPwd(request.getParameter("pwd"));
		vo.setNo(Integer.parseInt(request.getParameter("no")));
		NoticeDAO dao=NoticeDAO.newInstance();
		boolean bCheck=dao.noticeUpdate(vo);
		
		request.setAttribute("bCheck", bCheck);
		request.setAttribute("no", vo.getNo());
		return "../notice/update_ok.jsp";
	}
}