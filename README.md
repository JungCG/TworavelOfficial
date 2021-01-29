# 국내여행 동행 사이트 TwoRavel

-----------------


<p align="center">
    <img src = "ForREADME/MainPage.png", width="100%">
    <sup><a href="http://two-ravel.com/" target="_blank">TwoRavel 메인페이지</a></sup>
</p>

-----------------


## Presentation and Testing Video
- **Youtube**:
    - [**시연 영상**](https://youtu.be/PcQtvklFjXo) [![Youtube Badge](https://img.shields.io/badge/Youtube-ff0000?style=flat-square&logo=youtube&link=https://youtu.be/PcQtvklFjXo)](https://youtu.be/PcQtvklFjXo)

-----------------


## Contents
1. [소개](#소개)
2. [설계의 주안점](#설계의-주안점)
3. [Using](#using)
4. [Main Function](#main-function)
5. [Schedule](#schedule)
6. [Document](#document)

-----------------


## 소개
- 해외 동행구하기 플랫폼은 활성화가 되어있는데 반해 국내에서는 활성화가 되어있지 않아서 국내 여행에 맞게 개발하였습니다.

-----------------


## 설계의 주안점
- 국내 동행 사이트에 맞춰 다양한 여행 정보와 기능을 제공하기 위해 노력했습니다.
1. 웹페이지를 이용한 간편한 회원가입 / 로그인 시스템
2. HTML, CSS, jQuery를 이용한 사용자가 이해하기 쉬운 UI구성
3. HTML을 이용한 각각의 페이지 프레임 구성
4. SPRING MVC를 통한 게시판 및 홈페이지 구성
5. AJAX를 이용한 테이블(화면전환) 처리
6. 다양한 API 활용(지도, 날씨, 차트, 결제)

-----------------


## Using
<p align="center">
    <img src = "ForREADME/API.png", width="100%">
</p>

1. **FrontEnd** - HTML5, JS, CSS3, jQuery
2. **BackEnd** - Java(JDK 1.8), Servlet, Spring, Mybatis
3. **OS** - Windows, macOS (Amazon Linux 2 - aws)
4. **Library&API** - Kakaomap, Kakao Postcode, BootStrap(v3.3.7), OJDBC(v6), COS, JavaMail API, JSON(v1.2), JSTL, I'mport, 공공 API, Google Chart, ChatBot, SmartEditor2.0, websocket, spring jdbc
5. **IDE** - eclipse (EE, 2019-12 v4.14.0), Spring Tool Suite 3 (3.9.12.RELEASE)
6. **Server** - AWS(EC2, Route 53), Tomcat(v8.5), Putty(v0.74), Filezilla(v3.50.0)
7. **Document** - Google Drive, diagrams.net, kakaotalk
8. **CI** - git(v2.28.0.windows.1), Github
9. **DataBase** - AWS RDS, Oracle DataBase(12c, 12.1.0.2.v22)

-----------------


## Main Function
- **Detailed** : can be found in <a href="http://two-ravel.com" target="_blank">our Website</a>.

1. **카카오맵과 공공데이터를 이용한 여행 지도, 코로나 지도**
<p align="center">
    <img src = "ForREADME/MF11.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 여행 테마 지도 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF12.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 코로나 지도 -</sup>
</p>

2. **웹소켓을 이용한 다대다 채팅**
<p align="center">
    <img src = "ForREADME/MF21.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 채팅 리스트 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF22.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 채팅방 -</sup>
</p>

3. **회원, 동행 게시판, 통합게시판, 갤러리 조회/등록/수정/삭제/추천**
<p align="center">
    <img src = "ForREADME/MF31.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 개인 프로필 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF32.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 상대방 프로필 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF33.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 동행 게시판 리스트 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF34.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 통합 게시판 리스트 -</sup>
</p>
<p align="center">
    <img src = "ForREADME/MF35.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 갤러리 리스트 -</sup>
</p>

4. **SmartEditor를 이용한 게시판**
<p align="center">
    <img src = "ForREADME/MF41.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 스마트 에디터를 이용한 게시글 작성 -</sup>
</p>

5. **Iamport를 이용한 결제 구현**
<p align="center">
    <img src = "ForREADME/MF51.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Iamport를 이용한 결제 페이지 -</sup>
</p>

6. **구글 차트를 이용한 통계 구현**
<p align="center">
    <img src = "ForREADME/MF61.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 구글 차트를 이용한 통계 -</sup>
</p>

7. **공공 API를 이용한 오늘날씨 + 일기 예보**
<p align="center">
    <img src = "ForREADME/MF71.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 공공 API를 이용한 일기예보 -</sup>
</p>

8. **마이페이지 (채팅, 작성한 게시글, 동행 신청, 키워드, 좋아요)**
<p align="center">
    <img src = "ForREADME/MF81.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- 마이 페이지 -</sup>
</p>

9. **비동기로 구현한 이메일 알림 전송**

10. **스케쥴링을 이용한 데이터 업데이트**

-----------------


## Schedule
- **Detailed Document** : can be found in each directory.
<p align="center">
    <img src = "ForREADME/Schedule.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Schedule -</sup>
</p>

-----------------

## Document
- **Detailed Document** : can be found in each directory.


**1. 기능정의서**
<p align="center">
    <img src = "ForREADME/Function.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Function_Def -</sup>
</p>


**2. 유스케이스**
<p align="center">
    <img src = "ForREADME/UseCase.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- UseCase Diagram -</sup>
</p>


**3. UI 설계서**
<p align="center">
    <img src = "ForREADME/UI.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- UI Design (Chat) -</sup>
</p>


**4. ERD**
<p align="center">
    <img src = "ForREADME/ERD.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- ERD -</sup>
</p>


**5. 테이블 정의서**
<p align="center">
    <img src = "ForREADME/Table.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- DB Table Def -</sup>
</p>


**6. 클래스 다이어그램**
<p align="center">
    <img src = "ForREADME/Class.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Class Diagram (MyPage) -</sup>
</p>


**7. 시퀀스 다이어그램**
<p align="center">
    <img src = "ForREADME/Sequence1.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Sequence Diagram 1 (ChatRoom) -</sup>
</p>
<p align="center">
    <img src = "ForREADME/Sequence2.png", width="100%">
    <sup style="color:#0AC5A8; font-weight:bolder;">- Sequence Diagram 2 (MemberLikeCheck) -</sup>
</p>
