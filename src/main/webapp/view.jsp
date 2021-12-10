<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.text.SimpleDateFormat, java.util.Date, java.util.*" %>
<%@ page import="board.Column, board.DbDao, board.MemoColumn" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%
	request.setCharacterEncoding("utf-8");
	Date today = new Date();
	SimpleDateFormat date = new SimpleDateFormat("yyyy-MM-dd");
	String now = date.format(today);
	
	Column col = DbDao.getInstance().selectOne(request.getParameter("id"));
	pageContext.setAttribute("col", col);
	
%>    

<c:set var="now" value="<%=new java.util.Date()%>"></c:set>
<!-- 쿠키생성 -->
<c:if test="${cookie.view.value ne param.id}">
	<%
		Cookie cookie = new Cookie("view", request.getParameter("id"));
		response.addCookie(cookie);
		DbDao.getInstance().hitUpdateDb("hit" ,request.getParameter("id"));
	%>
</c:if>
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
    <script>
    $('.comment').summernote({
        placeholder: "내용을 입력하세요.",
        tabsize: 2,
        height: 100
      });
      $('.contents').summernote({
        placeholder: "내용을 입력하세요.",
        tabsize: 2,
        height: 350
      });
    </script>
</head>
<body>
   <div class="container mb-5"> 
        <h1 class="text-center my-4">
            게시판
        </h1>
        <ul class="view-title">
            <li>
               <label>제목</label> ${col.title }
            </li>
            <li>
              <label>작성일</label> ${col.wdate }
            </li>
            <li>
               <label>조회수</label> ${col.hit }
            </li>
            <li class="content">
                ${col.content }
            </li>
            <li>
                <label>작성자</label> ${col.writer }
            </li>    
        </ul>
    
        <div class="mt-3 mb-5 pb-5 text-right">
            <a href="write.jsp" type="button" class="btn btn-secondary btn-write px-4"> 답글쓰기 </a>
            <a href="edit.jsp?id=${param.id }" type="button" class="btn btn-secondary btn-write px-4"> 수정 </a>
            <a href="del.jsp?id=${param.id }" type="button" class="btn btn-secondary btn-write px-4"> 삭제 </a>
            <a href="list.jsp?pg=${param.pg }" type="button" class="btn btn-dark btn-write px-4"> 목록 </a>
        </div>    

<%
	List<MemoColumn> list = DbDao.getInstance().selectMemo(request.getParameter("id"));
	pageContext.setAttribute("list", list);
%>

        <ul class="comment-list mb-5">
            <!-- loop -->
            <c:forEach var="list" items="${list }">
	            <li>
	                <div class="row">
	                    <div class="col-3">
	                        <div class="card">
	                           <div class="card-body text-center">
	                               <span class="bigfont">${list.getWriter() }</span>
	                               <br>
	                               <span class="cdate">${list.getWdate() }</span>  
	                           </div>
	                        </div>
	                    </div>
	                    <div class="col-7">
	                        <p>${list.getContent() }
	                        </p>
	                    </div>
	                    <div class="col-2">
	                       <div class="cdel-edit d-flex justify-content-center align-items-center">
	                           <a href="#">수정</a>&nbsp;&nbsp;/&nbsp;&nbsp;<a href="#">삭제</a>
	                       </div>
	                    </div>
	                </div>    
	            </li>
            </c:forEach>
	        <!-- loop -->
        </ul>
        
        
        <div class="comment-write">
            <form name="commentForm" action="action/memo.jsp" id="commentForm" method="post">
              <input type="hidden" name="wdate" value= "<%=now %>" />
              <input type="hidden" name="bbs_id" id="bbsid" value="${param.id }" />
              <div class="d-flex">
	              <div class="form-group col-10">   
	                <textarea name="content" id="comment" class="comment form-control"></textarea>
	              </div>
	              <div class="col-2">
	              	<button type="submit" class="memo_submit btn btn-primary"> 전 송 </button>
	              </div>              
              </div>
              <div class="form-group">
                <div class="row">  
                    <div class="col-3 ml-3">
                       <input type="text" class="form-control memowriter" id="writer" name="writer" placeholder="이름" required>
                    </div>
                    <div class="col-3">
                       <input type="password" class="form-control memopwd" id="pwd" name="pwd"  placeholder="비밀번호" required>
                    </div>    
                </div>
               </div>
            </form>
            
            <div class="modal123">
            	<div class="modal-content">
            		<form action="action/memoUpdate.jsp" method="post" name="memoUpdateForm" id="memoUpdateForm">
	            		<input type="hidden" name="wdate" value= "<%=now %>" />
              			<input type="hidden" name="bbs_id" id="bbsid" value="${param.id }" />
	            		<div class="modal-header">
	            			<h5>댓글 수정</h5>
	            			<button type="button" class="close" data-dismiss="modal" aria-label="Close">
	            				<span aria-hidden="true">&times;</span>
	            			</button>
	            		</div>
	            		<div class="modal-body">
	            			<div class="form-group col-3">
	            				<label for="">작성자</label>
	            				<input type="text" name="newWriter" class="form-control"/>
	            			</div>
	            			<div class="form-group col-3">
	            				<label for="">비밀번호</label>
	            				<input type="password" name="newPwd" class="form-control"/>
	            			</div>
	            			<div class="form-group px-3">
	            				<label for="">내용</label>
	            				<textarea name="newContent" id="" cols="" rows="3" class="form-control"></textarea>
	            			</div>
	            		</div>
	            		<div class="modal-footer">
	            			<button type="button" class="btn btn-secondary" data-dismiss="modal">취 소</button>
	            			<button type="button" class="btn btn-primary">변 경</button>
	            		</div>
            		</form>
            	</div>
            </div>
        </div>
        
   </div><!-- /.container -->

    <div class="loading">
       <div class="spinner-border text-primary"></div>
    </div>
    </body>
    </html>        