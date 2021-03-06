<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<script type="text/javascript">
var curPage = 1;
function changed(cat1,areacode,sigungucode,keyword, pageNo) {
	if($('input[name=keyword]').val() == ""|| $('input[name=keyword]').val().length<2 ){
		alert("두글자이상 키워드를 입력해주세요!");
		$('input[name=keyword]').focus();
		return false; 
	}else{
		$('.tripcontent').remove();
		$('.tripcontent_right').remove();
		$('.slider').remove();
		$('.resultLi').remove();
		$('.totalCnt').remove();
	$.ajax({
			type:"get"
			,url:"http://api.visitkorea.or.kr/openapi/service/rest/KorService/searchKeyword"
			,contentType: "application/x-www-form-urlencoded"
			,data:{
				"serviceKey": "oVpLLrYOZ3HgAbsrCL7WWVWeyhyK8sMPeScf3RiLkxYxnUSCCgj9rb8kRVW2MXInXYI3sSaZovOLHgmfur2rRg=="
				,"_type":"json"
				, "MobileOS": "ETC"
				, "MobileApp": "TourAPI3.0_Guide"
				, "cat1": cat1
				, "cat2": ""
				, "cat3": ""
				, "areaCode": areacode
				, "sigunguCode": sigungucode
				, "keyword": keyword
				, "numOfRows": 12
				, "pageNo": pageNo
			}
			,dataType:"json"
			,success:function(res){
// 				console.log(res);
				var response = res.response;
				
				var header = response.header;
				
				var body = response.body;
				
				var numOfRows = body.numOfRows;
				var pageNo = body.pageNo;
				var items = body.items.item;
				var totalCount = body.totalCount; 
				
//					console.log("rows : " + numOfRows);
				
//					console.log("total : " + totalCount);
				
				$(".total").append("<span class='totalCnt'>총 결과 수 : "+totalCount+"</span>")
				
				
// 				console.log(items)
// 				console.log(items.length)
				var cnt = items.length!=null ?items.length :1;
// 				console.log("cnt : " + cnt) 
				
				for(var i=0; i<numOfRows && i<totalCount && i<cnt; i++) {
//						console.log(items[i]);
//						$("#resultUl").append("<li class='resultLi'>"
//								+"<img class='resultImg' src="+items[i].firstimage+"><p class='resultPtag'>"+items[i].title+"</p></li>")
					var item = (items.length==null) ?items :items[i];
//						console.log(item);
					if(item.firstimage == null){
						item.firstimage = "/resources/img/noimage.jpg";	
					}
					$(".resultUl").append("<li class='resultLi'><a class='contentAtag' data="+item.contentid+" id="+item.contenttypeid+">"
							+"<img class='resultImg' src="+item.firstimage+"><p class='resultPtag'>"+item.title+"</p></a></li>")
		 		 }
				
				var totalData = totalCount;    // 총 데이터 수
			    var dataPerPage = numOfRows;    // 한 페이지에 나타낼 데이터 수
			    var pageCount = 10;        // 한 화면에 나타낼 페이지 수
			    var pageGroup = Math.ceil(pageNo/pageCount); // 총 페이지 수  
			    var totalPage = Math.ceil(totalData/dataPerPage); //페이지 그룹
			    var startPage = (Math.floor((pageNo-1)/pageCount))*pageCount+1;
			    var endPage = startPage+pageCount-1;
			    if(endPage > totalPage)	endPage = totalPage;
			    var totalGroup = Math.ceil(totalPage/pageCount);
// 			    var last = pageGroup * pageCount;    // 화면에 보여질 마지막 페이지 번호
// 		        	if(last > totalPage) last = totalPage;
// 		        var first = last - (pageCount-1); 
// 		        var next = last+1;
// 		        var prev = first-1;

		     // 게시글 시작번호
				var startNo = (pageNo-1)*dataPerPage+1;
			// 게시글 끝번호
				var endNo = pageNo*dataPerPage;
		     // 현재 페이지가 총 페이지보다 크게 입력되면
				// 강제로 마지막페이지 고정
		        if (totalPage < pageNo)	pageNo = totalPage;
		     // 계산된 마지막 페이지가 totalPage보다 커질 경우 
				// 강제로 최종 페이지까지만 보이도록 설정
// 				if(last > totalPage)	last = totalPage;
				if(endPage > totalPage)	endPage = totalPage;
		     
// 			    console.log("totalData : "+totalData)
// 			    console.log("dataPerPage : "+dataPerPage)
// 			    console.log("pageCount : "+pageCount)
// 			    console.log("pageGroup : "+pageGroup)
// 			    console.log("totalPage : "+totalPage)
// 			    console.log("startPage : "+startPage)
// 			    console.log("endPage : "+endPage)
// 			    console.log("totalGroup : "+totalGroup)
// 			    console.log("pageNo :"+pageNo)
			    //=====paging 처리
			    
			   	
				$(".pagination").empty();  //페이징에 필요한 객체내부를 비워준다.
				
			    if(pageNo != 1){            // 페이지가 1페이지 가아니면
			    	$(".pagination").append("<li class='goFirstPage'><a><<</a></li>");        //첫페이지로가는버튼 활성화
			    }else{
			    	$(".pagination").append("<li class='disabled'><a><<</a></li>");        //첫페이지로가는버튼 비활성화

				    }
				
			    if(pageGroup != 1){            
		        	$(".pagination").append("<li class='goBackPage'><a><</a></li>");        //뒤로가기버튼 활성화

		        }else{
		        	$(".pagination").append("<li class='disabled'><a><</a></li>");        //뒤로가기버튼 비활성화

		        }
				
			    for(var i = startPage ; i <= endPage ; i++){        //시작페이지부터 종료페이지까지 반복문

		        	if(pageNo == i){                            //현재페이지가 반복중인 페이지와 같다면
		                	$(".pagination").append("<li class='active'><a>"+i+"</a></li>");    //버튼 비활성화
		        	}else{
		        		$(".pagination").append("<li class='goPage' data-page='"+i+"'><a>"+i+"</a></li>"); //버튼 활성화
		        	}
		        }

			    
			     if(pageGroup<totalGroup ){            
			        	$(".pagination").append("<li class='goNextPage'><a>></a></li>");         //다음페이지버튼 활성화
			        }else{
			        	$(".pagination").append("<li class='disabled'><a>></a></li>");        //다음페이지버튼 비활성화
			        }

			     if(pageNo<totalPage ){            
			        	$(".pagination").append("<li class='goLastPage'><a>>></a></li>");         //다음페이지버튼 활성화
			        }else{
			        	$(".pagination").append("<li class='disabled'><a>>></a></li>");        //다음페이지버튼 비활성화
			        }
			     
			     
		  		if(totalCount == 0 ){
		  			$(".pagination").empty(); 
		  		}

		          
		          
// 		          //첫페이지로 가기 버튼 이벤트
		       $(".goFirstPage").click(function(){

				       	curPage = 1;

				  		changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), curPage);

			        });



		//뒷페이지로 가기 버튼 이벤트

				$(".goBackPage").click(function(){

				      	curPage = Number(startPage) - 1; 
 
				      	changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), curPage);
				      	
			        });



		//클릭된 페이지로 가기 이벤트

				$(".goPage").click(function(){

					changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), $(this).attr("data-page"));
					
				});



		//다음페이지로 가기 클릭이벤트

				$(".goNextPage").click(function(){

					curPage = Number(endPage) + 1;

					changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), curPage);

					if(curPage = totalPage){
						return;
					}
					
			        });



		//마지막페이지로 가기 클릭이벤트

			        $(".goLastPage").click(function(){

			        	curPage = totalPage;

			        	changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), curPage);

			        });

			$(".contentAtag").click(function(){
				
				Detail($(this).attr("data"),$(this).attr("id") );
				
				
				
			});



				

				
			   	//===============
				
			}
	})
}
}
$(document).ready(function() {
	$("#btnSearch").click(function() {
		changed($("[name='cat1']").val(), $("[name='areacode']").val(), $("[name='sigungucode']").val(), $("[name='keyword']").val(), 1);
	})
})
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

