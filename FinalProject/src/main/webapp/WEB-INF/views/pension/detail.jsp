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

<h1>펜션</h1>
<hr>

<div id="pension">

<button type="button" id="prev_btn" class="btn">이전</button>
<button type="button" id="next_btn" class="btn">다음</button>
<ul id="slider">
    <li><img src="/images/pen1.jpg"></li>
    <li><img src="slider/pen2.jpg"></li>
    <li><img src="slider/pen3.jpg"></li>
</ul>

	<c:forEach items="${pensionlist}" var="i">

			${i.pension_no }

			<a href="${path}/pension/detail/${i.pension_no}">
				<img src="${path}/images/${i.pension_url}" width="250px" height="100px">
			</a>
		</td>
		<td>
			<a href="${path}/pension/detail/${i.pension_no}">${i.pension_name }</a>
		</td>
		<td>
			${i.pension_location }
		</td>
		<td>
			${i.pension_content }
		</td>
	</tr>	
</c:forEach>




</div>

