<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>
<script type="text/javascript">
var images = "";
var isfirst = true;
$(document).ready(function(){
	
	$("#region option[value='${tripspot.region}']").attr("selected", true);
	change($("#region option[value='${tripspot.region}']:selected").attr('data-idx'));
	$("#region_detail option[value='${tripspot.region_detail}']").attr("selected", true);
	
	$(".update").click(function(){
		$("#updateform").submit();
	});
	$(".back").click(function(){
		location.href='/tripspot/list';
	});
	
	$('#summernote').summernote({
		toolbar: [
	    // [groupName, [list of button]]
	    ['style', ['bold' , 'italic', 'underline', 'clear']],
	    ['font', ['strikethrough', 'superscript', 'subscript']],
	    ['fontsize', ['fontsize']],
	    ['color', ['color']],
	    ['insert', ['link', 'hr', 'picture']],
	    ['para', ['ul', 'ol', 'paragraph']],
	    ['height', ['height']],
        ['view', ['fullscreen', 'codeview']]
	  ],
	  height:500,
	  minHeight:500,
	  maxHeight:null,
		callbacks: {
			onImageUpload: function(files, editor) {
				sendFile(files[0],editor);
			}
		}
	});
	
});

function sendFile(file, editor) {
	// 파일 전송을 위한 폼생성
	data = new FormData();
    data.append("file", file);

    $.ajax({ // ajax를 통해 파일 업로드 처리
        data : data,
        dataType: "json",
        type : "POST",
        url : "/tripspot/imageupload",
        cache : false,
        contentType : false,
        enctype: 'multipart/form-data',
        processData : false,
        success : function(data) { // 처리가 성공할 경우
       		 // 에디터에 이미지 출력   
        	console.log(data);
        	$("#summernote").summernote('insertImage', "/tripspotimage?fileno="+data.fileno);
        	if(isfirst){
        		images = images + data.fileno;
        		isfirst = false;
        		document.getElementById("images").value = images;
        	}else{
        		images = images + "," + data.fileno;
        		document.getElementById("images").value = images;
        	}
        }
    });
}
function test(){
	console.log(document.getElementById("images").value);
}
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
		if(i==0){
			region_detail.options[i] = new Option(cnt[idx][i],"");
		}else{
			region_detail.options[i] = new Option(cnt[idx][i],cnt[idx][i]);
		}
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
.btn-right{
	text-align: right;
}
</style>
<form action="/tripspot/update" method="post" id="updateform">
<input type="text" style="display: none;" id="images" name="images" value=""/>
<input type="text" style="display: none;" name="board_no" value="${tripspot.board_no }"/>
<input type="hidden" name="writer_id" value="${tripspot.writer_id  }"/><br>
<input type="hidden" name="writer_nick" value="${tripspot.writer_nick  }"/><br>
<h1>${tripspot.writer_nick  }님의 여행추천게시판 수정 폼</h1>
<input class="title" type="text" name ="title" style="width:600px;"/><br><br>

	
<label>시/도</label>
<select id="region" name="region" onchange="change(this.selectedIndex);" >
 	<option value="">시/도 선택</option>
	<option value="서울" data-idx="1">서울</option>
	<option value="인천" data-idx="2">인천</option>
	<option value="대전" data-idx="3">대전</option>
	<option value="대구" data-idx="4">대구</option>
	<option value="광주" data-idx="5">광주</option> 
	<option value="부산" data-idx="6">부산</option>
	<option value="울산" data-idx="7">울산</option>
	<option value="세종" data-idx="8">세종</option>
	<option value="경기" data-idx="9">경기</option>
	<option value="강원" data-idx="10">강원</option>
	<option value="충북" data-idx="11">충북</option>
	<option value="충남" data-idx="12">충남</option>
	<option value="경북" data-idx="13">경북</option>
	<option value="경남" data-idx="14">경남</option>
	<option value="전북" data-idx="15">전북</option>
 	<option value="전남" data-idx="16">전남</option>
	<option value="제주" data-idx="17">제주</option>
</select>         
<label> 시/군/구</label>
<select id="region_detail" name="region_detail">
	<option value="">시/군구선택</option>
</select>
<textarea name="content" id="summernote">${tripspot.content }</textarea><br>
<a class="btn btn-right update">수정</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<a class="btn btn-right back">돌아가기</a>
</form>