function change(add) {
	sel= document.getElementById('sigungucode')
	for (i=sel.length-1; i>=0; i--){
		sel.options[i] = null
	}
	for (i=0; i < cnt[add].length;i++){
		if(i==0){
			sel.options[i] = new Option(cnt[add][i], "");
		}else{
			sel.options[i] = new Option(cnt[add][i], i);
		}
	}         
}

function Detail(contentId, contentTypeId){
    $f = ($("<form>")
          .attr("action", "/main")
          .attr("method", "post")
       ).append(
       $("<input>")
          .attr("name", "id")
          .val(contentId)
    ).append(
    	       $("<input>")
    	          .attr("name", "typeid")
    	          .val(contentTypeId)
   	).appendTo( $(document.body) );
    $f.submit();
}

$(document).ready(function() {
	$('#div1').click(function(){
		location.href="https://www.yeosu.go.kr/tour/information/sightseeing_call/tour_info";
	})
	$('#div2').click(function(){
		location.href="https://www.visitjeju.net/kr";
	})
	$('#div3').click(function(){
		location.href="https://www.gn.go.kr/tour/index.do";
	})
	
	
})

</script>

<style type="text/css">
.totalCnt{
	color: #000000;
}
.resultImg{
	height: 200px;
	width: 200px;
}  
.resultPtag{
	overflow: hidden;
	color: #000000; 
}
.resultLi{
    overflow: hidden;
    float: left;
    width: 210px;
    height: 300px;
    margin-left: 39px;
}
.result{
	height: 900px;
	left: -50%;
}
.paginations{
	height: 100px;
	 left: 40%;
	 padding-bottom: 30px;
}
.pagination{
	list-style: none;
	height: 80px;
	margin-left: 24%;
    font-size: 24px;
}
.pagination>li{
	float: left;
	margin-right: 20px;
}
.active{
	color: red;
	font-weight: bold;
}
.selectTitle{
	color: #000000;
	text-align: center;
	font-size: -webkit-xxx-large;
}
.subSelect{
	color: #000000;
	font-size: 25px;
}
.utubediv{
	text-align: center;
}
.selectMenu{
    text-align: center;
	margin-bottom: 20px;
	background-color: #d5d5d5; 
}
.total{ 
	text-align: center;
	font-size: 30px;
	margin-bottom: 20px;
}
.slider{
	margin-top: 30px;
	padding-top: 30px;
	padding-bottom: 100px;
}
#search{ padding-bottom: 20px;}
#cat1{ width: 220px;height: 30px;}
#keyword{ width:222px; height:20px;}
#areacode{ width: 210px; height: 30px;}
#sigungucode{ width:175px; height: 30px;}
#searchlabel{margin-left: 48px;}

 .tripcontent{ 
 	float: left; 
     display: inline-block; 
     width: 220px; 
     padding-left: 30px;
 } 
