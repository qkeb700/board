<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.sql.*, java.text.*" %>
<%@ page import="board.Column, board.DbDao" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="col" class="board.Column"/>
<jsp:setProperty name="col" property="*"/>
<%
	DbDao.getInstance().insertDb(col);
	response.sendRedirect("../list.jsp");
%>