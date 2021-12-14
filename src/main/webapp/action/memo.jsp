<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.sql.*, java.text.*" %>
<%@ page import="board.DbDao, board.MemoColumn" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="col" class="board.MemoColumn"/>
<jsp:useBean id="jobj" class="org.json.simple.JSONObject" />
<jsp:setProperty name="col" property="*"/>

<%
	String bbs_id = request.getParameter("bbs_id");
	String mode = request.getParameter("mode");
	
	if(mode.equals("write")){
		DbDao.getInstance().insertmemoDb(col);
		DbDao.getInstance().hitUpdateDb("memocount", bbs_id);
		// response.sendRedirect("../list.jsp");
		jobj.put("result", "1");
		response.setContentType("application/json");
		out.print(jobj.toJSONString());
		
	} else if(mode.equals("edit")){
		String pwd = request.getParameter("editpwd");
		if(pwd == null || pwd == ""){
			jobj.put("result", "0");
			response.setContentType("application/json");
			out.print(jobj.toJSONString());
			return;
		} else {
			col = DbDao.getInstance().selectmemoOne(request.getParameter("memoid"));
			
			if(!pwd.equals(col.getPwd())){
				jobj.put("result", "1");
				response.setContentType("application/json");
				out.print(jobj.toJSONString());				
			}else{
				String wdate = request.getParameter("wdate");
				String content = request.getParameter("content");
				DbDao.getInstance().updatememoDb(col, content, wdate);
				jobj.put("result", "2");
				response.setContentType("application/json");
				out.print(jobj.toJSONString());
			}
			
		}
	} else if(mode.equals("del")){
		String pwd = request.getParameter("pwd");
		if(pwd == null || pwd == ""){
			jobj.put("result", "0");
			response.setContentType("application/json");
			out.print(jobj.toJSONString());
			return;
		} else{			
			col = DbDao.getInstance().selectmemoOne(request.getParameter("memoid"));
			if(!pwd.equals(col.getPwd())){
				jobj.put("result", "1");
				response.setContentType("application/json");
				out.print(jobj.toJSONString());				
			}else{
				DbDao.getInstance().deletememoOne(request.getParameter("memoid"));
				DbDao.getInstance().hitUpdateDb("delmemocount", bbs_id);
				jobj.put("result", "2");
				response.setContentType("application/json");
				out.print(jobj.toJSONString());
			}
		}
		
	} else{
		out.println("error");
	}
	
%>
