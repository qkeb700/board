<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.Column, board.DbDao" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>    
<%
	Column col = DbDao.getInstance().selectOne(request.getParameter("id"));
	pageContext.setAttribute("col", col);    

%>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hoyeon's BBS</title>
    <!-- stylesheet -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Gowun+Dodum&display=swap">
    <link rel="stylesheet" href="css/plugin/all.css">
    <link rel="stylesheet" href="css/plugin/animate.css">
    <link rel="stylesheet" href="css/plugin/bootstrap.css">
    <link rel="stylesheet" href="css/plugin/summernote-bs4.css">
    <link rel="stylesheet" href="css/style.css">

    <!-- script -->
    <script src="js/plugin/jquery-1.12.4.js"></script>
    <script src="js/plugin/popper.min.js"></script>
    <script src="js/plugin/bootstrap.js"></script>
    <script src="js/plugin/summernote-bs4.js"></script>
    <script src="js/bbs.js"></script>
</head>
<body>
    <div class="container mb-5"> 
        <h1 class="text-center my-4">
            연습용 게시판
        </h1>
        <form id="writeForm" action="action/editok.jsp" method="post">
        <input type="hidden" name="id" value="${col.id }" />
        <input type="hidden" name="wdate" value='<fmt:formatDate value="<%=new java.util.Date() %>" pattern="yyyy-MM-dd"/>' />
        <ul class="write-title">
            <li class="row">
               <label class="col-2 label" for="uname">이름</label> 
               <div class="col-4 py-3">
                  <input type="text" class="form-control" name="writer" id="writer" value="${col.writer }">    
               </div>
            </li>
            <li class="row">
                <label class="col-2 label" for="upass">비밀번호</label> 
                <div class="col-4 py-3">
                   <input type="password" class="form-control" name="pwd" id="pwd" placeholder="비밀번호">    
                </div>
            </li>
            <li class="row">
                <label class="col-2 label" for="title">제목</label> 
                <div class="col-10 py-3">
                   <input type="text" class="form-control" name="title" id="title" value="${col.title }">    
                </div>
            </li>
            <li class="content py-4">
                <textarea name="content" class="contents form-control">${col.content }</textarea>
            </li>    
        </ul>   
        <div class="btn-area px-4 py-4 text-center">
            <button type="reset" class="btn btn-danger">취소</button> 
            <button type="submit" class="btn btn-dark">전송</button>
        </div>
    </form>
   </div><!-- /.container -->

    <div class="loading">
       <div class="spinner-border text-primary"></div>
    </div>

</body>
</html>