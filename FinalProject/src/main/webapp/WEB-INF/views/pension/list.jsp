<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

<script>
$(function() {
    var time = 500;
    var idx = idx2 = 0;
    var slide_width = $("#slider").width();
    var slide_count = $("#slider li").size();
    $("#slider li:first").css("display", "block");
    if(slide_count > 1)
        $(".btn").css("display", "inline");
    $("#prev_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx - 1) % slide_count;
            if(idx2 < 0)
                idx2 = slide_count - 1;
            $("#slider li:hidden").css("left", "-"+slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "+="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", "-"+slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "+="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
    $("#next_btn").click(function() {
        if(slide_count > 1) {
            idx2 = (idx + 1) % slide_count;
            $("#slider li:hidden").css("left", slide_width+"px");
            $("#slider li:eq("+idx+")").animate({ left: "-="+slide_width+"px" }, time, function() {
                $(this).css("display", "none").css("left", slide_width+"px");
            });
            $("#slider li:eq("+idx2+")").css("display", "block").animate({ left: "-="+slide_width+"px" }, time);
            idx = idx2;
        }
    });
});
</script>

<style type="text/css">
#prev_btn {
	margin-left: auto;
	margin-right: auto;
	position: relative;
}
#next_btn {
	margin-left: auto;
	margin-right: auto;
}
.btn {
	height:50px;
	border:0;
	background:#D8D8D8;
	display:none;
	text-align: center;	
}

#slider {
	position:relative;
	margin:0 auto;
	padding:0;
	list-style:none;
	width:320px;
	height:290px;
	
}
#slider li {
	display:none;
	position:absolute;
	left:0;
	top:0
}
#slider img {
	width:320px;
	height:290px;
}
</style>

<h1>펜션</h1>
<hr>

<div id="pension">

<ul id="slider">
    <li><img src="/images/pen1.jpg"></li>
    <li><img src="/images/detail1.jpg"></li>
    <li><img src="/images/detail2.jpg"></li>
</ul>


<button type="button" id="prev_btn" class="btn">이전</button>
<button type="button" id="next_btn" class="btn">다음</button>

	<c:forEach items="${pensionlist}" var="i">

		
</c:forEach>
</div>


