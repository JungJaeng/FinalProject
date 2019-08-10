<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">

// $('#dot2').click(function(){
// 		curSlide = 1; 

// 		setInterval(function() {rolling ();},3000);	
// 	})

$(document).ready(function() {
	
	//모든 이미지 리스트
	var $slider_list = $("#slider li");
	
	//모든 이미지를 "left: 600px"로 보내기(숨기기)
	$slider_list.css("left", "1000px");
	
	
	//첫번째 이미지를 div 안쪽으로 보내기
	//첫 이미지를 보여주기
// 	$("#slider li:first-child").css("left", 0);
	$slider_list.eq(0).css("left", 0);
// 	var dots = document.getElementsByClassName("dot");
	
// 	dots[0].className += " active";
	
	var curSlide = 0; //현재 보이는 이미지의 인덱스

	//3초마다 이미지  교체하기 - slide
	
	setInterval(function() {rolling ();},3000);	
		
		function rolling(){
		//다음 이미지의 인덱스
		var nextSlide = (curSlide+1) % $slider_list.length;
		//확인
		console.log(curSlide + " : " + nextSlide);
		
		//보여져야 할 이미지 오른쪽으로 이동시키기
		$slider_list.eq(nextSlide).css("left", "1000px");
		
		//현재 이미지 숨기기 : curSlide
		$slider_list.eq(curSlide).animate({"left":"-=1000px"});
// 		dots[curSlide].className = dots[curSlide].className.replace(" active", "");
		//다음 이미지 보여주기 : nextSlide
		$slider_list.eq(nextSlide).animate({"left":"-=1000px"});
// 		dots[nextSlide].className += " active";
		
// 		$('#dot1').click(function(){
// 			curSlide = 1;
// 			$slider_list.eq(nextSlide).css("left", "1000px");
			
// 			$slider_list.eq(curSlide).animate({"left":"-=1000px"});
// 			dots[curSlide].className = dots[curSlide].className.replace(" active", "");
			
// 			$slider_list.eq(nextSlide).animate({"left":"-=1000px"});
// 			dots[nextSlide].className += " active";
			
// 		})
// 		$('#dot2').click(function(){
// 			surSlide = 2;
// 			$slider_list.eq(nextSlide).css("left", "1000px");
			
// 			$slider_list.eq(curSlide).animate({"left":"-=1000px"});
// 			dots[curSlide].className = dots[curSlide].className.replace(" active", "");
			
// 			$slider_list.eq(nextSlide).animate({"left":"-=1000px"});
// 			dots[nextSlide].className += " active";
			
// 		})
// 		$('#dot2').click(function(){
// 			curSlide = 1; 
		
// 			$slider_list.eq(curSlide).animate({"left":"-=1000px"});
// 			dots[curSlide].className = dots[curSlide].className.replace(" active", "");
		
// 			$slider_list.eq(curSlide).css("left", "1000px");
// 		})
		
		
		//순환구조 만들기
		curSlide++;
		curSlide = curSlide % $slider_list.length;
	}
	
});

</script>

<style type="text/css">
#sliderbox {
	width: 951px;
    height: 436px;
	
 	overflow: hidden; /* div영역을 벗어난 내용물 숨기기 */
	margin: 0 auto; /* div박스를 화면 가운데로 정렬 */
	margin-top: 52px;
}

#slider {
	/* ul태그의 기본 스타일 없애기 */
	padding: 0;
	margin: 0;
	list-style: none;
	
	position: relative;
}

#slider li {
	position: absolute;
}

#slider li img {
	width: 951px;
    height: 436px;
}

</style>
</head>
<body>

<div id="sliderbox">
	<ul id="slider">
		<li><img id="1" class="imgslider" src="https://t1.daumcdn.net/cfile/tistory/27698E4A557FEBC601" /></li>
		<li><img id="2" class="imgslider" src="http://www.hayantravel.co.kr/data/FILE_BBS/banner_hayantour_74220190517170243.jpg" /></li>
		<li><img id="3" class="imgslider" src="http://img.modetour.com//promotion/10724/1100_10724.jpg?resize=1100px:480px&output-quality=75&output-format=jpg" /></li>
	</ul> 
</div>
<br>
<!-- <div style="text-align:center" > -->
<!--   <a><span class="dot" id="dot1"></span></a> -->
<!--   <a><span class="dot" id="dot2"></span></a> -->
<!--   <a><span class="dot" id="dot3"></span></a> -->
<!-- </div> -->
</body>
</html>