<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">

$(document).ready(function() {
	info();
})

function image() {
	$('.addTitle').empty();
	$('.resultImage').empty();
	$('.contentUl').empty();
	$('.resultSummary').empty();
	$.ajax({
		type:"get"
		,url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailImage"
		,contentType: "application/x-www-form-urlencoded"
		,data:{
			"serviceKey": "oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg=="
			,"_type":"json"
			, "MobileOS": "ETC"
			, "MobileApp": "TourAPI3.0_Guide"
			, "contentTypeId": ${contentTypeId}
			, "contentId" : ${contentId}
			, "imageYN" : "Y"
		}
		,dataType:"json"
		,success:function(res){
			console.log(res);
			var response = res.response; 
			
			var header = response.header;
			
			var body = response.body;
			
			var item = body.items.item;
			
			$('.addTitle').append("<h2>추가이미지</h2>");
			
			if(body.items == null || body.items == ""){
				$(".resultSummary").append("<p><img src='/resources/img/noimage.jpg'></p>");
			}else{			
			
			for(var i=0; i<item.length; i++){
				
				$(".resultSummary").append("<p><img src="+item[i].originimgurl+"></p>");
				}
			
			
			}
			
		} 
	})
}
// ajax 공공api json 형식 데이터 값 가져오기
function info() {
	$('.addTitle').empty();
	$('.resultTitle').empty();
	$('.resultImage').empty();
	$('.contentUl').empty();
	$('.resultSummary').empty();
	$('.resultBack').empty();
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
						
			if(item.tel == null || item.tel == ""){
				item.tel = "정보없음";
			}
			if(item.telname == null || item.telname == ""){
				item.telname = "정보없음";
			}
			if(item.addr1 == null || item.addr1 == ""){
				item.addr1 = "정보없음";
			}
			if(item.zipcode == null || item.zipcode == ""){
				item.zipcode = "정보없음";
			}
			if(item.homepage == null || item.homepage == ""){
				item.homepage = "정보없음";
			}
			if(item.firstimage == null || item.firstimage == ""){
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
			
			//지도
			$(".contentUl").append("<li><a class='mapAtag' id="+item.mapx+" data="+item.mapy+">지도</a></li>");
			
			$(".resultSummary").append("<hr>");
			
			$(".resultSummary").append("<Strong>개요</Strong>");
			
			$(".resultSummary").append("<p>"+item.overview+"</p>");
			
			$(".resultBack").append("<input type='button' onclick='location.href=\"/main\"' id='btnBack' value='돌아가기'/>")
			
			$(".mapAtag").click(function(){
				
			map($(this).attr("id"),$(this).attr("data") );
				
			});
			
			}
		})
}

function intro(){
	$('.addTitle').empty();
	$('.resultImage').empty();
	$('.contentUl').empty();
	$('.resultSummary').empty();
				$.ajax({
					type:"get"
					,url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/detailIntro"
					,contentType: "application/x-www-form-urlencoded"
					,data:{
						"serviceKey": "oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg=="
						,"_type":"json"
						, "MobileOS": "ETC"
						, "MobileApp": "TourAPI3.0_Guide"
						, "contentTypeId": ${contentTypeId}
						, "contentId" : ${contentId}
						, "introYN": "Y"
					}
					,dataType:"json"
					,success:function(res){
						console.log(res);
						
						var response = res.response;
						
						var header = response.header;
						
						var body = response.body;
						
						var item = body.items.item;	
						
						if(item.infocenter == null || item.infocenter == ""){
							item.infocenter = "정보없음";
						}
						if(item.parking == null || item.parking == ""){
							item.parking = "정보없음";
						}
						if(item.chkcreditcard == null || item.chkcreditcard == ""){
							item.chkcreditcard = "정보없음";
						}
						if(item.chkbabycarriage == null || item.chkbabycarriage == ""){
							item.chkbabycarriage = "정보없음";
						}
						if(item.usetime == null || item.usetimer == ""){
							item.usetime = "정보없음";
						}
						if(item.chkpet == null || item.chkpet == ""){
							item.chkpet = "정보없음";
						}
						if(item.restdate == null || item.restdate == ""){
							item.restdate = "정보없음";
						}
						
						$('.addTitle').append("<h2>추가 정보</h2>");
						
						$(".contentUl").append("<li><Strong class='context'>문의 및 안내 : "+item.infocenter+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>주차시설 : "+item.parking+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>신용카드 가능 여부 : "+item.chkcreditcard+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>유모차 대여 여부 : "+item.chkbabycarriage+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>이용시간 : "+item.usetime+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>애완동물 동반 가능 여부 : "+item.chkpet+"</Strong></li>");
						
						$(".contentUl").append("<li><Strong class='context'>쉬는날 : "+item.restdate+"</Strong></li>");
					}
				})
		}
function map(mapx, mapy){
    $f = ($("<form>")
          .attr("action", "/map")
          .attr("method", "post")
       ).append(
       $("<input>")
          .attr("name", "mapx")
          .val(mapx)
    ).append(
    	       $("<input>")
    	          .attr("name", "mapy")
    	          .val(mapy)
   	).appendTo( $(document.body) );
    $f.submit();
}
</script>
<style type="text/css">
#map{
	height: 300px;
	width: 300px;
}
.resultSummary>p>img{
	height: 500px;
	width: 800px; 
}
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
.subMenu{
	list-style: none;
    width: 30%;
    margin-left: 20px;
    display: -webkit-inline-box;
    background-color: #ccc;
/*     margin-top: 0px !important; */
}
.subMenu>span{
	display: block;
	text-align: center;
}
.Menu{
	text-align: center; 
}
</style>
<div class="Menu">
	<ul class="subMenus">
		<li class="subMenu"><a onclick="info();"><span>정보</span></a></li>
		<li class="subMenu"><a onclick="intro();"><span>소개정보</span></a></li>
		<li class="subMenu"><a onclick="image();"><span>추가이미지</span></a></li>
	</ul>
</div>
<div class="result">
	
	<div class="resultMenu">
		<ul class="resultMenuUl">
		
		</ul>
	</div>

	<div class="resultTitle">
	
	</div>

	<div class="addTitle">
	
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
