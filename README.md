
# 개인 프로젝트: 게시판

## 개발환경
- #####	개발 툴: Eclipse
- #####	개발언어: JAVA JDK 1.8 64bit
- #####	서버 및 데이터베이스: Tomcat 9.0v, MySQL
- #####	디자인 API: Bootstrap 4, Font-awesome
- #####	깃허브 주소: https://github.com/qkeb700

## 프로젝트 요약
- #####	회원가입, 로그인을 하고 글을 작성, 읽기, 수정, 삭제 할 수 있습니다.
- #####	아이디/비밀번호를 찾는 기능과 글 작성시 파일을 업로드 할 수 있습니다.
- #####	관련 내용 게시물을 찾아 보여주는 검색 창이 있습니다.
- #####	한번 본 게시물의 조회수는 올라가지 않고 댓글을 달고 수정, 삭제 할 수 있습니다.
- #####	보안을 위해 권한이 허가되지 않은 경로로의 접근은 제한합니다.

## 프로젝트 상세 소개
### [링크](https://qkeb700.github.io/projects/bbs)

## 프로젝트 소스코드 보기
### [링크](https://github.com/qkeb700/board)
### 프론트엔드 기술
#### 1.	회원가입
회원 약관 동의를 통해 가입을 할 수 있습니다.
 