.tripcontent, .title_h3{
	line-height: 140%;
    word-break: keep-all;
    letter-spacing: -1px;
    padding-bottom: 22px;
}
.tripcontent, .title_h3:after{
	content: '';
    bottom: 0;
    left: 0;
    display: block;
    width: 20px;
    height: 1px;
    background: #333;
    margin-left: 30px;
}
.content_ul>li>img{
	height: 300px;
	width: 300px;
}
.content_ul>li{
	    position: relative;
    transition: transform 0.4s;
    float: left;
    display: inline-block;
    width: 270px;
    margin-left: 20px;
    overflow: hidden;
}
.content_ul{
    display: block;
    margin-left: 110px;
}
.content_ptag{
	text-align: center;
}
 .white {
	color: #606060;
	border: solid 1px #b7b7b7;
	background: #fff;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#ededed));
	background: -moz-linear-gradient(top,  #fff,  #ededed);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#ededed');
}
.white:hover {
	background: #ededed;
	background: -webkit-gradient(linear, left top, left bottom, from(#fff), to(#dcdcdc));
	background: -moz-linear-gradient(top,  #fff,  #dcdcdc);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffffff', endColorstr='#dcdcdc');
}
.white:active {
	color: #999;
	background: -webkit-gradient(linear, left top, left bottom, from(#ededed), to(#fff));
	background: -moz-linear-gradient(top,  #ededed,  #fff);
	filter:  progid:DXImageTransform.Microsoft.gradient(startColorstr='#ededed', endColorstr='#ffffff');
}
 .btn {
	display: inline-block;
	zoom: 1; /* zoom and *display = ie7 hack for display:inline-block */
	*display: inline;
	vertical-align: baseline;
	margin: 0 2px;
	outline: none;
	cursor: pointer;
	text-align: center;
	text-decoration: none;
	font: 14px/100% Arial, Helvetica, sans-serif;
	padding: 8px 7px 5px;
	text-shadow: 0 1px 1px rgba(0,0,0,.3);
	-webkit-border-radius: .5em; 
	-moz-border-radius: .5em;
	border-radius: .5em;
	-webkit-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	-moz-box-shadow: 0 1px 2px rgba(0,0,0,.2);
	box-shadow: 0 1px 2px rgba(0,0,0,.2);
}
.btn:hover {
	text-decoration: none;
}
.btn:active {
	position: relative;
	top: 1px;
}
#div1:hover{cursor: pointer;}
#div2:hover{cursor: pointer;}
#div3:hover{cursor: pointer;}
.goFirstPage,.goBackPage,.goPage,.goNextPage,.goLastPage,.contentAtag{ cursor: pointer;}
</style>
<div class="tour">
<div class="selectMenu">
	<p class="selectTitle">어디갈래?</p>
	<input type="hidden" name="cat2">
	<input type="hidden" name="cat3">
	<div class="subdiv">
		<label class="subSelect">분류</label>
		<select id="cat1" title="대분류" name="cat1">
			<option value="">대분류</option>
			<option value="A01">자연</option>
			<option value="A02">인문(문화/예술/역사)</option>
			<option value="A03">레포츠</option>
			<option value="A04">쇼핑</option>
			<option value="A05">음식</option>
			<option value="B02">숙박</option>
			<option value="C01">추천코스</option>
		</select>
	</div>
	<div class="subdiv">
	<span id="test"></span>
		<label class="subSelect">시/도</label>
		 <select name="areacode" id="areacode" onchange="change(this.selectedIndex);" >
                       <option value="">시/도 선택</option>
                       <option value="1">서울</option>
                       <option value="2">인천</option>
                       <option value="3">대전</option>
                       <option value="4">대구</option>
                       <option value="5">광주</option>
                       <option value="6">부산</option>
                       <option value="7">울산</option>
                       <option value="8">세종</option>
                       <option value="31">경기</option>
                       <option value="32">강원</option>
                       <option value="33">충북</option>
                       <option value="34">충남</option>
                       <option value="35">경북</option>
                       <option value="36">경남</option>
                       <option value="37">전북</option>
                       <option value="38">전남</option>
                       <option value="39">제주</option>
                    </select>         
	</div>
	<div class="subdiv">
		<label class="subSelect"> 시/군/구</label>
		<select id="sigungucode" name="sigungucode">
			<option value="">시/군구선택</option>
		</select>
	</div>
	
	<div id="search" class="subdiv">
		<label class="subSelect" id="searchlabel">검색</label> 
		<input type="text" id="keyword" name="keyword" placeholder="2글자 이상의 키워드를 입력하세요" />&nbsp;<button class="btn white" id="btnSearch">검색</button> 
	</div>
</div>
	<div class="total">
	
	</div>

<div class="result">
	<ul class="resultUl">
	</ul>
	<!--슬라이더  -->
	<div class="slider">
	<c:import url="/WEB-INF/views/slider/slider.jsp" />
	</div>
  <!-- 슬라이더 종료 -->
  
  	<div class="tripcontent">
  		<h3 class="title_h3">추천 여행지!!
  		</h3>
  		<p>#훨씬 저렴한 국내</p>
  		<p>#귀찮지 않은 계획</p> 
  	</div>
  	<div class="tripcontent_right">
  			<ul class="content_ul">
  			<li id="div1"><img src="http://mblogthumb3.phinf.naver.net/20160408_258/koempr_146004149328375ukp_PNG/160408_%BF%A9%BC%F6%BF%A9%C7%E0%C4%DA%BD%BA_%BF%A9%BC%F6%B9%E3%B9%D9%B4%D9_%BF%A9%BC%F6%BE%DF%B0%E6.png?type=w2">
  			<p class="content_ptag">여수</p>
  			</li>
  			<li id="div2"><img src="https://pbs.twimg.com/media/DcuBU_tU0AAZ_XU.jpg">
  			<p class="content_ptag">제주</p>
  			</li>
  			<li id="div3"><img src="http://m.young.hyundai.com/upload/CMS_NEWS_IMAGE/2017/01/20/CMS_NEWS_IMAGE_JBjugS5KD3ocOgKTsc9K.png">
  			<p class="content_ptag">강릉</p>
  			</li>
  			</ul>
  	</div>
</div>

<div class="paginations">
	<ul class="pagination">
	
	</ul>
</div>

<div class="utubediv">
<iframe width="871" height="490" src="https://www.youtube.com/embed/Lnuh9ux-xm4" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
</div>

</div>
<div style="clear:both; height: 0; display: hidden;"></div>