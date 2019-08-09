<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>
#control {
margin-left:450px;
}
</style>

<form action="/mypage/withdraw" method="post">

<br><br>
<h1>회원 탈퇴</h1>
<h5>* 회원탈퇴 사유를 입력해주시면 적극 반영하겠습니다.</h5>
<hr style="border-top:1px solid #777">

<br>
   <label for="name" class="col-sm-1 control-label"> 아이디&nbsp;&nbsp;&nbsp; </label> 
   <div class="col-sm-3" style="padding-left:70px; ">
	<span>${info.user_id }</span>
      </div>  
 <br><br>
         	
<hr style="border-top:1px solid #777">
<br>	
      <label for="pw"> 비밀번호 </label>   
      <div class="col-sm-3">
       <input type="password" id="inputpw" name="inputpw" class="form-control"/>
      </div>
         
      <br><br>
      <hr style="border-top:1px solid #777">
         
    <label for="reason" class="col-sm-1 control-label" style="top:35px;"> 탈퇴사유 </label>   
      <div class="text">
		<textarea rows="4" cols="50" class="form-control" style="margin-left:170px; width:500px;"></textarea>
      </div>     
      <h5><label for="text1" style="margin-left:550px;">(0/500자 내외입력)</label></h5>
     <hr style="border-top:1px solid #777">
        
<div id="control">
<input type="submit" id="withdraw" value="회원탈퇴" class="form-control"/>
<input type="button" id="cancel" value="취소" class="form-control"/>
</div>    
   
<br><br>
<hr>

</form>


</body>
</html>