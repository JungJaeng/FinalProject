<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<script type="text/javascript">

// ajax 공공api json 형식 데이터 값 가져오기
$(document).ready(function() {
	$.ajax({
		type:"get"
		,url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailCommon"
		,contentType: "application/x-www-form-urlencoded"
		,data:{
			"serviceKey": "oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg=="
			,"_type":"json"
			, "MobileOS": "ETC"
			, "MobileApp": "TourAPI3.0_Guide"
			, "contentTypeId": ${contentTypeId}
			, "contentId" : ${contentId}
			, "defaultYN" : "Y"
			, "firstImageYN" : "Y"
			, "areacodeYN" : "Y"
			, "catcodeYN" : "Y"
			, "addrinfoYN" : "Y"
			, "mapinfoYN" : "Y"
			, "overviewYN" : "Y"
			, "transGuideYN": "Y"
		}
		,dataType:"json"
		,success:function(res){
			console.log(res);
			
			var response = res.response;
			
			var header = response.header;
			
			var body = response.body;
			
			var item = body.items.item;
			
			if(item.tel == null){
				item.tel = "정보없음";
			}
			if(item.telname == null){
				item.telname = "정보없음";
			}
			if(item.addr1 == null){
				item.addr1 = "정보없음";
			}
			if(item.zipcode == null){
				item.zipcode = "정보없음";
			}
			if(item.homepage == null){
				item.homepage = "정보없음";
			}
			if(item.firstimage == null){
				item.firstimage = "/resources/img/noimage.jpg";
			}
			
			//제목
			$(".resultTitle").append("<h1>"+item.title+"</h1>");
			$(".resultTitle").append("<hr>");
			//이미지
			$(".resultImage").append("<p><img src="+item.firstimage+"></p>");
			//우편번호
			$(".contentUl").append("<li><Strong class='context'>우편번호 : "+item.zipcode+"</Strong></li>");
			//전화명
			$(".contentUl").append("<li><Strong class='context'>전화명 : "+item.telname+"</Strong></li>");
			//전화번호
			$(".contentUl").append("<li><Strong class='context'>전화번호 : "+item.tel+"</Strong></li>");
			//주소
			$(".contentUl").append("<li><Strong class='context'>주소 : "+item.addr1+"</Strong></li>");
			//홈페이지
			$(".contentUl").append("<li><Strong class='context'>홈페이지 : "+item.homepage+"</Strong></li>");
			
			$(".resultSummary").append("<hr>");
			
			$(".resultSummary").append("<Strong>개요</Strong>");
			
			$(".resultSummary").append("<p>"+item.overview+"</p>");
			
			$(".resultBack").append("<input type='button' onclick='location.href=\"/main\"' id='btnBack' value='돌아가기'/>")
			
		}
	})

})


</script>
<style type="text/css">
.result{
	margin-left: 30px;
	width: 1080px;
}
.resultTitle>h1, .resultSummary>Strong{
	padding-left: 30px;
}
.resultSummary>Strong{
	font-size: 25px;
}
.resultSummary>p{
	margin-left: 50px;
}

.resultImage{
	text-align: center;
}
.resultImage>p>img{
	width: 1000px;
	height: 500px;
}
.resultContent{
	margin-left: 30px;
}
</style>
<div class="result">
	<div class="resultTitle">
	
	</div>

	<div class="resultImage">
	
	</div>
	
	<div class="resultContent">
		<ul class="contentUl">
		
		</ul>
	</div>
	
	<div class="resultSummary">
	
	</div>
	
	<div class="resultBack">
	
	</div>
	
</div>
