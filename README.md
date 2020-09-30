# Blog
## 공부 겸 사이트 만들기.

혼자 스프링 MyBatis 등을 사용하여 사이트를 만드는중 입니다.

### 개발환경

* IDE : eclipse
* OS : Windows
* springframework 4.2.3
* Java 1.8
* MyBatis
* Oracle

### 기능 구현

* 스프링 시큐리티를 이용하여 각 유저에 권한 달리 부여.
* 스프링 시큐리티를 이용한 사용자 비밀번호 암호화.
* 일반 게시판에 게스트 사용자, 일반 유저 기능 분할화.(DC인사이드의 게스트와 유저의 차별화)
* 댓글 기능 구현(게스트와 일반유저의 권한 다름.)

### 동작 화면

* 유저와 게스트의 글 차별화(게스트 글 제목은 검은색이며 해당 게시글의 pw만 입력하면 삭제가능, 회원 글 제목은 파랑색이며 해당 게시글은 해당 회원만이 삭제 가능.)
* 게시판 페이징
* 조회수, 댓글 수 등 확인 가능.

<div>
  <img width="30%"  src="https://user-images.githubusercontent.com/60742556/94341870-ed5e7280-0047-11eb-8f65-5e6dc123f3f4.PNG">
  <img width="30%"  src="https://user-images.githubusercontent.com/60742556/94341871-ef283600-0047-11eb-886f-4ddbde5a922b.PNG">
  <img width="30%"  src="https://user-images.githubusercontent.com/60742556/94341872-ef283600-0047-11eb-8df3-681a0a0f287b.PNG">
</div>
