<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Date, java.sql.*, java.text.*" %>
<%@ page import="board.Column, board.DbDao" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="col" class="board.Column"/>

<c:choose>

<c:when test="${empty param.pwd }">
	<script>
		alert("비밀번호를 입력하세요.");
		history.back();
	</script>
</c:when>	
<c:otherwise>
<%
	DbDao.getInstance().delete(request.getParameter("id"));
	response.sendRedirect("../list.jsp");
%>
</c:otherwise>
</c:choose>
<c:if test="${param.pwd ne col.pwd}">
	<script>
		alert("비밀번호를 다시 확인하세요.");
		history.back();	
	</script>
</c:if>
<jsp:setProperty property="*" name="col"/>

