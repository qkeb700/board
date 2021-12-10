<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.sql.*, java.text.*, java.util.*" %>
<%@ page import="board.Column, board.DbDao" %>


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
            게시판 삭제
        </h1>
        <p class="text-center">비밀번호를 입력 하세요.</p>
        <div class="del-box">
        	<form action="action/delok.jsp" method="post" name="delform" id="delform">
		        <ul class="view-title">
		            <li>
		               <label>비밀번호</label> 
		               <input type="password" name="pwd" placeholder="비밀번호" />
		               <input type="hidden" name="id" value="${param.id }" />
		            </li>
		            <li class="pt-3 pb-3 text-center">
		            	<button type="button" class="btn btn-warning" onclick="javascript:history.back();">돌아가기</button>
		            	<button type="submit" class="btn btn-danger">삭 제</button>
		            </li>
		        </ul>        
        	</form>
        </div>
    
        <div class="mt-3 mb-5 pb-5 text-right">
            <a href="write.jsp" type="button" class="btn btn-secondary btn-write px-4"> 답글쓰기 </a>
            <a href="edit.jsp?id=${param.id }" type="button" class="btn btn-secondary btn-write px-4"> 수정 </a>
            <a href="del.jsp?id=${param.id }" type="button" class="btn btn-secondary btn-write px-4"> 삭제 </a>
            <a href="list.jsp" type="button" class="btn btn-dark btn-write px-4"> 목록 </a>
        </div>    

   </div><!-- /.container -->

    <div class="loading">
       <div class="spinner-border text-primary"></div>
    </div>
    </body>
    </html>        