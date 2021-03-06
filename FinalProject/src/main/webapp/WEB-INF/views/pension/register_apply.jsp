<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


 <!-- 다음 주소 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<!-- include libraries(jQuery, bootstrap) -->
<link href="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

<!-- include summernote css/js -->
<link href="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.css" rel="stylesheet">
<script src="http://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.12/summernote.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
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
	     height:200,
	     minHeight:200,
	     maxHeight:null,
	      callbacks: {
	         onImageUpload: function(files, editor) {
	            sendFile(files[0],editor);
	         }
	      }
	   });
	
	
	
	
	//작성버튼 동작
	$("#btnWrite").click(function() {
		$("form").submit();
	});
	
	//취소버튼 동작
	$("#btnCancel").click(function() {
		history.go(-1);
	});
});



function sendFile(file, editor) {
	   // 파일 전송을 위한 폼생성
	   data = new FormData();
	    data.append("file", file);
	    data.append("board_no",$('#apply_no').val());

	    $.ajax({ // ajax를 통해 파일 업로드 처리
	        data : data,
	        dataType: "json",
	        type : "POST",
	        url : "/pension/image_upload",
	        cache : false,
	        contentType : false,
	        enctype: 'multipart/form-data',
	        processData : false,
	        success : function(data) { // 처리가 성공할 경우
	              // 에디터에 이미지 출력   
	           console.log(data);
	           $("#summernote").summernote('insertImage', "/pensionimage?fileno="+data.fileno);
	           $('#apply_no').val(data.board_no);
	           
	        }
	    });
	}


function execPostCode() {
    new daum.Postcode({
        oncomplete: function(data) {
           // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

           // 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
           // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
           var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
           var extraRoadAddr = ''; // 도로명 조합형 주소 변수

           // 법정동명이 있을 경우 추가한다. (법정리는 제외)
           // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
           if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
               extraRoadAddr += data.bname;
           }
           // 건물명이 있고, 공동주택일 경우 추가한다.
           if(data.buildingName !== '' && data.apartment === 'Y'){
              extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
           }
           // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
           if(extraRoadAddr !== ''){
               extraRoadAddr = ' (' + extraRoadAddr + ')';
           }
           // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
           if(fullRoadAddr !== ''){
               fullRoadAddr += extraRoadAddr;
           }

           // 우편번호와 주소 정보를 해당 필드에 넣는다.
           console.log(data.zonecode);
           console.log(fullRoadAddr);
           
           
           $("[name=pension_postcode]").val(data.zonecode);
           $("[name=pension_address]").val(fullRoadAddr);
           
           document.getElementById('name=pension_postcode').value = data.zonecode; //5자리 새우편번호 사용
           document.getElementById('name=pension_address').value = fullRoadAddr;

       }
    }).open();
}

</script>

<style type="text/css">


.board_type1_write_wrap{width:90%;margin:auto;background:white;}
.board_type1_write_button_wrap{width:90%;margin:auto;background:white;font-size:16px;padding-left: 10px;padding-right: 10px;}
.board_write_type1{width:100%;table-layout:fixed;font-size:16px;color:black;}
.board_write_type1 tbody tr td{height:100px;}
.board_write_type1 tbody tr td .split_three{padding:0;margin:0;width:100%;list-style:none;}
.board_write_type1 tbody tr td .split_three li{width:33.333%;padding:0;margin:0;float:left;padding-right:5%;}
.board_write_type1 tbody tr td div{padding-top:5px;padding-bottom:5px;}
.board_write_type1 tbody tr .column_name{font-weight:800;}
.board_write_type1 tbody tr .column_desc{}
.board_write_type1 tbody tr .left{text-align:left;padding-left:10px;padding-right:10px;}
.text_type1{width:100%;height:35px;border-radius:5px;padding-left:10px;padding-right:10px;}
.text_type2{width:90%;height:35px;border-radius:5px;padding-left:10px;padding-right:10px;}
.textarea_type1{width:100%;height:350px;border-radius:5px;}
@media only screen and (max-width:1080px){
	.board_write_type1 tbody tr td .split_three li{width:100%;float:none;padding-right:0%;}
	
}



</style>

<h2>펜션등록 요청</h2>
<hr>

<div class="container">
    <form action="/pension/register_apply" method="post" enctype="multipart/form-data">
            
 <input type="text" style="display: none;" id="apply_no" name="apply_no" value="0"/>
      
      <table class="board_write_type1">
      	<tr>
      		<td class="left">
      			<div class="pension_name">펜션명</div>
      			<input type="text" class="text_type1" name="pension_name" placeholder="펜션명을 입력하세요.">
      		</td>  	
      	</tr>
      	
      	<tr>
      		<td class="left">
      			<ul class="split_three">
      			<li>
      				<div class="writer">작성자</div>
      				<input type="text" class="text_type1" name="writer" value="${sessionScope.login_id }" readonly="readonly">
      				
      			 </li>    			
      				<li>
      					<div class="pension_postcode">펜션위치</div>
      					<input class="text_type1" style="width: 40%; display: inline;" placeholder="우편번호" name="pension_postcode" id="pension_postcode" type="text" readonly="readonly" >
      					<button type="button" class="btn btn-default" onclick="execPostCode();"><i class="fa fa-search"></i> 우편번호 찾기</button>
      					<input class="form-control" style="top: 5px;" placeholder="주소" name="pension_address" id="pension_address" type="text" readonly="readonly" />
    					<input class="form-control" placeholder="상세주소" name="pension_detailAddress" id="pension_detailAddress" type="text"  />
      				</li>    			
      			</ul>
      		</td>
      	<tr>
      		<td class="left">
      		<div class="pension_content">펜션 소개</div>
      		<textarea class="form-control" name="pension_content" placeholder="펜션소개를 입력하세요."></textarea>   		
      		</td>
      	</tr>
      	
     	<tr>
      		<td class="left">
      			<div class="room_name">객실명</div>
      			<input type="text" class="text_type1" name="room_name" placeholder="객실명을 입력하세요.">
      		</td>  	
      	</tr>
      	
      	<tr>
      		<td class="left">
      			<div class="room_content">객실소개</div>
       		    <textarea class="form-c" name="room_content" id="summernote"></textarea>
				
      		</td>  	
      	</tr>
 
 		<tr>
      		<td class="left">
      			<ul class="split_three">
      				<li>
      					<div class="room_men">인원</div>
      					<input type="text" class="text_type1" name="room_men" placeholder="방 인원을 입력하세요.">
      				
      				</li>
      			</ul>
      		</td>
      	</tr>
      	
      	 <tr>
      		<td class="left">
      			<ul class="split_three">
      				<li>
      					<div class="room_size">크기</div>
      					<input type="text" class="text_type1" name="room_size" placeholder="방 크기를 입력하세요.">     				
      				</li>
      			</ul>
      		</td>
      	</tr>
      	
      	 <tr>
      		<td class="left">
      			<ul class="split_three">
      				<li>
      					<div class="room_price">요금</div>
      					<input type="number" class="text_type1" name="room_price" placeholder="방 요금을 입력하세요.">
      				
      				</li>
      			</ul>
      		</td>
      	</tr>     
      </table>
    
 <div class="text-center">	
	<button type="button" id="btnWrite" class="btn btn-info">등록</button>
	<button type="button" id="btnCancel" class="btn btn-danger">취소</button>
</div>
    </form>
</div>



