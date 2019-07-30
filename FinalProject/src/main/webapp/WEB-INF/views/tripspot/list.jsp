<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<div class="wrap">
<div class="tablediv">
<table>
<thead>
	<tr>
		<th style="width: 10%;">구분</th>
		<th style="width: 45%;">제목</th>
		<th style="width: 15%;">작성자</th>
		<th style="width: 10%;">조회수</th>
		<th style="width: 20%;">작성일</th>
	</tr>
</thead>
<tbody>
<c:forEach items="${boardlist}" var="i">
		<tr class="content">
			<td>${i.board_no}</td>
			<td><a href="/board/view?board_no=${i.board_no }">${i.title }</a></td>
			<td>${i.writer_nick }</td>
			<td>${i.hit }</td>
		 	<td>${i.write_date }</td>
		</tr>
</c:forEach>
</tbody>
</table>
<c:if test="${loginnick eq '관리자'}">
<button type="button" id="btnlistDelete" class="btn btn-primary" onclick="checklist();">체크 삭제</button>
</c:if>
</div>
<div class="paging">
<c:if test="${login_id ne null}">
<div class="button-right"><button id="btnWrite" onclick="location.href='/board/write'">글 쓰기</button></div>
</c:if>
</div>
<div class="search">
<script type="text/javascript">
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
<form action="/tripspot/list" method="get">
	<div>
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
	</div>
	<div>
		<label> 시/군/구</label>
		<select id="region_detail" name="region_detail">
			<option value="">시/군구선택</option>
		</select>
	</div><button  style="vertical-align: middle;">검색</button>
</form>

</div>
</div>