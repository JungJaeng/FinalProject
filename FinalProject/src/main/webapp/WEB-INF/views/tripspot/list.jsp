<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<script type="text/javascript">
$(document).ready(function(){
	$(".searchbtn").click(function(){
		$("#searchform").submit();
	});
	$(".writebtn").click(function(){
		location.href="/tripspot/write";
	});
	
});

var cnt = new Array();
cnt[0] = new Array("시/군구선택");
cnt[1] = new Array("시/군구선택","강남구","강동구","강북구","강서구","관악구","광진구","구로구","금천구","노원구","도봉구","동대문구","동작구","마포구","서대문구","서초구","성동구","성북구","송파구","양천구","영등포구","용산구","은평구","종로구","중구","중랑구");
cnt[2] = new Array("시/군구선택","강화군","계양구","미추홀구","남동구","동구","부평구","서구","연수구","옹진군","중구");
cnt[3] = new Array("시/군구선택","대덕구","동구","서구","유성구","중구");
cnt[4] = new Array("시/군구선택","남구","달서구","달성군","동구","북구","서구","수성구","중구");
cnt[5] = new Array("시/군구선택","광산구","남구","동구","북구","서구");
cnt[6] = new Array("시/군구선택","강서구","금정구","기장군","남구","동구","동래구","부산진구","북구","사상구","사하구","서구","수영구","연제구","영도구","중구","해운대구");
cnt[7] = new Array("시/군구선택","중구","남구","동구","북구","울주군");
cnt[8] = new Array("시/군구선택","세종특별자치시");
cnt[9] = new Array("시/군구선택","가평시","고양시","과천시","광명시","광주시","구리시","군포시","김포시","남양주시","동두천시","부천시","성남시","수원시","시흥시","안산시","안성시","안양시","양주시","양평군","여주시","연천군","오산시","용인시","의왕시","의정부시","이천시","파주시","평택시","포천시","하남시","화성시");
cnt[10] = new Array("시/군구선택","강릉시","고성군","동해시","삼척시","속초시","양구군","양양군","영월군","원주시","인제군","정선군","철원군","춘천시","태백시","평창군","홍천군","화천군","황성군");
cnt[11] = new Array("시/군구선택","괴산군","단양군","보은군","영동군","옥천군","음성군","제천시","진천군","청원군","청주시","충주시","증평군");
cnt[12] = new Array("시/군구선택","공주시","금산군","논산시","당진시","보령시","부여군","서산시","서천군","아산시","예산군","천안시","청양군","태안군","홍성군","계룡시");
cnt[13] = new Array("시/군구선택","경산시","경주시","고령군","구미시","군위군","김천시","문경시","봉화군","상주시","성주군","안동시","영덕군","영양군","영주시","영천시","예천군","울릉군","울진군","의성군","청도군","청송군","칠곡군","포항시");
cnt[14] = new Array("시/군구선택","거제시","거창군","고성군","김해시","남해군","마산시","밀양시","사천시","산청군","양산시","의령군","진주시","진해시","창녕군","창원시","통영시","하동군","함안군","함양군","합천군");
cnt[15] = new Array("시/군구선택","고창군","군산시","김제시","남원시","무주군","부안군","순창군","완주군","익산시","임실군","장수군","전주시","정읍시","진안군");
cnt[16] = new Array("시/군구선택","강진군","고흥군","곡성군","광양시","구례군","나주시","담양군","목포시","무안군","보성군","순천시","신안군","여수시","영광군","영암군","완도군","장성군","장흥군","진도군","함평군","해남군","화순군");
cnt[17] = new Array("시/군구선택","남제주군","북제주군","서귀포시","제주시");

function change(idx){
	var region_detail = document.getElementById("region_detail");
	for(i=region_detail.length-1;i>=0; i--){
		region_detail.options[i] = null;
	}
	for(i=0; i<cnt[idx].length;i++){
		region_detail.options[i] = new Option(cnt[idx][i],cnt[idx][i]);
	}
	
}
</script>
<style type="text/css">

