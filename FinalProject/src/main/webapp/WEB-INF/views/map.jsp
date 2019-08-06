<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <script type="text/javascript">

 var mapx = ${mapx}
 var mapy = ${mapy}
 
 console.log("mapx:"+mapx)
 console.log("mapy:"+mapy)
 
      function mapview() {
        var uluru = {lat: mapy, lng: mapx};
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 15,
          center: uluru
        });
        var marker = new google.maps.Marker({
          position: uluru,
          map: map
        });
      }
 function back() {
	    window.history.back();
	}
    </script>
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyDVzh5YZcbY2HExtC0eRkTj4BP-zm6y9UM&callback=mapview"
    async defer></script>
<style type="text/css">
#map{
	height: 300px;
	/* width: 400px; */
	
}
</style>
</head>
<body>
<div id="map"></div>

<div class="back">
	<input type='button' onclick="back();" id='btnBack' value='돌아가기'/>
</div>

</body>
</html>