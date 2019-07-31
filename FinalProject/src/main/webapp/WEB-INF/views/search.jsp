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
					, "contenttypeid": contenttypeid
					, "contentid" : contentid 
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
					
					var numOfRows = body.numOfRows;
					var items = body.items.item;
					var totalCount = body.totalCount; 
					
					console.log("rows : " + numOfRows);
					
					console.log("total : " + totalCount);
					
					$(".total").append("<span class='totalCnt'>총 결과 수 : "+totalCount+"</span>")
					for(var i=0; i<numOfRows; i++) {
						console.log(items[i]);
						$("#resultUl").append("<li class='resultLi'>"
								+"<img class='resultImg' src="+items[i].firstimage+"><p class='resultPtag'>"+items[i].title+"</p></li>")
					
					
					
					}
				}
	})
})



</script>

