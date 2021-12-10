<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.sql.*, java.text.*" %>
<%@ page import="board.DbDao, board.MemoColumn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="col" class="board.MemoColumn"/>
<jsp:setProperty name="col" property="*"/>
<%
	String bbs_id = request.getParameter("bbs_id");
	DbDao.getInstance().insertmemoDb(col);
	DbDao.getInstance().hitUpdateDb("memocount", bbs_id);
	response.sendRedirect("../list.jsp");
%>
1