![signup](https://user-images.githubusercontent.com/46728564/145846831-4d046c1c-50fd-4343-9db7-21ccd9889719.png)

 
#### 2.	로그인
회원가입을 통해 생성한 아이디와 비밀번호로 로그인을 할 수 있습니다.
 
![login](https://user-images.githubusercontent.com/46728564/145847137-61aa8972-091e-4edc-94d7-157cccaec364.png)


#### 3.	홈
카테고리별로 생성된 게시판 목록을 조회 할 수 있습니다.
 
![home](https://user-images.githubusercontent.com/46728564/145847224-83fad97b-1db0-4dc0-9f47-17eee0dea1f6.png)


#### 4.	게시판 작성
글 작성을 통해 파일을 첨부하고 기본적인 정보를 입력 할 수 있습니다.

 ![write](https://user-images.githubusercontent.com/46728564/145847772-9aa8f393-1978-45dd-83ae-6ba19056fc27.png)


#### 5.	게시판 보기
작성한 글의 상세 내용을 볼 수 있고 댓글도 볼 수 있습니다.
 
![view](https://user-images.githubusercontent.com/46728564/145847424-c82196df-4286-4dd9-8fb6-23835ba8f232.png)


#### 6.	게시판 수정
게시판 관련 정보를 변경 할 수 있습니다.
 
![update](https://user-images.githubusercontent.com/46728564/145847493-421d095a-5b0a-449e-9be9-13550863a734.png)

#### 7.	게시판 삭제
게시판 생성시 입력한 비밀번호를 입력하여 삭제 할 수 있습니다.
 
![delete](https://user-images.githubusercontent.com/46728564/145847529-5d62b428-cc29-49c1-ba31-9237efad36a0.png)



### 백엔드 기술 
#### 1.	아이디/비밀번호 찾기
JQuery를 통하여 Ajax 통신사용
 ![1](https://user-images.githubusercontent.com/46728564/145847870-9b4707fe-a29e-4db8-baa2-c9ba3994cd09.png)

비동기통신으로 데이터 교환이 이루어지고 성공적으로 값을 가져와 출력한다.
 ![result](https://user-images.githubusercontent.com/46728564/145847956-bfb200df-7b82-46bf-9e3b-5c9850201799.png)



#### 2.	파일업로드 하기

 ![upload](https://user-images.githubusercontent.com/46728564/145848021-da04d18b-d0bb-4d49-bb27-6eb69ecbd909.png)

파일 업로드 기능을 위해 form 태그에 enctype 옵션을 추가한다.

 ![dir](https://user-images.githubusercontent.com/46728564/145848101-a4a1257f-e618-4d92-9e38-6804b5fc4561.png)

업로드 할 파일이 저장될 장소를 dir로 저장하고 MultipartRequest로 데이터를 가져와 변수에 저장한다.

 ![dbcon](https://user-images.githubusercontent.com/46728564/145848173-9b8e9670-6bb0-4ac2-ad30-6d7c31a4b60f.png)

DB connect와 DAO 을 통하여 업로드 할 파일과 정보들을 insert 합니다.

#### 3.	조회수 올리기
Cookie와 JSTL 사용
 ![cookie](https://user-images.githubusercontent.com/46728564/145848261-3d257571-80c7-4965-b105-a466c5926227.png)

현재 게시물의 num과 cookie의 값이 같지 않을 때, cookie의 값을 현재 게시물의 num 값으로 하고 count를 1 증가시켜서 조회수를 올려줍니다.

#### 4.	페이징 구현
DTO와 DAO을 사용하여 데이터를 가져와 list.jsp에서 구현한다.
 ![paging](https://user-images.githubusercontent.com/46728564/145848356-3f5442bf-90f0-40e5-bb6f-9ac584d0aae0.png)

페이징을 위한 기본값들을 세팅한다.

 ![3](https://user-images.githubusercontent.com/46728564/145848444-18a7e62c-9564-42e1-8d41-8b9398fe23c5.png)
![4](https://user-images.githubusercontent.com/46728564/145848453-02364a58-01a3-4ffd-a0b9-bb40d4d9fa58.png)
![5](https://user-images.githubusercontent.com/46728564/145848464-370ecc6e-16c6-45e7-8b16-de4f14e04e67.png)
 
데이터베이스에서 한 번에 불러올 레코드를 제한해준다.

 ![dto](https://user-images.githubusercontent.com/46728564/145848503-419d9960-ff03-4b20-962e-8b42549ee1e4.png)

DTO인 페이징 클래스에 현재 페이지와 총 레코드의 개수를 세팅해주고 DAO을 이용하여 필요한 값들을 list에 저장한다.

 ![list](https://user-images.githubusercontent.com/46728564/145848567-0475269f-d8da-44a1-b158-874218677f6d.png)

List.jsp에 페이징을 구현한다..


#### 5.	검색으로 관련 게시물 찾기
제목, 글쓴이 또는 내용으로 관련된 게시물을 찾을 수 있다.
 ![sear](https://user-images.githubusercontent.com/46728564/145848612-d05f0892-c021-4453-b4fd-f599210dae71.png)

Form 태그 안에 list.jsp 자신에게 보내는 input 값을 만든다.

 ![jq](https://user-images.githubusercontent.com/46728564/145848650-9b9f9dda-1865-482f-9522-b3ba89cf0bde.png)

JQuery를 이용하여 전송할 input 값에 어떠한 방식으로 검색할지를 저장시킨다.

 ![col](https://user-images.githubusercontent.com/46728564/145848680-a070393b-2de0-4d59-b766-ceb0f049ab76.png)

변수 col과 val을 선언해주고 form 태그에서 보낸 colname과 values의 값들을 저장시킨다.

 
 ![11](https://user-images.githubusercontent.com/46728564/145848789-2c5025fb-7941-48a5-9c3f-eb2fe4c22086.png)
![22](https://user-images.githubusercontent.com/46728564/145848799-96393ab9-e813-44d0-8587-356a37ead879.png)
![33](https://user-images.githubusercontent.com/46728564/145848805-dd9469f2-6095-471e-a27e-fdd3124d1269.png)

 
위에서 구현한 페이징 메소드에 col과 val 두 개의 매개변수를 추가하고 switch 문의 조건에 맞게 검색 내용을 데이터베이스값에서 찾는다.


![pagingre](https://user-images.githubusercontent.com/46728564/145848855-e01b8ce1-60a1-43c9-a600-deaac59b5080.png)

검색 내용에 관련된 게시물의 수와 출력이 되어 페이징이 되어있는 것을 볼 수 있다.


#### 6.	댓글 기능 구현
Ajax 비동기 통신으로 값을 전달하여 댓글을 등록, 수정, 삭제 할 수 있다.
 ![comment](https://user-images.githubusercontent.com/46728564/145848940-2a871950-00a9-4d9d-9f5c-71e7c6bd5a8a.png)

form태그 안에 전송할 값들을 $form에 저장하여 통신한다. 

 ![111](https://user-images.githubusercontent.com/46728564/145849015-c6688eb7-c4db-48cf-992a-508f6787cd54.png)
![222](https://user-images.githubusercontent.com/46728564/145849023-6af45c39-2f17-447e-99a0-1bfb43cd8dca.png)

 
JSON 데이터를 처리하기 위한 자바 라이브러리를 Bean으로 가져온다.
댓글의 기능에 맞게 result 값을 넣어주고 JSON 객체를 문자열 데이터로 변경해준다.
 ![ajax](https://user-images.githubusercontent.com/46728564/145849085-e7745740-a2e9-4b1c-a08d-1bf91e8f2264.png)

Ajax로 받아온 input값에 따라서 댓글을 작성, 수정, 삭제 할 수 있고 각 기능을 수행 할 수 있다. 


