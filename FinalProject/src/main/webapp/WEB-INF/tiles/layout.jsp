<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<script type="text/javascript"
 src="http://code.jquery.com/jquery-2.2.4.min.js"></script>

<script type="text/javascript">
var last_top = 0;
$(window).scroll(function() {
  var this_top = $(this).scrollTop();
  if( this_top > last_top ) {
    $(".subbar").addClass("hide");
  }
  else {
    $(".subbar").removeClass("hide");
  }
	last_top = this_top;  
});
</script>

<style type="text/css">
/* 모든 페이지에 적용되는 스타일 CSS */

.wrap {
	padding: 0 10%;
	width: 1080px;
}
.header{
	width: 1200px;
}
</style>

</head>
<body>
<div class="container">
<!-- HEADER -->
<div class="header">
<tiles:insertAttribute name="header" />
</div>
<!-- BODY -->
<div class="wrap">
	<tiles:insertAttribute name="body" />
</div>

<!-- FOOTER -->
<tiles:insertAttribute name="footer" />
</div>
</body>
</html>


