.btn {
	-moz-box-shadow:inset 0px 0px 0px 0px #ffffff;
	-webkit-box-shadow:inset 0px 0px 0px 0px #ffffff;
	box-shadow:inset 0px 0px 0px 0px #ffffff;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #ffffff), color-stop(1, #f6f6f6));
	background:-moz-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-webkit-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-o-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:-ms-linear-gradient(top, #ffffff 5%, #f6f6f6 100%);
	background:linear-gradient(to bottom, #ffffff 5%, #f6f6f6 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#f6f6f6',GradientType=0);
	background-color:#ffffff;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #dcdcdc;
	display:inline-block;
	cursor:pointer;
	color:#666666;
	font-family:Arial;
	font-size:15px;
	font-weight:bold;
	padding:8px 8px;
	text-decoration:none;
	text-shadow:0px 0px 0px #bfbdbf;
	line-height: 10px !important;
}
.btn:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #f6f6f6), color-stop(1, #ffffff));
	background:-moz-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-webkit-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-o-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:-ms-linear-gradient(top, #f6f6f6 5%, #ffffff 100%);
	background:linear-gradient(to bottom, #f6f6f6 5%, #ffffff 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f6f6f6', endColorstr='#ffffff',GradientType=0);
	background-color:#f6f6f6;
}
.btn:active {
	position:relative;
	top:1px;
}
article, aside, details, figcaption, figure, footer, header, hgroup,
	menu, nav, section {
	display: block;
}
blockquote, q {
	quotes: none;
}
blockquote : before, blockquote : after, q : before, q : after {
	content: '';
	content: none;
}
table {
	border-collapse: collapse;
	border-spacing: 0;
}

/*css 초기화*/
.card {
	height: 340px;
	width: 300px;
	border-radius: 15px;
	display: inline-block;
	margin-top: 30px;
	margin-left: 30px;
	margin-bottom: 30px;
	position: relative;
	box-shadow: 0 4px 8px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
	overflow: hidden;
}



.card-header {
	-webkit-transition: 0.5s; /*사파리 & 크롬*/
    -moz-transition: 0.5s;  /*파이어폭스*/
    -ms-transition: 0.5s;	/*인터넷 익스플로러*/
    -o-transition: 0.5s;  /*오페라*/
    transition: 0.5s;
	width: 100%;
	height: 220px;
	border-radius: 15px 15px 0 0;
	background-size: 100% 280px;
	background-repeat: no-repeat;	
}



.card:hover .card-header  {
	opacity: 0.8;
	height: 100px;
}



.card-header-is_closed{
    background-color: #EF5A31 ;
    color: #FFF ;
    font-weight: bold ;
    text-align: center ;
    float: right;
    margin: 15px 15px 0 0;
    border-radius: 50%;
    font-weight: bold;
    padding: 10px 10px;
    line-height: 20px;
}
h1 {
    font-size: 22px;
    font-weight: bold;
}
.card-body {

}
.card-body-header{
	line-height: 25px;
	margin: 10px 20px 0px 20px;
}
.card-body-description  {
    opacity: 0;
    color: #757B82;
    line-height: 25px;
    -webkit-transition: .2s ease-in-out; /*사파리&크롬*/
    -moz-transition: .2s ease-in-out; /*파이어폭스*/
    -ms-transition: .2s ease-in-out; /*익스플로러*/
    -o-transition: .2s ease-in-out; /*오페라*/
    transition : .2s ease-in-out;
    overflow: hidden;
	height: 180px;
	margin: 5px 20px;

}
.card:hover .card-body-description {
    opacity: 1;
    -webkit-transition: .5s ease-in-out;
    -moz-transition: .5s ease-in-out;
    -ms-transition: .5s ease-in-out;
    -o-transition: .5s ease-in-out;
    transition : .5s ease-in-out;
    overflow: hidden;
}
.card-body-region {
	color: #2478FF;
	font-style: italic;
}
.card-body-footer {
  	position: absolute; 
  	margin-top: 15px;
  	margin-bottom: 6px;
    bottom: 0; 
    width: 270px;
    font-size: 14px;
    color: #9FA5A8;
    padding: 0 15px;
}
.icon {
    display: inline-block;
    vertical-align: middle;
    margin-right: 2px;
}
.icon-view_count {
    width: 25px;
    height: 17px;
}

.icon-comments_count {
	margin-left: 5px;
	width: 25px;
    height: 17px;
}
.reg_date {
	float: right;
}
.wrap{
	text-align: center;
}
.search{
	background : #d9e1e8; 
}
.button-right{
	text-align: right;
}

</style>
<div class="wrap">
<c:forEach items="${tripspotlist}" var="i">
	<a href="/tripspot/view?board_no=${i.board_no}"> <!-- 클릭 시 링크 설정 -->
	<div class="card">
		<!-- 카드 헤더 -->
		<div class="card-header" style="background-image: url('/tripspotimage?fileno=${i.thumbnail}');" >
			<div class = "card-header-is_closed" > 
                <div class = "card-header-text" >추천수</div> 
                <div class = "card-header-number" >
                <c:forEach items="${recommendlist }" var = "j">
 					<c:if test="${i.board_no eq j.board_no }">
 					${j.recommendcnt }
 					</c:if>
                </c:forEach>
                
                </div > 
            </div >

		</div>
		<!--  카드 바디 -->
		<div class="card-body">
			<!--  카드 바디 헤더 -->
			<div class="card-body-header">
				<h1 style="margin-top: 0px;margin-bottom: 0px;">${i.title }</h1>
				<p style="margin-top: 0px;margin-bottom: 0px;" class="card-body-region">${i.region } ${i.region_detail }</p>
				<p style="margin-top: 0px;margin-bottom: 0px;" class = "card-body-nickname"> 
					작성자:${i.writer_nick }
				</p>
			</div>
			<!--  카드 바디 푸터 -->
			<div class="card-body-footer">
				<hr style="margin-bottom: 8px; opacity: 0.5; border-color: #EF5A31">
				조회 ${i.hit }회
				<i class="reg_date"><fmt:formatDate value="${i.writendate }" pattern="yyyy-MM-dd" /></i>
			</div>
		</div>
	</div>
	</a>
</c:forEach>
</div>

<c:if test="${login_id ne null}">
<div class="button-right"><a class="writebtn btn">글 쓰기</a></div>
</c:if>
<div class="paging">
</div>
<div class="search">

<h2>지역별로 검색하기</h2>
<form action="/tripspot/list" method="get" id="searchform">
	<label>시/도</label>
		<select name="region" onchange="change(this.selectedIndex);" >
 			<option value="">시/도 선택</option>
			<option value="서울">서울</option>
			<option value="인천">인천</option>
			<option value="대전">대전</option>
			<option value="대구">대구</option>
			<option value="광주">광주</option> 
			<option value="부산">부산</option>
			<option value="울산">울산</option>
			<option value="세종">세종</option>
			<option value="경기">경기</option>
			<option value="강원">강원</option>
			<option value="충북">충북</option>
			<option value="충남">충남</option>
			<option value="경북">경북</option>
			<option value="경남">경남</option>
			<option value="전북">전북</option>
 			<option value="전남">전남</option>
			<option value="제주">제주</option>
		</select>         
		<label> 시/군/구</label>
		<select id="region_detail" name="region_detail">
			<option value="">시/군구선택</option>
		</select>
	<a class="searchbtn btn">검색</a>
</form>

</div>