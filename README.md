# TouristWebSite_Node.js
<h3>Local Tourist Attractions Guide Website using Node.js</h3>

<BR>
 
 ## Table of Contents
 
- [Folders Description.](#folders-description)
  * [MySQL Code<BR>](#mysql-code)
  * [NodeJS Code<BR>](#nodejs-code)
- [ER Diagram](#er-diagram)
- [Implementation](#implementation)
- [Pages](#pages)
    + [Login, Register, Edit, Delete User information Page](#login-register-edit-delete-user-information-page)
    + [Home Page](#home-page)
    + [City Page](#city-page)
    + [Travel Agency Page](#travel-agency-page)
    + [Restaurant Page](#restaurant-page)
    + [Festival Page](#festival-page)
    + [Hotel Page](#hotel-page)
 
 ***
 <BR>
 
## Folders Description.
<BR>

### MySQL Code
<BR>
데이터 저장을 위해 local MySQL DB를 이용하였습니다. <BR>
정보를 알려주는 사이트이므로 필요한 값들을 세팅하는 쿼리들을 구현하였습니다.<BR>
<BR>
 
### NodeJS Code
<BR>
JavaScript 런타임. <BR>
 
**크게 views(ejs 파일들), router(서버역할의 main.js), config, img, node_modules(express) 폴더로 이루어져있습니다.** <BR>
웹프레임워크 express에서 ejs(Embedded JavaScript, HTML 템플릿 엔진)을 사용했습니다. <BR>
서버와의 데이터 통신으로는 Ajax 방식을 이용하였고 body-parser를 통해 post 요청 처리했습니다. <BR>
 <BR>
 
 - +) mysql.js<BR>: dbconfig, mysql connection 변수, bodyParser, express, session 등의 변수들 세팅하고 ejs view engine과 static directory를 세팅하는 코드를 구현하였습니다. <BR>
 <BR><BR>
 
 ***
 <BR>
 
## ER Diagram
 <img src= "https://github.com/haewon13/TouristWebSite_Node.js/blob/master/ERDiagram.png" width=90% > <BR><BR>
 <BR><BR>
  ***
  <BR>
 
## Implementation
해당 웹사이트는 주로 국내 도시별 관광지 정보 검색과 근처의 식당과 호텔 추천 및 후기, 여행사 등에 관한 국내 관광지와 관련된 내용들을 소개하고 있습니다.<BR> 사용자는 회원 가입을 통해 후기를 남기고 열람할 수 있으며 정보 관리를 할 수 있습니다.<BR><BR><BR>
 ***
 <BR>
 
 ## Pages
 <BR>
 
 #### Login Register Edit Delete User information Page
 <BR>
<img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/login.png" width=25% ><img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/register.png" width=25% ><img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/edit.png" width=25% ><img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/delete.png" width=25% ><BR><BR><BR>
 <BR>
 
 #### Home Page
 <BR>
<img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/home1.png" width=90% >
  <BR>
  
<img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/home2_1.png" width=90% ><img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/home2_2.png" width=90% >
<BR><BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/home2_3.png" width=90% ><BR><BR><BR>
 <BR>
  
  #### City Page
  <BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/city.png" width=90% ><BR><BR><BR>
  <BR>
  <BR>
   <BR>
    
 <BR>
 
  #### Travel Agency Page
  <BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/agency.png" width=90% ><BR><BR><BR>
 <BR>
  
  #### Restaurant Page
  <BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/restaurant.png" width=90% ><BR><BR><BR>
 <BR>
  
  #### Festival Page
  <BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/festival.png" width=90% ><BR><BR><BR>
 <BR>
  
  #### Hotel Page
  <BR>
 <img src="https://github.com/haewon13/TouristWebSite_Node.js/blob/master/UI_images/hotel.png" width=90% ><BR><BR><BR>
 <BR>
  

