<%@page import="SignIn.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, javax.servlet.http.HttpSession, Util.MyWebContextListener" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>회원 정보 수정</title>
    <link rel="stylesheet" href="styles.css">
    <script>
    function openEditWindow(fieldName) {
        // Encode user object to make it safe to pass in URL
        var editUrl = "/mypage/edit/" + fieldName + ".jsp";
        window.open(editUrl, "_blank", "width=600,height=400");
    }   
    function openAddressSearchWindow() {
        var editUrl = "/mypage/edit/AddressSearch.jsp";
        window.open(editUrl, "_blank", "width=600,height=400");
    }
    </script>
</head>
<body>
    <h1>회원 정보 수정</h1>
    <% 
    try (Connection connection = MyWebContextListener.getConnection();) {
        String userId = (String) session.getAttribute("userId");
        Statement stmt = connection.createStatement();
        // 회원 정보 가져오기
        String userInfoQuery = "SELECT * FROM pet.user WHERE id = '" + userId + "'";
        ResultSet userInfoRs = stmt.executeQuery(userInfoQuery);
        if (userInfoRs.next()) {
            String id = userInfoRs.getString("id");
            String password = userInfoRs.getString("pw");
            String userName = userInfoRs.getString("user_name");
            String phone = userInfoRs.getString("phone");
            String address = userInfoRs.getString("address");
            String addressDetail = userInfoRs.getString("address_detail");
    %>
        <div>
            <label for="id">아이디:</label>
            <input type="text" id="id" name="id" value="<%= id %>" readonly>
        </div>
        <div>
            <label for="password">비밀번호:</label>
            <input type="password" id="password" name="password" value="<%= password %>"readonly>
			<button type="button" onclick="openEditWindow('password')">수정</button>
        </div>
        <div>
            <label for="userName">이름:</label>
            <input type="text" id="userName" name="userName" value="<%= userName %>"readonly>
        </div>
        <div>
            <label for="phone">핸드폰:</label>
            <input type="text" id="phone" name="phone" value="<%= phone %>"readonly>
        </div>
        <div>
            <label for="address">주소:</label>
            <input type="text" id="address" name="address" value="<%= address %>">
            <button class="btn btn-outline-secondary" type="button" onclick="sample6_execDaumPostcode()">우편번호 찾기</button>
            <input type="text" id="address" name="address" value="<%= address %>"readonly>
            <button type="button" onclick="openAddressSearchWindow()">주소 수정</button>
        </div>
        <div>
            <label for="addressDetail">상세 주소:</label>
            <input type="text" id="addressDetail" name="addressDetail" value="<%= addressDetail %>"readonly>
        </div>
    <a href="/mypage.jsp">취소</a>
    <% 
        } else {
            // 회원 정보가 없는 경우
            out.println("회원 정보를 찾을 수 없습니다.");
        }
    } catch (Exception e) {
        out.println("오류가 발생했습니다. 오류 메시지: " + e.getMessage());
    }
    %>
<script
		src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.
                var addr = ''; // 주소 변수
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
                document.getElementById('sample6_postcode').value = data.zonecode;
                document.getElementById("sample6_address").value = addr;
                document.getElementById("sample6_detailAddress").focus();
            }
        }).open();
    }
</script>
    <script>
        function sample6_execDaumPostcode() {
            new daum.Postcode({
                oncomplete: function(data) {
                    var addr = ''; // 주소 변수
                    if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                        addr = data.roadAddress;
                    } else { // 사용자가 지번 주소를 선택했을 경우(J)
                        addr = data.jibunAddress;
                    }
                    document.getElementById('sample6_postcode').value = data.zonecode;
                    document.getElementById("sample6_address").value = addr;
                    document.getElementById("sample6_detailAddress").focus();
                }
            }).open();
        }
    </script>
</body>
</html>