function getLocation() {
	if (navigator.geolocation) {
		navigator.geolocation.getCurrentPosition(showPosition, showError);
	} else {
		alert("Geolocation is not supported by this browser.");
	}
}
function showPosition(position) {
	var latitude = position.coords.latitude;
	var longitude = position.coords.longitude;
	// 서버로 위도와 경도를 보냅니다.
	var xhr = new XMLHttpRequest();
	xhr.open("POST", "/saveLocation", true);
	xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded;charset=UTF-8");
	xhr.onreadystatechange = function() {
		if (xhr.readyState === 4 && xhr.status === 200) {
			// 서버에서 응답을 받았을 때 실행할 코드
			console.log("Location saved successfully");
		}
	};
	// UTF-8로 변환하여 보냅니다.
	var data = "latitude=" + encodeURIComponent(latitude) + "&longitude=" + encodeURIComponent(longitude);
	xhr.send(data);
}
function showError(error) {
	switch (error.code) {
		case error.PERMISSION_DENIED:
			alert("User denied the request for Geolocation.");
			break;
		case error.POSITION_UNAVAILABLE:
			alert("Location information is unavailable.");
			break;
		case error.TIMEOUT:
			alert("The request to get user location timed out.");
			break;
		case error.UNKNOWN_ERROR:
			alert("An unknown error occurred.");
			break;
	}
}
// 페이지가 로드될 때 위치 정보를 물어봅니다.
window.onload = function() {
    var userId = document.getElementById("userId").value;
    if (userId != null && userId.trim() !== "") { // Check if userId is not empty
        getLocation(); // Call the getLocation function only if userId is not empty
    }
};