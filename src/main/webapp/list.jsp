<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@  page import="java.sql.*, java.text.*, java.util.*" %>
<%@ page import="board.Column, board.DbDao, board.Paging" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<fmt:requestEncoding value="utf-8"/>
<jsp:useBean id="pg" class="board.Paging"/> 
<%
	int cpage = (request.getParameter("pg")!=null)? Integer.parseInt(request.getParameter("pg")):1;

	String col = (request.getParameter("colname")!=null)?request.getParameter("colname"):"";
	String val = (request.getParameter("values")!=null)?request.getParameter("values"):"";

	int count = DbDao.getInstance().selectAll(col, val);
	pageContext.setAttribute("count", count);
	
	pg.setPage(cpage);
	pg.setTotalCount(count);
	
	List<Column> list = DbDao.getInstance().selectPaging(pg.getStart(), pg.getDisplayRow(), col, val);
	pageContext.setAttribute("list", list);
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
    <link rel="stylesheet" href="css/style.css">

    <!-- script -->
    <script src="js/plugin/jquery-1.12.4.js"></script>
    <script src="js/plugin/popper.min.js"></script>
    <script src="js/plugin/bootstrap.js"></script>
    <script src="js/bbs.js"></script>
</head>
<body>
   <div class="container mb-5"> 
        <h1 class="text-center my-4">
            Hoyeon's 게시판
        </h1>
        <p class="allcount">전체게시물: ${count }</p>
        <table class="table table-hover">
          <colgroup class="mobile-hidden">
              <col width="55">
              <col>
              <col width="120">
              <col width="120">
              <col width="80">
          </colgroup>
          <thead>
              <tr>
                  <th class="mobile-hidden">번호</th>
                  <th class="mobile-hidden">제목</th>
                  <th class="mobile-hidden">글쓴이</th>
                  <th class="mobile-hidden">날짜</th>
                  <th class="mobile-hidden">조회수</th>    
              </tr>
          </thead>
          <tbody>
              <!-- loop -->
              <c:forEach var="list" items="${list }">
	              <tr>
	                 <td class="mobile-hidden">${list.getId() }</td>
	                 <td>
	                     <a href="view.jsp?id=${list.getId() }&pg=${param.pg}" class="icon pc-hidden"><i class="fas fa-user-tie"></i></a>
	                     <a href="view.jsp?id=${list.getId() }&pg=${param.pg}" class="utxt pc-hidden">${list.getWriter() }[${list.getWdate() }]</a>
	                     <a href="view.jsp?id=${list.getId() }&pg=${param.pg}">${list.getTitle() }<c:if test="${list.getMemocount() >0 }"> [${list.getMemocount() }]</c:if></a>
	                 </td>
	                 <td class="mobile-hidden"><a href="view.jsp?id=${list.getId() }&pg=${param.pg}">${list.getWriter() }</a></td> 
	                 <td class="mobile-hidden">${list.getWdate() }</td>
	                 <td class="mobile-hidden">${list.getHit() }</td>
	              </tr>
              </c:forEach>
              <!-- /loop -->    
          </tbody>
        </table>
       <div class="row">
           <div class="col-12 col-md-4 my-3">
               <form name="searchform" action="list.jsp" method="post">
                  <div class="input-group">
                      <div class="input-group-prepend">
                          <button type="button" 
                                  class="btn-title btn btn-outline-secondary dropdown-toggle"
                                  data-toggle="dropdown">제목+내용</button>
                          <div class="dropdown-menu colname">
                              <a class="dropdown-item" data-name="writer">이름</a>
                              <a class="dropdown-item" data-name="title">제목</a>
                              <a class="dropdown-item" data-name="content">내용</a>
                              <a class="dropdown-item" data-name="all">제목+내용</a>
                          </div>
                      </div>
                      <input type="hidden" name="colname" id="colname" value="all" >
                      <input type="text" name="values" class="form-control user-form" placeholder="검색">
                      <div class="input-group-append">
                          <button class="btn btn-dark" type="submit">검색</button>
                      </div>
                  </div>
               </form>
           </div>
           <div class="col-12 col-md-8 my-3 text-right">
               <a href="write.jsp" type="button" class="btn btn-dark btn-write px-4"> 쓰기 </a>
           </div>
       </div>
      
       <ul class="pagination my-3 justify-content-center">
<c:if test="${pg.isPrev() }">       
          <li class="page-item"><a href="list.jsp?pg=${pg.getBeginPage()-1 }" class="page-link">&lt;&lt;</a></li>
</c:if>      

<c:forEach begin="${pg.getBeginPage() }" end="${pg.getEndPage() }" step="1" var="i">    
	<c:choose> 
		<c:when test="${param.pg==i }">
          <li class="page-item active disabled"><a href="list.jsp?pg=${i }" class="page-link">${i }</a></li>
		</c:when>		
		<c:otherwise>
			<li class="page-item"><a href="list.jsp?pg=${i }" class="page-link">${i }</a></li>
		</c:otherwise>         
	</c:choose>          
</c:forEach>          
<c:if test="${pg.isNext() }">          
          <li class="page-item"><a href="list.jsp?pg=${pg.getEndPage()+1 }" class="page-link">&gt;&gt;</a></li>
</c:if>       
       </ul>
   </div><!-- /.container -->


<div class="loading">
   <div class="spinner-border text-primary"></div>
</div>
</body>
</html>