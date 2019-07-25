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

</script>

<style type="text/css">
/* 모든 페이지에 적용되는 스타일 CSS */
 
.container{
	width: 100%;
	height: 100%;
}

.wrap {
	padding-top: 50px;
	padding-bottom: 50px;
	width: 1080px;
	margin-left: auto;
	margin-right: auto;
}
.header{
	padding-bottom: 30px;
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
	height: 100px;
}
.footer{
	padding-top: 30px;
	padding-bottom: 30px;
	width: 1200px;
	margin-left: auto;
	margin-right: auto;
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
	<div class="footer">
	<tiles:insertAttribute name="footer" />
	</div>
</div>
</body>
</html>
